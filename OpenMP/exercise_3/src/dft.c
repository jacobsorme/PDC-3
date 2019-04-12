#include "dft.h"

// DFT/IDFT routine
// idft: 1 direct DFT, -1 inverse IDFT (Inverse DFT) 
int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
{
	#pragma omp parallel for
	for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
		
		for (int n = 0; n < N; n ++) {
			// Real part of X[k] dikc
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

/*
* Typ lite snabbare än den förra
* Kan vi inte testa med parallell inuti parallell?
* Ey är du med nu? Kolla här
* Pallar inte skriva en bash nu, eller vänta
*/



// VERSION 1 COLLAPSING LOOPS
// int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
// {
// 	// Kolla här då
// 	// Detta är inte en reduktion förresten, eftersom k ändras
// 	#pragma omp parallel for collapse(2) // <<-- sick
// 	for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
// 		for (int n = 0; n < N; n ++) {
// 			// Real part of X[k]
// 			Xr_o[k] += xr[n] * cos(n * k * PI2 / N) + idft * xi[n] * sin(n * k * PI2 / N);
// 			// Imaginary part of X[k]
// 			Xi_o[k] += -idft * xr[n] * sin(n * k * PI2 / N) + xi[n] * cos(n * k * PI2 / N);
// 		}
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






// VERSION 2 REDUCTION
// int DFT(int idft, double* xr, double* xi, double* Xr_o, double* Xi_o, int N)
// {
// 	for (int k = 0 ; k < N; k++) { // k := Vilket element i Xr_o och Xi_o som beräknas
// 		#pragma omp parallel for reduction(+:Xr_o[k],Xi_o[k])
// 		for (int n = 0; n < N; n ++) {
// 			// Real part of X[k]
// 			Xr_o[k] += xr[n] * cos(n * k * PI2 / N) + idft * xi[n] * sin(n * k * PI2 / N);
// 			// Imaginary part of X[k]
// 			Xi_o[k] += -idft * xr[n] * sin(n * k * PI2 / N) + xi[n] * cos(n * k * PI2 / N);
// 		}
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