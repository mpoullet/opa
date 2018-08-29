%> \file
%> Runs example 17.2  of \cite Bier15-book (Tables 17.1 and 17.2)
%> 
%> @note Calls \ref projectedGradient
%>
%> @ingroup Running
%> @ingroup chap17
%> @author Michel Bierlaire
%> @date Sun Mar 22 15:10:27 2015

A = [-1 1] ;
b = -1 ;
x0 = [3.5 ; 2.5] ;
eps = 1.0e-6 ;
[solution, iteres, niter] = projectedGradient('ex1101',A,b,x0,eps);
format short e
iteres(1:niter,:)
solution
format 
niter

[solution, iteres, niter] = projectedGradient('ex1101',A,b,x0,eps,0.1);
format short e
iteres(1:niter,:)
solution
format 
niter


