segment .text
    global _start

_start:             ; linker entry point
    mov edx,len    ; string length
    mov ecx,msg     ; string
    mov ebx,1       ; file descriptor
    mov eax,4   ;  sys_write
    int 0x80        ; call kernel

    mov eax,1   ; sys_exit
    int 0x80        ; call kernel

segment .data
msg db 'Hello, World!', 0xA  ; string to print
len equ $ - msg          ; length of the string