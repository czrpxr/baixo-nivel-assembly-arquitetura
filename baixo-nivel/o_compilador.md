# 5.4 O Compilador

#### Próximo: [](./.md)  
#### Anterior: [5.3 O Debugger](./o_debugger.md)  

---  

Se você planeja criar um programa apenas com a linguagem assembly, um compilador não será necessário. Contudo, a maioria dos programadores prefere desenvolver seua aplicações em uma linguagem de mais alto nível e concentrar seus esforços em assembly na otimização de pontos bem definidos. Para que isso aconteça, você deve ter um compilador instalado para a sua linguagem de alto nível.  

O trabalho do compilador é converter a linguagem de alto nível em instruções ao processador. A maioria dos compiladores na verdade realizam um trabalho intermediário: ao invês de converter códigos fonte em instruções eles convertem o código fonte em assembly. Então o código em assembly é convertido em instruções utilizando o assembler. A maioria dos compiladores inclui um assembler em seu compilador.