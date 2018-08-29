%> \file
%> Compute the divergence of a flow vector (Definition 21.13 of \cite Bier15-book)
%>
%> @note Tested with \ref runDivergence.m
%> @note Called by \ref flowDecomposition
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:30:04 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Compute the divergence of a flow vector
%> @param adj adjacency matrix of the network
%> @param flow flow vector (number of entries should be equal to the number of non zero entries of the adjacency matrix)
%> @return divergence of eachnode
function diverg = nodeDivergence(adj,flow)
  nnodes = rows(adj) ;
  if (columns(adj) != nnodes) 
    error("Adjacency matrix must be square") ;
  endif

  diverg = zeros(nnodes, 1) ;
  for i = 1:nnodes
    for j = 1:nnodes
      if (adj(i,j) != 0)
        diverg(i) += flow(adj(i,j)) ;
        diverg(j) -= flow(adj(i,j)) ;
      endif
    endfor
  endfor
endfunction
