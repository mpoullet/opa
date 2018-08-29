%> \file
%> Run the unsaturated path algorithm on Example 24.2 of  \cite Bier15-book.  Iteration 1 of Table 24.2.
%> 
%> Calls \ref unsaturatedPath
%>
%> @ingroup Running
%> @ingroup chap24
%> @author Michel Bierlaire
%> @date Thu Apr  9 18:25:09 2015


adj = [ 0  1  2  3  0  0  0  ;
        0  0  4  0  0  5  0  ;
        0  0  0  6  0  7  0  ;
        0  0  8  0  9  0  0  ;
        0  0  0  0  0 10 11  ;
        0  0  0  0  0  0 12  ;
        0  0  0  0  0  0  0  ] ;

orig = 1 ;
dest = 7 ; 
lb = [ 0 0 0 0 0 0 0 0 0 0 0 0 ]' ;
ub = [ 5 3 5 3 3 3 5 1 5 1 2 9 ]' ;
flow = [0 0 0 0 0 0 0 0 0 0 0 0]' ;


[path, cut, pathFound] = unsaturatedPath(adj,orig,dest,lb,ub,flow,1);



