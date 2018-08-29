%> \file
%> Algorithm 26.3: Gomory cuts for linear optimization.   Implementation of algorithm 26.3 of \cite Bier15-book 
%>
%> @note Tested with \ref run2604gomory.m
%> @note Tested with \ref run2513gomory.m
%> @note Calls \ref twoPhasesSimplex
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:07:55 2015
%> @ingroup Algorithms
%> @ingroup chap26

%> Solve an integer optimization problem by generating valid inequalities using a Gomory cut: 
%> \f[ \min_{x \in \mathbb{R}^n} c^T x
%> \f]
%> subject to 
%> \f[ Ax = b \f]
%> and
%> \f[ x \in \mathbb{N}^n \f]
%> where \f$A\in\mathbb{R}^{m\times n}\f$, \f$ b\in\mathbb{R}^m\f$ and
%> \f$c\in \mathbb{R}^n\f$. 
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @return xopt: an optimal solution
%> @return iter: number of iterations

function [xopt, iter] = gomory(A,b,c)
  addpath("../chap16") ;
  [m,n] = size(A) ;
   if (m != size(b))
    error("The number of rows in A and b do not match") ;
  endif
  if (n != size(c))
    error("The number of columns in A and do not match the size of c") ;
  endif

  iter = 0;
  while (1)
    iter = iter + 1 ;
    % m and n are the dimension of the original problem
    % mm and nn are the dimension of the current problem including the cuts
    [mm,nn] = size(A) ; 
    [x,copt,finaltableau,feasible,bounded] = twoPhasesSimplex(A,b,c) ;
    if (bounded == 0) 
      error("Unbounded problem detected\n") ;
    endif
    % If some constraints have been detected to be redundant, the size may have changed
    [tm,tn] = size(finaltableau) ;
    tm -= 1 ;
    tn -= 1 ;
    lastcol = finaltableau(1:tm,tn+1) ;
    fractional = find(min(ceil(lastcol)-lastcol,lastcol-floor(lastcol))  > sqrt(eps)) ;
    if (isempty(fractional))
      xopt = x(1:n) ;
      return ;
    endif
    i = fractional(1) ;
    gamma = floor(finaltableau(i,1:tn)) ;
    bplus = floor(finaltableau(i,tn+1)) ;

    A = [ A zeros(mm,1) ; gamma  1] ;
    b = [ b ; bplus] ;
    c = [ c ; 0] ;
endwhile
  
  
endfunction