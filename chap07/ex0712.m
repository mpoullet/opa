%> \file 
%> \f$F(x)=(x_1^3 - 3 x_1 x_2^2 -1, x_2^3 - 3x_1^2 x_2)\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Apr  5 19:47:58 2014
%> @ingroup Examples
%> @ingroup chap07

%> Example 7.12 in \cite Bier15-book
function [F,J] = ex0712(x)
     F = [ x(1) * x(1) * x(1) - 3 * x(1) * x(2) * x(2) - 1 ; x(2) * x(2) * x(2) - 3 * x(1) * x(1) * x(2)] ;
     J = [ 3 * x(1) * x(1) - 3 * x(2) * x(2) , -6 * x(1) * x(2) ; -6 *x(1) * x(2)  , 3* x(2) * x(2) - 3 * x(1) * x(1) ] ;
endfunction
