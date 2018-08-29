%> \file
%> Generate the 2-opt neightborhood for the TSP
%> 
%> @note Calls \ref twoOpt
%> @note Called by \ref tspLocalSearch
%> @note Called by \ref tspInsertionLocalSearch
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 15:29:19 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Generate the 2-opt neightborhood for the TSP
%> @param cities current tour
%> @return matrix containing all tours neighbor of the current one
function [neighborhood,city1, city2] = twoOptNeighborhood(cities)
  nCities = size(cities,1) ;
  if (nCities < 3) 
    neighborhood = [] ;
    city1 = [] ;
    city2 = [] ;
    return ;
  endif
  first = 1 ;
  for i=2:nCities-1
    for j=i+1:nCities
      next = twoOpt(cities,i,j) ; 
      if (first)
	neighborhood = next ;
	first = 0 ; 
        city1 = cities(i) ;
        city2 = cities(j) ;
      else
	neighborhood = [neighborhood  next] ;
        city1 = [city1 cities(i)] ;
        city2 = [city2 cities(j)] ;
      endif
    endfor
  endfor
endfunction

