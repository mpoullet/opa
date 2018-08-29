%> \file
%> Calculate the length of a subtour of the TSP
%> 
%> @note Called by \ref tspInsertion
%> @note Called by \ref bestInsert
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 11:39:05 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Calculate the length of a tour
%> @param next for each node, provides the next node in the tour
%> @param dist the distance matrix
%> @return l the length of the tour
%> @return m the number of nodes in the tour
function [l,m] = subtourLength(next,dist)
  currentnode = 1 ;
  l = 0 ;
  m = 1 ;
  while (currentnode != 0)
    na = currentnode ;
    if (next(currentnode) == 0)
      nb = 1 ;
    else
      nb = next(currentnode) ;
    endif
    l += dist(na,nb) ;
    m += 1 ;
    currentnode = next(currentnode) ;
  endwhile
endfunction