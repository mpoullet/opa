%> \file
%>  Algorithm 16.1: Vertex enumeration Implementation of algorithm 16.1 of \cite Bier15-book
%>
%> @note Tested with \ref run1604.m
%> @note Tested with \ref runBoundConstraints.m
%>
%> @author Michel Bierlaire
%> @date Sun Mar 22 10:53:32 2015
%> @ingroup Algorithms
%> @ingroup chap16

%> Applies the vertex enumeration algorithm  to solve  \f$\min_x c^Tx\f$ subject to \f$Ax=b\f$ and \f$x \geq 0\f$ , where \f$A \in \mathbb{R}^{m\times n}\f$, \f$b \in \mathbb{R}^m\f$, and \f$c \in \mathbb{R}^n\f$.
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @return [solution,optvalue]
%> @return solution:  an optimal solution
%> @return optvalue: the value of the objective function at the optimal solution
function [solution,optvalue] = vertexEnumeration(A,b,c)
  [m,n] = size(A) ;

  if (m != size(b))
    error("The number of rows in A and b do not match") ;
  endif
  if (n != size(c))
    error("The number of columns in A and do not match the size of c") ;
  endif
  optvalue = realmax ;

  enumerate = nchoosek(1:n,m) ;
  for i = enumerate'
    B = A(:,i) ;
    [x, R] = linsolve(B,b) ;
    if (R > 0)
      xfull = zeros(n,1) ;
      xfull(i) = x ;
      printf("%e\t",xfull) ;
      if (all(x >= 0))
	f = c(i)' * x ;
	printf("%e\n",f) ;
	if (f < optvalue)
	  solution = xfull ;
	  optvalue = f ;
	endif
      else
	printf("Infeasible\n") ;	
      endif
    endif
  endfor
endfunction
