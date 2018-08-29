%> \file
%> Runs example 19.5 with the augmented lagrangian method of \cite Bier15-book
%> 
%> @note Calls \ref augmentedLagrangian
%>
%> @remark The implementation of the augmented Lagrangian method called by this example is slightly different from the implementation used to generate Tables 19.1 and 19.2, so that the iterates are not the same. 
%>
%> @ingroup Running
%> @ingroup chap19
%> @author Michel Bierlaire
%> @date Mon Mar 23 16:41:47 2015 

x0 = [-1 ; 0.1] ; 
lambda0 = 0 ; 
eps = 1.0e-11 ;
[solution,lambda] = augmentedLagrangian('ex1905',x0,lambda0,eps,1000)



