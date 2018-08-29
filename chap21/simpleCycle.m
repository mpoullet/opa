%> \file
%>  Algorithm 21.1: Generation of a simple cycle flow from a circulation. Implementation of algorithm 21.1 of \cite Bier15-book
%>
%> @note Tested with \ref runSimpleCycle.m
%> @note Calls \ref prepareNetwork
%> @note Called by \ref circulationDecomposition
%> 
%> @author Michel Bierlaire
%> @date Fri Mar 27 17:09:10 2015
%> @ingroup Algorithms
%> @ingroup chap21

%> Extract a simple cycle flow from a circulation
%> @param adj the adjacency matrix of the network. It is a \f$m \times m\f$ matrix, such that the element at row i and column j corresponds to the id of the arc (i,j). The numbering should be from 1 to n. 
%> @param circ the circulation flow. It is a vector of \f$\mathbb{R}^n\f$.
%> @param printlevel If different from 0, the cycle is printed. (Default: 0)
%> @return cycleflow a simple cycle flow. It is a vector of \f$\mathbb{R}^n\f$.
function cycleflow = simpleCycle(adj,circ,printlevel=0)
 cycleflow = zeros(size(circ)) ;
 nnodes = rows(adj) ;
 if (columns(adj) != nnodes) 
   error("Adjacency matrix must be square") ;
 endif
 arcs = prepareNetwork(adj) ;
 nonzeros = find(circ) ;
 if(length(nonzeros)==0)
   printf("The circ flow vector is zero")
   return 
 endif
 # Find an arc carrying positive flow
 theArc = nonzeros(1) ;
 theLoopArcs = [theArc] ;

 layerNumber = 1 ;
 if (circ(theArc) > 0) 
   layer{layerNumber} = arcs(theArc,2) ;
   otherNode = arcs(theArc,1) ;
   theLoopOrientation = [1] ;
 else
   layer{layerNumber} = arcs(theArc,1) ;
   otherNode = arcs(theArc,2) ;
   theLoopOrientation = [-1] ;
 endif
 inserted = 1 ;
 treatedNodes = zeros(nnodes,1) ;
 treatedNodes(layer{layerNumber}) = 1 ;
 while (inserted != 0)
  inserted = 0  ;
  currentlayer = zeros(0) ;
  for i = layer{layerNumber} 
    for arcij = adj(i,:)
      if (arcij != 0)
        if (circ(arcij) > 0) && (treatedNodes(arcs(arcij,2)) == 0) 
%	  printf("Forward arc: %d -> %d\n",arcs(arcij,1),arcs(arcij,2)); 
          currentlayer(end + 1) = arcs(arcij,2) ;
          inserted = 1 ;
          treatedNodes(arcs(arcij,2)) = 1 ;
        endif          
      endif
    endfor
    for arcij = adj(:,i)'
      if (arcij != 0)
        if (circ(arcij) < 0) && (treatedNodes(arcs(arcij,1)) == 0) 
%          printf("Backward arc: %d -> %d\n",arcs(arcij,1),arcs(arcij,2)); 
          currentlayer(end + 1) = arcs(arcij,1) ;
          inserted = 1 ;
          treatedNodes(arcs(arcij,1)) = 1 ;
        endif          
      endif
    endfor
  endfor
  layerNumber += 1 ;
  layer(layerNumber) = currentlayer; 
 endwhile

% Here, layer contains the nodes organized into layers
% Search for the node to close the loop

 for key = 1:length(layer)
   theLayer = layer{key} ;
%   printf("Look for %d in \n",otherNode)
   idx = find(theLayer == otherNode) ;
   if (length(idx) > 0) 
     theLayerOfOtherNode = key ;
     theIndexOfOtherNode = idx ;
   endif
 endfor
 
 theLoop = [otherNode] ; 
 flowMin = realmax ;
 for k = theLayerOfOtherNode-1:-1:1
% Find an arc carrying positive flow. It must exist by construction
   for ell = layer{k}
     theForwardArc = adj(ell,theLoop(end)) ;
     if (theForwardArc != 0)
       forwardflow = circ(theForwardArc) ;
       if (forwardflow > 0)
         theLoop(end+1) = ell ;
         theLoopArcs(end+1) = theForwardArc ;
         theLoopOrientation(end+1) = 1 ;
         if (forwardflow < flowMin) 
           flowMin = forwardflow ;
         endif
         break ; 
       endif
     endif
     theBackwardArc = adj(theLoop(end),ell) ;
     if (theBackwardArc != 0)
       backwardflow = circ(theBackwardArc) ;
       if (backwardflow < 0) 
         theLoop(end+1) = ell ;
         theLoopArcs(end+1) = theBackwardArc ;
         theLoopOrientation(end+1) = -1 ;
         if (-backwardflow < flowMin)
           flowMin = -backwardflow;
         endif 
         break ; 
       endif
     endif
   endfor
 endfor
 for i = length(theLoopArcs):-1:1
   if (printlevel != 0)
     printf("%d",theLoop(i))
     if (theLoopOrientation(i) == 1) 
       printf("->") ;
     else
       printf("<-") ;
     endif
   endif
   cycleflow(theLoopArcs(i)) = flowMin * theLoopOrientation(i) ;
 endfor 
 if (printlevel != 0)
   printf("%d [%f]\n",theLoop(end),flowMin)
 endif
endfunction

