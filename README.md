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

```asm
mov destination, source ; copy source to destination
add AH, 1 ; add 1 to AH (register)
add AH, BH ; add BH to AH (register)
add VAR, 1 ; add 1 to VAR
mov AL, 10 ; move 10 to AL (register)
inc VAR ; increment VAR by 1
```

### Syscalls

```asm
mov ebx,1 ; (stdout)

mov eax,6 ; (sys_close)
mov eax,5 ; (sys_open)
mov eax,4 ; (sys_write)
mov eax,3 ; (sys_read)
mov eax,2 ; (sys_fork)
mov eax,1 ; (sys_exit)

int 0x80 ; call kernel
```
