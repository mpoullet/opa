%> @file
%> Hyperbolic tangent function. Equation (14.9) in \cite Bier15-book
%> \f[\frac{e^{\alpha}-e^{-\alpha}}{e^{\alpha}+e^{-\alpha}}\f]
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 17:25:23 2015
%> @ingroup Examples
%> @ingroup chap14

%> Hyperbolic tangent function. Equation (14.9) in \cite Bier15-book
function [phi,deriv] = hyperbolicTangent(alpha)
  phi = (exp(alpha)-exp(-alpha)) / (exp(alpha)+exp(-alpha)) ;
  deriv = 4 * exp(2*alpha) / (exp(2*alpha)+1)^2 ;
endfunction
