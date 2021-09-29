# 6.1 Declarando elementos de dados

#### Próximo: [6.2 Movendo Dados](./movendo_dados.md)  
#### Anterior: [6. Primeiro Programa Assembly](./primeiro_programa.md)   

  ---  

Na seção anterior vimos como são as seções de um programa assembly. Entre elas temos as seção *.data* que é onde definimos os elementos de dados. Nessa seção definimos os endereços de memória onde os elementos serão armazenados. Estes elementos podem ser referenciados nos programas, lidos e modificados quando necessário.  

*OBS: Existe uma outra seção de dados além de .data chamada de .rodata. Nesta seção os elementos somente podem ser acessados para leitura (read-only)*  

É utilizado um rótulo para referenciar o elemento (assim como uma variável em outras linguagens). Além do rótulo deve ser definido quantos bytes serão reservados para este elemento. Isso é feito utilizando uma diretiva do assembler. Abaixo temos uma tabela delas:  

|Diretiva|Tipo de Dados|
|:---:|:---:|
|.ascii| Texto |
|.asciz| Texto terminado com valor nulo |
|.byte| Valor em Byte |
|.double| Ponto flutuante de dupla precisão |
|.float| Ponto flutuante |
|.int| inteiro de 32-bits |
|.long| inteiro de 32-bits |
|.octa| inteiro de 16-bytes |
|.quad| inteiro de 8-bytes |
|.short| inteiro de 16-bits |
|.single| Ponto flutuante |  

Após utilizar o rótulo e o título é necessário dizer o valor padrão. No nosso primeiro programa isso foi feito da seguinte maneira:  

`  
.section .data  

 output:  
  .ascii "O ID do Fabricante e 'xxxxxxxxxxxx'\n"  
`  

Esta declaração reserva 36 bytes da memória, armazena a string nela e atribui o endereço do primeiro byte à *output*. Quando a localização de *output* for referenciada no programa, o assembler saberá onde ir na memória para iniciar a leitura da string.  

O mesmo acontece para o seguinte:  

`  
.section .data  

 pi:  
  .float 3.14159
`  
  
  Você não está limitado em declarar somente um valor. Você pode definir multiplos valores em uma linha com cada valor sendo armazenado na memória na ordem em que é declarado. Por exemplo:  
  
`  
 sizes:
  .long 100,150,200,250,300
`  

No código anterior o inteiro 100 é colocado no endereço de referência de *sizes* ocupando os primeiros 4 bytes (32-bits). Em seguida é colocado o valor 150 ocupando os próximos 4 bytes. Como o espaço reservado para cada elemento possui tamanho fixo, podemos acessar cada elemento por sua posição relativa na lista. Por exemplo, podemos acessar o valor 200 acessando a posição na memória de *sizes* e acrescentar 8 bytes (sizer+8).  

Podem ser declarados quantos elementos de dados forem necessários na seção *.data*. Cada elemento é armazenado na memória na ordem em que é declarado. Elementos com multiplos valores são armazenados na posição declarada na diretiva.  

*OBS: cuidado ao definir elementos de dados e utilizá-los no programa. O programa nao irá saber se você está manipulando o dado da forma correta! Por exemplo, se você definir dois inteiros de 16-bits, mas referenciar um como inteiro de 32-bits, o assembler continuará lendo os 4 bytes da memória necessários, mesmo que não seja o valor correto.*  

