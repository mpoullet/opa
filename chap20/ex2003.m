%> \file 
%> \f[\min f(x)=2(x_1^2+x_2^2-1)-x_1\f] subject to \f[x_1^2+x_2^2=1 \f]
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 27 15:41:39 2015
%> @ingroup Examples
%> @ingroup chap20

%> @param x value of the variables 
%> @param index If 0, the objective function is evaluated. If not, the constraint number index is evaluated. 
%> @return f value of the function
%> @return g value of the gradient
%> @return H value of the hessian
function [f,g,H] = ex2003(x,index)
  if (index == 0)
    f = 2.0 * (x(1)*x(1) + x(2) * x(2) - 1) - x(1) ;
    g = [ 4.0 * x(1) - 1.0 ; 4 * x(2) ];
    H = [ 4.0  0.0  ; 0.0  4.0  ] ; 
    return ;
  endif
  if (index == 1) 
    f = x(1) * x(1) + x(2) * x(2) - 1.0;
    g = [ 2 * x(1) ; 2 * x(2) ] ;
    H = [ 2  0 ; 0  2 ] ;
    return
  endif  
  error("There is only one constraint") ;
endfunction