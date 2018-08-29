%> \file
%> Generate one random 2-opt neighbor for the TSP
%> 
%> @note Called by \ref tspSimulatedAnnealing
%> @note Calls \ref twoOpt
%> @note Calls \ref randomFromAtoB
%>
%> @author Michel Bierlaire
%> @date Sun Apr 19 13:37:59 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Generate one random 2-opt neighbor for the TSP
%> @param cities current tour
%> @return neighbor the selected neighbor
function neighbor = twoOptRandomNeighbor(cities)
  first = 1 ;
  i = randomFromAtoB(2,size(cities)-1) ;
  j = randomFromAtoB(i+1,size(cities)) ;
  neighbor = twoOpt(cities,i,j) ; 
endfunction

