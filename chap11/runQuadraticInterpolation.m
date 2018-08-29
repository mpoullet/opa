%> \file 
%> Runs example 11.3 with quadratic interpolation (table 11.2)
%>
%> \note Calls \ref quadraticInterpolation
%>
%> @ingroup Running
%> @ingroup chap11
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 17:34:20 2015

delta = 6 ;
eps = 1.0e-3 ;
xstar = quadraticInterpolation('ex1103',delta,eps) 


