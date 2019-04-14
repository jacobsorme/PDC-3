#include "dft.h"


 int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
 {
     #pragma omp parallel for
     for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
              for (int n = 0; n < N; n ++) {
                      // Real part of X[k]
                      Xr_o[k] += xr[n] * cos(n * k * PI2 / N) + idft * xi[n] * sin(n * k * PI2 / N);
                      // Imaginary part of X[k]
                      Xi_o[k] += -idft * xr[n] * sin(n * k * PI2 / N) + xi[n] * cos(n * k * PI2 / N);
              }
      }
      // normalize if you are doing IDFT
      if (idft == -1){
              for (int n = 0; n < N; n++) {
                      Xr_o[n] /= N;
                      Xi_o[n] /= N;
              }
      }
      return 1;
 }


// VERSION 1 parallel for outer 0.47 nan s
// DFT/IDFT routine
// idft: 1 direct DFT, -1 inverse IDFT (Inverse DFT) 
// int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
// {
//	#pragma omp parallel for 
//	for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
//		for (int n = 0; n < N; n ++) {
//			// Real part
//			Xr_o[k] += xr[n] * cos(n * k * PI2 / N) + idft * xi[n] * sin(n * k * PI2 / N);
//			// Imaginary part
//			Xi_o[k] += -idft * xr[n] * sin(n * k * PI2 / N) + xi[n] * cos(n * k * PI2 / N);
//		}
//	}
//	// normalize if you are doing IDFT
//	if (idft == -1){
//		for (int n = 0; n < N; n++) {
//			Xr_o[n] /= N;
//			Xi_o[n] /= N;
//		}
//	}
//	return 1;
//}

// VERSION 2 REDUCTION 1.47 nan s
// int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
// {
// 	for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
//		double i_val = 0;
//		double r_val = 0;
// 		#pragma omp parallel for reduction(+:r_val,i_val)
// 		for (int n = 0; n < N; n ++) {
// 			// Real part of X[k]
// 			r_val += xr[n] * cos(n * k * PI2 / N) + idft * xi[n] * sin(n * k * PI2 / N);
// 			// Imaginary part of X[k]
// 			i_val += -idft * xr[n] * sin(n * k * PI2 / N) + xi[n] * cos(n * k * PI2 / N);
// 		}
//		Xr_o[k] += r_val;
//		Xi_o[k] += i_val;
// 	}
// 	// normalize if you are doing IDFT
// 	if (idft == -1){
// 		#pragma omp parallel for
// 		for (int n = 0; n < N; n++) {
// 			Xr_o[n] /= N;
// 			Xi_o[n] /= N;
// 		}
// 	}
// 	return 1;
// }
