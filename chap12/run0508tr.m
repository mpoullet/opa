%> \file
%> Runs example 5.8 with Newton's method with trust region (Tables 12.1, 12.2, 12.3)
%> 
%> @ingroup Running
%> @ingroup chap12
%> @author Michel Bierlaire
%> @date Sat Mar 21 16:07:37 2015

x0 = [1 ; 1] ;
printf("Dogleg, Delta 0  = 10\n") ;
delta0 = 10 ;
[solution,iteres,niter] =  newtonTrustRegion('ex0508',x0,delta0,1.0e-11);
format short e
iteres(1:niter,:)
solution
format 
niter

printf("Dogleg, Delta 0  = 1\n") ;
delta0 = 1 ;
[solution,iteres,niter] =  newtonTrustRegion('ex0508',x0,delta0,1.0e-11);
format short e
iteres(1:niter,:)
solution
format 
niter

printf("Truncated CG, Delta 0  = 10\n") ;
delta0 = 10 ;
[solution,iteres,niter] =  newtonTrustRegion('ex0508',x0,delta0,1.0e-11,1);
format short e
iteres(1:niter,:)
solution
format 
niter


