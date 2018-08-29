%> \file
%> Runs example 20.3 with the local SQP algorithm of \cite Bier15-book (Table 20.5)
%> 
%> @note Calls \ref localSqp
%>
%> @ingroup Running
%> @ingroup chap20
%> @author Michel Bierlaire
%> @date Fri Mar 27 15:43:45 2015

x0 = [0.5 ; 1.3] ; 
lambda0 = 1 ; 
eps = 1.0e-8 ;
[solution,lambda] = localSqp('ex2003',x0,lambda0,eps,1000)



