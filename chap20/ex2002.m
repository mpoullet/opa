%> \file 
%> \f[\min f(x)=x_1+x_2\f] subject to \f[x_1^2+(x_2-1)^2-1=0 \f]
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 26 13:43:46 2015
%> @ingroup Examples
%> @ingroup chap20

%> @param x value of the variables 
%> @param index If 0, the objective function is evaluated. If not, the constraint number index is evaluated. 
%> @return f value of the function
%> @return g value of the gradient
%> @return H value of the hessian
function [f,g,H] = ex2002(x,index)
  if (index == 0)
    f = x(1) + x(2) ;
    g = [ 1 ; 1 ];
    H = [ 0  0 ;  0 0 ] ; 
    return ;
  endif
  if (index == 1) 
    f = x(1) * x(1) + (x(2)-1.0) * (x(2)-1.0) - 1.0 ;
    g = [ 2 * x(1) ; 2 * (x(2)-1) ] ;
    H = [ 2  0 ; 0  2 ] ;
    return
  endif  
  error("There is only one constraint") ;
endfunction