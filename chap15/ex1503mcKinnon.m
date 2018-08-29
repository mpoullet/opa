%> \file 
%> \f$f(x)=\left\{  \begin{array}{ll} 360  x_1^2 + x_2 + x_2^2&\text{if } x_1 \leq 0 \\ 6x_1^2 + x_2 + x_2^2 & \text{if } x_1 \geq 0.  \end{array}\right.\f$
%> @author Michel Bierlaire
%> @date Sat Mar 21 19:02:59 2015
%> @ingroup Examples
%> @ingroup chap15

%> Example 15.3 in \cite Bier15-book
function f = ex1503mcKinnon(x)
  if (x(1) <= 0)
    f = 360.0 * x(1) * x(1) + x(2) + x(2) * x(2) ;
  else
    f = 6 * x(1) * x(1) + x(2) + x(2) * x(2) ;
  endif
  return
endfunction
