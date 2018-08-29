%> \file
%> Run to illustrate the use of longest path for PERT (Section 23.4 of \cite Bier15-book. Result in Figure 23.5)
%> 
%> @ingroup chap23
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Thu Apr  9 17:57:33 2015

 
cost = [ 0  1  1  1  1  3  3  3  2  5  5  5  6  1  2  2  3  2  1]' ;

adj = [  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 ;
         0  0  2  3  0  0  0  0  0  0  0  0  0  0  0 ;
         0  0  0  4  0  5  0  0  0  0  0  0  0  0  0 ;
         0  0  0  0  6  0  7  0  0  0  0  0  0  0  0 ;
         0  0  0  0  0  0  0  8  0  0  0  0  0  0  0 ;
         0  0  0  0  0  0  0  9  0  0  0  0  0  0  0 ;
         0  0  0  0 10  0  0  0 11  0  0  0  0  0  0 ;
         0  0  0  0  0  0  0  0  0 12  0  0  0  0  0 ;
         0  0  0  0  0  0  0  0  0  0 13  0  0  0  0 ;
         0  0  0  0  0  0  0  0  0  0  0 14  0  0  0 ;
         0  0  0  0  0  0  0  0  0  0  0 15  0 16  0 ;
         0  0  0  0  0  0  0  0  0  0  0  0 17  0  0 ;
         0  0  0  0  0  0  0  0  0  0  0  0  0  0 18 ;
         0  0  0  0  0  0  0  0  0  0  0  0  0  0 19 ;
         0  0  0  0  0  0  0  0  0  0  0  0  0  0  0 ] ;


coord = [ 1   3 ;
          3   3 ; 
          5   5 ;
          5   3 ;
          7   3 ;
          7   5 ;
          5   1 ;
          9   5 ;
          7   1 ;
         11   5 ;
          9   1 ;
         11   3 ;
         13   3 ;
         13   1 ;
         15   3 ] ; 

 
orig = 1 ;
[lambda,pred] = dijkstra(adj,-cost,orig) ;

nnodes = rows(adj) ;
for i=1:nnodes
  if (pred(i) != -1)
    % The numbering in the figure starts at 0 and not 1.
    printf("Task %d before task %d\n",pred(i)-1,i-1)
  endif
endfor
