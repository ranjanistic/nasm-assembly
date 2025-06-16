# NASM Assembly basics

For x86 architecture

## Prerequisites

- nasm
- ld

## Build and execute

```bash
nasm -f elf file.asm -o file.o
ld -m elf_i386 -s -o bin/file file.o
./bin/file
```

or, alternatively

```bash
./run.sh file.asm
```

## Notes

### Registers

Processor registers

- General-purpose registers
    Data registers to store data and perform arithmetic operations

    ```plaintext
    AX -> AL (low) + AH (high) -> 8 bit + 8 bit (accumulator)
    BX -> BL + BH -> 8 bit + 8 bit (base)
    CX -> CL + CH -> 8 bit + 8 bit (count)
    DX -> DL + DH -> 8 bit + 8 bit (data)
    
    (extended)
    EDX -> 32 bit
    ECX -> 32 bit
    EBX -> 32 bit
    EAX -> 32 bit
    ```

- Pointer registers
    To point to the instruction, stack, and base

    ```plaintext
    IP -> 16 bit (instruction)
    SP -> 16 bit (stack)
    BP -> 16 bit (base)

    (extended)
    EIP -> 32 bit
    ESP -> 32 bit
    EBP -> 32 bit
    ```

- Control registers
    Pointer registers + Flags register

    Flag bits (32 bit) to indicate the status of the processor

    ```plaintext
    OF (overflow)
    DF (direction)
    IF (interrupt)
    TF (trap)
    SF (sign)
    ZF (zero)
    AF (auxiliary)
    PF (parity)
    CF (carry)
    ```

- Segment registers: 16 bit
    To contain data,code, and stack segments

    ```plaintext
    CS (code segment)
    DS (data segment)
    ES (extra segment)
    SS (stack segment)
    FS (extra segment 1)
    GS (extra segment 2)
    ```

- Index registers: 32 bit
    Used for string operations

    ```plaintext
    ESI (source index)
    EDI (destination index)
    ```

### Statements

```nasm
mov destination, source ; copy source to destination
add AH, 1 ; add 1 to AH (register)
add AH, BH ; add BH to AH (register)
add VAR, 1 ; add 1 to VAR
mov AL, 10 ; move 10 to AL (register)
inc VAR ; increment VAR by 1
```

### Syscalls

```nasm
mov ebx,1 ; (stdout)

mov eax,6 ; (sys_close)
mov eax,5 ; (sys_open)
mov eax,4 ; (sys_write)
mov eax,3 ; (sys_read)
mov eax,2 ; (sys_fork)
mov eax,1 ; (sys_exit)

int 0x80 ; call kernel
```

## Variable Directives

```plaintext
db (define 1 bit)
dw (define 16 bit)
dd (define 32 bit)
dq (define 64 bit)
resb 1 (reserve byte)
resw 1 (reserve word)
resd 1 (reserve double word)
resq 1 (reserve quad word)
rest 1 (reserve ten bytes )
times 2 (initialize 2 times)
```

```nasm
choice db 'Y'       ;ASCII of y = 79H
number1 dw 12345    ;12345D = 3039H
number2 dd 12345679 ;123456789D = 75BCD15H
stars times 9 dw '*'
```

## Constants

```plaintext
equ  (define constant) 
%assign (define numeric constant)
%define (define string literal constant)
```

```nasm
%assign STDOUT 1
%define MSG 'Hello world'

NUM1 equ 40
NUM2 equ 30
SUM equ NUM1 + NUM2

section .data
    msg db MSG, 0xA
    len equ $-msg
```

## Arithmetic

```plaintext
inc ebx (increments 32-bit register)
inc dl (increments 8-bit register)
inc [var] (increments var)
dec dl (decrements 8-bit register by 1)
dec [var] (decrements var by 1)
add dest, source (add)
sub dest, source (subtract)

mul dl (multiply)
imul dl (signed multiply)
div dl (division)
idiv dl (signed division)
```
