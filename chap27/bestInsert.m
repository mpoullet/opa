%> \file
%> Identifies the best insertion in a tour for the TSP
%>
%> @note Called by \ref tspInsertion
%> @note Calls \ref insertCity
%> @note Calls \ref subtourLength
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 12:50:27 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Inserts city i in the best place
%> @param next for each node, provides the next node in the tour
%> @param dist distance matrix
%> @param i city to be inserted
%> @return new tour
function [bestnode,bestlength] = bestInsert(next,dist,i)
  currentnode = 1 ;
  bestnode = 0 ;
  bestlength = realmax ;
  while (currentnode != 0)
    candidate = next ;
    candidate = insertCity(candidate,currentnode,i) ;
    [l,m] = subtourLength(candidate,dist) ;
    if (l < bestlength) 
      bestnode = currentnode ;
      bestlength = l ;
    endif
    currentnode = next(currentnode) ;
  endwhile
endfunction


