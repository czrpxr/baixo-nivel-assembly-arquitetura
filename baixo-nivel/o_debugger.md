# 5.3 O Debugger

#### Próximo: [5.4 O Compilador](./o_compilador.md)  
#### Anterior: [5.2 O Linker](./o_linker.md)  

---  

Espero que você não cometa erros no seu programa assembly. Porém quando cometer é bom que tenha um bom debugger disponível!  
Similar aos assemblers, os debuggers são específicos para o sistema (S.O. e hardware) em que serão utilizados. O debugger deve saber a instrução correta do hardware e entender os métodos de manipulação de registradores e memória no sistema operacional.  

A maioria dos debuggers disponibiliza quatro funções básicas ao programador. São elas:  
- Executar o programa em um ambiente controlado, especificando versão e parâmetros necessários,  
- Parar o programa a qualquer momento durante a execução,  
- Examinar os elementos de dados, como posições na memória e registradores,  
- Alterar elementos em um programa enquanto ele está sendo executado, facilitando a remoção de bugs.  
