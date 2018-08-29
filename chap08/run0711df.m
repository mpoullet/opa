%> \file
%> Runs example 7.11 with Newton's method with finite differences (Tables 8.4 and 8.5), n variables
%> 
%> @ingroup Running
%> @ingroup chap08
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 19 18:36:22 2015

%> @note Calls \ref newtonFinDiffNVariables

x0 = [1 ; 1] ;
tau = 1.0e-7 ;
root = newtonFinDiffNVariables('ex0711',x0,tau,1.0e-15)

tau = 0.1 ;
root = newtonFinDiffNVariables('ex0711',x0,tau,1.0e-15)


