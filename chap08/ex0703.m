%> \file 
%> \f$F(x)=x^2-2\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 18:46:41 2015
%> @ingroup Examples
%> @ingroup chap08

%> Example 7.3 in \cite Bier15-book
function [f,g] = ex0703(x)
     f = x * x - 2;
     g = 2 * x ;
endfunction
