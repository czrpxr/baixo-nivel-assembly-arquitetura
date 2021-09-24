# 5.2 O Linker

#### Próximo: [5.3 O Debugger](./o_debugger.md)  
#### Anterior: [5.1 O Assembler ](./o_assembler.md)  

---  

Em linguagens de alto nível muito provavelmente você nunca utilizou diretamente o **linker**. A maioria delas realiza a etapa de compilação e link (ligação, conexão) no mesmo comando.  
O processo para conectar objetos envolve relacionar todas as funções e endereços de memória declarados no programa. Ele recebe os objetos criados pelo compilador e cria um único arquivo executável (ou biblioteca, ou outro objeto).  A linguagem assembly necessita desse passo manual para ligar objetos da linguagem assembly com outras bibliotecas e produzir um programa executável que pode rodar no sistema operacional host. Quando o linker é executado manualmente, o desenvolvedor deve saber quais bibliotecas são necessárias para satisfazer as funções utilizadas na aplicação.  

Todo assembler inclui o seu próprio linker. Você sempre deve utilizar o linker apropriado ao assembler que estiver utilizando para o desenvolvimento.  

## O Linker GNU  

O Linker GNU também é parte do binutils assim como o GAS. Portanto, se você possui o assembler GNU instalado entãopp o linker GNU também estará.  

Seu comando para ser executado através do terminal do Linux é o **ld**. Você pode verificar a instalação e a versão digitando. No meu caso, o retorno foi o seguinte:  

`  
ld --version  
`  
`
GNU ld (GNU Binutils for Ubuntu) 2.34
Copyright (C) 2020 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or (at your option) a later version.
This program has absolutely no warranty.
`  

Existem diversos parametros para o comando *ld*. Eles podem ser visualizados utilizando o comando *ld --help*.  
Na seção em que falei do assembler mostrei que um arquivo objeto pode ser criado da seguinte maneira através do GAS:  

`  
as -o teste.o test.s  
`  

onde o arquivo objeto se chamará teste.o. Podemos então utilizar o linker para criar um executável através deste objeto utilizando o seguinte comando:  

`  
ld -o meuteste teste.o
`  

É criado então um executável com o nome de *meuteste*. No ambiente Linux o executável é criado com a permissão padrão 755, ou seja, permitindo que qualquer um com acesso ao sistema execute-o, porém apenas o proprietário pode modificá-lo.