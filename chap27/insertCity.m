%> \file
%> Inserts a city in a tour for the TSP
%>
%> @note Called by \ref bestInsert
%> @note Called by \ref tspInsertion
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 12:51:09 2015
%> @ingroup Algorithms
%> @ingroup chap27
%>
%> Inserts city i after city a in the tour
%> @param next for each node, provides the next node in the tour
%> @param a index of the city after which i must be included
%> @param i index of the city to be inseerted
%> @return permutation of the cities
function next = insertCity(next,a,i)
  if (next(i) != 0)
    error("Node %d is already in the tour",i) ;
  endif
  next(i) = next(a) ;
  next(a) = i ;
endfunction



