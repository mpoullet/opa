%> @file 
%> \f$F(x_1,x_2)=(x_1 + \cos(x_2) ; -x_1 \sin(x_2))\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:05:44 2015
%> @ingroup Examples
%> @ingroup chap10

%> Gradient of example 5.8 in \cite Bier15-book
function [F,J] = ex0508gradient(x)
     F = [ x(1) + cos(x(2)) ; -x(1) * sin(x(2)) ] ;
     J = [ 1 , -sin(x(2)) ; -sin(x(2)),-x(1)*cos(x(2))] ;
endfunction
