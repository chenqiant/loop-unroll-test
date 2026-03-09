# loop-unroll-test

Int16 matrix multiply **C(m,k) = A(m,n) * B(n,k)**; loop unroll only (no other optimizations).

- **`test_progama_assume.c`** — Original triple loop `dspm_mult_s16_ansi` (with `__builtin_assume` k,n % 4 == 0). Unroll via compiler flags; see `run_2.sh`.
- **`loop_unroll_demo.c`** — Manually unrolled `dspm_mult_s16_ansi_unrolled` (j and s unrolled by 4).