
# 4.1 Partes do Processador

#### Anterior: [4.0 O Processador](./o_processador.md)  
#### Próximo: [4.3 Tipos de Registradores](./tipos_registradores.md)  

---  

* **UNIDADE DE CONTROLE**  

O coração do processador é a unidade de controle. Suas funções são basicamente as seguintes etapas:  
* Trazer instruções da memória  
* Traduzir as instruções em operações  
* Trazer mais dados da memória, se necessário  
* Armazenar os resultados, se necessário  
  
* **UNIDADE DE EXECUÇÃO**  
  
A função principal do processdor é executar instruções. Essa ação é realizada pela unidade de execução. Um único processador pode conter muitas unidades de execução, capazes de processar instruções simultaneamente.  
  
A unidade de execução consiste em uma ou mais Unidades de Lógica Aritmética (Arithmetic Logic Units - ALUs). Eles são desenhados especificamente para lidar com operações matemáticas em diferentes tipos de dados.  
  
* **REGISTRADORES**  
  
Os operações que podem onerar mais o processador são as operações para ler ou armazenar dados na memória. Como pudemos ver na última imagem da parte 4, quando o processador acessa um dado, a requisição deve viajar para fora dele, atravessar o barramento de controle e chegar a unidade de memória. Esse processo não é somente complexo, mas também obriga o processador a aguardar enquanto a memória é acessada. Esse tempo poderia ser utilizado para processar outras instruções.  
Para resolver este problema, o processador possui posições internas de memória, chamadas **REGISTRADORES**. Eles são capazes de armazenar dados para processamento sem ter que acessar a memória propriamente dita. Uma limitação dos registradores é ser uma estrutura cara, portanto o processador possui poucos internamente.  
Os x86 de 32 bits possuem diferentes grupos de registradores com diferentes tamanhos, incluindo registradores com funções especializadas. Os principais grupos de registradores disponíveis em todos os processadores são:  

* *Uso Geral:* Oito registradores de 32-bits utilizados para armazenar dados sendo trabalhados.  
* *Segmento:* Seis registradores de 16-bits utilizados para manipular acesso à memória.  
* *Ponteiro de Instrução:* Um único registrador de 32-bits que aponta para a proxima instrução a ser executada.  
* *Dado de ponto flutuante:* Oito registradores de 80 bits utilizados para aritmética com dados de ponto flutuante.  
* *Controle:* Cinco registradores de 32 bits utilizados para determinar o modo de operação do processador.  
* *Debug:* Oito registradores de 32 bits utilizados para armazenar informação quando realizado debug no processador. 

Na próxima seção esses discutidos mais detalhadamente.  

* **FLAGS**  

Para cada operação que ocorre no processador deve existir um mecanismo que determina se esta operação foi concluída com sucesso ou não. As flags são utilizadas com essa finalidade.  
As flags são importantes na linguagem Assembly por elas serem o único meio de determinar se um programa ocorreu com sucesso ou não. Por exemplo, se uma aplicação realizou uma subtração que resultou em um valor negativo, uma flag especial deve ser sinalizada. Sem verificar a flag, o programa em assembly pode não saber que algo deu errado.  

Os tipos de flag estão discriminados em uma seção posterior.

