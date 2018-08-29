%> \file
%> Runs Newton's method with line search  (Algorithm 11.8) [\ref newtonLineSearch] on the Rosenbrock problem.
%>
%> \note Calls \ref newtonLineSearch
%> 
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 12:51:55 2015

%> 

x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = newtonLineSearch('exRosenbrock',x0,1.0e-15,10000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


