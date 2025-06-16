SYS_WRITE equ 4
STDIN equ 0
%assign STDOUT 1
%assign SYS_EXIT 1
%define HELLO 'hello there!'

section .data
    msg db HELLO, 0xA, 0xD
    len equ $-msg
    
section .text
    global _start

_start:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    mov edx, len
    int 80h

    mov eax, SYS_EXIT
    int 80h   
