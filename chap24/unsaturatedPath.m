%> \file
%> Algorithm 24.1: unsaturated path.  Implementation of algorithm 24.1 of \cite Bier15-book
%>
%> @note Tested with \ref runUnsaturatedPath.m
%> @note Called by \ref fordFulkerson
%> @note Calls \ref prepareNetwork
%> 
%> @author Michel Bierlaire
%> @date Thu Apr  9 18:08:09 2015
%> @ingroup Algorithms
%> @ingroup chap24



%> Find an unsaturated path from o to d
%>
%> @note Calls \ref buildPathBackward
%> @note Calls \ref printLayers
%> @param adj adjacency matrix of the network. Each nonzero entry corresponds to an arc. The value of the entry is the ID of the arc.
%> @param orig the origin node 
%> @param dest the destination node 
%> @param lb the lower bound on the flow 
%> @param ub the upper bound on the flow 
%> @param flow the current flow vector
%> @param printlevel If different from 0, the layers are printed. (Default: 0)
%> @return path.arcs: sequence of arcs on the path
%> @return path.dir: +1 if forward, -1 if backward
%> @return cut: array of nodes defining the cut
function [path, cut, pathFound] = unsaturatedPath(adj,orig,dest,lb,ub,flow,printlevel=0)
  addpath("../chap21") ;  
  pathFound =  0 ;
  cut = zeros(0) ;
  arcs = prepareNetwork(adj) ;
  nnodes = rows(adj) ;
  treatedNodes = zeros(nnodes,1) ;

  currentlayer.arcs = -1 ;
  currentlayer.nodes = orig ;
  currentlayer.dir  = 0 ;
  
  layer{1} = currentlayer ;
  treatedNodes(orig) = 1 ;
  layerNumber = 1 ;
  inserted = 1 ;
  while (inserted != 0)
    inserted = 0 ;
#    printf("Layer %d\n=========\n",layerNumber);
    currentlayer.arcs = zeros(0) ;
    currentlayer.nodes = zeros(0) ;
    currentlayer.dir = zeros(0) ;
    for i = layer{layerNumber}.nodes
#      printf("Treat node %d\n",i) ;
      for arcij = adj(:,i)'
	if (arcij != 0)
	  if (flow(arcij) > lb(arcij) && (treatedNodes(arcs(arcij,1)) == 0)) 
#            printf("Backward arc: %d -> %d\n",arcs(arcij,1),arcs(arcij,2)); 
            currentlayer.arcs(end + 1) = arcij ;
            currentlayer.nodes(end + 1) = arcs(arcij,1) ;
            currentlayer.dir(end + 1) = -1 ;
            if (currentlayer.nodes(end) == dest) 
	      layer(end+1) = currentlayer ;
	      path = buildPathBackward(layer,dest,arcs) ;
	      pathFound = 1 ;
	      if (printlevel != 0)
		printLayers(layer,arcs) ;
	      endif
	      return ;
	    endif
            inserted = 1 ;
            treatedNodes(arcs(arcij,1)) = 1 ;
	  endif
	endif
      endfor
      for arcij = adj(i,:)
	if (arcij != 0)
	  if (flow(arcij) < ub(arcij) && (treatedNodes(arcs(arcij,2)) == 0))
#	    printf("Forward arc: %d -> %d\n",arcs(arcij,1),arcs(arcij,2)); 
            currentlayer.arcs(end + 1) = arcij ;
            currentlayer.nodes(end + 1) = arcs(arcij,2) ;
            currentlayer.dir(end + 1) = 1 ;
            if (currentlayer.nodes(end) == dest) 
	      layer(end+1) = currentlayer ;
	      path =  buildPathBackward(layer,dest,arcs) ;
	      pathFound = 1 ;
	      if (printlevel != 0)
		printLayers(layer,arcs) ;
	      endif
	      return ;
	    endif
            inserted = 1 ;
            treatedNodes(arcs(arcij,2)) = 1 ;
   	  endif
        endif
      endfor
    endfor
    layerNumber += 1 ;
    layer(layerNumber) = currentlayer ;
  endwhile
%  Saturated cut identified
  path.arcs = zeros(0) ;
  path.dir = zeros(0) ;
  if (printlevel != 0)
    printLayers(layer,arcs) ;
  endif
  cut = find(treatedNodes) ;
endfunction

%> Build the path by traversing the layers backward.
%>
%> @note Called by \ref unsaturatedPath
%> @param layer list of layers. Each layer contains an array of nodes, arcs and directions. 
%> @param dest destination node to reach
%> @param arcs A matrix containing the upstream and downstream nodes of each arc. Each row corresponds to an arc. Column 1 contains the upstream node and column 2 the downstream. Output of \ref prepareNetwork.
%> @return path.arcs: sequence of arcs on the path
%> @return path.dir: +1 if forward, -1 if backward
function path = buildPathBackward(layer,dest,arcs)
  path.arcs = zeros(0) ;
  path.dir = zeros(0) ;
  currentNode = dest ; 
  for i = length(layer):-1:2
    theLayer = layer{i} ;
    idx = find(theLayer.nodes == currentNode) ;
    path.dir = [theLayer.dir(idx) path.dir]   ;
    path.arcs = [theLayer.arcs(idx) path.arcs] ;
    if (theLayer.dir(idx)  == 1)
      currentNode = arcs(theLayer.arcs(idx),1) ;
    else
      currentNode = arcs(theLayer.arcs(idx),2) ;
    endif
  endfor
endfunction

%> Print the layers
%>
%> @note Called by \ref unsaturatedPath
%> @param layer list of layers. Each layer contains an array of nodes, arcs and directions. 
%> @param arcs A matrix containing the upstream and downstream nodes of each arc. Each row corresponds to an arc. Column 1 contains the upstream node and column 2 the downstream. Output of \ref prepareNetwork.
function printLayers(layer,arcs)
  for i = 1:length(layer)
    printf("S_%d = {",i) ;
    theLayer = layer{i} ;
    for j = 1:length(theLayer.dir) 
      if (theLayer.arcs(j) == -1)
	printf("%d ",theLayer.nodes(j)) ;
	else
	  if (theLayer.dir(j) == 1)
	    printf("%d[%d ->], ",arcs(theLayer.arcs(j),2),arcs(theLayer.arcs(j),1)) ;
	  else 
	    printf("%d[<- %d], ",arcs(theLayer.arcs(j),1),arcs(theLayer.arcs(j),2)) ;
	  endif
	endif ;
    endfor
    printf("}\n") ;
  endfor
endfunction