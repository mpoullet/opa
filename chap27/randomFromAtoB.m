%> \file
%> Compute a random integer between A and B
%> 
%> @note Called by \ref twoOptRandomNeighbor
%>
%> @author Michel Bierlaire
%> @date Sun Apr 19 13:41:06 2015
%> @ingroup Algorithms
%> @ingroup chap27

%> Compute a random integer between A and B
%> @param A lower bound
%> @param B upper bound
%> @return r random number
function r=randomFromAtoB(A,B)
  r = 1+floor((A-1)+(B-(A-1))*rand()) ;
endfunction