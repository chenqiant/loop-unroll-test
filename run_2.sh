# Unified unroll: clang does all loop unrolling (count=4), then opt runs loop-fusion.
clang -O3 -funroll-loops -mllvm -unroll-count=4 -mllvm -unroll-allow-remainder --target=riscv32-unknown-elf -S -emit-llvm test_progama_assume.c -o 1.ll
opt -passes=loop-fusion 1.ll -S -o 2.ll -debug-only=loop-fusion


