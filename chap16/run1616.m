%> \file
%> Runs example 16.16  of \cite Bier15-book
%> 
%> @note Calls \ref twoPhasesSimplex
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 14:27:01 2015

A = [1 3 0 4 1 ; 1 2 0 -3 1 ; -1 -4 3 0 0] ;
b = [2 ; 2 ; 1 ] ;
c = [2 ; 3 ; 3 ; 1 ; -2] ;
[x,copt,finaltableau,feasible,bounded] = twoPhasesSimplex(A,b,c)


