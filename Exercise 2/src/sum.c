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
    int n = omp_get_max_threads();
    // 1 double takes up padding_constant sizeof(double) in memory
    int padding_constant = 8; // Cache line size / sizeof(double)
    double *res = malloc(n * padding_constant * sizeof(double));

    // Clear the positions in res to be used
    for(int i = 0; i < n; i++) res[padding_constant*i] = 0; 

    #pragma omp parallel
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            res[padding_constant*t] += x[i];
        }
    }
    double sum = 0;
    // Spatial locality will depend on the size of padding_constant
    for(int i = 0; i < n; i ++) sum += res[padding_constant*i];
    *sum_ret = sum;
}

void omp_private_sum(double *sum_ret)
{
    int n = omp_get_max_threads();
    *sum_ret = 0;

    double sum;
    #pragma omp parallel private(sum)
    {
        int t = omp_get_thread_num();
        for (int i = t; i < size; i += n) {
            sum += x[i];
        }
        #pragma omp critical
        *sum_ret += sum;
    }    
}

void omp_reduction_sum(double *sum_ret)
{
    double sum = 0;
    #pragma omp parallel for reduction (+:sum)
	for (int i = 0; i < size; i++){
		sum += x[i];
	}
	*sum_ret = sum;
}
