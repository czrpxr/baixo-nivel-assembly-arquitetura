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

 Quando um programa assembly é convertido em um executável, o linker deverá saber qual o ponto de início do programa. Para programas simples não é dificil encontrá-lo, porém para programas maios complexos que utilizam diversas funções encontrar este ponto pode ser um problema.  

 Para resolver este problema, o assembler GNU declara um identificador padrão que indica o início do programa. Ele é o **_start**. Se o linker não encontrar este identificador ele retornará uma mensagem de erro.  

 *OBS: você também pode utilizar outra palavra para definir o início do programa. Basta utilizar o parâmetro -e do linker para informar qual o ponto de entrada*  

 Outra questão importante é que você deverá fazer com que este ponto de entrada seja global, ou seja, acessível a programas externos. isso é feito utilizando a diretiva .globl.  

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



