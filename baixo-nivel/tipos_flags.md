
# 4.3 Tipos de Flags


#### Anterior: [4.2 Tipos de Registradores](./tipos_registradores.md)   
#### Próximo: [](.md)  

---  

A arquitetura de 32-bits utiliza registradores de 32-bits para armazenar um conjunto de status, controle e sistema de flags. No registrador EFLAGS os bits são mapeados para representar flags específicas. Alguns bits são reservados para uso futuro. na literatura utilizada como referência 17bits são utilizados para flags.  

As flags são divididas em três grupos baseados em suas funcões:  

- Flags de Status,  
- Flags de Controle,  
- Flags de Sistema  

* **FLAGS DE STATUS**  

As flags de status são utilizadas para indicar o resultado de alguma operação matemática realizada pelo processador. Os status são representados conforme tabela:

|Flag|Bit|Nome|
|:---:|:---:|:---:|
|CF|0| Carry Flag|
|PF|2| Parity Flag|
|AF|4| Adjust Flag|
|ZF|6| Zero Flag|
|SF|7| Sign Flag|
|OF|11| Overflow Flag|

- Carry Flag: é utilizada se alguma operação matemática de um inteiro sem sinal (unsigned) gerar um carregamento ou empréstimo de um bit mais significativo. Eles representa uma condição de overflow no registrador envolvido na operação. Quando um overflow acontece, o dado que é mantido no registrador não é a resposta correta para a operação.  

- Parity Flag: é utilizada para indicar quando o registrador do resultado de uma operação matemática contem um dado corrompido. Apenas como um indicador de validação, o parity flag é ativado quando o numero total de bits 1 no resultado é par e desativado quando o numero total de bits 1 é ímpar.

- Adjust Flag: é utilizada em operações matemáticas de BCD (Binary Coded Decimal)  

- Zero Flag: é ativada se o resultado de uma operação é zero. É uma maneira fácil de verificar se o resultado de uma operação matemática foi nulo.  

- Overflow Flag: é utilizada quando um valor positivo é grande demais ou um número negativo é pequeno demais para ser representado em um registrador.  

* **FLAGS DE CONTROLE**  

As Flags de Controle são utilizadas especificamente para controlar o comportamento do processador. Atualmente, apenas uma flag é definida, a flag DF, ou flag de direção. Ela é utilizada para controlar a maneira que strings são manipuladas pelo processador.  

* **FLAGS DE SISTEMA**  

As Flags de Sistema são utilizadas para controlar operações de baixo nível do sistema. Aplicações nunca devem tentar modificar flags de sistema. Elas seguem listadas abaixo:  

|Flag|Bit|Nome|
|:---:|:---:|:---:|
|TF|8| Trap Flag|
|IF|9| Flag de Interrupção Habilitada|
|IOPL|12 e 13| Flag de privilégio de I/O|
|NT|14| Flag de tarefa aninhada|
|RF|16| Flag de retorno a operação|
|VM|17| Flag de modo virtual 8086|
|AC|18| Flag de checagem de alinhamento|
|VIF|19| Flag virtual de interrupção|
|VIP|20| Flag virtual de pendência|
|ID|21|  Flag de Identificação|

- Trap Flag: é ativada para permitir o modo de single-step. No modo single-step, o processador realiza apenas uma instrução de cada vez, aguardando um sinal para realizar a próxima. Esse atributo é extremamente util quando debugando aplicações em código assembly.  
- Flag de Interrupção habilitada: controla a resposta do processador a sinais recebidos de fontes externas
- Flag de privilégio de I/O: indica o nível de privilégio da tarefa atual. Define o nível de acesso ao espaço de endereço de I/O. Esta flag deve ser menor ou igual ao nível de acesso necessário para acessar o espaço de endereços de I/O. Caso contrário, a requisição para acessar este espaço será negada.  
- Flag de tarefa aninhada: controlar se uma tarefa atual está relacionada a tarefa anterior. É utilizada para conectar tarefas interrompidas ou requisitadas.  
- Flag de Retorno de Operação: controla como o processador responde a exceções quando no modo de debug.  
- Flag de movo virtual 8086: indica que o processador está operando no modo virtual-8086 ao invés do modo protegido ou modo real.  
- Flag de checagem de alinhamento: é utilizada para habilitar o checagem de alinhamento de referencias de memória.  
- Flag virtual de interrupção: replica a flag IF quando o processador está no modo virtual.  
- Flag virtual de pendência: é utilizada quando o processador está operando no modo virtual para indicar que uma interrupção está pendente.  
- Flag de identificação: indica se um processador suporta instruções CPUID. Se está habilitado ele suporta, se não, a instrução CPUID não está disponível.  
