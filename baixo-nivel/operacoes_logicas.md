<link rel="stylesheet" href="css/style.css">

# 1.2 Operações Lógicas


#### Anterior: [1.1 Bit, Nibble, Byte, Word](./estruturas.md)
#### Próximo: [1.3 Sobre os Números Positivos e Negativos](./signed_unsigned.md)

---

## Operações Lógicas com Bits

As operações lógicas com Bits definidas são AND, OR, XOR e NOT. Estas operações serão exemplificadas com suas respectivas tabelas verdade considerando duas entradas e sua respectiva saída.

### AND
Na operação AND ("e") quando inseridos os valores ambos devem ser 1 para que a saída também seja 1, ou seja o primeiro **E** o segundo devem ser 1:  

|AND|0|1|
|:---:|:---:|:---:|
|**0**|0|0|
|**1**|0|1|

### OR
Na operação OR ("ou") quando inseridos os valores, pelo menos um deles deve ser 1 para que a saída também seja 1. Ou seja o primeiro **OU** o segundo devem ser 1:  

|AND|0|1|
|:---:|:---:|:---:|
|**0**|0|1|
|**1**|1|1|


### XOR
Na operação XOR ("ou exclusivo ou exclusive-or") quando inseridos os valores, pelo menos um deles deve ser 1 para que a saída também seja 1 e somente 1 deles. Ou seja o primeiro **OU** o segundo devem ser 1, porém não é incluído o caso onde os dois valores são 1:  

|AND|0|1|
|:---:|:---:|:---:|
|**0**|0|1|
|**1**|1|0|

### NOT
Na operação NOT ("não" ou "negação") quando um valor é inserido, a saída é o oposto da entrada, ou seja, "negando" a entrada.

|NOT|0|1|
|:---:|:---:|:---:|
||1|0|

## Operações Lógicas com Bits e Bit Strings

Os operadores lógicos operam apenas com bits individuais. Mas se estamos falando de bytes, nibbles e words, como lidar com isso?  
As operações com estes conjuntos de dados serão realizadas bit a bit, sendo assim, alguns cuidados a serem tomados serão mostrados em seguida.  

Quando temos valores representados por conjuntos de bits e queremos modificar algum deles em específico, operações como AND e OR nos ajudam a forçar algum bit para 0 ou 1 e a operação XOR a inverter valores.  

*Exemplo:*  
Suponha que temos o número X de dois bytes (8 bits) e queremos garantir que todos os bits de 4 à 7 (byte mais significativo) tenham valor 0. Podemos então realizar uma operação AND deste número X com o número 0000 1111. Abaixo vemos duas situações exemplificadas.  

<br />

|valor teste|0|1|0|1|0|1|0|1|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|valor 'mascara'|0|0|0|0|1|1|1|1|
|resultado AND|0|0|0|0|0|1|0|1|  

<br />  

|valor teste|1|1|0|1|1|1|0|1|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
|valor 'mascara'|0|0|0|0|1|1|1|1|
|resultado AND|0|0|0|0|1|1|0|1|

Como podemos observar, os bits de 0 à 3 permaneceram inalterados, enquanto os de 4 à 7, como desejavamos, foram alterados para 0. Usando agora como exemplo um número de 2 bytes em que queremos que o byte menos significativo seja alterado para 1, podemos utilizar o operador OR para realizar a operação (utilizando os mesmos valores de teste):  
