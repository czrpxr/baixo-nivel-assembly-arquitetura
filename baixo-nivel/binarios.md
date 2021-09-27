<link rel="stylesheet" href="css/style.css">

# 1. Binários e Hexadecimais

O conteúdo é baseado na arquitetura intel x86 32-bits

#### Próximo: [1.1 Bit, Nibble, Byte e Word](./estruturas.md)

---

## Binários  
* Sistema decimal:

No cotidiano utilizamos o sistema decimal (base dez) para representar grandezas. O número 1234 pode ser descrito das seguintes formas:

<img class="center" src="https://latex.codecogs.com/gif.latex?1000&space;&plus;&space;200&space;&plus;&space;30&space;&plus;&space;4" title="1000 + 200 + 30 + 4" />
<img class="center" src="https://latex.codecogs.com/gif.latex?1&space;*&space;10^{3}&space;&plus;&space;2&space;*&space;10^{2}&space;&plus;&space;3&space;*&space;10^{1}&space;&plus;&space;4&space;*&space;10^{0}" title="1 * 10^{3} + 2 * 10^{2} + 3 * 10^{1} + 4 * 10^{0}" />

Ou seja, cada digito representa um valor entre zero e nove multiplicado por uma potência de 10.

* Sistema binário:

Internamente os computadores representam valores em níveis de voltagem ALTA e BAIXA (geralmente 0 e 5V), ou seja, apenas dois valores. Convencionou-se então a utilização dos dois digitos utilizados no _sistema binário_ (base dois). Podemos converter qualquer número binário para o sistema decimal utilizando praticamente a mesma lógica para representação que no sistema decimal: as diferenças são que ao invés dos números de 0-9 os valores referência são 0 e 1 multiplicados por potências de 2.
Tomando como exemplo o número 1111011, temos:

<img class="center" src="https://latex.codecogs.com/gif.latex?1&space;*&space;2^{6}&space;&plus;&space;1&space;*&space;2^{5}&space;&plus;&space;1&space;*&space;2^{4}&space;&plus;&space;1&space;*&space;2^{3}&space;&plus;&space;0&space;*&space;2^{2}&space;&plus;&space;1&space;*&space;2^{1}&space;&plus;&space;1&space;*&space;2^{0}" title="1 * 2^{6} + 1 * 2^{5} + 1 * 2^{4} + 1 * 2^{3} + 0 * 2^{2} + 1 * 2^{1} + 1 * 2^{0}" />
<img class="center" src="https://latex.codecogs.com/gif.latex?=&space;64&space;&plus;&space;32&space;&plus;&space;16&space;&plus;&space;8&space;&plus;&space;0&space;&plus;&space;2&space;&plus;&space;1" title="= 64 + 32 + 16 + 8 + 0 + 2 + 1" />
<img class="center" src="https://latex.codecogs.com/gif.latex?=&space;123_{10}" title="= 123_{10}" />

(OBS: o número 10 na parte inferior do resultado mostra que ele está escrito na base 10)

* Conversão entre decimal e binário:

Como foi observado no exemplo anterior, a conversão de binário para decimal é simples. Para realizar a operação inversa (de decimal para binário) não há grande dificuldade, porém não é tão intuitivo. Pode ser seguido o seguinte raciocínio:

    - Objetivo: converter o número 1359;  
    - 2¹⁰ = 1024 é a maior potência de dois menor que 1359. Sendo assim, subtraímos 1024 de 1359 (1359 - 1024 = 335) e colocamos "1" no início do nosso número;  
    - Começamos então a descer nas potências de 2 a partir de 2¹⁰. 2⁹ = 512 e é maior que o resultado da subtração anterior (335), então colocamos um "0" depois do nosso "1", ficando com **10**;  
    - No caso de 2⁸ temos 256 que é menor que 335. Então, realizamos a subtração 335-256 (=79) e acrescentamos "1" no nosso número. Ele fica até o momento **101**;  
    - Para 2⁷ (128) é maior que 79, portanto colocamos "0". Nosso resultado parcial fica **1010**;  
    - 2⁶ (64) é menor que 79. Então realizamos a subtração 79-64 (= 15) e adicionamos 1 ao número **10101**;  
    - 2⁵ (32) é maior que 15, portanto incluímos "0";  
    - 2⁴ (16) também é maior que 15 e também incluímos "0". Nosso resultado parcial é **1010100**;  
    - 2³ (8) é menor que 15. Então realizamos a subtração 15-8 (= 7) e incluímos "1";  
    - 2² (4) é menor que 7. Subtraímos 7-4 (= 3) e incluímos "1". Parcial agora de **101010011**;  
    - 2¹ (2) é menor que 3. Subtraímos 3-2 (= 1) e incluímos "1";  
    - 2⁰ (1) é igual ao resultado anterior. A sequencia de subtrações agora chega ao fim com 1-1 (= 0) e incluindo o "1" final;  
    - Resultado final **10101001111**.

---

## Hexadecimais  

O sistema binário facilita a representação numérica pois utilizamos apenas dois símbolos para representar qualquer número podendo assim utilizar dois estados (ou níveis de voltagem) de um transistor, por exemplo. Porém cria outro problema: como no exemplo anterior para representar 1359 (4 dígitos) acabamos utilizando 10101001111 (11 dígitos) o que dificulta nosso entendimento quando precisamos trabalhar com números grandes. Além disso as conversões entre binários e decimais são trabalhosas.  
O sistema hexadecimal (base 16) nos ajuda com estes problemas. É compacto e sua conversão para binário (e vice-versa) relativamente simples. Assim como o sistema decimal é baseado em 10 dígitos (0-9) e o binário em 2 (0 e 1) o hexadecimal utiliza 16 dígitos, que são (0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F). Ou seja, para convertermos o número 1234 hexadecimal para decimal, faríamos:

<img src="https://latex.codecogs.com/gif.latex?1&space;*&space;16^{3}&space;&plus;&space;2&space;*&space;16^{2}&space;&plus;&space;3&space;*&space;16^{1}&space;&plus;&space;4&space;*&space;16^{0}" title="1 * 16^{3} + 2 * 16^{2} + 3 * 16^{1} + 4 * 16^{0}" />

E para converter de hexadecimal para binário?    

|Binário|Hexadecimal|
|:---:|:---:|
|0000|0|
|0001|1|
|0010|2|
|0011|3|
|0100|4|
|0101|5|
|0110|6|
|0111|7|
|1000|8|
|1001|9|
|1010|A|
|1011|B|
|1100|C|
|1101|D|
|1110|E|
|1111|F|

Aqui temos uma tabela com todos os dígitos hexadecimais e suas equivalências em binário. Esta tabela é o suficiente para realizar a conversão, pois basta realizar as devidas substituições. Por exemplo:

0BEEFh = 0000 1011 1110 1110 1111b

(OBS: o "h" no fim do número hexadecimal assim como o "b" servem apenas para identificar a base que está sendo utilizada como referências. Também constuma-se encontrar "d" para representação da base decimal)
