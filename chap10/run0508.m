%> \file
%> Runs example 5.8 with Newton's local, n variables (Table 10.1)
%> 
%> @ingroup Running
%> @ingroup chap10
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:07:38 2015
%>
%> @note Calls \ref newtonLocal

x0 = [-2 ; 1] ;
root = newtonLocal('ex0508gradient',x0,1.0e-15)

x0 = [1 ; 1] ;
root = newtonLocal('ex0508gradient',x0,1.0e-15)


