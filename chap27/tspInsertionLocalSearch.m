%> \file
%> Local search method for the TSP based on the insertion heuristic, as described in Section 27.3.2 of \cite Bier15-book
%> 
%> @note Called by \ref tspVns
%> @note Calls \ref tspInsertion
%> @note Calls \ref tspTourLength
%> @note Calls \ref twoOptNeighborhood
%> @note Calls \ref getTourList
%> @note Calls \ref getTourSequence
%>
%> @author Michel Bierlaire
%> @date Wed Apr 15 11:59:07 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> @param dist the distance matrix
%> @param subtour initial subtour stored as a succesor list
%> @return betterTour local optimum
function [bestTourSeq,bestLength] = tspInsertionLocalSearch(dist,subtourList)
  n = rows(dist) ;
  if (columns(dist) != n) 
    error("Distance matrix must be square") ;
  endif
  betterTourList = subtourList ;
  currentList = subtourList ;
  bestTourSeq = tspInsertion(dist,subtourList) ;
  bestLength = tspTourLength(bestTourSeq,dist) ;
  iter = 0 ;
  contin = 1 ;
  while (contin)
    contin = 0 ;
    iter += 1 ;
    [neighborhood, city1, city2] = twoOptNeighborhood(getTourSequence(currentList)) ;
    for i = 1:columns(neighborhood)
      tourSeq = tspInsertion(dist,getTourList(neighborhood(:,i),n)) ;
      l = tspTourLength(tourSeq,dist) ;
%      printf("Best length: %f, Candidate length: %f\n",bestLength,l); 
      if (l < bestLength)
	betterTourList = getTourList(neighborhood(:,i),n) ;
	bestLength = l ;
	bestTourSeq = tourSeq ;
	bestindex = i ;
	contin =  1 ;
      endif 
    endfor
    if (contin)
      currentList = betterTourList ;
    endif
  endwhile
endfunction