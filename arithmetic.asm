EXIT  equ 1
READ  equ 3
WRITE equ 4
STDIN  equ 0
STDOUT equ 1

section .data
    msg1 db "Enter a digit: ", 
    len1 equ $-msg1 

    msg2 db "Enter another digit: ", 
    len2 equ $-msg2 

    msg3 db "The sum is: "
    len3 equ $-msg3

    msg4 db  0xA, 'Multiply of 3 and 2 is: '
    len4 equ $-msg4

    msg5 db  0xA, 'Division of 8 by 2 gives: '
    len5 equ $-msg5

segment .bss
    num1 resb 1
    num2 resb 1
    res resb 1

section .text
    global _start

_start:
    ; read num1
    mov eax, WRITE
    mov ebx, STDOUT
    mov ecx, msg1
    mov edx, len1 
    int 0x80 

    mov eax, READ 
    mov ebx, STDIN  
    mov ecx, num1 
    mov edx, 1
    int 0x80

    ; Read newline (discard)
    mov eax, READ 
    mov ebx, STDIN  
    mov ecx, res
    mov edx, 1
    int 0x80  

    ; read num2
    mov eax, WRITE
    mov ebx, STDOUT
    mov ecx, msg2
    mov edx, len2
    int 0x80

    mov eax, READ
    mov ebx, STDIN
    mov ecx, num2
    mov edx, 1
    int 0x80

    ; Read newline (discard)
    mov eax, READ 
    mov ebx, STDIN  
    mov ecx, res    
    mov edx, 1
    int 0x80  

addsub:
    mov eax, WRITE
    mov ebx, STDOUT
    mov ecx, msg3
    mov edx, len3
    int 0x80

    mov al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    add al, bl
    add al, '0'
    mov [res], al
 
    mov eax, WRITE   
    mov ebx, STDOUT
    mov ecx, res
    mov edx, 1
    int 0x80

multiply:
    mov byte [num1], '3'
    mov byte [num2], '2'

    mov	al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    mul bl
    add	al, '0'

    mov [res], al
    mov	ecx, msg4
    mov	edx, len4
    mov	ebx, STDOUT	
    mov	eax, WRITE
    int	0x80

    mov	ecx, res
    mov	edx, 1
    mov	ebx, STDOUT	
    mov	eax, WRITE
    int	0x80	

divide:
    mov byte [num1], '8'
    mov byte [num2], '2'

    mov	al, [num1]
    sub al, '0'
    mov bl, [num2]
    sub bl, '0'
    xor ah, ah
    div bl
    add	al, '0'

    mov [res], al
    mov	ecx, msg5	
    mov	edx, len5
    mov	ebx, STDOUT	
    mov	eax, WRITE
    int	0x80

    mov	ecx, res
    mov	edx, 1
    mov	ebx, STDOUT
    mov	eax, WRITE	
    int	0x80	

exit:
    xor ebx, ebx
    mov	eax, EXIT
    int	0x80
