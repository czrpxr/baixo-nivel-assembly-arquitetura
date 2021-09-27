# 6. Primeiro Programa Assembly

#### Próximo: [6. ](./md)  
#### Anterior: [5.4 O Compilador](./o_compilador.md)  

  ---  

  O código desenvolvido em linguagem assembly é constituído de seções bem definidas, cada uma com um diferente propósito. As três mais usadas são:  

  - seção **data**  
  - seção **bss**  
  - seção **text**  

  A seção *text* é obrigatória em todos os programas assembly. É nesta seção em que as instruções são declaradas. As seções *data* e *bss* são opcionais, porém aparecem na maioria dos programas. A seção *data* declara elementos de dados que possuem valor inicial. Estes elementos são utilizados como variáveis no programa assembly. A seção *bss* declara elementos de dados que são instanciados com o valor zero (ou nulo). Estes elementos são geralmente utilizados como área de buffer do programa.  

  Abaixo temos como as seções são delimitadas em um program assembly. Não existe uma regra muito bem definida para as posições, porém a seção *bss* **deve** preceder a seção *text*. Já a seção *data* pode ocupar qualquer posição. A imagem mostra a posição mais usual das seções.  

 ![](./imgs/6_001.png)  

 ## O ponto de início  

 Quando um programa assembly é convertido em um executável, o linker deverá saber qual o ponto de início do programa. Para programas simples não é difícil encontrá-lo, porém para programas maios complexos que utilizam diversas funções encontrar este ponto pode ser um problema.  

 Para resolver este problema, o assembler GNU declara um identificador padrão que indica o início do programa. Ele é o **_start**. Se o linker não encontrar este identificador ele retornará uma mensagem de erro.  

 *OBS: você também pode utilizar outra palavra para definir o início do programa. Basta utilizar o parâmetro -e do linker para informar qual o ponto de entrada*  

 Outra questão importante é que você deverá fazer com que este ponto de entrada seja global, ou seja, acessível a programas externos. isso é feito utilizando a diretiva *.globl.*  

 Sendo assim, o esboço de um programa assembly ideal seria assim:  

 `  
 .section.data  
<dados inicializados aqui>  

.section .bss  
<dados não inicializados aqui>  

.section .text  
.globl _start  
_start:  

<código segue aqui>  
`  

## O Comando CPUID  


O comando CPUID é utilizado para requisitar informações sobre o processador que está executando o programa. Ele utiliza um único valor em uma registrador como entrada.  O registrador *EAX* é utilizado para determinar qual informação é produzida pela instrução CPUID. Dependendo do valor no registrador *EAX*, o comando CPUID irá produzir uma informação diferente sobre o processador nos registradores *EBX*, *ECX* e *EDX*. A informação é retornada como uma série de bits e flags a serem interpretadas. A seguinte tabela mostra as diferentes opções de saída para o comando:  

|Valor em EAX|Valor CPUID|
|:---:|:---:|
|0 | ID do fabricante e a opção máxima do CPUID suportado|
|1 | Tipo do processador, família, modelo e informação de stepping|
|2 | Configuração de Cache|
|3 | Número de Série|
|4 | Outras configurações de cache (núm. de threads, numero de núcleos, entre outros)|
|5 | Informação sobre monitor|
|80000000h | ID estendido do fabricante e níveis suportados|
|80000001h | Tipo do processador, família, modelo e informação de stepping extendidos|
|80000002h-80000004h | Nome estendido do processador|  

No programa de exemplo que vamnos criar, utilizamos a opção *0* da tabela para receber simplesmente o ID do fabricante. Quando o valor 0 é colocado no registrador *EAX* e a instrução CPUID é executada, o processador retorna o ID do fabricante em *EBX*, *EDX* e *ECX* de acordo com o seguinte:  

- O *EBX* contém 4 bytes menos significativos da string,  
- O *EDX* contém os 4 bytes intermediários da string,  
- O *ECX* contém os 4 bytes mais significativos da string.
