int ledLatVerm = 13;
int ledLatAmar = 12;
int ledBotVerd = 11;
int ledBotAzul = 10;
int ledBotVerm = 9;

int header[5];
int i;

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
  Serial.println("");
  delay(100);
  leHeader();
  for(i=0; i <= 4; i++)
  {
    Serial.print(header[i]);
  }
    
}

int leHeader()
{
  header[0] = digitalRead(ledLatVerm);
  header[1] = digitalRead(ledLatAmar);
  header[2] = digitalRead(ledBotVerd);
  header[3] = digitalRead(ledBotAzul);
  header[4] = digitalRead(ledBotVerm);
}

