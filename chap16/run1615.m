%> \file
%> Runs example 16.15  of \cite Bier15-book
%> 
%> @note Calls \ref twoPhasesSimplex
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 14:38:09 2015

A = [1 2 3 0 ; -1 2 6 0 ;  0 4 9 0 ; 0 0 3 1 ] ;
b = [3 ; 2 ; 5 ; 1] ;
c = [1 ; 1 ; 1 ; 0] ;
[x,copt,finaltableau,feasible,bounded] = twoPhasesSimplex(A,b,c)


