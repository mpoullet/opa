%> \file
%> Algorithm 12.2: Dogleg method to find an approximation of the trust region subproblem. Implementation of algorithm 12.2 of \cite Bier15-book
%> 
%> @author Michel Bierlaire
%> @date Sat Mar 21 15:43:44 2015
%> @ingroup Algorithms
%> @ingroup chap12

%> Given a current iterate \f$\widehat{x}\f$, consider the trust region subproblem \f[ \min_d d^T \nabla f(\widehat{x}) + \frac{1}{2} d^T \nabla^2 f(\widehat{x}) d  \f] subject to \f[\|d\|_2 \leq \Delta. \f] Apply the Dogleg method to find an approximate solution. 

%> @note Tested with \ref run1203dogleg.m
%> @note Calls \ref intersectionTrustRegion
%> @note Called by \ref newtonTrustRegion
%> @note Called by \ref symmetricRankOne

%> @param g the gradient \f$ \nabla f(\widehat{x})\f$
%> @param H the hessian \f$ \nabla^2 f(\widehat{x})\f$ 
%> @param delta the radius \f$ \Delta\f$ of the trust region
%> @return [dstar,type] dstar: the approximate solution, type: the type of outcome of the method, based on the following code: 
%> - type -2: negative curvature along Newton's direction
%> - type -1: negative curvature along Cauchy's direction (i.e. along the gradient)
%> - type  1: Partial Cauchy step 
%> - type  2: Newton step
%> - type  3: Partial Newton step
%> - type  4: Dogleg
%>
function [dstar,type] = dogleg(g,H,delta)

  alpha = g' * g ;
  beta = g' * H * g ;

% Check if the model is convex along the gradient direction

  if (beta <= 0)
    dstar = -delta * g / sqrt(alpha)  ;
    type = -1 ;
    return
  endif

				% Compute the Cauchy point

  dc = - (alpha / beta ) * g ;  
  normdc = alpha * sqrt(alpha) / beta ;


  if (normdc >= delta)
				% The Cauchy point is outside the trust
				% region. We move along the Cauchy
				% direction until the border of the trut
				% region.

    dstar = (delta / normdc) * dc ;
    type = 1 ;
    return ;
  endif

% Compute Newton's point

  dn = - H \ g  ;
  normdn = norm(dn) ;

% Check the convexity of the model along Newton's direction

  if (dn' * H * dn <= 0.0)
				% Return the Cauchy point
    dstar = dc ;
    type = -2 ;
    return ;
  endif

  if (normdn <= delta) 
                               % Newton's point is inside the trust region
    dstar = dn ;
    type = 2;
    return ;

  endif
				% Compute the dogleg point

  eta = 0.2 + (0.8 * alpha * alpha / (beta * abs(g' * dn)))  ;

  partieldn = eta * normdn ;
  if (partieldn <= delta)
				% Dogleg point is inside the trust region
    dstar = (delta / normdn) * dn ;
    type = 3 ;
    return ;
  endif

  
				% Between Cauchy and dogleg

  nu = eta * dn - dc ;
  lambda = intersectionTrustRegion(dc,nu,delta) ;

  
  dstar = dc + lambda * nu ;
  type = 4 ;
  return ;
      
endfunction
