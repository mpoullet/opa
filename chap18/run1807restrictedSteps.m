%> \file
%> Runs example 18.7 with the restricted steps algorithm of \cite Bier15-book (Table 18.5)
%> 
%> @note Calls \ref restrictedSteps
%>
%> @ingroup Running
%> @ingroup chap18
%> @author Michel Bierlaire
%> @date Mon Mar 23 11:31:03 2015

A = [1  1 1];
b = 1;
c = [1 ; 2 ; 3] ;
x0 = [0.6 ; 0.2 ; 0.2];
mu0 = c ;
lambda0 = 0 ;
eps = 1.0e-6 ;
[x,lambda,mu] = restrictedSteps(A,b,c,x0,lambda0,mu0)


