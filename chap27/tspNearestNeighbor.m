%> \file
%> Algorithm 27.1: nearest neighbor heuristic for TSP. Implementation of algorithm 27.1 of \cite Bier15-book
%>
%> @note Tested with \ref run2703nearestNeighbor.m
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 11:36:13 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Compute an halmitonian path using the nearest neighbor heuristic
%> @param dist distance matrix
%> @return permutation of the cities
function pi = tspNearestNeighbor(dist)
  n = rows(dist) ;
  if (columns(dist) != n) 
    error("Distance matrix must be square") ;
  endif
  # First city is the depot
  currentCity = 1;
  pi = [ currentCity ] ;
  while (size(pi) != n)
    distances = dist(:,currentCity)  ;
    [s,i] = sort(distances) ;
    for j=1:size(s)
      if (s(j) != 0.0 && !any(pi==i(j)))
	  currentCity = i(j) ;
	  pi(end+1,1) = currentCity ;
	  break ;
      endif
    endfor
  endwhile
  

