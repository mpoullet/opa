%> \file 
%> Illustrates inexact line search with example 11.1  (table 11.6)
%>
%> \note Calls \ref lineSearch
%>
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 17:47:16 2015

x = [10.0 ; 1.0] ;
d = [-2.0/sqrt(5.0) ; 1.0/sqrt(5.0) ];
alpha0 = 1.0e-3 ;
beta1 = 0.3 ;
beta2 = 0.7 ;
lambda = 20 ;
alpha = lineSearch('ex1101',x,d,alpha0,beta1,beta2,lambda,1)

