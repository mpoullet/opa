%> \file
%> Algorithm 8.3: Newton's method with finite differences, n variables. Implementation of algorithm 8.3 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 19 18:26:50 2015
%> @ingroup Algorithms
%> @ingroup chap08

%> @note Tested with \ref run0711df.m

%> Applies Newton's algorithm with finite differences to solve \f$F(x)=0\f$ where \f$F:\mathbb{R}^n\to\mathbb{R}^n \f$
%> @param obj the name of the Octave function defining F(x) and its Jacobian
%> @param x0 the starting point
%> @param tau step for the finite difference approximation
%> @param eps  algorithm stops if \f$\|F(x)\| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return root of the system
function solution = newtonFinDiffNVariables(obj,x0,tau,eps,maxiter=100)
  xk = x0 ;
  f = feval(obj,xk)  ;
  k = 0 ;
  printf("%2d %+15.8e %+15.8e %+15.8e\n",k,xk(1),f(1),norm(f)) ;
  printf("   %+15.8e %+15.8e\n",xk(2),f(2)) ;
  n = size(x0,1) ;
  do
  for i=1:n
    if (abs(xk(i)) >= 1)
      s = tau * xk(i) ; 
    else 
      if (xk(i) >= 0)
	s = tau ;
      else
	s = -tau ;
      endif
    endif
    ei = eye(n,n)(:,i) ;
    fp = feval(obj,xk+s * ei)  ;
    A(:,i) = (fp - f) / s ;
  endfor
  xk = xk - A \ f  ;
  f = feval(obj,xk)  ;
  k=k+1; 
  printf("%2d %+15.8e %+15.8e %+15.8e\n",k,xk(1),f(1),norm(f)) ;
  printf("   %+15.8e %+15.8e\n",xk(2),f(2)) ;
  until (norm(f) <= eps || k >= maxiter)
  solution = xk ;
endfunction
