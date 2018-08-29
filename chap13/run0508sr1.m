%> \file
%> Runs example 5.8 with SR1 method with trust region (Tables 13.3 et 13.4)
%> 
%> @ingroup Running
%> @ingroup chap13
%> @author Michel Bierlaire
%> @date Sat Mar 21 16:38:51 2015

%> @note Calls \ref symmetricRankOne

x0 = [1 ; 1] ;
delta0 = 10 ;
printf("Dogleg\n") ;
[solution,iteres,niter] =  symmetricRankOne('ex0508',x0,delta0,1.0e-10,0,1000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


printf("Truncated CG\n") ;
[solution,iteres,niter] =  symmetricRankOne('ex0508',x0,delta0,1.0e-10,1,1000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


