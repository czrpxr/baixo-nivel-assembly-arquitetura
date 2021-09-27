
# 3.1 Os Barramentos


#### Próximo: [3.2 A Memória](./a_memoria.md)  
#### Anterior: [3 Organização de um sistema x86](./sistemax86.md)  

Os barramentos do sistema são utilizados para conectar vários componentes em uma máquina Von Neumann. A família 80x86 possui 3 barramentos principais: endereço, dados e controle. Um barramento é simplesmente uma conjunto de fios que transferem sinais elétricos entre os componentes de um sistema. Eles variam de processador para processador, mas todos desempenham a mesma função entre sistemas.  

Um sistema 80x86 padrão utiliza níveis lógicos TTL (Transistor-Transistor Logic). Isso significa que cada fio do barramento utiliza voltagens padrões para representar 0 e 1 (No caso do TTL, 0.0 - 0.8V representam 0 e 2.4 - 5V representa 1).  

## Barramento de Dados  

É utilizado para troca de dados entre vários componentes em um sistema e a CPU. O tamanho desse barramento varia e é ele quem define o "tamanho" do processador. Em um sistema típico 80x86 o barramento de  dados possui 8, 16, 32 ou 64 linhas. Possuir um barramento de dados de 8 bits não significa que o processador está limitado a dados de 8 bits, mas sim que o processador poderá acessar apenas 1 byte na memória, por ciclo. Contudo um barramento de 8 bits com um processador 8088 pode apenas transmitir metade da informação por unidade de tempo (ciclo de memória) que um processador 8086 de 16 bits.  
Sendo assim, sabemos que processadores com barramentos de 16 bits são naturalmente mais rápidos que processadores de 8 bits e que processadores de 32 bits são mais rápidos que de  16 bits.  
O tamanho do barramento de dados afeta o desempenho de um sistema mais do que o tamanho de qualquer outro barramento.  

## Barramento de Endereço  

Para transmitir os dados através do barramento de dados, a máquina necessita saber o _endereço_ ou origem/destino da entrada/saída dos dados. Para resolver este problema existe o barramento de endereço. Para cada componente de entrada/saída ou elemento na memória, é atribuído um endereço. Quando um software necessita acessar alguma localização específica a localização é colocada no barramento de endereço. O dispositivo reconhece o endereço e então instrui a memória ou entrada/saída a ler ou enviar dados para aquela localização.  
Com apenas uma linha de endereçamento o processador poderia criar exatamente dois endereços únicos (0 e 1). Com n linhas o processador pode prover 2 elevado a n endereços únicos. Sendo assim, o número de bits no barramento de endereços irá determinar o número máximo de memória endereçável.  

_Exemplos:_

|Processador|Tamanho do Barr. de End.|Máx. de memória endereçável|Traduzindo|
|:-:|:-:|:-:|:-:|
|8088|20|1.048.576|1 Mb|
|8086|20|1.048.576|1 Mb|
|80286|24|16.777.216|16 Mb|
|80386sx|24|16.777.216|16 Mb|
|80386dx|32|4.294.976.296|4 Gb|
|80486|32|4.294.976.296|4 Gb|  

## Barramento de Controle  

Vamos imaginar que o processador está enviando e recebendo dados da memória através do barramento de dados. Em determinado momento nos perguntamos _"Estamos enviando ou recebendo?"._ Nesse momento entra o **barramento de controle**: ele especifica parâmetros para a comunicação como a direção do dado (enviando ou recebendo), o clock do sistema, status, interrupções e por aí vai.  
As linhas de controle de _leitura_ e _escrita_ controlam a direção do dado no barramento de dados. Quando ambos estão definidos como 1, o processador, a memória e as entradas/saídas não estão se comunicando. Se a linha de leitura é 0, o processador está lendo dado da memória, quando a linha de escrita é 0, o sistema esta transferindo dados do processador para memória.  
A família 80x86 oferece dois espaços de endereçamento distintos: um para memória e outro para as entradas/saídas. Enquanto os endereço para memória variam de tamanho, os de entrada/saída são de 16 bits. Isso permite que um processador enderece 65536 diferentes endereços de entrada/saída (lembrando que alguns dispositivos precisam de mais de um endereço para entrada e saída.
