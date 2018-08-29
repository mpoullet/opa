%> \file
%>  Algorithm 16.3: Pivoting of the simplex tableau. Implementation of algorithm 16.3 of \cite Bier15-book
%>
%> @note Tested with \ref run1612pivoting.m
%> @note Called by \ref simplexTableau
%> @note Called by \ref twoPhasesSimplex
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 22 12:43:21 2015
%> @ingroup Algorithms
%> @ingroup chap16

%> Pivot the tableau
%> @param tab the simplex tableau
%> @param l the row of the pivot
%> @param j the column of the pivot
%> @return newtab the pivoted tableau
function newtab = pivoting(tab,l,j) 
  [mtab,ntab] = size(tab)  ;
  if (l > mtab)
    error("The row of the pivot exceeds the size of the tableau") ;
  endif
  if (j > ntab)
    error("The column of the pivot exceeds the size of the tableau") ;
  endif
  thepivot = tab(l,j) ;
  if (abs(thepivot) < realmin)
    error("The pivot is too close to zero") ;
  endif

  thepivotrow = tab(l,:) ;
  newtab = tab ;
  for i=1:mtab
    if (i == l) 
      newtab(l,:) = newtab(l,:) / thepivot ;
    else
      mult = -newtab(i,j) / thepivot ;
      newtab(i,:) = newtab(i,:) + mult * thepivotrow ;
    endif
  endfor
endfunction
