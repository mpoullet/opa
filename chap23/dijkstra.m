%> \file
%> Algorithm 23.2: Dijkstra.  Implementation of algorithm 23.2 of \cite Bier15-book
%>
%> @note Tested with \ref runDijkstra.m
%> @note Calls \ref prepareNetwork
%> 
%> @author Michel Bierlaire
%> @date Wed Thu Apr  9 17:22:28 2015
%> @ingroup Algorithms
%> @ingroup chap23

%> Calculate the shortest paths from one origin to all nodes using Dijkstra's algorithm
%> @param adj adjacency matrix of the network. Each nonzero entry corresponds to an arc. The value of the entry is the ID of the arc.
%> @param cost the cost of each arc 
%> @param orig the origin node 
%> @param printlevel If different from 0, detailes about the iterations are printed. (Default: 0)
%> @return [lambda,pred] lambda is the vector of labels, pred is the vector of the predecessors in the shortest path 
function [lambda,pred] = dijkstra(adj,cost,orig,printlevel=0)
  addpath("../chap21") ;  
  arcs = prepareNetwork(adj) ;
  nnodes = rows(adj) ;
  lambda = realmax(nnodes,1) ;
  lambda(orig) = 0 ;
% Length of the smallest simple path
  lengthmin = (nnodes-1) * min(cost) ;
  pred(1:nnodes,1) = -1 ;
  listOfNodes = [orig] ;
  iter = 0 ;
  while (!isempty(listOfNodes))
    [val, index] = min(lambda(listOfNodes)) ;
    node = listOfNodes(index) ;
    if (printlevel != 0)
      printf("%d\t",iter) ;
      printf("{") ;
      printf("%d ",listOfNodes) ;
      printf("}\t%d\t",node) ;
      for i=1:nnodes
	if (lambda(i) == realmax)
	  printf("Inf\t") ;
	else 
	  printf("%d\t",lambda(i)) ;
	endif
      endfor
      printf("\n") ;
    endif
    iter += 1;
    listOfNodes(index) = [] ;
    for arcij = adj(node,:)
      if (arcij != 0)
	nodej = arcs(arcij,2) ;
	if (lambda(nodej) > lambda(node) + cost(arcij))
	  lambda(nodej) = lambda(node) + cost(arcij) ;
          if (lambda(nodej) < 0 && lambda(nodej) < lengthmin)
	    error("A cycle of negative cost has been detected")
	  endif
          pred(nodej) = node ;
          idx = find(listOfNodes == nodej) ;
          if (length(idx) == 0)
            listOfNodes(end+1) = nodej ;
	  endif
	endif
      endif
    endfor
  endwhile
  if (printlevel != 0)
    printf("%d\t",iter) ;
    printf(" {}\t\t") ;
    for i=1:nnodes
      if (lambda(i) == realmax)
	printf("Inf\t") ;
      else 
	printf("%d\t",lambda(i)) ;
      endif
    endfor
    printf("\n") ;
  endif
endfunction

