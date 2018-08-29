%> \file
%> Algorithm 8.1: Newton's method with finite differences, one variable. Implementation of algorithm 8.1 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Thu Mar 19 09:44:05 2015
%> @ingroup Algorithms
%> @ingroup chap08

%> @note Tested with \ref run0703df.m

%> Applies Newton's algorithm with finite differences to solve \f$F(x)=0\f$ where \f$F:\mathbb{R}\to\mathbb{R} \f$
%> @param obj the name of the Octave function defining F(x)
%> @param x0 the starting point
%> @param eps  algorithm stops if \f$|F(x)| \leq \varepsilon \f$. 
%> @param tau step for the finite difference approximation
%> @param maxiter maximum number of iterations (Default: 100)
%> @return root of the function
function solution = newtonFinDiffOneVariable(obj,x0,eps,tau,maxiter = 100)
  xk = x0 ;
  f = feval(obj,xk)  ;
  k = 0 ;
  printf("%d %15.8e %15.8e\n",k,xk,f) ;
  do
    if (abs(xk)>= 1) 
      s = tau * xk ;
    else
      s = tau ;
    endif
    fs = feval(objop,xk+s)  ;
    xk = xk - s * f / (fs - f) ;
    f = feval(obj,xk)  ;
    k=k+1; 
    printf("%d %15.8e %15.8e\n",k,xk,f) ;
    until (abs(f) <= eps || k >= maxiter)
  solution = xk ;
endfunction
