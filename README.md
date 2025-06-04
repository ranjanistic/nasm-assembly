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
