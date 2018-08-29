%> \file
%> Run to illustrate the path enumeration algorithm (Table 23.1)
%>
%> @note Calls \ref enumeratePaths
%> @note Calls \ref prepareNetwork
%> 
%> @ingroup chap23
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Thu Apr  9 17:20:47 2015

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


addpath("../chap21") ;  
arcs = prepareNetwork(adj) ;
nnodes = rows(adj) ;
forbiddennodes = zeros(nnodes,1) ;

forwardOnly = 1 ;
o = 1 ;
d = 16 ;
[listOfPathsNodes, listOfPathsLinks] = enumeratePaths(adj,arcs,o,d,forbiddennodes,forwardOnly);
for i = 1:length(listOfPathsLinks)
  printf("%d:\t",i) ;
  cc = 0 ;
  for j = 1:length(listOfPathsLinks{i})
    a = listOfPathsLinks{i}(j) ;
    cc = cc + cost(a)  ;
  endfor
  for a = listOfPathsNodes{i}
     printf("%d\t",a) ;
  endfor
  printf("\n") ;
endfor
