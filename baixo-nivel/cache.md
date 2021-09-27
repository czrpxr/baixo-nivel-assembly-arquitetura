
# 3.6 Memória Cache

#### Próximo: [4.0 O Processador](./registradores_flags.md)
#### Anterior: [3.5 Estado de Espera](./estado_espera.md)

---  
Se você analisar um programa comum, você perceberá que ele tende a acessar a mesma localização na memória repetidas vezes. Além disso, você também descobrirá que um programa geralmente acessa endereços adjacentes. O nome técnico para estes fenômenos é _localidade de referência temporal_ e _localidade de referência espacial_.  

Uma localidade espacial ocorre quando o programa acessa as localizações de memória vizinhas. Quando ocorre uma localidade temporal o programa acessa repetidamente a mesma localização na memória em um curto período de tempo. Ambos os formatos de localidade ocorrem no seguinte código em Pascal:  

```pascal
for i := 0 to 10 do
     A [i] := 0;
```
Na primeira linha do código o loop **for** compara _i_ com 10 para checar a condição. Ao final do bloco _i_ é incrementado em 1. Dentro do bloco _i_ é utilizado como índice no array _A_. Isso mostra uma **localidade temporal** já que a CPU acessa _i_ três vezes (condição, array, incremento) em um curto período de tempo.  Esse código também mostra uma **localidade espacial**: a ação do loop em si zera todos os elementos do array _A_ adicionando um zero na primeira posição e então na segunda e assim sucessivamente. Assumindo que o Pascal armazena os elementos de A em localizações consecutivas na memória, cada iteração do loop acessa uma localização adjacente.  

Existe um outro exemplo de localidade temporal e espacial no exemplo anterior, mas não sendo óbvio: as _instruções_ do computador que dizem ao sistema o que fazer em determinada tarefa também estão na memória. Estas instruções são armazenadas sequencialmente (a parte **espacial**). O computador também executa estas instruções repetidamente, uma vez por iteração do loop (a parte **temporal**).  

Se você observar o perfil de execução de um programa comum, você irá descobrir que o programa geralmente executa menos da metade dos comandos. Geralmente, um programa comum utiliza de 10-20% da memória alocado para ele. Em um determinado momento, um programa de 1Mb acessa apenas de 4 a 8 kb de dados e código. Portanto, se você pagou caro em uma memória RAM com nenhum Estado de Espera, você não irá utilizá-la em determinado momento! Não seria bom se você pudesse na verdade comprar pequenas partes de RAM rápida e dinamicamente atribuir seus endereços durante a execução do programa? Isso é exatamente o que a **memória CACHE** faz para você.  

A memória cache fica entre a CPU e a memória principal. É uma pequena quantidade de memória muito rápida (zero Estado de Espera). Ao contrário de memórias comuns, os bytes em uma memória cache não possuem endereços fixos. Ao invés disso, a memória cache pode reatribuir o endereço de um objeto de dados. Isso permite que o sistema mantenha valores recentemente acessados no cache. Endereços os quais a CPU nunca acessou ou não acessa há algum tempo permanecem na memória principal (mais lenta). Considerando que a maior parte dos acessos à memória são em variáveis recentemente acessadas (ou em posições próximas), o dado geralmente aparece na memória cache.  

Ela não é perfeita. Mesmo que o programa passe um tempo considerável executando o código em um lugar, eventualmente ele irá chamar um comando fora da memória cache. Neste momento a CPU deve ir até a memória principal para buscar o dado. Considerando que a memória principal é lenta, isso irá requerer a inserção de estados de espera.  

**Cache Hit:** Ocorre quando a CPU acessa a memória e encontra com _sucesso_ o dado no cache.
**Cache Miss:** Ocorre quando a CPU acessa a memória e o dado não está em cache. Neste caso a CPU deve ler o dado da memória principal, o que leva a uma perda de performance.  para tirar vantagem da localidade de referência, a CPU copia o dado para o cache quando acessa um dado que não está presente nele. Considerando que a CPU irá acessar a mesma localização em breve, o sistema irá economizar alguns estados de espera.  

A memória cache lida com os aspectos temporais do acesso à memória, mas não os espaciais. Armazenando em cache posições de memória _quando acessadas_ não irá melhorar o desempenho da aplicação se você constantemente acessar posições consecutivas, como no caso da localidade de referência espacial.Para resolver este problema a maioria dos sistemas de cache leem alguns bytes consecutivos da memória quando um _Cache Miss_ acontece. O 80486 por exemplo lê 16 bytes a mais em um Cache Miss. Mas porque lê-los em blocos ao invés de apenas quando precisamos deles? A maioria dos chips de memória disponíveis hoje possuem modos especiais que deixam você acessar algumas localizações de memória consecutivas. O cache explora essa capacidade para reduzir a quantidade média de estados de espera para acessar a memória.  

Se você escrever um programa que acessa a memória de modo aleatório, utilizar o cache pode eventualmente te deixar lento. Ler 16 bytes em cada Cache Miss é mais custos do que acessar somente alguns bytes na linha correspondente do cache  

---  

Não é surpresa que a proporção de Cache Hits para Miss aumenta com o tamanho (em bytes) do sub sistema de memória cache. Os chips 80486, por exemplo, possuem 8.192 bytes no cache on-chip. A Intel alega conseguir 80-95% de taxa de hits com este cache (significa que 80-95% do tempo a CPU encontra o dado no cache). Isso soa muito impressionante. Mas se você analisar os números com atenção, você irá descobrir que não é _tão_ impressionante. Vamos pegar a situação de 80%. Assim 1 em 5 acessos à memória, na média, não estará no cache. Se você possui um processador de 50MHz e um tempo de acesso a memória de 90ns, 4 em 5 acessos à memória vão precisar de apenas um ciclo de clock (por estarem no cache) e 1/5 irá precisar de 10 estados de espera. Sendo assim, o sistema precisará de 15 ciclos de clock para acessar 5 locais na memória ou 3 ciclos de clock por acesso, na média. Isso é o equivalente a dois estados de espera adicionais para cada acesso à memória. Você ainda acredita que sua máquina ainda roda em zero estados de espera?  
