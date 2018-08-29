%> \file
%> Runs example 7.3 with Newton's method with finite differences, one variable (Tables 8.1 and 8.2)
%> 
%> @ingroup Running
%> @ingroup chap08
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 19 09:50:54 2015

%> @note Calls \ref newtonFinDiffOneVariable

tau = 1.0e-7
root = newtonFinDiffOneVariable('ex0703',2.0,1.0e-15,tau)

tau = 0.1
root = newtonFinDiffOneVariable('ex0703',2.0,1.0e-15,tau)


