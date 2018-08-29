%> \file
%> Runs Trust region method with line search  (Algorithm 12.4) [\ref newtonTrustRegion] on the Rosenbrock problem.
%>
%> \note Calls \ref newtonTrustRegion
%> 
%> @ingroup Running
%> @ingroup chap12
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 16:16:57 2015

%> 

delta0 = 10 ;
printf("Dogleg\n") ;
x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = newtonTrustRegion('exRosenbrock',x0,delta0,1.0e-11,0) ;
format short e
iteres(1:niter,:)
solution
format 
niter

printf("Truncated trust region\n") ;
x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = newtonTrustRegion('exRosenbrock',x0,delta0,1.0e-11,1) ;
format short e
iteres(1:niter,:)
solution
format 
niter


