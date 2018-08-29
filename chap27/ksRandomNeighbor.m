%> \file
%> Algorithm 27.5: neighborhood for the knapsack problem. Implementation of algorithm 27.5 of \cite Bier15-book
%>
%> @note Called by \ref ksLocalSearchRandom
%> @note Called by \ref ksSimulatedAnnealing
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 13:06:01 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> Generate a random neighbor in a neighborhood of a given size for the knpasack problem
%> @param x0 current solution
%> @param s size of the neighborhood
%> @return x generated neighbor
function x = ksRandomNeighbor(x0,s)
  order = randperm(size(x0)) ;
  if (s > size(x0))
    error("Size %d is larger than the size of the problem %d",size,size(x0))
  endif
  x = x0 ;
  for i=1:s
    x(order(i)) = 1-x0(order(i)) ;
  endfor
endfunction