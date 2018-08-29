%> \file
%>  Transform tour stored as list of successor, into a sequence of cities
%> 
%> @note Called by \ref tspInsertionLocalSearch
%>
%> @author Michel Bierlaire
%> @date Wed Apr 15 12:12:51 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Print tour stored as list of successor
%> @param tour
function sequence = getTourSequence(tour)
  currentnode = 1 ;
  sequence = [currentnode] ;
  while (tour(currentnode) != 0)
    currentnode = tour(currentnode) ;
    sequence = [sequence ; currentnode] ;
  endwhile
endfunction
