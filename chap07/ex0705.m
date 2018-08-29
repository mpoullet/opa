%> \file 
%> \f$F(x)=\arctan(x)\f$
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 21:43:26 2015
%> @ingroup Examples


%> Example 7.5 in \cite Bier15-book
function [f,g] = ex0705(x)
     f = atan(x) ;
     g = 1.0 / (1.0 + x * x) ;
endfunction
