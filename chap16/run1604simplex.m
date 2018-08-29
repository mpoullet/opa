%> \file
%> Runs example 16.4 illustrating the simplex method
%> 
%> @note Calls \ref simplex
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 11:09:14 2015
A = [1 1 1 0 ; 1 -1 0 1] ;
b = [1 ; 1] ;
c = [-1 ; -2 ; 0 ; 0 ] ;
basis = [3 4] ;
[optimalbasis,unbounded] = simplex(A,b,c,basis) ;
B = A(:,optimalbasis) ;
xb = B \ b ;
xfull = zeros(size(c));
xfull(optimalbasis) = xb ;
xfull
printf("Objective function: %e\n",c'*xfull) 
