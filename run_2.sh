clang -O3 --target=riscv32-unknown-elf -S -emit-llvm test_progama_assume.c -o 1.ll
opt -passes=loop-fusion  1.ll -S -o 2.ll


