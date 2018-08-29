%> @file
%> Example 14.2 in \cite Bier15-book
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:03:42 2015
%> @ingroup Examples
%> @ingroup chap14

%> Example 14.2 in \cite Bier15-book
function [g,gradg] = ex1402(x)
  alpha = [1.165 ; 0.626 ; 0.075 ; 0.351 ; -0.696] ;
  beta = [1 ; -1 ; -1 ; 1 ; 1 ] ;
  m = size(alpha,1) ;
  n = size(x,1) ;
  if (n != 2)
    error("x should contain two entries");
  endif
  g = zeros(m,1) ;
  gradg = zeros(n,m) ;
  for i=1:m
    [phi,deriv] = hyperbolicTangent(alpha(i) * x(1) + x(2)) ;
    g(i) = phi - beta(i) ;
    gradg(1,i) = alpha(i) * deriv ;
    gradg(2,i) = deriv ;
  endfor
endfunction
