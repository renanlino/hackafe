#Hackathon 3 Corações CPBR9

##Conexões
###Módulo BLE
* HM10 RX   <---- (LEVEL SHIFT) --- Pino 4
* HM10 TX   ----------------------> Pino 5
* HM10 GND  ----- (C BC547 E) ----> GND
* HM10 VCC  ----------------------- 5V
* BC547 B   ----------------------> Pino 6

##Comandos do Firmware
* STS
  * STS+OK: Pronta para funcionar
  * STS+ERR: Erro desconhecido
  * STS+HEAT: Aquecendo
  * STS+WATER: Sem água
  * STS+DESCAL: Necessita descalcificação
  * STS+LONG: Muito tempo desligada
  * STS+SLEEP: Economia de Energia
* BUT=N
  * Acionamento do botão N [1-3]
  * BUT+OK || BUT+ERR:
* START=client
  * Informa o nome do usuário
  * START+OK
