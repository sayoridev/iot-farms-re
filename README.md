# Keyestudio IoT Farm – Reverse Engineering & Protocol Specification

![Python](https://img.shields.io/badge/Python-3.x-blue.svg)
![Protocol](https://img.shields.io/badge/Protocol-Raw%20TCP-orange.svg)
![Target](https://img.shields.io/badge/Target-ESP32%20%2F%20Android-green.svg)

Reverse engineering analysis of the **Keyestudio IoT Smart Farm** Android application (`com.keyestudio.IOTfarm`) and its raw TCP communication protocol with the ESP32 controller. 

This repository provides full protocol specifications, vulnerability assessments, an ESP32 server simulator for dynamic testing, and a standalone CLI control utility.

---

## 📁 Repository Structure
iot-farms-re/
├── REVERSE_ENGINEERING_REPORT.md  # Detailed technical report and analysis
├── iot_farm_sim.py               # ESP32 server simulator & test client
├── farm_ctl.py                   # Standalone CLI tool to control the farm directly
└── .gitignore                    # Git ignore rules

## 🛰️ Protocol Overview

- **Transport:** Unencrypted Raw TCP Socket
- **Default Target IP:** `192.168.3.2`
- **Port:** `80`[cite: 1]
- **Handshake:** ASCII character `{` (Byte `123`) sent by the client upon socket connection to initiate telemetry streaming[cite: 1].

### Actuator Control Commands (Client ➔ ESP32)
Commands are 2-character ASCII strings sent over the open TCP socket[cite: 1]:

| Hardware Component | Command | Description |
| :--- | :---: | :--- |
| **LED Light** | `as` / `As` | Turn ON (`as`) / OFF (`As`)[cite: 1] |
| **Water Pump** | `bs` | Trigger irrigation pump[cite: 1] |
| **Ventilation Fan** | `cs` / `Cs` | Turn ON (`cs`) / OFF (`Cs`)[cite: 1] |
| **Servo Door** | `ds` / `Ds` | Open (`ds`) / Close (`Ds`) door[cite: 1] |
| **Buzzer** | `es` | Play audio melody[cite: 1] |

### Telemetry Format (ESP32 ➔ Client)
The ESP32 continuously streams a 12-character Hexadecimal ASCII string representing 6 sensor metrics (converted Hex-to-Dec)[cite: 1]:

| Byte Pair | Hex Index | Sensor Metric | Unit |
| :---: | :---: | :--- | :---: |
| 1 | `[0..1]` | Air Temperature | `°C`[cite: 1] |
| 2 | `[2..3]` | Air Humidity | `%`[cite: 1] |
| 3 | `[4..5]` | Soil Moisture | `%`[cite: 1] |
| 4 | `[6..7]` | Ambient Light | `%`[cite: 1] |
| 5 | `[8..9]` | Water Level | `%`[cite: 1] |
| 6 | `[10..11]` | Rain Intensity | `%`[cite: 1] |

---

📄 License & Disclaimer
This project is created strictly for educational, security research, and interoperability purposes. All product names, trademarks, and registered trademarks belong to their respective owners.
