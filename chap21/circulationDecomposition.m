%> \file
%>  Algorithm 21.2: circulation decomposition. Implementation of algorithm 21.2 of \cite Bier15-book
%>
%> @note Tested with \ref runCirculationDecomposition.m
%> @note Calls \ref simpleCycle
%> @note Called by \ref flowDecomposition
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:16:14 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Decompose a circulation into simple cycle flows
%> @param adj the adjacency matrix of the network. It is a \f$m \times m\f$ matrix, such that the element at row i and column j corresponds to the id of the arc (i,j). The numbering should be from 1 to n. 
%> @param circ the circulation flow
%> @return simpleCycleFlows a matrix with as many columns as arcs, and as many rows as simple cycles in the decomposition
function simpleCycleFlows = circulationDecomposition(adj,circ)
  simpleCycleFlows = zeros(0,0) ;
  workingcirc = circ ;
  while any(workingcirc)
    theCycleFlow = simpleCycle(adj,workingcirc) ;
    simpleCycleFlows(end+1,:) = theCycleFlow' ;
    workingcirc -= theCycleFlow ;
  endwhile
endfunction
