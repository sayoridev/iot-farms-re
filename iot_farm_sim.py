#!/usr/bin/env python3
import socket
import time
import threading
import sys

COMMANDS = {
    "as": "LED - ON",
    "As": "LED - OFF",
    "bs": "Irrigazione - Pump Activated",
    "cs": "Ventola - ON",
    "Cs": "Ventola - OFF",
    "ds": "Servomotore - Open",
    "Ds": "Servomotore - Closed",
    "es": "Buzzer - Music reproduced",
}

class ESP32FarmServer:
    def __init__(self, host="0.0.0.0", port=80):
        self.host = host
        self.port = port
        self.running = False

    def start(self):
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        server_socket.bind((self.host, self.port))
        server_socket.listen(1)
        self.running = True
        print(f"[*] ESP32 Farm Server listening on {self.host}:{self.port}...")

        while self.running:
            client_sock, addr = server_socket.accept()
            print(f"[+] Client connected from: {addr[0]}:{addr[1]}")
            threading.Thread(target=self._handle_client, args=(client_sock,), daemon=True).start()

    def _handle_client(self, client_sock):
        try:
            data = client_sock.recv(1024)
            if data and data[0] == 123:
                print("[+] Handshake sended with success (Byte 123 / '{')")

            def send_telemetry():
                temp, hum, soil, light, water, rain = 25, 60, 50, 75, 80, 0
                while self.running:
                    telemetry_hex = f"{temp:02X}{hum:02X}{soil:02X}{light:02X}{water:02X}{rain:02X}"
                    try:
                        client_sock.sendall(telemetry_hex.encode("utf-8"))
                        time.sleep(2)
                    except Exception:
                        break

            threading.Thread(target=send_telemetry, daemon=True).start()

            while self.running:
                cmd_bytes = client_sock.recv(1024)
                if not cmd_bytes:
                    break
                cmd = cmd_bytes.decode("utf-8", errors="ignore")
                action = COMMANDS.get(cmd, f"Unknown command ({cmd})")
                print(f"[>] Command recived from the app: '{cmd}' -> Action: {action}")

        except Exception as e:
            print(f"[-] Error managing client: {e}")
        finally:
            client_sock.close()
            print("[-] Client disconnected.")

def run_client(target_ip, port=80):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        sock.connect((target_ip, port))
        print(f"[+] Connesso a {target_ip}:{port}")
        sock.sendall(bytes([123])) 
        
        while True:
            print("\n--- Comandi Disponibili ---")
            for code, desc in COMMANDS.items():
                print(f" [{code}] {desc}")
            cmd = input("Insert command code (or 'q' for exiting): ").strip()
            if cmd.lower() == 'q':
                break
            if cmd in COMMANDS:
                sock.sendall(cmd.encode('utf-8'))
                print(f"[->] Sended: {cmd}")
            else:
                print("[!] Code not valid.")
    except Exception as e:
        print(f"[-] Connection error: {e}")
    finally:
        sock.close()

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "--client":
        ip = sys.argv[2] if len(sys.argv) > 2 else "192.168.3.2"
        run_client(ip)
    else:
        ESP32FarmServer().start()