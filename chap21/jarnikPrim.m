%> \file
%> Algorithm 21.4: Jarnik-Prim. Implementation of algorithm 21.4 of \cite Bier15-book
%>
%> @note Tested with \ref run2120.m
%>
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:54:11 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Identifies the minimum spanning tree of an undirected network.
%> @param adj the symmetric adjacency matrix of the undirected network. It is a \f$m \times m\f$ matrix, such that the element at row i and column j, and the element at row j and column i, contain to the id of the edge (i,j). The numbering should be from 1 to n. 
%> @param cost a vector of size n containing the cost of each edge
function spanningTree = jarnikPrim(adj,cost)
  nnodes = rows(adj) ;
  if (columns(adj) != nnodes) 
    error("Adjacency matrix must be square") ;
  endif
  spanningTree = [] ;
  leftBank = [1] ;
  rightBank = setdiff(1:nnodes,leftBank) ;
  while (size(leftBank) != nnodes)
    c = realmax ;
    theEdge = -999 ;
    theNode = -999 ;
    for i = leftBank
      for j = rightBank
	if (adj(i,j) != 0)
	  if (cost(adj(i,j)) < c)
	    c = cost(adj(i,j)) ;
	    theEdge = adj(i,j) ;
	    theNode = j ;
	  endif
       endif
     endfor
   endfor
   if (theEdge == -999)
     printf("Disconnected network. No edge between\n") ;
     printf("%d\t",leftBank) ;
     printf("\n") ;
     printf("%d\t",rightBank) ;
     printf("\n") ;
     error("No spanning tree exists") ;
   else
     spanningTree = [ spanningTree ; theEdge] ;
     leftBank = [ leftBank  theNode] ;
     rightBank = setdiff(1:nnodes,leftBank) ;
   endif
 endwhile
 endfunction 
