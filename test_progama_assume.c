/* Triple loop; unroll_count(4) on j and s. loop-fusion-prep adds readnone
   to BODY/BODY2 declarations so loop-fusion can fuse (use -loop-fusion-prep-ignore-calls=BODY,BODY2). */

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
  

void loop_original(int m, int k, int n)
{
    __builtin_assume(k % 4 == 0);
    __builtin_assume(n % 4 == 0);

    for (int i = 0; i < m; i++) {
        #pragma clang loop unroll_count(4)
        for (int j = 0; j < k; j++) {
            #pragma clang loop unroll_count(4)
            for (int s = 0; s < n; s++) {
                BODY(s, j, i);
            }
            BODY2(j, i);
        }
    }
}
