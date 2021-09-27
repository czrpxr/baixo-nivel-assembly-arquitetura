.section .data

 output:
  .ascii "O ID do Fabricante e 'xxxxxxxxxxxx'\n"

.section .text
 .globl _start
  _start:
  movl $0, %eax
  cpuid
  movl $output, %edi
  movl %ebx, 22(%edi)
  movl %edx, 26(%edi)
  movl %ecx, 30(%edi)
  movl $4, %eax
  movl $1, %ebx
  movl $output, %ecx
  movl $42, %edx
  int $0x80
  movl $1, %eax
  movl $0, %ebx
  int $0x80
