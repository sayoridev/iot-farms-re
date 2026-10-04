# Report Finale di Reverse Engineering - Keyestudio IoT Farm

## 1. Sintesi Esecutiva
Il presente documento raccoglie i risultati dell'analisi statica e del reverse engineering condotti sull'applicazione Android `com.keyestudio.IOTfarm`. L'obiettivo principale è stato decodificare l'architettura software, il protocollo di rete e i comandi di controllo scambiati tra l'applicazione client e la scheda di controllo (ESP32).

---

## 2. Dettagli Applicativi ed Architettura
- **Package Name:** `com.keyestudio.IOTfarm`
- **Architettura:** Monolitica basata su un'unica Activity (`MainActivity`).
- **Componenti di Background:** Nessun Background Service o Broadcast Receiver registrato.
- **Librerie di Rete:** Assenti librerie di terze parti (es. Retrofit, OkHttp, Paho MQTT). Tutta la comunicazione è gestita tramite `java.net.Socket` nativo all'interno del thread dedicato `connectthread`.

---

## 3. Protocollo di Comunicazione di Rete
L'applicazione stabilisce un socket TCP diretto in chiaro (Raw TCP Socket) verso il controller IoT[cite: 1].

- **Indirizzo IP Predefinito:** `192.168.3.2` (memorizzato nelle SharedPreferences con chiave `text1`)[cite: 1].
- **Porta TCP:** `80`[cite: 1].
- **Handshake Iniziale:** Subito dopo l'apertura del socket, l'app invia il byte decimale `123` (carattere ASCII `{`) tramite l'OutputStream per richiedere all'ESP32 l'avvio dello streaming dei dati[cite: 1].

---

## 4. Mappatura Comandi di Controllo (Client -> ESP32)
Tutti i comandi vengono inviati sotto forma di stringhe ASCII da 2 caratteri tramite `outputStream.write()`[cite: 1]:

| Componente Hardware | Evento GUI / Pulsante | Comando ASCII | Descrizione Azione |
| :--- | :--- | :---: | :--- |
| **Illuminazione LED** | `led_button` | `"as"` / `"As"` | Attiva (`"as"`) / Disattiva (`"As"`) il LED[cite: 1] |
| **Pompa di Irrigazione** | `watering_button` | `"bs"` | Attiva la pompa dell'acqua[cite: 1] |
| **Ventola** | `fan_button` | `"cs"` / `"Cs"` | Attiva (`"cs"`) / Disattiva (`"Cs"`) la ventola[cite: 1] |
| **Servomotore (Porta)** | `servo_button` | `"ds"` / `"Ds"` | Apri (`"ds"`) / Chiudi (`"Ds"`) la porta[cite: 1] |
| **Buzzer / Melodia** | `music_button` | `"es"` | Riproduzione tono audio[cite: 1] |

---

## 5. Decodifica Telemetria Sensori (ESP32 -> Client)
L'ESP32 risponde inviando in continuo un flusso di byte formattato come stringa ASCII di caratteri esadecimali[cite: 1]. Il metodo `dataHandle(String str)` converte le coppie di caratteri Hex in valori interi decimali[cite: 1].

**Struttura del pacchetto (6 valori, 12 caratteri Hex):**

| Indice Array (`intData`) | Sensore Misurato | Unità | Parsing / Formattazione GUI |
| :---: | :--- | :---: | :--- |
| `0` | Temperatura Aria | `℃` | `Integer.parseInt(hex[0..1], 16)`[cite: 1] |
| `1` | Umidità Aria | `%` | `Integer.parseInt(hex[2..3], 16)`[cite: 1] |
| `2` | Umidità del Terreno | `%` | `Integer.parseInt(hex[4..5], 16)`[cite: 1] |
| `3` | Intensità Luminosa | `%` | `Integer.parseInt(hex[6..7], 16)`[cite: 1] |
| `4` | Livello dell'Acqua | `%` | `Integer.parseInt(hex[8..9], 16)`[cite: 1] |
| `5` | Sensore di Pioggia | `%` | `Integer.parseInt(hex[10..11], 16)`[cite: 1] |

---

## 6. Vulnerabilità di Sicurezza e Rischi
1. **Assenza di Autenticazione:** Chiunque sia attestato sulla sottorete Wi-Fi dell'ESP32 può connettersi alla porta 80 e inviare comandi arbitrari agli attuatori.
2. **Traffico in Chiaro:** I comandi e la telemetria non sono protetti da cifratura (TLS/SSL).
3. **Crash per Pacchetti Malformati:** L'uso diretto di `Integer.parseInt` senza gestione dell'eccezione `NumberFormatException` all'interno di `dataHandle` rende il client vulnerabile a Denial of Service (DoS) locale se vengono inviati dati non esadecimali[cite: 1].

## 7. Validazione Dinamica sul Campo

I risultati dell'analisi statica del sorgente Java sono stati confermati mediante test dinamico con simulatore Python su porta 80/TCP.

### Evidenze di Sovrapposizione
- **Handshake Iniziale:** L'applicazione Android trasmette il valore decimale `123` (`{`) al momento dell'apertura del socket, attivando il flusso di telemetria.
- **Formato Telemetria:** L'app riceve ed elabora correttamente le stringhe esadecimali di 12 caratteri (es. `193C324B5000` -> 25°C, 60% umidità, 50% terreno, 75% luce, 80% acqua, 0% pioggia).
- **Mappa Comandi Confermata:** Tutti i pulsanti dell'interfaccia utente inviano i codici a 2 caratteri ASCII identificati durante la decompilazione:
  - `as` / `As` : LED ON / OFF
  - `bs` : Irrigazione ON
  - `cs` / `Cs` : Ventola ON / OFF
  - `ds` / `Ds` : Servo Aperto / Chiuso
  - `es` : Buzzer Attivo
