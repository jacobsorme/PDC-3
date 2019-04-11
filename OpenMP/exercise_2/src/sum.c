#include "sum.h"

void omp_sum(double *sum_ret)
{
    double sum = 0;
    int n = omp_get_num_threads();
    double *res = calloc(n,sizeof(double));

    #pragma omp parallel {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n){
            res[t] += x[i];
        }
    }
    for(int i = 0; i < n; i++) sum += res[i];
    *sum_ret = sum;
}

void omp_critical_sum(double *sum_ret)
{

}

void omp_atomic_sum(double *sum_ret)
{

}

void omp_local_sum(double *sum_ret)
{

}

void omp_padded_sum(double *sum_ret)
{

}

void omp_private_sum(double *sum_ret)
{

}

void omp_reduction_sum(double *sum_ret)
{

}
