%> \file
%> Runs example 26.4 of \cite Bier15-book with Algorithm 26.3
%> 
%> @note Calls \ref gomory
%>
%> @ingroup Running
%> @ingroup chap26
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:12:43 2015

A = [-4 6 1 0 ; 1 1 0 1 ] ;
b = [5 ; 5 ] ;
c = [1 ;-2; 0 ; 0];

[xopt,iter] = gomory(A,b,c)


