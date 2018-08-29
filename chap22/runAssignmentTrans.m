%> \file
%> Solve the transportation problem as a transhipment problem (Example 22.14 of \cite Bier15-book)
%>
%> @note Calls \ref transhipment
%> 
%> @ingroup Running
%> @ingroup chap22
%> @author Michel Bierlaire
%> @date Sat Apr 11 11:33:42 2015

adj = [ 0  0  0  0  1  2  0  0 ; 
        0  0  0  0  3  4  5  0 ;
        0  0  0  0  6  0  7  8 ;
        0  0  0  0  0  9 10  0 ;
        0  0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0  0 ];



cost = [ 8000 ; 11000 ; 9000 ; 13000 ; 12000 ; 9000 ; 11000 ; 0.01 ; 14000 ; 12000 ];
lb = [ 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0  ] ;
ub = [  1 ; 1 ; 1 ; 1 ; 1 ; 1 ; 1 ; 1 ; 1 ; 1  ] ;

supply = [ 1 ; 1 ; 1 ; 1 ; -1 ; -1 ; -1 ; -1  ] ;

useGlpk = 0 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

useGlpk = 1 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

