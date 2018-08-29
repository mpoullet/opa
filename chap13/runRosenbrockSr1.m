%> \file
%> Runs Trust region method with symmetric rank one  (Algorithm 13.2) [\ref newtonTrustRegion] on the Rosenbrock problem.
%>
%> \note Calls \ref symmetricRankOne
%> 
%> @ingroup Running
%> @ingroup chap13
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 16:46:45 2015

%> 

delta0 = 10 ;
printf("Dogleg\n") ;
x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = symmetricRankOne('exRosenbrock',x0,delta0,1.0e-8,0,1000) ;
format short e
iteres(1:niter,:)
solution
format 
niter

printf("Truncated trust region\n") ;
x0 = [-1.5 ; 1.5] ;
[solution, iteres, niter] = symmetricRankOne('exRosenbrock',x0,delta0,1.0e-8,1,1000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


