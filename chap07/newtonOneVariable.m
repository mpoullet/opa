%> \file
%> Algorithm 7.2: Newton's method, one variable. Implementation of algorithm 7.2 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Wed Mar 18 18:44:56 2015
%> @ingroup Algorithms
%> @ingroup chap07 

%> @note Tested with \ref run0703.m
%> @note Tested with \ref run0704.m
%> @note Tested with \ref run0705.m

%> Applies Newton's algorithm to solve \f$F(x)=0\f$ where \f$F:\mathbb{R}\to\mathbb{R} \f$
%> @param obj the name of the Octave function defining F(x) and its derivative
%> @param x0 the starting point
%> @param eps  algorithm stops if \f$|F(x)| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return root of the function
function solution = newtonOneVariable(obj,x0,eps,maxiter=100)

  xk = x0 ;
  [f,g] = feval(obj,xk)  ;
  k = 0 ;
  printf("%d %15.8e %15.8e %15.8e\n",k,xk,f,g) ;
  do
    xk = xk - f / g  ;
    [f,g] = feval(obj,xk)  ;
    k=k+1; 
    printf("%d %15.8e %15.8e %15.8e\n",k,xk,f,g) ;
  until (abs(f) <= eps || k >= maxiter)
  solution = xk ;
endfunction
