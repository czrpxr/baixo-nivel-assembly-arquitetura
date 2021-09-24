# 5.1 O Assembler

#### Próximo: [5.2 O Linker](./o_linker.md)  
#### Anterior: [5.0 Ferramentas para Desenvolvimento em Assembly](./ferramentas_assembly.md)  

---  

Para criar programas em assembly precisamos de algumas ferramentas para converter a linguagem em instruções para o processador. Essa é a função do **assembler**.  

Infelizmente, cada assembler utiliza diferentes formatos para opcodes, data sections e diretivas. Desenvolver utilizando um assembler pode ser totalmente diferente de outro. Enquanto os comandos básicos são os mesmos, as maneiras de implementação podem ser muito diferentes. A maior diferença ocorre entre as diretivas. Enquanto opcodes estão muito relacionadas as instruções do processador, as diretivas são únicas para cada assembler. O ponto para escolher um assembler é a possibilidade de criar instruções para o ambiente almejado da maneira mais simples possível. Abaixo temos alguns dos assemblers mais comuns para plataformas 32 e 64-bits.  

### MASM

  O Microsoft Assembler é o avô dos assemblers para plataforma intel. Está disponível desde o início dos PCs IBM, permitindo que programadores produzam programas para o ambiente DOS e Windows.  
  Por estar no mercado há muito tempo, muitos tutoriais, livros e exemplos utilizando ele estão por aí. A Microsoft não comercializa mais o MASM, mas ele continua embutido no Microsoft Visual Studio. A Microsoft também autorizou diversas empresas e grupos a distribuir o MASM de forma gratuita.  

### NASM  

O Netwide Assembler foi desenvolvido originalmente como um assembler comercial para o ambiente UNIX. Atualmente existe tanto para o ambiente Unix quanto para o ambiente Windows. É compatível com todas as instruções da Intel e pode criar executáveis para Unix, Dos e Windows.  

### GAS  

O GAS é um assembler desenvolvido pela Free Software Foundation e é a plataforma mais popular disponível para Unix. O GAS foi desenvolvido para operar em diversas plataformas, independente da família de processadores. Geralmente ele é capaz de detectar qual a plataforma (ou pelo menos deve ser informado) e cria as instruções compatíveis com a plataforma. É a mesma ferramenta utilizada pelo compilador CNU C para converter código C/C++ em instruções.  

### HLA  

O High Level Assembler é uma criação do professor Randall Hyde e cria instruções para Intel nas plataformas Dos, Windows e Linux. A idéia principal por trás do HLA é ensinar linguagem assembly para iniciantes.  

## Detalhes sobre o Assembler GNU  (GAS)  

O GAS é o mais popular entre os assemblers para o ambiente Unix. Ele possui a capacidade de criar instruções para as seguintes plataformas:  

- VAX  
- AMD 29K  
- Hitachi H8/300  
- Intel 80960  
- Intel 80x86  
- M680x0  
- Z8000  
- MIPS  

A maioria das distribuições Linux inclui o GAS pré-instalado no sistema. Caso seja necessário buscá-lo, você pode procurar por binutils no seu gerenciador de pacotes.  

## Como utilizar o GAS  

Apesar do assembler ser chamado GAS, o parametro utilizado para executá-lo no terminal do Linux é o **as**. Você pode verificar a instalação e a versão digitando. No meu caso, o retorno foi o seguinte:  

`  
as --version  
`  
`
GNU assembler (GNU Binutils for Ubuntu) 2.34  
Copyright (C) 2020 Free Software Foundation, Inc.  
This program is free software; you may redistribute it under the terms of  
the GNU General Public License version 3 or later.  
This program has absolutely no warranty.  
This assembler was configured for a target of `x86_64-linux-gnu'.  
`
  
Existem diversos parametros para o comando *as*. Eles podem ser visualizados utilizando o comando *as --help*.  
Como exemplo, podemos converter um programa de teste do arquivo *teste.s* para o arquivo de objeto *teste.o* através do seguinte comando:  

`  
as -o teste.o test.s  
`  
  
O parâmetro *-o* identifica o nome do arquivo de objeto que será criado (neste caso teste.o). Caso este nome não seja informado o valor padrão para esta saída será o nome *a.out*.  