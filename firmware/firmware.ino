#include <SoftwareSerial.h>

#define BLE_RX  4
#define BLE_TX  5
#define BLE_EN  6

#define DEBUG   1

SoftwareSerial BLE(BLE_RX, BLE_TX);

void setup() {
  
  //Resetando o modulo BLE
  digitalWrite(BLE_EN, LOW);
  delay(500);
  digitalWrite(BLE_EN, HIGH);
  delay(2000);

  //testando módulo BLE
  BLE.println("AT");
  delay(500);
  if ( !BLESlave.find("OK") ) {
    if (DEBUG) Serial.println("ERRO FATAL: Não foi possível estabelecer comunicação com o módulo BLE!");
    for(;;);
  } else {
    if (DEBUG) Serial.println("Comunicação com o módulo BLE realizada.");
  }

}

void loop() {
  // put your main code here, to run repeatedly:
  String cmd;
  cmd = BLE.readStringUntil('\n');

}
