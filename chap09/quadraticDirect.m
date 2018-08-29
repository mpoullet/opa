%> \file
%> Algorithm 9.1: Direct resolution of quadratic problems. Implementation of algorithm 9.1 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 11:03:31 2015
%> @ingroup Algorithms
%> @ingroup chap09

%> @note Tested with \ref run0908quad.m
%> @note Called by \ref newtonLocalQuadratic 

%> Applies the direct resolution method to solve  \f[\min_x \frac{1}{2} x^T Q x + b^T x\f] where \f$Q \in \mathbb{R}^n\times\mathbb{R}^n \f$ and \f$b \in \mathbb{R}^n\f$.
%> @param Q matrix of size \f$n \times n \f$.
%> @param b vector of size \f$n\f$.
%> @return solution: optimal solution
function solution = quadraticDirect(Q,b)
  L = chol(Q)' ;
  y = L \ (-b) ;
  solution = L' \ y ;
endfunction
