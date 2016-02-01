#Hackathon 3 Corações CPBR9

##Conexões
###Módulo BLE
| HM10 BLE  | Conexão                         | Arduino|
| HM10 RX   | <---- ( 3v3 LEVEL SHIFT 5v) --- | Pino 4 |
| HM10 TX   | ------------------------------> | Pino 5 |
| HM10 GND  | --------- (C BC547 E) --------> | GND    |
| HM10 VCC  | ------------------------------- | 5V     |
| BC547 B   | ---------- (R 1k Ohm) --------> | Pino 6 |

### Placa da Máquina Multibebidas/


##Comandos do Firmware
* STS
  * STS+abcde
    * a: LED Lateral Vermelho
    * b: LED Lateral Amarelo
    * c: LED Botão Vermelho/Laranja
    * d: LED Botão Azul
    * e: LED Botão
  * Onde a, b, c, d, e e pode ser:
    * 0 = LED fixo desligado
    * 1 = LED fixo ligado
    * 2 = LED piscando
* BUT=N
  * Acionamento do botão N [1-3]
  * BUT+OK || BUT+ERR:range
* START=client (useless)
  * Informa o nome do usuário
  * START+OK
