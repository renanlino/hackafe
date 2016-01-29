int ledLatVerm = 13;
int ledLatAmar = 12;
int ledBotVerd = 11;
int ledBotAzul = 10;
int ledBotVerm = A0;

int header[5];

int i;
int auxRead;

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
  Serial.println(detectarPiscando());
}

void leHeader( int * array)
{
  array[0] = digitalRead(ledLatVerm);
  array[1] = digitalRead(ledLatAmar);
  array[2] = digitalRead(ledBotVerd);
  array[3] = digitalRead(ledBotAzul);
  auxRead  = analogRead(ledBotVerm);
  if(auxRead > 300) array[4] = 1;
  else array[4] = 0;
}

int detectarPiscando()
{
  float duracao;
  duracao = pulseIn(11, HIGH);
  return duracao;
}

