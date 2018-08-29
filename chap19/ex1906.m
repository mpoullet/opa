%> \file 
%> \f[\min f(x)=100(x_2-x_1^2)^2+(1-x_1)^2\f] subject to \f[x_1-x_2^2-\frac{1}{2} \f]
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 25 17:53:06 2015
%> @ingroup Examples
%> @ingroup chap19

%> @param x value of the variables 
%> @param index If 0, the objective function is evaluated. If not, the constraint number index is evaluated. 
%> @return f value of the function
%> @return g value of the gradient
%> @return H value of the hessian
function [f,g,H] = ex1906(x,index)
  if (index == 0)
    f = 100.0 * (x(2) - x(1) * x(1))^2 + (1.0 - x(1))^2;
    g = [ -400.0 * x(1) * x(2) + 400 * x(1)^3 - 2.0 + 2 * x(1) ;
           200.0 * (x(2) - x(1)*x(1)) ];
    H = [ -400.0 * x(2) + 1200.0 * x(1) * x(1) + 2.0           -400.0 * x(1) ;
          -400.0 * x(1)  200.0] ; 
         
    return ;
  endif
  if (index == 1) 
    f = x(1) - x(2) * x(2) - 0.5 ;
    g = [ 1 ; -2.0 * x(2) ] ;
    H = [0 0 ; 0 -2] ;
    return
  endif  
  error("There is only one constraint") ;
endfunction