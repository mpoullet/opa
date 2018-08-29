%> \file
%> Runs example 7.12 with Newton's method, n variables
%> 
%> @ingroup Running
%> @ingroup chap07
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 21:51:47 2015

%> @note Calls \ref newtonNVariables

x0 = [1 ; 1] ;
root = newtonNVariables('ex0712',x0,1.0e-15)

x0 = [-1 ; -1] ;
root = newtonNVariables('ex0712',x0,1.0e-15)

x0 = [0 ; 1] ;
root = newtonNVariables('ex0712',x0,1.0e-15)


