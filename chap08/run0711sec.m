%> \file
%> Runs example 7.11 with Newton's secant method  (Table 8.6), n variables
%> 
%> @ingroup Running
%> @ingroup chap08
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 19 18:42:41 2015

%> @note Calls \ref secantNVariables

x0 = [1 ; 1] ;
root = secantNVariables('ex0711',x0,1.0e-15)



