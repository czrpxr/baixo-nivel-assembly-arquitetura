<link rel="stylesheet" href="css/style.css">

# 2. Postulados de Álgebra Booleana

#### Próximo: [3. Organização de um Sistema x86](./sistemax86.md)  
---

A lógica da álgebra booleana é a base da computação. Qualquer algoritmo ou circuito eletrônico pode ser representado utilizando equações booleanas. São operações que acontece muito mais próximas da camada de hardware, mas são essenciais para entender a fundo o comportamento de sistemas de computação.  

Para facilitar o entendimento será usada a seguinte simbologia:  
** * **: Para indicar o operador AND  
** + **: Para indicar o operador OR  
** ' **: Para indicar o operador NOT (unário)  

OBS: Em alguns casos, quando o operador entre dois valores for omitido, considera-se que estamos utilizando o operador *.

## Postulados

* O sistema booleano é fehado no que diz respeito aos operadores binários. Todo conjunto de valores booleanos produzem apenas resultados booleanos.  
* Qualquer operação binária possui propriedade comutativa.  
* Os operadores * e + são distributivos entre si. Isto é:  
A * (B + C) = (A * B) + (A * C)  
A + (B * C) = (A + B) * (A * C)  
* Os operadores * e + são associativos. Isto é:  
A * (B * C) = (A * B) * C  
A + (B + C) = (A + B) + C  
* Um elemento é dito _elemento identidade (I)_ quando qualquer operação entre um número booleano A e este valor I retorna o próprio valor A. O elemento identidade referente ao operador * é 1 e ao operador + é 0.  
* Um valor booleano é dito _elemento inverso (I)_ quando qualquer operação entre um número booleano A e este valor I retorna um valor B, sendo que B é diferente de A (em um sistema booleano, se A é 1, B deve ser zero e vice-versa).
* Para todo valor A existe um valor A' tal que A * A' = 0 e A + A'= 1. Este valor A'é o complemento lógico de A.  

## Teoremas  

* Teorema 1:  
A + A = A  
A * A = A  

* Teorema 2:  
A + 0 = A  
A * 1 = A  

* Teorema 3:  
A * 0 = 0  
A + 1 = 1  

* Teorema 4:  
(A + B)' = A' * B'  
(A * B)' = A' + B'  

* Teorema 5:  
A + A * B = A  

* Teorema 6:  
A * (A + B) = A  

* Teorema 7:  
A * (A + B) = A  

* Teorema 8:  
A + A'B = A + B  

* Teorema 9:  
A' * (A + B') = A'B'  

* Teorema 10:  
AB + AB' = A  

* Teorema 11:  
(A' + B') * (A' + B) = A'  

* Teorema 12:  
A + A' = 1  
A * A' = 0
