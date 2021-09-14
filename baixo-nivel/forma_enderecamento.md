# 3.9 Modos de Endereçamento

#### Próximo: [3.10 Encoding do x86](./codificacao_x86.md)  
#### Anterior: [3.8 Conjunto de Operações dos x86](./operacoesx86.md)  

---  

As instruções dos x86 utilizam cinco diferentes tipos de operandos: _registradores_, _constantes_ e três esquemas de endereçamento de memória. Cada um deles é chamado de _modo de endereçamento_. Os processadores x86 suportam os seguintes modos de endereçamento:  
* Modo de endereçamento de registrador  
* Modo de endereçamento imediato  
* Modo de endereçamento indireto  
* Modo de endereçamento indexado  
* Modo de endereçamento direto  


Os operandos registradores são os mais fáceis de serem entendidos. Considere as seguintes formas da instrução MOV:  

```
mov ax, ax
mov ax, bx
mov ax, cx
mov ax, dx
```

Na primeira instrução não acontece absolutamente nada, ela simplesmente copia o valor do registrador ax novamente no registrador ax. Nas três instruções seguintes, os valores de bx, cx e dx, respectivamente, são copiados para ax. Note que os valores originais de bx, cx e dx continuam os mesmos. O primeiro operando (destino) não é limitado apenas a ax; você pode mover valores entre quaisquer registradores.  

Constantes também são fáceis de se entender. Considere as instruções abaixo:  

```
mov ax, 25
mov ax, 195
mov ax, 2056
mov ax, 1000
```

Estas instruções carregam para o registrador ax os respectivos valores constantes em hexadecimal.  

Existem três modos de endereçamento que trabalham com o acesso de dados na memória. Estes modos existem nos seguintes formatos:  

```
mov ax, [1000]
mov ax, [bx]
mov ax, [1000+bx]
```

A primeira instrução utiliza o modo de endereçamento direto para carregar ax com um valor de 16 bits armazenado na memória a partir da posição 1000 (hexadecimal).  
A segunda instrução carrega ax com um valor a partir da memória de uma localização especificada pelo conteúdo de bx. este é um endereçamento indireto. Ao invés de utilizar o valor em bx, esta instrução acessa a localização que está armazenada em bx.  A instrução:

```
mov bx, 1000
mov ax, [bx]
```

é equivalente a  

```
mov ax, [1000]
```

Claro que a segunda instrução deveria ser a preferência por ser mais direta, contudo, existem diversos casos onde o uso indireto é mais rápido, direto e melhor.  

O último modo de endereçamento é o indexado. Um exemplo é:  

```
mov ax, [1000 + bx]
```

Esta instrução adiciona o conteúdo de bx a 1000 e produz o endereço de memória a ser buscado. Esta instrução é útil para acessar elementos de arrays, records e outras estruturas de dados.