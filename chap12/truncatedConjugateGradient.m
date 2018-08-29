%> \file
%> Algorithm 12.3: Truncated conjugate gradients method  to find an approximation of the trust region subproblem. Implementation of algorithm 12.3 of \cite Bier15-book
%> 
%> @author Michel Bierlaire
%> @date Sat Mar 21 15:49:09 2015
%> @ingroup Algorithms
%> @ingroup chap12

%> Given a current iterate \f$\widehat{x}\f$, consider the trust region subproblem \f[ \min_d d^T \nabla f(\widehat{x}) + \frac{1}{2} d^T \nabla^2 f(\widehat{x}) d  \f] subject to \f[\|d\|_2 \leq \Delta. \f] Apply the truncated conjugate gradients method to find an approximate solution. 

%> @note Tested with \ref run1203tcg.m
%> @note Called by \ref newtonTrustRegion
%> @note Called by \ref symmetricRankOne

%> @param g the gradient \f$ \nabla f(\widehat{x})\f$
%> @param H the hessian \f$ \nabla^2 f(\widehat{x})\f$ 
%> @param delta the radius \f$ \Delta\f$ of the trust region
%> @return [dstar,type] 
%> @return dstar: the approximate solution
%> @return type: the type of outcome of the method, based on the following code: 
%> - type  1: convergence
%> - type  2: out of the trust region
%> - type  3: negative curvature detected
function [step,type] = truncatedConjugateGradient(g,H,delta)
  tol = 1.0e-6 ;
  n = size(g,1) ;
  xk = zeros(n,1) ;
  gk = g  ;
  dk = -gk ;
  for k=1:n
    if (dk' * H * dk <= 0)
      type = 3 ;
      a = dk' * dk ;
      b = 2 * xk' * dk ;
      c = xk' * xk - delta * delta ;
      rho = b * b - 4 * a * c ;
      step = xk + ((-b + sqrt(rho)) / (2*a)) * dk ;
      return ;
    endif
    alphak = - (dk' * gk) / (dk' * H * dk) ;
    xkp1 = xk + alphak * dk ;
    if (norm(xkp1) > delta)
      type = 2 ;
      a = dk' * dk ;
      b = 2 * xk' * dk ;
      c = xk' * xk - delta * delta ;
      rho = b * b - 4 * a * c ;
      step = xk + ((-b + sqrt(rho)) / (2*a)) * dk ;
      return ;
    endif 
    xk = xkp1 ;
    gkp1 = H * xk + g ;
    betak = (gkp1' * gkp1) / (gk' * gk) ;
    dk = -gkp1 + betak * dk ;
    gk = gkp1 ;
    if (norm(gkp1) <= tol) 
      type = 1 ;
      step = xk ;
      return ;
    endif
  endfor  
  type = 1 ;
  step = xk ;
endfunction