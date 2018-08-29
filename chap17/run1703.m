%> \file
%> Runs example 17.3  of \cite Bier15-book 
%> 
%> @note Calls \ref dikin
%>
%> @ingroup Running
%> @ingroup chap17
%> @author Michel Bierlaire
%> @date Sun Mar 22 16:50:51 2015

A = [1 1 1] ;
b = 1 ;
c = [1 ; 2 ; 3] ;
x0 = [1/3; 1/3 ; 1/3] ;
eps = 1.0e-6 ;
[solution, iteres, niter] = dikin(A,b,c,x0,eps);
format short e
iteres(1:niter,:)
solution
format 
niter



