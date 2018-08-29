%> \file
%> Runs example 19.6 with the augmented lagrangian method of \cite Bier15-book
%> 
%> @note Calls \ref augmentedLagrangian
%>
%> @remark The implementation of the augmented Lagrangian method called by this example is slightly different from the implementation used to generate Tables 19.3 and 19.4, so that the iterates are not the same. 
%>
%> @ingroup Running
%> @ingroup chap19
%> @author Michel Bierlaire
%> @date Wed Mar 25 18:01:15 2015

x0 = [-1 ; 0] ; 
lambda0 = 0 ; 
eps = 1.0e-8 ;
[solution,lambda] = augmentedLagrangian('ex1906',x0,lambda0,eps,1000)



