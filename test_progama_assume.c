/* C(m,k) = A(m,n) * B(n,k). Triple loop; unroll by flags on j and s (assume k,n % 4 == 0). */
#include <stdint.h>

/* Matrix multiply: C(m,k) = A(m,n) * B(n,k), c(i,j) = sum_s a(i,s)*b(s,j). */
int dspm_mult_s16_ansi(const int16_t *A, const int16_t *B, int16_t *C,
                       int m, int n, int k, int shift)
{
    int final_shift = shift;

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j++) {
            long long acc = 0x7fff >> shift;
            for (int s = 0; s < n; s++) {
                acc += (int32_t)A[i * n + s] * (int32_t)B[s * k + j];
            }
            C[i * k + j] = (int16_t)(acc >> final_shift);
        }
    }
    return 0;
}
