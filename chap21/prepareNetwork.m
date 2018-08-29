%> \file
%> Prepares the network for efficient access to the data
%>
%> @note Tested with runPrepareNetwork.m
%> @note Called by \ref simpleCycle
%> @note Called by \ref shortestPath
%> @note Called by \ref dijkstra
%> @note Called by \ref incidenceMatrix
%> @note Called by \ref transhipmentTransform
%> @note Called by \ref run2120.m
%> @note Called by \ref runEnumeratePaths.m
%> 
%> @author Michel Bierlaire
%> @date Fri Mar 27 17:52:24 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Identifies the upstream and downstream nodes of each arc
%> @param adj the adjacency matrix of the network. It is a \f$m \times m\f$ matrix, such that the element at row i and column j corresponds to the id of the arc (i,j). The numbering should be from 1 to n. 
%> @return arcs A matrix containing the upstream and downstream nodes of each arc. Each row corresponds to an arc. Column 1 contains the upstream node and column 2 the downstream.

function arcs = prepareNetwork(adj)
  nnodes = rows(adj) ;
  if (columns(adj) != nnodes) 
    error("Adjacency matrix must be square") ;
  endif
  narcs = max(max(adj)) ;
  arcs = zeros(narcs,2) ;
  for i = 1:nnodes
    for j = 1:nnodes
      if (adj(i,j) != 0)
        arcs(adj(i,j),1) = i ;
        arcs(adj(i,j),2) = j ;
      endif
    endfor
  endfor
  
endfunction