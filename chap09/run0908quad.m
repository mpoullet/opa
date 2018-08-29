%> \file
%> Runs example 9.8 with the direct method (algorithm 9.1).
%> 
%> @ingroup Running
%> @ingroup chap09
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sun Apr  6 11:27:07 2014

%> @note Calls \ref quadraticDirect

Q = [1 1 1 1 ; 1 2 2 2 ; 1 2 3 3 ; 1 2 3 4] ;
b = [-4 ; -7 ; -9 ; -10 ] ;
printf("Solution provided by Algorihm 9.1: \n")
solution = quadraticDirect(Q,b) 

% With Octave, this can be solved directly using the following statement
printf("Solution provided by Octave: \n")
solution = Q \ -b

