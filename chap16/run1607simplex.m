%> \file
%> Runs example 16.4 illustrating the simplex method
%> 
%> @note Calls \ref simplex
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 11:09:14 2015
A = [1 2 2 1 0 0 ; 2 1 2 0 1 0 ; 2 2 1 0 0 1] ;
b = [20 ; 20 ; 20 ] ;
c = [-10 ; -12 ; -12 ; 0 ; 0 ; 0 ] ;
basis = [4 5 6] ;
[optimalbasis,unbounded] = simplex(A,b,c,basis) ;
if (unbounded == 0)
  B = A(:,optimalbasis) ;
  xb = B \ b ;
  xfull = zeros(size(c));
  xfull(optimalbasis) = xb ;
  xfull
  printf("Objective function: %e\n",c'*xfull) 
else
  printf("Unbounded problem\n") ;
endif
