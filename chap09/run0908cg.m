%> \file
%> Runs example 9.8 for the conjugate gradient algorithm (Table 9.1).
%> 
%> @ingroup Running
%> @ingroup chap09
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 14:30:01 2015

%> @note Calls \ref conjugateGradient

Q = [1 1 1 1 ; 1 2 2 2 ; 1 2 3 3 ; 1 2 3 4] ;
b = [-4 ; -7 ; -9 ; -10 ] ;
x0 = [5 ; 5 ; 5 ; 5] ;
[D,solution] = conjugateGradient(Q,b,x0,1) 


