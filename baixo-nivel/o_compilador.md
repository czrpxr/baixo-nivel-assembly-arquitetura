# 5.4 O Compilador

#### Próximo: [](./.md)  
#### Anterior: [5.3 O Debugger](./o_debugger.md)  

---  

Se você planeja criar um programa apenas com a linguagem assembly, um compilador não será necessário. Contudo, a maioria dos programadores prefere desenvolver seua aplicações em uma linguagem de mais alto nível e concentrar seus esforços em assembly na otimização de pontos bem definidos. Para que isso aconteça, você deve ter um compilador instalado para a sua linguagem de alto nível.  

O trabalho do compilador é converter a linguagem de alto nível em instruções ao processador. A maioria dos compiladores na verdade realizam um trabalho intermediário: ao invês de converter códigos fonte em instruções eles convertem o código fonte em assembly. Então o código em assembly é convertido em instruções utilizando o assembler. A maioria dos compiladores inclui um assembler em seu compilador.  cle

Após converter, por exemplo, um código C/C++ em assembly, o compilador utiliza o assembler para criar a instrução para o linker. Você pode interromper o processo entre estes passos e examinar o código assembly. Se você achar que algo pode ser otimizado, o código assembly pode ser modificado.  

## O Compilador GNU  

O compilador GNU (gcc) é o mais popular no desenvolvimento em ambiente Unix. Não somente é o compilador padrão do sistema Linux e da maioria dos sistemas BSD-based, mas também é popular em diversas distribuições comerciais Unix.  

O *gcc* é capaz de compilar diferentes linguagens de alto nível. Atualmente ele é compatível com as linguagens C, C++, Objective-C, Java, Fortran, and Ada. O *gcc* não é só capaz de compilar C/C++, como também disponibiliza as bibliotecas necessárias para rodar esteas aplicações no sistema.  

A grande maioria das distribuições Linux possuem o *gcc* instalado por padrão, porém, caso necessário, você pode verificar sua instalação através do comando:  

`  
gcc --version  
`  
`
gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
`  

Caso não esteja instalado, você pode verificar no seu gerenciador de pacotes.  
Existem diversos parametros para o comando *gcc*. Eles podem ser visualizados utilizando o comando *gcc --help*.  

Para testar seu compilador, você pode criar um programa de teste em C como o programa abaixo:  

`  
#include <stdio.h>  
  
int main(void)  
{  
printf("Hello, world!\n");  
  
return 1;  
}  
`  

e compilá-lo com a seguinte instrução:  

`  
gcc -o cteste teste.c
`  

Como esperado o *gcc* cria um arquivo executável (cteste). Repare que neste caso não existe um formato intermediário tipo objeto.  Sendo assim, um parâmetro muito útil que pode ser utilizado no gcc é o -S. Este parâmetro disponibiliza o arquivo intermediário na linguagem assembly criado pelo compilador antes que o assembler o acesse: 

`  
gcc -S teste.c
`  

O arquivo gerado é nomeado com a extensão *.s*. Esta opção é muito útil quando se quer otimizar aplicações em determinados pontos com a linguagem assembly.  