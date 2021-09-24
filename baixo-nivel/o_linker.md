# 5.2 O Linker

#### Próximo: [5.3 O Debugger](./o_debugger.md)  
#### Anterior: [5.1 O Assembler ](./o_assembler.md)  

---  

Em linguagens de alto nível muito provavelmente você nunca utilizou diretamente o **linker**. A maioria delas realiza a etapa de compilação e link (ligação, conexão) no mesmo comando.  
O processo para conectar objetos envolve relacionar todas as funções e endereços de memória declarados no programa. Ele recebe os objetos criados pelo compilador e cria um único arquivo executável (ou biblioteca, ou outro objeto).  A linguagem assembly necessita desse passo manual para ligar objetos da linguagem assembly com outras bibliotecas e produzir um programa executável que pode rodar no sistema operacional host. Quando o linker é executado manualmente, o desenvolvedor deve saber quais bibliotecas são necessárias para satisfazer as funções utilizadas na aplicação.  

Todo assembler inclui o seu próprio linker. Você sempre deve utilizar o linker apropriado ao assembler que estiver utilizando para o desenvolvimento.