%> \file
%> Perform a 2-opt operation of a list of cities
%> 
%> @note Called by \ref twoOptNeighborhood
%> @note Called by \ref twoOptRandomNeighbor
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 15:30:42 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Perform a 2-opt operation of a list of cities
%> @param cities
%> @param c1 index of the first city 
%> @param c2 index of the second city
%> @return new list of cities
function newlist = twoOpt(cities,c1,c2)
  if (c1 > c2)
    t = c1 ;
    c1 = c2 ;
    c2 = t ;
  endif
  if (c1 == 1)
    error('Cannot perform a 2-opt with the depot')
  else
    c1 = c1 - 1 ;
  endif
  newlist = cities(1:c1);
  newlist = [newlist ; flipud(cities(c1+1:c2))];
  newlist = [newlist ; cities(c2+1:end)];
endfunction

