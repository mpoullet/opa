%> \file
%> Runs example 5.8 with BFGS method with linesearch (Tables 13.1 and 13.2)
%> 
%> @ingroup Running
%> @ingroup chap13
%> @author Michel Bierlaire
%> @date Sat Mar 21 16:30:18 2015

%> @note Calls \ref bfgs

x0 = [1 ; 1] ;
[solution,iteres,niter] =  bfgs('ex0508',x0,1.0e-15) ;
format short e
iteres(1:niter,:)
solution
format 
niter


