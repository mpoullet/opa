%> \file
%> Runs example 20.7 with the global SQP algorithm of \cite Bier15-book (Tables 20.7, 20.8)
%> 
%> @note Calls \ref globalSqp
%>
%> @ingroup Running
%> @ingroup chap20
%> @author Michel Bierlaire
%> @date Fri Mar 27 16:02:07 2015

x0 = [-0.1 ; 1] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = globalSqp('ex2002',x0,lambda0,eps,1000)

x0 = [0.1 ; 1] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = globalSqp('ex2002',x0,lambda0,eps,1000)




