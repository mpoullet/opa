%> \file
%>  Algorithm 16.4: Phase II simplex algorithm with tableau. Implementation of algorithm 16.4 of \cite Bier15-book
%> 
%> @note Tested with \ref run1613.m
%> @note Calls \ref pivoting 
%> @note Called by \ref twoPhasesSimplex
%>
%> @author Michel Bierlaire
%> @date Sun Mar 22 12:52:25 2015
%> @ingroup Algorithms
%> @ingroup chap16

%> Solve a linear optimization problem in standard form using the tableau simplex 
%> @param tab the first simplex tableau
%> @param rowindex: for each row, index of the corresponding basic variables
%> @return opttableau the optimal tableau
function [opttableau,bounded,rowindex] = simplexTableau(tab,rowindex)
  
  [mtab,ntab] = size(tab) ;
  m=mtab-1 ;
  n=ntab-1 ;
  while (true)
    colpivot = -1 ;
    i = 1 ;
    cfirstneg = eps ;
    while (i <= n ) 
      if tab(m+1,i) < -eps 
        cfirstneg =  tab(m+1,i) ;
        colpivot = i ;
        i = n + 1 ;
      endif 
      i = i + 1 ;
    end
    if (cfirstneg >= -eps) 
      opttableau = tab ;
      bounded = 1 ;
      return ;
    endif
    bestlambda = 1000000 ;
    rowpivot = -1 ;
    for i=1:m
      if (tab(i,colpivot) > 0)
        lambda = tab(i,n+1) / tab(i,colpivot) ;
        if (lambda < bestlambda)   
	  bestlambda = lambda ; 
	  rowpivot = i ;
	endif
      endif
    endfor
    if (rowpivot == -1)
      printf("**** Unbounded problem ****\n") ;
      bounded = 0 ;
      return
    endif
    tab = pivoting(tab,rowpivot,colpivot)  ;
    rowindex(rowpivot) = colpivot ;
  endwhile

endfunction