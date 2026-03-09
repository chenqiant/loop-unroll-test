/*
 * Two versions of the same triple-nested loop:
 * - loop_original: standard i, j, s loops
 * - loop_unrolled: j and s unrolled by 4 (assumes k, n divisible by 4)
 *
 * BODY(s, j, i) and BODY2(j, i) are declared only; link with real impl if needed.
 */

 float x[32][256];
 float h[64][256];
 float y[32][64];
 
 float acc[32][64];
 
 static inline __attribute__((always_inline)) void BODY(int s, int j, int i)
 {
     acc[i][j] += x[i][s] * h[j][s];
 }
 
 static inline __attribute__((always_inline)) void BODY2(int j, int i)
 {
     y[i][j] = acc[i][j];
     acc[i][j] = 0;
 }

/* Unrolled: j and s by 4. Same semantics when k and n are multiples of 4. */
void loop_unrolled(int m, int k, int n)
{
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j += 4) {
            for (int s = 0; s < n; s += 4) {
                BODY(s + 0, j + 0, i);
                BODY(s + 1, j + 0, i);
                BODY(s + 2, j + 0, i);
                BODY(s + 3, j + 0, i);
                BODY(s + 0, j + 1, i);
                BODY(s + 1, j + 1, i);
                BODY(s + 2, j + 1, i);
                BODY(s + 3, j + 1, i);
                BODY(s + 0, j + 2, i);
                BODY(s + 1, j + 2, i);
                BODY(s + 2, j + 2, i);
                BODY(s + 3, j + 2, i);
                BODY(s + 0, j + 3, i);
                BODY(s + 1, j + 3, i);
                BODY(s + 2, j + 3, i);
                BODY(s + 3, j + 3, i);
            }
            BODY2(j + 0, i);
            BODY2(j + 1, i);
            BODY2(j + 2, i);
            BODY2(j + 3, i);
        }
    }
}
