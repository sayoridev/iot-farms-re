# Keyestudio IoT Farm – Reverse Engineering & Protocol Specification

![Python](https://img.shields.io/badge/Python-3.x-blue.svg)
![Protocol](https://img.shields.io/badge/Protocol-Raw%20TCP-orange.svg)
![Target](https://img.shields.io/badge/Target-ESP32%20%2F%20Android-green.svg)

Reverse engineering analysis of the **Keyestudio IoT Smart Farm** Android application (`com.keyestudio.IOTfarm`) and its raw TCP communication protocol with the ESP32 controller.  
This repository provides full protocol specifications, vulnerability assessments, an ESP32 server simulator for dynamic testing, and a standalone CLI control utility.

---

## 📁 Repository Structure

```text
iot-farms-re/
├── REVERSE_ENGINEERING_REPORT.md   # Detailed technical report and analysis
├── iot_farm_sim.py                 # ESP32 server simulator & test client
├── decompiled/                     # Decompiled code
└── .gitignore                      # Git ignore rules
```

## 🛰️ Protocol Overview

**Transport:** Unencrypted Raw TCP Socket  
**Default Target IP:** `192.168.3.2`  
**Port:** `80`  
**Handshake:** ASCII character `{` (Byte `123`) sent by the client upon socket connection to initiate telemetry streaming.

### Actuator Control Commands (Client ➔ ESP32)

Commands are 2-character ASCII strings sent over the open TCP socket:

| Hardware Component | Command | Description |
| :--- | :---: | :--- |
| **LED Light** | `as` / `As` | Turn ON (`as`) / OFF (`As`) |
| **Water Pump** | `bs` | Trigger irrigation pump |
| **Ventilation Fan** | `cs` / `Cs` | Turn ON (`cs`) / OFF (`Cs`) |
| **Servo Door** | `ds` / `Ds` | Open (`ds`) / Close (`Ds`) door |
| **Buzzer** | `es` | Play audio melody |

### Telemetry Format (ESP32 ➔ Client)

The ESP32 continuously streams a 12-character hexadecimal ASCII string representing 6 sensor metrics (converted Hex-to-Dec):

| Byte Pair | Hex Index | Sensor Metric | Unit |
| :---: | :---: | :--- | :---: |
| 1 | `[0..1]` | Air Temperature | `°C` |
| 2 | `[2..3]` | Air Humidity | `%` |
| 3 | `[4..5]` | Soil Moisture | `%` |
| 4 | `[6..7]` | Ambient Light | `%` |
| 5 | `[8..9]` | Water Level | `%` |
| 6 | `[10..11]` | Rain Intensity | `%` |

---

# Final Reverse Engineering Report – Keyestudio IoT Farm

## 1. Executive Summary

This document collects the results of the static analysis and reverse engineering performed on the Android application `com.keyestudio.IOTfarm`. The main objective was to decode the software architecture, network protocol, and control commands exchanged between the client application and the controller board (ESP32).

---

## 2. Application Details and Architecture

- **Package Name:** `com.keyestudio.IOTfarm`
- **Architecture:** Monolithic, based on a single Activity (`MainActivity`).
- **Background Components:** No Background Service or registered Broadcast Receiver.
- **Networking Libraries:** No third-party libraries are present (e.g., Retrofit, OkHttp, Paho MQTT). All communication is handled through the native `java.net.Socket` inside the dedicated `connectthread`.

---

## 3. Network Communication Protocol

The application establishes a direct, unencrypted TCP socket (Raw TCP Socket) to the IoT controller.

- **Default IP Address:** `192.168.3.2` (stored in SharedPreferences with the key `text1`).
- **TCP Port:** `80`.
- **Initial Handshake:** Immediately after opening the socket, the app sends the decimal byte `123` (ASCII character `{`) through the OutputStream to request that the ESP32 start streaming data.

---

## 4. Control Command Mapping (Client ➔ ESP32)

All commands are sent as 2-character ASCII strings through `outputStream.write()`:

| Hardware Component | GUI Event / Button | ASCII Command | Action Description |
| :--- | :--- | :---: | :--- |
| **LED Lighting** | `led_button` | `"as"` / `"As"` | Turn the LED ON (`"as"`) / OFF (`"As"`) |
| **Irrigation Pump** | `watering_button` | `"bs"` | Activate the water pump |
| **Fan** | `fan_button` | `"cs"` / `"Cs"` | Turn the fan ON (`"cs"`) / OFF (`"Cs"`) |
| **Servo Motor (Door)** | `servo_button` | `"ds"` / `"Ds"` | Open (`"ds"`) / Close (`"Ds"`) the door |
| **Buzzer / Melody** | `music_button` | `"es"` | Play an audio tone |

---

## 5. Sensor Telemetry Decoding (ESP32 ➔ Client)

The ESP32 responds by continuously sending a byte stream formatted as an ASCII hexadecimal character string. The `dataHandle(String str)` method converts pairs of Hex characters into decimal integer values.

**Packet structure (6 values, 12 Hex characters):**

| Array Index (`intData`) | Measured Sensor | Unit | Parsing / GUI Formatting |
| :---: | :--- | :---: | :--- |
| `0` | Air Temperature | `°C` | `Integer.parseInt(hex[0..1], 16)` |
| `1` | Air Humidity | `%` | `Integer.parseInt(hex[2..3], 16)` |
| `2` | Soil Moisture | `%` | `Integer.parseInt(hex[4..5], 16)` |
| `3` | Light Intensity | `%` | `Integer.parseInt(hex[6..7], 16)` |
| `4` | Water Level | `%` | `Integer.parseInt(hex[8..9], 16)` |
| `5` | Rain Sensor | `%` | `Integer.parseInt(hex[10..11], 16)` |

---

## 6. Security Vulnerabilities and Risks

1. **Lack of Authentication:** Anyone connected to the ESP32 Wi-Fi subnet can connect to port 80 and send arbitrary commands to the actuators.
2. **Cleartext Traffic:** Commands and telemetry are not protected by encryption (TLS/SSL).
3. **Crash on Malformed Packets:** The direct use of `Integer.parseInt` without handling the `NumberFormatException` inside `dataHandle` makes the client vulnerable to a local Denial of Service (DoS) if non-hexadecimal data is sent.

---

## 7. Dynamic Field Validation

The results of the static analysis of the Java source code were confirmed through dynamic testing using a Python simulator on TCP port 80.

### Overlap Evidence

- **Initial Handshake:** The Android application transmits the decimal value `123` (`{`) when the socket is opened, activating the telemetry stream.
- **Telemetry Format:** The app correctly receives and processes 12-character hexadecimal strings (e.g., `193C324B5000` → 25°C temperature, 60% humidity, 50% soil moisture, 75% light, 80% water level, 0% rain).
- **Confirmed Command Map:** All user interface buttons send the 2-character ASCII codes identified during decompilation:
  - `as` / `As`: LED ON / OFF
  - `bs`: Irrigation ON
  - `cs` / `Cs`: Fan ON / OFF
  - `ds` / `Ds`: Servo Open / Closed
  - `es`: Buzzer Active

---

## 📄 License & Disclaimer

This project is created strictly for educational, security research, and interoperability purposes. All product names, trademarks, and registered trademarks belong to their respective owners.
