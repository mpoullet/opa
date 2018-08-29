%> \file
%> Run to illustrate Dijkstra's algortihm (Table 23.4)
%>
%> @note Calls \ref dijkstra
%> 
%> @ingroup chap23
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Thu Apr  9 17:26:53 2015

# Arc    1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24
cost = [ 8  1  1  1  1  8  1  1  8  8  8  1  8  1  1  8  8  8  1  1  1  8  8  8]' ;

adj = [        0  1  0  0  2  0  0  0  0  0  0  0  0  0  0  0 ;
               0  0  3  0  0  0  0  0  0  0  0  0  0  0  0  0 ;
               0  0  0  4  0  0  0  0  0  0  0  0  0  0  0  0 ; 
               0  0  0  0  0  0  0  5  0  0  0  0  0  0  0  0 ;
               0  0  0  0  0  6  0  0  7  0  0  0  0  0  0  0 ;
               0  8  0  0  0  0  9  0  0  0  0  0  0  0  0  0 ;
               0  0 10  0  0  0  0 11  0  0  0  0  0  0  0  0 ;
               0  0  0  0  0  0  0  0  0  0  0 12  0  0  0  0 ;
               0  0  0  0  0  0  0  0  0 13  0  0 14  0  0  0 ;
               0  0  0  0  0 15  0  0  0  0 16  0  0  0  0  0 ;
               0  0  0  0  0  0 17  0  0  0  0 18  0  0  0  0 ;
               0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 19 ;
               0  0  0  0  0  0  0  0  0  0  0  0  0 20  0  0 ;
               0  0  0  0  0  0  0  0  0 21  0  0  0  0 22  0 ;
               0  0  0  0  0  0  0  0  0  0 23  0  0  0  0 24 ;
               0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 ];

orig = 1 ;
printlevel = 1 ;
[lambda,pred] = dijkstra(adj,cost,orig,printlevel)  ;

printf("List of predecessors in the shortest path tree:\n") ;
nnodes = rows(adj) ;
for i=1:nnodes
  if (pred(i) != -1)
    printf("%d -> %d\n",pred(i),i)
  endif
endfor
