%> \file
%> Algorithm 11:7: Modified Cholesky factorization.  Implementation of algorithm 11.7 of \cite Bier17-book. This implementation is far from efficient, and is designed for illustrative purposes only. Implementations suggested by \cite fang2008modified and \cite SchnEsko99, for instance, should be preferred. 
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Sat Mar 21 12:28:56 2015
%> @ingroup Algorithms
%> @ingroup chap11

%> \note Tested with \ref runModifiedCholesky.m
%> \note Called by \ref newtonLineSearch


%> Given a symmetric matrix \f$ A\in \mathbb{R}\times \mathbb{R}\f$, provide a lower triangular matrix \f$L\f$ and a real \f$\tau\f$ such that \f[ A + \tau I = L L^T.\f]
%> @param A symmetric matrix \f$n \times n \f$.
%> @return [L, tau] 
%> @return L: lower triangular matrix \f$L\f$
%> @return tau: real \f$\tau\f$ such that \f$ A + \tau I = L L^T.\f$
function [L, tau] = modifiedCholesky(A) 
  tau = 0.0 ;
  [m,n] = size(A) ; 
  if (m != n)
    error("Matrix must be square. Size %dx%d",m,n) ;
  endif
  nf = norm(A,"fro") ;  
  if (nf <= 1.0e-6)
    nf = 1.0e-6 ;
  endif

  mindiag = min(diag(A)) ;

  if (mindiag > 0)
    tau = 0 ;
    R = A ;
  else
    tau = nf ;
    R = A + tau * eye(n,n) ;
  endif

  mineig = min(eig(R)) ;

  while (mineig <= 0)
    tau = max([2 * tau, 0.5 * nf])  ;
    R = A + tau * eye(n,n)  ;
    mineig = min(eig(R)) ;
  endwhile
  L = chol(R,"lower")  ;
  return

endfunction
