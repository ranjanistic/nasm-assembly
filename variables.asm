section .data
    newline db 0xA
    array times 9 db "*"
    size equ $-array
    choice db 'y',0xA
    choicesize equ $-choice
    
    buffer times 6 db 0 
    number dd 12345        ; full 32-bit

section .text
    global _start

_start:
    ; Print array
    mov edx, size
    mov ecx, array
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Print choice
    mov edx, choicesize
    mov ecx, choice
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Convert number to string
    mov eax, [number]   
    mov ecx, 0          
    mov ebx, 10         
    lea edi, [buffer + 5] ; 32-bit register

next_digit:
    xor edx, edx        
    div ebx             ; EAX ÷ 10, quotient in EAX, remainder in EDX
    add dl, '0'        
    dec edi
    mov [edi], dl
    inc ecx
    test eax, eax
    jnz next_digit

    ; Print converted number
    mov edx, ecx
    mov ecx, edi
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Exit
    mov eax, 1
    int 0x80
