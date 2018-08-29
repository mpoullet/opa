%> \file
%> Calculate the length of a tour of the TSP
%> 
%> @note Called by \ref tspLocalSearch
%> @note Called by \ref tspVns
%> @note Called by \ref tspInsertionLocalSearch
%> @note Called by \ref tspSimulatedAnnealing
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 11:44:01 2015
%> @ingroup Algorithms
%> @ingroup chap27


%> Calculate the length of a tour for the TSP
%> @param tour list of cities
%> @param dist distance matrix
%> @return l tour length
function l = tspTourLength(tour,dist)
  [n, shouldBeOne]= size(tour) ;
  [dsn, dsm] = size(dist) ;
  if (dsn != n) 
    error("Incompatible dimensions") ;
  endif
  if (dsm != n) 
    error("Incompatible dimensions") ;
  endif
  l = 0 ;
  for i = 1:n-1
    l += dist(tour(i),tour(i+1)) ;
  endfor
  l += dist(tour(end),tour(1)) ;
endfunction