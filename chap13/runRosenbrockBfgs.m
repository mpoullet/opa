%> \file
%> Runs  BFGS with line search (Algorithm 13.1) [\ref bfgs] on the Rosenbrock problem.
%>
%> \note Calls \ref bfgs
%> 
%> @ingroup Running
%> @ingroup chap13
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 16:44:17 2015

%> 

x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = bfgs('exRosenbrock',x0,1.0e-11) ;
format short e
iteres(1:niter,:)
solution
format 
niter



