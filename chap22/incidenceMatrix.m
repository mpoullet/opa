%> \file
%> Provide the incidence matrix of the network for the teanshipment problem
%> 
%> @note Calls \ref prepareNetwork
%> @note Called by \ref transhipment
%>
%> @author Michel Bierlaire
%> @date Wed Jul 23 09:43:15 2014
%> @ingroup Algorithms
%> @ingroup chap22

%> Provide the incidence matrix a a network
%> @param adj the adjacency matrix of the network
%> @return A 
function A = incidenceMatrix(adj)
  
  addpath("../chap21") ;  
  nnodes = rows(adj) ;
  narcs = max(max(adj)) ;
  if (columns(adj) != nnodes) 
    error("Adjacency matrix must be square") ;
  endif
  
  arcs = prepareNetwork(adj) ;
  
  A = zeros(nnodes,narcs) ;
  for m=1:narcs
    i = arcs(m,1) ;
    j = arcs(m,2) ;
    A(i,m) = 1 ;
   A(j,m) = -1 ;
 endfor
endfunction