%> \file
%> Algorithm 27.3: local search for the TSP. Implementation of algorithm 27.3 of \cite Bier15-book
%>
%> @note Tested with \ref run2703localSearch.m
%> @note Calls \ref twoOptNeighborhood
%> @note Calls \ref tspTourLength
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 15:27:43 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> Local search based on the 2-OPT neighborhood.
%> @param tour initial solution
%> @param dist the distance matrix
%> @return betterTour local optimum
%> Perform a local search for the TSP with a 2-OPT neighborhood
function betterTour = tspLocalSearch(tour,dist)
  betterTour = tour ;
  current = tour ;
  bestLength = tspTourLength(tour,dist) ;
  printf("%d\t",current) ;
  printf("|%.2f\n",bestLength) ;
  iter = 0 ;
  contin = 1 ;
  while (contin)
    contin = 0 ;
    iter += 1 ;
    [neighborhood, city1, city2] = twoOptNeighborhood(current) ;
    for i =1:columns(neighborhood)
      l = tspTourLength(neighborhood(:,i),dist) ;
      if (l < bestLength)
	betterTour = neighborhood(:,i) ;
	bestLength = l ;
	bestindex = i ;
	contin =  1 ;
      endif 
    endfor
    if (contin)
      printf("%d\t",betterTour) ;
      printf("|%.2f\t%d\t%d\n",bestLength,city1(bestindex),city2(bestindex)) ;
      current = betterTour ;
    endif
  endwhile
endfunction