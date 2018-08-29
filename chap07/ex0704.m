%> \file 
%> \f$F(x)=x - \sin(x)\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 21:38:51 2015
%> @ingroup Examples
%> @ingroup chap07

%> Example 7.4 in \cite Bier15-book
function [f,g] = ex0704(x)
     f = x - sin(x) ;
     g = 1 - cos(x) ;
endfunction
