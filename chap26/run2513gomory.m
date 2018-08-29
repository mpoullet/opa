%> \file
%> Runs example 25.13 of \cite Bier15-book with Algorithm 26.3
%>
%> @note Calls \ref gomory
%> 
%> @ingroup Running
%> @ingroup chap26
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:14:53 2015

A = [2 9 1 0 ; 11 -8 0 1 ] ;
b = [29 ; 79] ;
c = [-3 ; -13; 0 ; 0] ;

[xopt, iter] = gomory(A,b,c)


