section .data
    name db 'John Doe'
    lname equ $-name

section .text
    global _start

_start:
    mov edx,lname
    mov ecx,name ; current name
    mov ebx,1
    mov eax,4
    int 0x80

    mov [name], dword 'Tina' ; dword -> 4 bytes addressed, replaced

    mov edx,lname
    mov ecx,name ; new name
    mov ebx,1
    mov eax,4
    int 0x80

    mov eax,1
    int 0x80
