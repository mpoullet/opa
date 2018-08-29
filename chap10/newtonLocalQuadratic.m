%> \file
%> Algorithm 10.2: Local Newton for optimization using the quadratic model. Implementation of algorithm 10.2 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:14:06 2015
%> @ingroup Algorithms
%> @ingroup chap10

%> @note Tested with \ref run0508quadratic.m
%> @note Calls \ref quadraticDirect
%> @note Calls \ref conjugateGradient

%> Applies local Newton algorithm to solve \f$\nabla f(x)=0\f$ where \f$\nabla f:\mathbb{R}^n\to\mathbb{R}^n \f$ is the gradient of the objective function.
%> @param obj the name of the Octave function defining \f$\nabla f(x)\f$ and the hessian  \f$\nabla^2 f(x)\f$
%> @param x0 the starting point
%> @param eps  algorithm stops if \f$\|F(x)\| \leq \varepsilon \f$. 
%> @param cg if 0, the quadratic model is solved using the direct method. If not zero, using the conjugate gradient algorithm.
%> @param maxiter maximum number of iterations (Default: 100)
%> @return [solution,f] 
%> @return solution: root of the function
%> @return f: value of F at the solution
function [solution,g] = newtonLocalQuadratic(obj,x0,eps,cg,maxiter=100)
  addpath("../chap09") ;
  xk = x0 ;
  [g,H] = feval(obj,xk)  ;
  k = 0 ;
  do
    if (cg == 0)
      d = quadraticDirect(H,g) ;
    else 
      % Note that the CG algorithm is started from 0. 
      [directions, d] = conjugateGradient(H,g,zeros(size(g))) ;
    endif
    xk = xk + d  ;
    [g,H] = feval(obj,xk)  ;
    k=k+1; 
  until (norm(g) <= eps || k >= maxiter)
  solution = xk ;
endfunction
