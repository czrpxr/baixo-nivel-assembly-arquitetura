# 6.2.2 Trocando Dados

#### Próximo: []()  
#### Anterior: [6.2.2 Trocando Dados](./trocando_dados.md) 

---  

A pilha (stack) é um local especial reservado na memória para armazenar dado. O que faz a pilha especial é a maneira como os dados são inseridos e removidos dessa área. Os elementos na seção de dados são armazenados de maneira sequencial, começando das posições na memória menores para as maiores. A pilha se comporta da maneira inversa. Ela é reservada no final da memória  e conforme um dado é adicionado a pilha ela cresce de cima para baixo.  

A parte de baixo da pilha (ou topo da memória) contém elementos colocados ali pelo sistema operacional quando o programa está rodando. Qualquer parâmetro de linha de comando utilizado ao executar um programa é adicionado na pilha e o ponteiro passa a apontar para a parte inferior dos elementos de dados. É o local onde você pode armazenar os dados do seu programa.  

A analogia utilizada para descrevê-la é pensar em uma pilha de pratos. Cada prato é colocado em cima do prato anterior e se torna o próximo a ser retirado, no topo. Neste caso, não é possivel mover um dado do meio da pilha.  

Conforme cada elemento é adicionado a pilha, um ponteiro é utilizado para armazenar onde ela se inicia. O registrador *ESP* contem o endereço de memória do início dela. Mesmo não sendo proibido, não é recomendado utilizar o registrador *ESP* no seu programa. Se seu programa perder a posição de início da pilha, comportamentos inesperados podem ocorrer.  

Ao invés de definir manualmente e se preocupar sobre o ponteiro, temos algumas instruções que podem ajudá-lo: *PUSH* e *POP*.