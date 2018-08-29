%> \file
%> Algorithm 21.3: flow decomposition. Implementation of algorithm 21.3 of \cite Bier15-book
%>
%> @note Tested with \ref runFlowDecomposition.m
%> @note Calls \ref nodeDivergence
%> @note Calls \ref circulationDecomposition
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:26:50 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Decompose a flow vector into simple path flows
%> @param adj the adjacency matrix of the network. It is a \f$m \times m\f$ matrix, such that the element at row i and column j corresponds to the id of the arc (i,j). The numbering should be from 1 to n. 
%> @param flow the flow vector
%> @return simplePathFlows a matrix with as many columns as arcs, and as many rows as simple paths in the decomposition
function simplePathFlows = flowDecomposition(adj,flow)
  nnodes = rows(adj) ;
   narcs = max(max(adj)) ;

  y = nodeDivergence(adj,flow) ;

  modAdj = [ adj  zeros(nnodes,1) ; zeros(1,nnodes+1)] ;
  arcNumber = narcs ;
  modFlow = flow ;
  for i=1:length(y)
    if (y(i) != 0)
      arcNumber += 1 ;
      modAdj(nnodes + 1,i) = arcNumber ;
      modFlow(end+1) = y(i) ;
    endif
  endfor
  theSimpleCycleFlow = circulationDecomposition(modAdj,modFlow);
  simplePathFlows = theSimpleCycleFlow(:,1:narcs);
endfunction
