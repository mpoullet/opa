%> \file
%> Algorithm 16.5: Two phases simplex algorithm with tableau to solve a linear optimization problem in standard from. Implementation of algorithm 16.5 of \cite Bier15-book
%>
%> @note Tested with \ref run1615.m
%> @note Tested with \ref run1616.m
%> @note Calls \ref simplexTableau
%> @note Calls \ref pivoting
%> @note Called by \ref transhipment
%> @note Called by \ref gomory
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 22 14:25:13 2015
%> @ingroup Algorithms
%> @ingroup chap16

%> Solve a linear optimization problem in standard form using the tableau simplex with two phases 
%> \f[ \min_{x \in \mathbb{R}^n} c^T x
%> \f]
%> subject to 
%> \f[ Ax = b \f]
%> and
%> \f[ x \geq 0 \f]
%> where \f$A\in\mathbb{R}^{m\times n}\f$, \f$ b\in\mathbb{R}^m\f$ and
%> \f$c\in \mathbb{R}^n\f$. 
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @return [x,copt,finaltableau] 
%> @return x the optimal solution
%> @return copt the value of the objective function
%> @return finaltableau the optimal tableau
function [x,copt,finaltableau,feasible,bounded] = twoPhasesSimplex(A,b,c) 

  [m,n] = size(A) ;

  if (m != size(b))
    error("The number of rows in A and b do not match") ;
  endif
  if (n != size(c))
    error("The number of columns in A and do not match the size of c") ;
  endif

% Make sure that b >= 0 
  for i=1:m
    if (b(i) < 0)
      b(i) *= -1 ;
      A(i,:) *= -1 ;
    endif
  endfor

% First tableau for Phase I
  tab = [ A eye(m,m) b ; zeros(1,n+m+1) ];
  for i = 1:n
    tab(m+1,i) = -sum(tab(1:m,i));
  end
  tab(m+1,n+m+1) = -sum(tab(1:m,n+m+1)) ;

% The basic variables are variables n+1 to n+m
 rowindex = [n+(1:m)] ;
% Solve the phase I problem
  [opttableau,bounded,rowindex] = simplexTableau(tab,rowindex) ;

  if (bounded == 0) 
    feasible = 1 ;
    x=[] ;  
    copt = 0 ;
    finaltableau = [] ;
    bounded = 0 ;
    return ;
  endif
  if (opttableau(m+1,n+m+1) > sqrt(eps))
    printf("Optimal cost is %e > %e. No feasible solution exists.\n",opttableau(m+1,n+m+1),sqrt(eps)) ;
    feasible = 0 ;
    x=[] ;  
    copt = 0 ;
    finaltableau = [] ;
    bounded = 1 ;
    return ;
  endif
  feasible = 1 ;
  ok = 0 ;
  
  rowstoberemoved = [] ;
% Remove the auxiliary variables from the basis
  for i=n+1:n+m
    basic = any(rowindex == i) ;
    if (basic != 0) 
      rowpivot = find(opttableau(:,i)') ;
				% Search the pivot
      colpivot = -1 ;
      k=1 ;
      while (colpivot < 0 && k <= n)
	if (abs(opttableau(rowpivot,k)) > eps) 
	  colpivot = k ;
	else
	  k = k + 1 ;
	endif
      end
      if (colpivot < 0) 
        rowstoberemoved(end + 1) = rowpivot ;
      else
	opttableau = pivoting(opttableau,rowpivot,colpivot)  ;
	rowindex(rowpivot) = colpivot ;
      endif
    endif
  end
% Remove the redundant constraints
  for r = size(rowstoberemoved,2):-1:1
    opttableau(rowstoberemoved(r),:) = [] ;
    rowindex(rowstoberemoved(r)) = [] ;
  endfor 
% Remove the columns 
  finaltableau = opttableau ;
  finaltableau(:,n+1:n+m) = [] ;

  [m,n] = size(finaltableau) ;
  m = m-1  ;
  n = n-1  ;

  cb = zeros(m,1) ;
  for i=1:m
    cb(i) = c(rowindex(i)) ;
  end

  for i=1:n
    if (any(rowindex==i))
      finaltableau(m+1,i) = 0 ;
    else
      finaltableau(m+1,i) = c(i) - cb' * finaltableau(1:m,i) ;
    endif
  end
   finaltableau(m+1,n+1) = - cb' * finaltableau(1:m,n+1) ;
  x = zeros(n,1) ;

% Phase II

  [finaltableau,bounded,rowindex] = simplexTableau(finaltableau,rowindex) ;
  x = zeros(n,1) ;
  for j=1:m
    x(rowindex(j)) = finaltableau(j,n+1) ;
  endfor
  copt = -finaltableau(m+1,n+1) ;
endfunction

