section .data
    lenUserMsg equ $-userMsg
    dispMsg db 'You have entered: '
    lenDispMsg equ $-dispMsg
    numsize equ 10
    userMsg db 'Enter upto 10 chars: '  ; sdf

section .bss
    num resb 10

section .text
    global _start

_start:
    ; diplay first message
    mov eax,4
    mov ebx,1
    mov ecx, userMsg
    mov edx, lenUserMsg
    int 0x80

    ; read and store input
    mov eax,3
    mov ebx,2
    mov ecx,num
    mov edx,numsize
    int 0x80

    ; display pre-input message
    mov eax,4
    mov ebx,1
    mov ecx,dispMsg
    mov edx, lenDispMsg
    int 0x80

    ;display the user input
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,numsize
    int 0x80

    ;exit
    mov eax,1
    mov ebx,0
    int 0x80