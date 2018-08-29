%> \file
%> Runs the steepest descent algorithm (Algorithm 11.6) on the Rosenbrock problem.
%>
%> \note Calls \ref steepestDescent
%>
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 12:09:01 2015

%>

x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = steepestDescent('exRosenbrock',x0,1.0e-15,10000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


