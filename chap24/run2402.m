%> \file
%> Run the FordFulkerson algorithm on Example 24.2 of  \cite Bier15-book
%>
%> @note Calls \ref fordFulkerson
%> 
%> @ingroup chap24
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Thu Apr  9 18:45:30 2015


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

[flow, total] = fordFulkerson(adj,orig,dest,lb,ub);

