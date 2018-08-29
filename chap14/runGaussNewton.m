%> \file
%> Run to illustrate the Gauss-Newton algorithm 14.1
%> 
%> @note Calls \ref gaussNewton
%>
%> @ingroup Running
%> @ingroup chap14
%> @author Michel Bierlaire
%> @date Sat May 10 18:53:46 2014

x0 = [0 ; 0] ;
[solution,iteres,niter] =  gaussNewton('ex1401',x0,1.0e-4) ;
format short e
iteres(1:niter,:)
solution
format 
niter

