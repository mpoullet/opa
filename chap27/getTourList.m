%> \file
%>  Transforms a tour stored as a sequence of cities into a list of successors
%> 
%> @note Called by \ref tspVns
%> @note Called by \ref tspInsertionLocalSearch
%>
%> @author Michel Bierlaire
%> @date Wed Apr 15 11:42:31 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> 
%> Transforms a tour stored as a sequence of cities into a list of successors
%> @param sequence tour as a sequence of cities
%> @param n number of cities
%> @return succ tour stored as a list of successors
function succ = getTourList(sequence,n)  
  succ = zeros(n,1) ;
  p = size(sequence,1) ; 
  for i=1:p-1
    succ(sequence(i)) = sequence(i+1) ; 
  endfor
endfunction
