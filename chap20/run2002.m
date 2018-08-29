%> \file
%> Runs example 20.2 with the local SQP algorithm of \cite Bier15-book (Tables 20.1, 20.2, 20.3, 20.4)
%> 
%> @note Calls \ref localSqp
%>
%> @remark The solver of the quadratic problem used in this code is not the same as the one used to generate the results of the book. Therefore, the results of Tables 20.3 and 20.4 are not exactly the same. 
%>
%> @ingroup Running
%> @ingroup chap20
%> @author Michel Bierlaire
%> @date Thu Mar 26 13:46:47 2015

x0 = [1 ; -1] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = localSqp('ex2002',x0,lambda0,eps,1000)

x0 = [-1.5 ; 2] ; 
lambda0 = 1 ; 
eps = 1.0e-7 ;
[solution,lambda] = localSqp('ex2002',x0,lambda0,eps,1000)

x0 = [-0.1 ; 1] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = localSqp('ex2002',x0,lambda0,eps,1000)

x0 = [0.1 ; 1] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = localSqp('ex2002',x0,lambda0,eps,1000)




