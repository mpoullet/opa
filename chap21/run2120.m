%> \file
%> Runs example 21.20 with the Jarnik-Prim algorithm for minimum spanning tree (Algorithm 21.4 of  \cite Bier15-book)
%>
%> @note Calls \ref jarnikPrim
%> @note Calls \ref prepareNetwork
%> 
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:47:37 2015
%> @ingroup chap21

A = [
  0  1  2  0  0  0  0 ;
  1  0  3  4  5  0  0 ;
  2  3  0  6  7  0  0 ;
  0  4  6  0  8  9 10 ;
  0  5  7  8  0 11 12 ;
  0  0  0  9 11  0 13 ;
  0  0  0 10 12 13  0 ] ;

cost = [ 6 ;     # (1,2)
         7 ;     # (1,3)
         2 ;     # (2,3)
         7 ;     # (2,4)
         4 ;     # (2,5)
         5 ;     # (3,4)
         3 ;     # (3,5)
         1 ;     # (4,5)
         5 ;     # (4,6)
         5 ;     # (4,7)
         5 ;     # (5,6)
         5 ;     # (5,7)
         7      # (6,7)
        ];

spanningTree = jarnikPrim(A,cost) ;

arcs = prepareNetwork(A) ;

for j = spanningTree'
  printf("(%d,%d)\n",arcs(j,1),arcs(j,2))
endfor

