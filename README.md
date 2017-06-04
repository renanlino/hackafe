# HackaCoffee - Hackathon 3 Corações CPBR9
Winning team of the [hackathon](https://twitter.com/3coracoes/status/693587047345451010) at Campus Party Brazil 2016

[Saiba mais do evento aqui](http://www.mexidodeideias.com.br/eventos/um-hackathon-cafeinado-na-campus-party-brasil/)

![Grupo Vencedor](https://raw.githubusercontent.com/ezefranca/hackafe/master/grupo.png)


## Conexões
### Módulo BLE
| HM10 BLE  | Conexão                         | Arduino|
|-----------|---------------------------------|--------|
| HM10 RX   | < ( 3v3 LEVEL SHIFT 5v) - | Pino 4 |
| HM10 TX   | --> | Pino 5 |
| HM10 GND  | - (C BC547 E) -> | GND    |
| HM10 VCC  | --- | 5V     |
| BC547 B   | - (R 1k Ohm) > | Pino 6 |

### Placa da Máquina Multibebidas/Painel Frontal
| Pino da Placa | Função no Painel |
|---------------|------------------|
|1 | GND (vermelho no cabo flat)|
|2 | GND |
|3 | LED Lateral Vermelho |
|4 | LED Lateral Amarelo |
|5 | LED Botão Verde |
|6 | LED Botão Azul |
|7 | LED Botão Vermelho |
|8 | Botão Verde |
|9 | Botão Azul |
|10| Botão Vermelho |

### Esquemático do Painel
![Esquemático do Painel](/images/schme.jpeg)


## Comandos do Firmware
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
