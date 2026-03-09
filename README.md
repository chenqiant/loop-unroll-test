# loop-unroll-test

- **`test_progama_assume.c`** — Original C version (with `__builtin_assume` for k%4==0, n%4==0).
- **`loop_unroll_demo.c`** — Manually unrolled C version (4×4 j/s unroll, equivalent to the optimized loop structure).
