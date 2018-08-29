%> \file
%> Runs example 18.7 with the long steps algorithm of \cite Bier15-book (Table 18.7)
%> 
%> @note Calls \ref longSteps
%>
%> @ingroup Running
%> @ingroup chap18
%> @author Michel Bierlaire
%> @date Mon Mar 23 14:59:42 2015


A = [1  1 1];
b = 1;
c = [1 ; 2 ; 3] ;
x0 = [0.6 ; 0.2 ; 0.2];
mu0 = c ;
lambda0 = 0 ;


eps = 1.0e-7 ;
[x,lambda,mu] = longSteps(A,b,c,x0,lambda0,mu0,eps)


