%> @file 
%> \f$f(x_1,x_2)=\frac{1}{2} x_1^2 + x_1 \cos(x_2)\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:03:42 2015
%> @ingroup Examples
%> @ingroup chap11

%> Example 5.8 in \cite Bier15-book
function [f,g,H] = ex0508(x)
     f = 0.5 * x(1) * x(1) + x(1) * cos(x(2)) ;
     g = [ x(1) + cos(x(2)) ; -x(1) * sin(x(2)) ] ;
     H = [ 1 , -sin(x(2)) ; -sin(x(2)),-x(1)*cos(x(2))] ;
endfunction
