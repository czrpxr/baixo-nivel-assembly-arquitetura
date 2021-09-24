# 5.1 O Assembler

#### Próximo: [5.2 ](./)  
#### Anterior: [5.0 Ferramentas para Desenvolvimento em Assembly ](./ferramentas_assembly.md)  

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