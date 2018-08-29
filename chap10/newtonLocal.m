%> \file
%> Algorithm 10.1: Local Newton for optimization. Implementation of algorithm 10.1 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 15:41:01 2015
%> @ingroup Algorithms
%> @ingroup chap10

%> @note Tested with \ref run0508.m

%> Applies local Newton algorithm to solve \f$\nabla f(x)=0\f$ where \f$\nabla f:\mathbb{R}^n\to\mathbb{R}^n \f$ is the gradient of the objective function.
%> @param obj the name of the Octave function defining \f$\nabla f(x)\f$ and the hessian  \f$\nabla^2 f(x)\f$
%> @param x0 the starting point
%> @param eps  algorithm stops if \f$\|F(x)\| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return [solution,f] 
%> @return solution: root of the function
%> @return f: value of F at the solution
function [solution,g] = newtonLocal(obj,x0,eps,maxiter=100)
  xk = x0 ;
  n = size(x0,1) ;
  [g,H] = feval(obj,xk)  ;
  k = 0 ;
  printf("%d\t%e\t%e\t%e\n",k,xk(1),g(1),norm(g))
  for i=2:n
    printf("\t%e\t%e\t\n",xk(i),g(i))
  endfor
  do
    xk = xk - H \ g  ;
    [g,H] = feval(obj,xk)  ;
    k=k+1; 
    printf("%d\t%e\t%e\t%e\n",k,xk(1),g(1),norm(g))
    for i=2:n
      printf("\t%e\t%e\t\n",xk(i),g(i))
    endfor
  until (norm(g) <= eps || k >= maxiter)
  solution = xk ;
endfunction
