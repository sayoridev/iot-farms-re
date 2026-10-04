# IoT Farms — Reverse Engineering

## 1. Obiettivo del progetto
Reverse engineering dell'applicazione Android "IoT Farms" (`com.keyestudio.IOTfarm`) per comprenderne l'architettura, le componenti, le API di rete e i protocolli di comunicazione IoT.

## 2. Stato attuale
Estratto il pacchetto XAPK. In corso decompilazione statica dell'APK base con JADX e Apktool.

## 3. Ambiente
- **OS**: Arch Linux (Linux larpmachine 7.2.8-zen1-2-zen) [VERIFICATO]
- **Hardware / Arch**: x86_64, Intel Core i3-1215U (8 cores) [VERIFICATO]
- **RAM / Spazio**: 7.5 GiB RAM (2.7 GiB disponibili), 157 GiB spazio libero [VERIFICATO]
- **Java**: OpenJDK 27 (/usr/bin/java) [VERIFICATO]
- **Python**: 3.x (/usr/bin/python3) [VERIFICATO]
- **Android SDK / ADB**: ADB presente (/usr/bin/adb) [VERIFICATO]
- **Toolchain RE**: `jadx` (1.5.6), `apktool` (android-apktool), `7z`, `ripgrep`, `readelf`, `unzip`, `git` [VERIFICATO]

## 4. Applicazione
- **Nome**: IoT Farms / IOT farm
- **Package name**: `com.keyestudio.IOTfarm` [VERIFICATO]
- **Version**: 1.5 [VERIFICATO]
- **Version code**: 5 [VERIFICATO]
- **Min SDK**: 24 (Android 7.0) [VERIFICATO]
- **Target SDK**: 36 [VERIFICATO]
- **XAPK**: `original/IOT+farm_1.5_APKPure.xapk` [VERIFICATO]
- **XAPK SHA-256**: `3ecadbdf3e505f3bff03e9936dec701f5c6c7936ab8adf76e86ecc50e5221283` [VERIFICATO]
- **Base APK**: `extracted/com.keyestudio.IOTfarm.apk` [VERIFICATO]
- **Base APK SHA-256**: `1197d7d78dd58aea9283eea3cf80bb5b5039d071dc51f16412972cc3a1ae987a` [VERIFICATO]

## 5. Struttura del progetto
iot-farms-re/
├── context.md
├── original/
│   └── IOT+farm_1.5_APKPure.xapk
├── extracted/
│   ├── com.keyestudio.IOTfarm.apk
│   ├── config.en.apk
│   ├── config.fr.apk
│   ├── config.mdpi.apk
│   ├── icon.png
│   └── manifest.json
├── decompiled/
│   ├── jadx/
│   └── apktool/
└── docs/

## 38. Cronologia
### 2026-10-04
- Inizializzato workspace `iot-farms-re`.
- Verificato ambiente host Arch Linux e completata installazione toolchain (`android-apktool` installato).
- Spostato e verificato l'archivio XAPK in `original/`.
- Estratto contenitore XAPK ed identificato pacchetto base `com.keyestudio.IOTfarm.apk`.
- Registrati metadati, permessi principali e checksum SHA-256 dell'APK base.
EOF
