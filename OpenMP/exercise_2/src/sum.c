#include "sum.h"

void omp_sum(double *sum_ret)
{
    int n = omp_get_max_threads();
    *sum_ret = 0;

    #pragma omp parallel
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            *sum_ret += x[i];
        }
    }
}

void omp_critical_sum(double *sum_ret)
{
    int n = omp_get_max_threads();
    *sum_ret = 0;

    #pragma omp parallel
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            #pragma omp critical
            *sum_ret += x[i];
        }
    }
}

void omp_atomic_sum(double *sum_ret)
{
    int n = omp_get_max_threads();
    *sum_ret = 0;

    #pragma omp parallel
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            #pragma omp atomic
            *sum_ret += x[i];
        }
    }
}

void omp_local_sum(double *sum_ret)
{
    int n = omp_get_max_threads();
    double *res = calloc(n,sizeof(double));

    #pragma omp parallel
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            res[t] += x[i];
        }
    }
    double sum = 0;
    for(int i = 0; i < n; i++) sum += res[i];
    *sum_ret = sum;
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
