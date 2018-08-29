%> \file
%> Runs example 18.7 with the predictor-corrector algorithm of \cite Bier15-book (Table 18.6)
%> 
%> @note Calls \ref predictorCorrector
%>
%> @ingroup Running
%> @ingroup chap18
%> @author Michel Bierlaire
%> @date Mon Mar 23 11:31:03 2015

A = [1  1 1];
b = 1;
c = [1 ; 2 ; 3] ;
x0 = [0.5 ; 0.3 ; 0.2];
mu0 = c ;
lambda0 = 0 ;

eps = 1.0e-7 ;
[x,lambda,mu] = predictorCorrector(A,b,c,x0,lambda0,mu0,eps,0.5,0.5,100)


