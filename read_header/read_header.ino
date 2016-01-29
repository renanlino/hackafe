int ledLatVerm = 13;
int ledLatAmar = 12;
int ledBotVerd = 11;
int ledBotAzul = 10;
int ledBotVerm = A0;

#define NUM_READ 10

void setup()
{
  pinMode(ledLatVerm, INPUT_PULLUP);
  pinMode(ledLatAmar, INPUT_PULLUP);
  pinMode(ledBotVerd, INPUT_PULLUP);
  pinMode(ledBotAzul, INPUT_PULLUP);
  pinMode(ledBotVerm, INPUT_PULLUP);
  Serial.begin(9600);
}


void loop()
{
  int ans[5];
  detectarPiscando(ans);
  for(int i = 0; i < 5; i++) {
    Serial.print(ans[i]);
  }
  Serial.println();
}


/*
  Examina o estado dos LEDs durante 1 segundo
  Retorna 1 para ligado fixo;
          0 para desligado fixo;
          2 para piscando;
  Tamanho do vetor ans: 5
*/
void detectarPiscando(int * ans)
{
  int ledLatVermVec[NUM_READ], ledLatAmarVec[NUM_READ], ledBotVerdVec[NUM_READ],
      ledBotAzulVec[NUM_READ], ledBotVermVec[NUM_READ], auxRead, sum;
  for ( int i = 0; i < NUM_READ; i++ ) {
    ledLatVermVec[i] = digitalRead(ledLatVerm);
    ledLatAmarVec[i] = digitalRead(ledLatAmar);
    ledBotVerdVec[i] = digitalRead(ledBotVerd);
    ledBotAzulVec[i] = digitalRead(ledBotAzul);
    auxRead  = analogRead(ledBotVerm);
    if(auxRead > 300) ledBotVermVec[i] = 1;
    else ledBotVermVec[i] = 0;
    delay(1000/NUM_READ);
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
  Soma um vetor
*/
int vecSum(int * vec, int len) {
  int sum = 0;
  for (int i = 0; i < len; i++) sum = sum + vec[i];
  return sum;
}

