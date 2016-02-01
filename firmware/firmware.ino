#include <SoftwareSerial.h>

#define ledLatVerm A4
#define ledLatAmar 12
#define ledBotVerd 11
#define ledBotAzul 10
#define ledBotVerm A0

#define bot1 7
#define bot2 8
#define bot3 9

#define BLE_RX  5
#define BLE_TX  4
#define BLE_EN  6

#define DEBUG   1

#define NUM_READ 10

String clientName;
int buttons[] = {bot1, bot2, bot3};

SoftwareSerial BLE(BLE_RX, BLE_TX);

void setup() {

  if (DEBUG) Serial.begin(9600);
  BLE.begin(9600);

  /*LEDS*/
  pinMode(ledLatAmar, INPUT_PULLUP);
  pinMode(ledBotVerd, INPUT_PULLUP);
  pinMode(ledBotAzul, INPUT_PULLUP);
  pinMode(13, INPUT);

  /*Inicia botões no modo tri-state*/
  pinMode(bot1, INPUT);
  pinMode(bot2, INPUT);
  pinMode(bot3, INPUT);

  /*Enable do modulo BLE*/
  pinMode(BLE_EN, OUTPUT);
  
  /*Resetando o modulo BLE*/
  digitalWrite(BLE_EN, LOW);
  delay(500);
  digitalWrite(BLE_EN, HIGH);
  delay(2000);

  /*testando módulo BLE*/
  BLE.println("AT");
  delay(500);
  if ( !BLE.find("OK") ) {
    if (DEBUG) Serial.println("ERRO FATAL: Não foi possível estabelecer comunicação com o modulo BLE!");
    //for(;;);
  } else {
    if (DEBUG) Serial.println("Comunicacao com o modulo BLE realizada.");
  }

}

void loop() {
  
  String cmd;
  int ans[5], value;
  
  cmd = BLE.readStringUntil('\n');
  

  if (cmd.length() >= 3) {
    
    if ( cmd.startsWith("START+") ) {
      clientName = cmd.substring( cmd.indexOf("=") + 1 );
      BLE.println("START+OK"); 
                  
    } else if ( cmd.startsWith("STS") ) {
     BLE.print("STS+");
     detectarPiscando(ans, 2000);

     /*interpretar e printar o resultado para o modulo BLE*/
     //BLE.println(RESULTADO DO STATUS)
     for(int i = 0; i < 5; i++) BLE.print(ans[i]);
     BLE.println();
     
     if (DEBUG) {
      for(int i = 0; i < 5; i++) Serial.print(ans[i]);
      Serial.println();
     }
       
    } else if ( cmd.startsWith("BUT=") ) {
      cmd.remove(0,4);
      value = cmd.toInt();
      BLE.print("BUT+");
      if (value > 0 && value <= 3 ) {
        pulseButton(value);
        BLE.println("OK");
      } else BLE.println("ERR:range");
    }

    if (DEBUG) {
    Serial.print("RCV: ");
    Serial.println(cmd);
    }
    
  }
}

/*
 *Examina o estado dos LEDs durante @period milisegundos
 *Retorna 1 para ligado fixo;
 *        0 para desligado fixo;
 *        2 para piscando;
 *Tamanho do vetor ans: 5
*/
void detectarPiscando(int * ans, int period)
{
  int ledLatVermVec[NUM_READ], ledLatAmarVec[NUM_READ], ledBotVerdVec[NUM_READ],
      ledBotAzulVec[NUM_READ], ledBotVermVec[NUM_READ], auxRead, sum;
  for ( int i = 0; i < NUM_READ; i++ ) {
    auxRead  = analogRead(ledLatVerm);
    if(auxRead > 300) ledLatVermVec[i] = 1;
    else ledLatVermVec[i] = 0;
    
    ledLatAmarVec[i] = digitalRead(ledLatAmar);
    ledBotVerdVec[i] = digitalRead(ledBotVerd);
    ledBotAzulVec[i] = digitalRead(ledBotAzul);
    
    auxRead  = analogRead(ledBotVerm);
    if(auxRead > 300) ledBotVermVec[i] = 1;
    else ledBotVermVec[i] = 0;
    delay(period/NUM_READ);
  }
  sum = vecSum(ledLatVermVec, NUM_READ);
  if ( sum == NUM_READ || sum == 0 ) ans[0] = sum/NUM_READ;
  else ans[0] = 2;

  sum = vecSum(ledLatAmarVec, NUM_READ);
  if ( sum == NUM_READ || sum == 0 ) ans[1] = sum/NUM_READ;
  else ans[1] = 2;

  sum = vecSum(ledBotVerdVec, NUM_READ);
  if ( sum == NUM_READ || sum == 0 ) ans[2] = sum/NUM_READ;
  else ans[2] = 2;

  sum = vecSum(ledBotAzulVec, NUM_READ);
  if ( sum == NUM_READ || sum == 0 ) ans[3] = sum/NUM_READ;
  else ans[3] = 2;

  sum = vecSum(ledBotVermVec, NUM_READ);
  if ( sum == NUM_READ || sum == 0 ) ans[4] = sum/NUM_READ;
  else ans[4] = 2;
}

/*
 *Soma um vetor
*/
int vecSum(int * vec, int len) {
  int sum = 0;
  for (int i = 0; i < len; i++) sum = sum + vec[i];
  return sum;
}

/*
 *Pulsa um botão de forma segura
 */
void pulseButton(int butNumber) {
  pinMode(buttons[butNumber-1], OUTPUT);
  digitalWrite(buttons[butNumber-1], LOW);
  delay(200);
  pinMode(buttons[butNumber-1], INPUT);
}


