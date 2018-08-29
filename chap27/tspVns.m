%> \file
%> Implements the VNS to solve the TSP, as described in Section 27.3.2 of \cite Bier15-book
%>
%> @note Tested with \ref run2703vns.m 
%> @note Calls \ref tspTourLength
%> @note Calls \ref getTourList
%> @note Calls \ref tspInsertionLocalSearch
%>
%> @author Michel Bierlaire
%> @date Wed Apr 15 11:38:36 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Runs the VNS heuristic on the TSP
%> @param tour Initial tour
%> @param dist matrix
%> @return best Best tour found by the heuristic
%> @return bestLength length of the best tour found.
%> @return The file \c ksIters.dat is also created, containing the details of the iterations. 
function [best,bestLength] = tspVns(tour,dist)
  n = rows(dist) ;
  if (columns(dist) != n) 
    error("Distance matrix must be square") ;
  endif
  [fff,msg] = fopen("tspIters.dat","w") ;
  fprintf(fff,"Iter\tNeighborhood\tCandidate\tBest\n") ;
  printf("Iter\tNeighborhood\tCandidate\tBest\n") ;
  best = tour ;
  bestLength = tspTourLength(best,dist) ;
  s = 2 ;
  iter = 1 ;
  while (s <= n)
    subtourlist = getTourList(best(1:s),n) ;
    [candidate,length] = tspInsertionLocalSearch(dist,subtourlist) ;
    fprintf(fff,"%d\t%d\t%f\t%f\n",iter,s,length,bestLength) ;
    printf("%d\t%d\t%f\t%f\n",iter,s,length,bestLength) ;
    iter += 1 ;
    if (length < bestLength)
      best = candidate ;
      bestLength = length ;
      s = 2 ;
    else
      s += 1 ;
    endif
  endwhile
  fclose(fff) ;
endfunction