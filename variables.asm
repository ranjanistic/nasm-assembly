section .data
    newline db 0xA
    array times 9 db "*"
    size equ $-array
    choice db 'y',0xA
    choicesize equ $-choice
    
    buffer times 6 db 0 
    number dw 12345
    numsize equ $-number
    neg_number	dw	-12345
    big_number	dq	123456789
    real_number1	dd	1.234
    real_number2	dq	123.456

section .text
    global _start    ; entry point

_start:
    mov	edx,size
    mov	ecx, array
    mov	ebx,1	
    mov	eax,4	;(sys_write)
    int	0x80	;call kernel

    mov edx,choicesize
    mov ecx,choice
    mov ebx,1   ; stdout
    mov eax,4   ; sys_write
    int 80h ;kernel call
    
    mov ax, [number]   ; get the number
    mov cx, 0          ; digit count
    mov bx, 10         ; divisor
    lea di, [buffer + 5]

next_digit:
    xor dx, dx  ; Clear DX (high byte of AX, used for division remainder)
    div bx             ; AX ÷ 10, result in AX, remainder in DX
    add dl, '0'        ; convert digit to ASCII
    dec di
    mov [di], dl
    inc cx
    test ax, ax
    jnz next_digit  ; jump if not zero

    mov edx,0
    mov ecx,number
    mov ebx,1   ; stdout
    mov eax,4   ; sys_write
    int 80h ;kernel call
    
    ; mov edx,6
    ; mov ecx,neg_number
    ; mov ebx,1   ; stdout
    ; mov eax,4   ; sys_write
    ; int 80h ;kernel call

    mov eax,1 ;sys_exit
    int 0x80 ; or 80h
