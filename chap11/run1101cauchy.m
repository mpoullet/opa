%> \file
%> Runs example 11.1. It is a specific implementation of the steepest descent algortihm, where tha Cauchy point is calculated at each iteration. It illustrates the high sensitivity of the method to ill-conditioning.(Table 11.1)
%>

%> \note Calls \ref steepestDescentCauchy

%> 
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 17:11:29 2015

%>

x0 = [9;1] ;
[solution, iteres, niter] = steepestDescentCauchy('ex1101',x0,1.0e-15,1000) ;
format short e
iteres(1:niter,:)
solution
format 
niter


