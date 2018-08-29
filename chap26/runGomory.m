%> \file
%> Runs example of Gomory cut
%> 
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Wed Sep 24 11:24:09 2014

%A = [-4 6 1 0 0 0 ; 1 1 0 1 0 0 ; 0 1 0 0 1 0 ; -1 2 0 0 0 1  ] ;
%b = [5 ; 5 ; 2 ; 2] ;
%c = [1 ;-2; 0; 0 ; 0 ; 0];

%A = [-4 6 1 0 ; 1 1 0 1 ] ;
%b = [5 ; 5 ] ;
%c = [1 ;-2; 0 ; 0];

A = [2 9 1 0 ; 11 -8 0 1] ;
b = [29 ; 79] ;
c = [-3 ; -13 ; 0 ; 0 ] ;
[xopt,fmin] = glpk(c,A,b)

xopt = agomory(A,b,c)

