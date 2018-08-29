%> \file
%> Runs example 7.11 with Newton's method, n variables
%> 
%> @ingroup Running
%> @ingroup chap07
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 21:49:14 2015

%> @note Calls \ref newtonNVariables

x0 = [1 ; 1] ;
root = newtonNVariables('ex0711',x0,1.0e-15)


