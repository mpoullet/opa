%> \file
%> Steepest descent algorithm, calculating the Cauchy point at each iteration.
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 17:07:48 2015
%> @ingroup Algorithms
%> @ingroup chap11


%>
%> Applies the steepest descent algorithm  to solve \f$\min_x f(x)\f$ where \f$f:\mathbb{R}^n\to\mathbb{R}\f$. The Cauchy point is calculated at each iteration.

%> \note Tested with \ref run1101cauchy.m

%> @param obj the name of the Octave function defining f(x) and its derivatives
%> @param x0 the starting point
%> @param eps  algorithm stops if \f$\|F(x)\| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return [solution,iteres,niter] 
%> @return solution: local minimum of the function
%> @return iteres: sequence of iterates generated by the algorithm. It contains n+2 columns. Columns 1:n contains the value of the current iterate. Column n+1 contains the value of the objective function. Column n+2 contains the value of the norm of the gradient. It contains maxiter rows, but only the first niter rows are meaningful.
%> @return niter: total number of iterations
function [solution, iteres, niter] = steepestDescentCauchy(obj,x0,eps,maxiter = 100)
  xk = x0 ;
  [f,g,H] = feval(obj,xk)   ;
  iteres = zeros(1+ maxiter,4) ;
  k = 0 ;
  iteres(1,:) = [xk'  f  norm(g) ] ;
  do
    denom = g' * H * g ;
    if (denom <= 0)
      error("The function is not convex in the direction of the gradient. The Cauchy point is not defined.")
    endif
    alpha = g' * g / denom ;
    xk = xk - alpha * g ;
    [f,g,H] = feval(obj,xk);
    k=k+1 ; 
    iteres(k+1,:) = [xk' f  norm(g) ] ;
  until (norm(g) <= eps || k >= maxiter)
  solution = xk ;
  niter = k ;
endfunction