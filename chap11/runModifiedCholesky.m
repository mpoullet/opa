%> \file 
%> Illustrates the modified Cholesky algorithm
%>
%> \note Calls \ref modifiedCholesky
%>
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 12:30:32 2015

A = [1 4 7 ; 4 5 8 ; 7 8 9 ];
[L,tau] = modifiedCholesky(A)

printf("L*L':\n")
L*L'

printf("A + tau I:\n")
A+tau*eye(size(A))
