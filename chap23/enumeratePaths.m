%> \file
%> Enumerate all simple paths between two nodes
%>
%> @note Tested with runEnumeratePaths.m 
%> 
%> @author Michel Bierlaire
%> @date Sat Apr 11 11:08:57 2015
%> @ingroup Algorithms
%> @ingroup chap23

%> Enumerate all simple paths between two nodes
%> @param adj adjacency matrix of the network. Each nonzero entry corresponds to an arc. The value of the entry is the ID of the arc.
%> @param arcs matrix containing the upstream and downstream nodes of each arc. Each row corresponds to an arc. Column 1 contains the upstream node and column 2 the downstream. Can be generated from the adjacency matrix by \ref prepareNetwork 
%> @param orig the origin node 
%> @param dest the destination node 
%> @param forbiddennodes nodes that cannot be included anymore, in order to generate simple paths.
%> @param forward if 0, arcs can be used in any direction. If not 0, arcs can only be used in the forward direction
%> @return paths [cell array containing paths as list of nodes, cell array containing paths as list of links]  
function [listOfPathsNodes, listOfPathsLinks] = enumeratePaths(adj,arcs,orig,dest,forbiddennodes,forward)
  forbiddennodes(orig) = 1 ;
  listOfPathsNodes = {} ;
  listOfPathsLinks = {} ;
  if (orig == dest)
    return ;
  endif
  # Forward arcs
  for arcij = adj(orig,:)
    if (arcij != 0)
      nodej = arcs(arcij,2) ;
      if (forbiddennodes(nodej) == 0)
        myforbiddennodes = forbiddennodes ;
	[myListOfPathsNodes, myListOfPathsLinks] = enumeratePaths(adj,arcs,nodej,dest,myforbiddennodes,forward) ;
	if isempty(myListOfPathsNodes)
	  theLink = [orig ; nodej] ;
          listOfPathsNodes(end+1) = theLink ;
          listOfPathsLinks(end+1) = arcij ;
	else
          for p = 1:length(myListOfPathsNodes)
            thePathNode = myListOfPathsNodes{p} ;
				% To avoid cycles, if the orig has
				% already been included in the
				% downstream path, it is not included
				% again
            idx = find(thePathNode == orig) ;
            if (length(idx) == 0)
              if (thePathNode(end) == dest)
		listOfPathsNodes(end+1) = [ orig ; thePathNode ] ;
		listOfPathsLinks(end+1) = [ arcij ; myListOfPathsLinks{p} ;
 ] ;
              endif
            endif
          endfor
	endif
      endif
    endif
  endfor
  # Backward arcs
  if (forward == 0)
    for arcji = adj(:,orig)'
      if (arcji != 0)
	nodei = arcs(arcji,1) ;
	if (forbiddennodes(nodei) == 0)
          myforbiddennodes = forbiddennodes ;
	  [myListOfPathsNodes, myListOfPathsLinks] = enumeratePaths(adj,arcs,nodei,dest,myforbiddennodes,forward) ;
	  if isempty(myListOfPathsNodes)
	    theLink = [orig ; nodei] ;
            listOfPathsNodes(end+1) = theLink ;
            listOfPathsLinks(end+1) = arcji ;
	  else
            for p = 1:length(myListOfPathsNodes)
              thePathNode = myListOfPathsNodes{p} ;
				% To avoid cycles, if the orig has
				% already been included in the
				% downstream path, it is not included
				% again
              idx = find(thePathNode == orig) ;
              if (length(idx) == 0)
		if (thePathNode(end) == dest)
		  listOfPathsNodes(end+1) = [ orig ; thePathNode ] ;
		  listOfPathsLinks(end+1) = [ arcji ; myListOfPathsLinks{p} ;
					     ] ;
		endif
              endif
            endfor
	  endif
        endif
      endif
    endfor
  endif
endfunction