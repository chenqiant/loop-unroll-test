/* Same as dspm_mult_s16_ansi but with j and s unrolled by 4 (manual unroll). */
#include <stdint.h>

int dspm_mult_s16_ansi_unrolled(const int16_t *A, const int16_t *B, int16_t *C,
                                int m, int n, int k, int shift)
{
    int final_shift = shift;
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j += 4) {
            long long acc0 = 0x7fff >> shift;
            long long acc1 = 0x7fff >> shift;
            long long acc2 = 0x7fff >> shift;
            long long acc3 = 0x7fff >> shift;
            for (int s = 0; s < n; s += 4) {
                acc0 += (int32_t)A[i * n + (s + 0)] * (int32_t)B[(s + 0) * k + (j + 0)]
                      + (int32_t)A[i * n + (s + 1)] * (int32_t)B[(s + 1) * k + (j + 0)]
                      + (int32_t)A[i * n + (s + 2)] * (int32_t)B[(s + 2) * k + (j + 0)]
                      + (int32_t)A[i * n + (s + 3)] * (int32_t)B[(s + 3) * k + (j + 0)];
                acc1 += (int32_t)A[i * n + (s + 0)] * (int32_t)B[(s + 0) * k + (j + 1)]
                      + (int32_t)A[i * n + (s + 1)] * (int32_t)B[(s + 1) * k + (j + 1)]
                      + (int32_t)A[i * n + (s + 2)] * (int32_t)B[(s + 2) * k + (j + 1)]
                      + (int32_t)A[i * n + (s + 3)] * (int32_t)B[(s + 3) * k + (j + 1)];
                acc2 += (int32_t)A[i * n + (s + 0)] * (int32_t)B[(s + 0) * k + (j + 2)]
                      + (int32_t)A[i * n + (s + 1)] * (int32_t)B[(s + 1) * k + (j + 2)]
                      + (int32_t)A[i * n + (s + 2)] * (int32_t)B[(s + 2) * k + (j + 2)]
                      + (int32_t)A[i * n + (s + 3)] * (int32_t)B[(s + 3) * k + (j + 2)];
                acc3 += (int32_t)A[i * n + (s + 0)] * (int32_t)B[(s + 0) * k + (j + 3)]
                      + (int32_t)A[i * n + (s + 1)] * (int32_t)B[(s + 1) * k + (j + 3)]
                      + (int32_t)A[i * n + (s + 2)] * (int32_t)B[(s + 2) * k + (j + 3)]
                      + (int32_t)A[i * n + (s + 3)] * (int32_t)B[(s + 3) * k + (j + 3)];
            }
            C[i * k + (j + 0)] = (int16_t)(acc0 >> final_shift);
            C[i * k + (j + 1)] = (int16_t)(acc1 >> final_shift);
            C[i * k + (j + 2)] = (int16_t)(acc2 >> final_shift);
            C[i * k + (j + 3)] = (int16_t)(acc3 >> final_shift);
        }
    }
    return 0;
}
