# 6.2 Movendo Dados

#### Próximo: [6.2.1 MOV Condicional ](./mov_condicional.md)  
#### Anterior: [6.1 Declarando Dados](./primeiro_programa.md)   

---  
  
Após os dados serem definidos na seção *.data* você deve saber como manipulá-los. A primeira etapa é saber como mover estes valores entre registradores.  
A instrução **MOV** é utilizada como um operador de propósito geral. É uma das instruções mais utilizadas em asembly. A seguir veremos as diferentes maneiras de utilizar esta instrução.  

## Os formatos da instrução MOV  

A formatação básica do comando *mov* é  

*mov**x** origem, destino*  

O campos de origem e destino podem ser endereços de memória, dados armazenados em memória, dados definidos em instruções ou registradores.  

*OBS: Lembrando que no assembler GNU utilizamos a sintaxe AT&T. Portanto a ordem dos parâmetros origem e destino estão invertidas em comparação com a sintaxe Intel*  

Junto com a instrução *mov* temos que dizer qual o tamanho do elemento que queremos mover. Assim entra o valor que substituirá o parâmetro **x** na instrução. Temos que adicionar uma caractere seguindo a regra:  

- l: para palavras de 32-bits,   
- w: para palavras de 16-bits,  
- b: para 1 byte  

Sendo assim, para mover um registro de 32-bits de EAX para EBX, utilizamos:  

*movl %eax, %ebx*  

Para mover um registro de 16-bits utilizamos:  

*movw %ax, %bx*  

Para mover um registro de 8-bits:  

*movb %al, %bl*  

Existem regras bem específicas para utilizar a instrução *mov*. Elas são mover:  

### Um elemento de dado para um registrador e uso geral 

*movl $0, %eax*  
*movl $0x80, %ebx*  

### Um elemento de dado para uma posição na memória  

*movl $100, height*  

### Um registrador de uso geral para outro registrador de uso geral  

*movl %eax, %ebx*  
*movw %ax, %cx*  

Mover dados entre registradores de mesmo tamanho é fácil. O problema começa quando temos que mover dados entre registradores de tamanhos diferentes. Você deve tomar cuidado quando especificar registradores maiores para receber dados de registradores menores. Por exemplo:  

*movb %al, %bx*  

Este comando produzirá um erro pelo assembler. Esta instrução tenta mover os 8 bits de *al* para os 8 bits menos significativos de *bx*. Ao inv;es disso você deve mover todo o registrador *ax* para *bx* com o comando *movw*.



### uma posição na memória para um registrador de uso geral  

*movl value, %eax*  

O caso acima move o dado localizado na posição de memória definida por *value* para o registrador *EAX*. Porém, lembre-se de que a instrução *movl* move 32-bits de dados; ou seja, estará movendo 4 bytes do endereço de início apontado por *value*. Se você estiver armazenando menos de 4 bytes de dado, você deve utilizar uma das outras opçoes para *mov* como *movb* para 1 byte e *movw* para 2 bytes.  


### um registrador de uso geral para uma posição na memória  

*movl %ecx, value*  

Esta instrução move 4 bytes de dados em *ecx* para a posição na memória especificado por *value*. 

Podemos ter também elementos de dados declarados da seguinte maneira:  

*values:*
*.int 10, 15, 20, 25, 30, 35, 40, 45*  

A instruão acima cria dados armazenados sequencialmente na memória. Cada um destes elementos ocupa uma unidade de memória (por ser int, 4 bytes para 32-bits). Quando referenciar este conjunto, você deve especificar qual valor está acessando. A maneira de fazer isso é chamada de modo de inexação de memória.  
O formato base da expressão é a seguinte:  

*endereco_base(offset, index, tamanho)*  

Caso algum desse valores seja zero, ele pode ser omitido, porém as vírgulas devem manter a posição.  
Sendo assim no caso do conjunto *values*, se quisermos referenciar o valor *20*, temos que utilizar a seguinte instrução:  

*movl $2, %edi*  
*movl values(, %edi, 4), %eax*  

No exemplo, carregamos o terceiro índice de tamanho 4 bytes de *values* para o registrador *eax% (lembrando que os índices se iniciam em zero).  

---  

Além de armazenar dados em si, os registradores também podem ser usados para armazenar endereços de memória. Quando um registrador armazena um endereço ele recebe o nome de **ponteiro**. Acessando o dado na posição da memória utilizando o ponteiro é chamado de **endereçamento indireto**. Esta técnica pode ser a maneira mais confusa de se acessar um dado.  


Ao utilizar rótulos para referenciar um valor na memória, você pode extrair a posição na memória deste elemento utilizando o símbolo **$**. Sendo assim, a instrução:  

*movl $values, %edi*  

move o endereço de memória de *values* para o registrador *edi*.  









- um segmento de registro para uma posição na memória.  
- uma posição na memória para um segmento de registro,  
- um registrador de uso geral para um segmento de registro e vice-versa,  
- um registrador e uso geral para um registrador de controle e vice-versa,  
- um registrador de uso geral para um registrador de debug e vice-versa,  





