%> \file
%> Algorithm 27.2: insertion heuristic for TSP. Implementation of algorithm 27.2 of \cite Bier15-book
%>
%> @note Tested with \ref run2703insertion.m
%> @note Called by tspInsertionLocalSearch
%> @note Calls \ref subtourLength
%> @note Calls \ref bestInsert
%> @note Calls \ref insertCity
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 12:43:17 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Compute an halmitonian path using the insertion heuristic
%> @param dist distance matrix
%> @param initialTour description of the initial tour stored as a successors list
%> @return greedyTour permutation of the cities
function greedyTour = tspInsertion(dist,initialTour = zeros(rows(dist),1))
  n = rows(dist) ;
  if (columns(dist) != n) 
    error("Distance matrix must be square") ;
  endif
  # First city is the depot
  next = initialTour ;
  inserted = zeros(n,1) ;
  inserted(1) = 1 ;
  for i=1:n
    if (next(i) != 0)
      inserted(next(i)) = 1 ;
    endif
  endfor
  [l,m] = subtourLength(next,dist);
%  printf("%f & ",l) ;
%  printTour(next) ;
  while (m <= n)
    thelength = realmax ;
    thenode = 0 ;
    for (i = 2:n)
      if (inserted(i) == 0)
%	printf("Try to insert city %d\n",i) ;
	[bestnode,bestlength] = bestInsert(next,dist,i) ;
	if (bestlength < thelength)
	  thelength = bestlength ;
	  thenode = i ;
	  thecity = bestnode ;
	endif
      endif
    endfor
%    printf("Decide to insert city %d after city %d\n",thenode,thecity) ;    
    next = insertCity(next,thecity,thenode) ;
    inserted(thenode) = 1 ;
    [l,m] = subtourLength(next,dist) ;
%    printf("%.1f & ",l) ;
%    printTour(next) ;
%    printf("Length: %f\n",l) ;

  endwhile
  [l,m] = subtourLength(next,dist) ;
%  printf("%f & ",l) ;
%  printTour(next) 
  greedyTour = zeros(n,1) ;
  pos = 1 ;
  currentnode = 1 ;
  greedyTour(pos) = currentnode ;
  while (next(currentnode) != 0)
    pos += 1 ;
    currentnode = next(currentnode) ;
    greedyTour(pos) = currentnode ;
  endwhile
endfunction

