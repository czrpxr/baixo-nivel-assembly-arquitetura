# 6.2.1 MOV Condicional

#### Próximo: [6.2.2 Trocando Dados](./trocando_dados.md)  
#### Anterior: [6.2 Movendo Dados](./movendo_dados.md) 

---  
  
A instrução MOV Condicional é o que o próprio nome diz: uma instrução *mov* que acontece de acordo com determinada condição. Segue o exemplo:  

*cmovx origem, destino*  

onde **x** é uma das condições que irá disparar a ação *mov*. As condições são baseadas nos valores que estiverem nos registradores de Flags. Os bits específicos utilizados para as condições de cmov seguem abaixo:  

|Flag|Nome|Descrição|
|:---:|:---:|:---:|
| CF | Carry Flag |  Uma expressão matemática criou ou emprestou 1 bit |
| OF | Overflow Flag | Um valor inteiro é muito pequeno ou muito grande |
| PF | Parity Flag | Um registrador contém dados corrompidos de uma operação matemática |
| SF | Sign Flag |  Indica se o resultado é positivo ou negativo |
| ZF | Zero  Flag | O resultado de uma operação matemática é zero |  

As instruções de *cmov* são agrupadas em pares, com duas instruções possuindo o mesmo significado. Por exemplo, o valor pode ser acima de outro valor; ao mesmo tempo ele não pode ser abaixo ou igual a esse valor. Ambas as condições são equivalentes, mas ambas possuem *cmov*s separados.  

Os *mov condicionais* são divididos em instruções utilizadas para operações com sinais e operações sem sinais. As operações com sinais envolvem comparações que utilizam o *SIGN FLAG*, enquanto as operações sem sinais envolvem comparações que não dependem do *SIGN FLAG*.  

A tabela seguinte mostra as intruções *cmov* para operações sem sinal:  

|Par de Instruções|Descrição| Condição das Flags|
|:---:|:---:|:---:|
|CMOVA/CMOVNBE|Acima / não abaixo ou igual| (CF ou ZF) = 0|
|CMOVAE/CMOVNB|Acima ou igual/não abaixo| CF = 0|
|CMOVNC|Sem carregamento| CF = 0|
|CMOVB/CMOVNAE|Abaixo/não acima ou igual| CF = 1|
|CMOVC|Com Carregamento| CF = 1|
|CMOVBE/CMOVNA|Abaixo ou Igual / Não acima| (CF ou ZF = 1)
|CMOVE/CMOVZ|Igual/Zero| ZF = 1|
|CMOVNE/CMOVNZ|Não Igual/Não zero| ZF = 0|
|CMOVP/CMOVPE|Paridade/Par Paridade| PF = 1|
|CMOVNP/CMOVPO|Sem Paridade/Impar paridade| PF = 0|  

Como você pode ver as condições para operação sem sinal recaem sobre as flags *Carry, Zero e Parity* para determinar a diferença entre dois operandos. Se o operando possui sinal, um conjunto diferente de condições devem ser utilizadas, conforme vemos abaixo:  

|Par de Instruções|Descrição|Condição das Flags|
|CMOVGE/CMOVNL|Maior ou igual/Não menor| (SF xor OF) = 0|
|CMOVL/CMOVNGE|Menor/Não maior ou igual| (SF xor OF) = 1|
|CMOVLE/CMOVNG|Menor ou igual/Não maior| ((SF xor OF) or ZF) = 1|
|CMOVO|Overflow| OF = 1|
|CMOVOV| Não overflow| OF = 0|
|CMOVS| Sinalizado (negativo)| SF=1|
|CMOVNS| Não sinalizado (não negativo)| SF = 0|  

Segue abaixo um exemplo de código utilizando uma instrução *cmov* para ilustração:  

*movl value, %ecx*  
*cmp %ebx, %ecx*  
*cmova %ecx, %ebx*  

O código acima carrega em *ecx* o valor de *value*. Em seguida, utiliza a instrução *CMP* para comparar este valor, com o valor presente em *ebx*. A instrução *CMP* subtrai o primeiro operando do segundo e define os valores apropriados para as Flags. A instrução *CMOVA* é então utilizada para substituir o valor em *ebx* com o valor de *ecx* se o valor for maior ou igual que o originalmente armazenado em *ebx*.

