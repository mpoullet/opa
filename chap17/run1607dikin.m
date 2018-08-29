%> \file
%> Runs example 16.7 illustrating the Dikin method (Table 17.4)
%> 
%> @note Calls \ref dikin
%>
%> @ingroup Running
%> @ingroup chap17
%> @author Michel Bierlaire
%> @date Sun Mar 22 17:06:32 2015
A = [1 2 2 1 0 0 ; 2 1 2 0 1 0 ; 2 2 1 0 0 1] ;
b = [20 ; 20 ; 20 ] ;
c = [-10 ; -12 ; -12 ; 0 ; 0 ; 0 ] ;
x0 = [ 3 ; 3 ; 3 ; 5 ; 5 ; 5] ;
eps = 1.0e-6 ;
[solution, iteres, niter, unbounded] =  dikin(A,b,c,x0,eps)
if (unbounded == 0)
  format short e
  iteres(1:niter,:)
  solution
  format 
  niter
else
  printf("Unbounded problem\n") ;
endif
