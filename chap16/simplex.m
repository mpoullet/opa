%> \file
%>  Algorithm 16.2: Simplex methos.  Implementation of algorithm 16.2 of \cite Bier15-book
%>
%> @note Tested with \ref run1604simplex.m
%> @note Tested with \ref run1607simplex.m
%>
%> @author Michel Bierlaire
%> @date Sun Mar 22 11:50:34 2015
%> @ingroup Algorithms
%> @ingroup chap16

%> Applies the simplex method  to solve  \f$\min_x c^Tx\f$ subject to \f$Ax=b\f$ and \f$x \geq 0\f$ , where \f$A \in \mathbb{R}^{m\times n}\f$, \f$b \in \mathbb{R}^m\f$, and \f$c \in \mathbb{R}^n\f$.
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @param basis indices of the basic variables of a feasible basic solution
%> @return [solution,optvalue]
%> @return solution:  an optimal solution
%> @return optvalue: the value of the objective function at the optimal solution
function [optimalbasis,unbounded] = simplex(A,b,c,basis)
  [m,n] = size(A) ;
  if (m != size(b))
    error("The number of rows in A and b do not match") ;
  endif
  if (n != size(c))
    error("The number of columns in A and do not match the size of c") ;
  endif
  stop = 0 ;
  while (stop == 0)
    printf("%d\t",basis) ;
    B = A(:,basis) ;
    d = B \ A  ;
    reducedCost = c' - c(basis)' * d;
    printf("|") ;
    nonbasic = setdiff(1:n,basis) ;
    printf("%g\t",reducedCost(nonbasic)) ;
    candidates = find(reducedCost < 0) ;
    if (isempty(candidates))
      optimalbasis = basis ;
      unbounded = 0 ;
      stop = 1 ;
    else
      p = candidates(1) ;
      xb = B \ b ;
      xfull = zeros(size(c)) ;
      xfull(basis) = xb ;
      printf("|") ;
      printf("%g\t",xfull) ;
      printf("|") ;
      printf("%f\t",-d(:,p)) ;
      step = realmax ;
      q = -1 ;
      for k=1:m
	if d(k,p) > 0 && step > 0
	  aStep = xb(k) / d(k,p) ;
	  if (aStep < step)
	    step = aStep ;
	    q = k ;
	  endif
	endif
      endfor
      if (q == -1)
	optimalbasis = zeros(m,1) ;
	unbounded = 1 ;
	stop = 1 ;
      else
	printf("|") ;
	printf("%f\t",step) ;
	printf("|%d\t%d",p,basis(q));
	printf("|%f\n",c(basis)'*xb) ;
	basis(q) = p ;
      endif
    endif
    printf("\n") ;
  endwhile
endfunction
  