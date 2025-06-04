nasm -f elf $1 -o out.o
ld -m elf_i386 -s -o bin/run out.o
./bin/run

