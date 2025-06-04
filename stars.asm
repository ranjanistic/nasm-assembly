segment .text
    global _start

_start:     ; linker entry point
    mov edx,len ;message length
    mov ecx,msg ;message 
    mov ebx,1 ; stdout
    mov eax,4; sys_write
    int 0x80 ;call kernel

    mov edx,len2; msg length
    mov ecx,msg2; msg
    mov ebx,1 ;stdout
    mov eax,4 ;sys_write
    int 0x80 ;call kernel

    mov eax,1 ;sys_exit
    int 0x80 ;call kernel

section .data
    msg db 'displaying 9 stars', 0xa ; msg
    len equ $ - msg ;len

    len2 equ 9 ;len
    msg2 times len2 db '*'
