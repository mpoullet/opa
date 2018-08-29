%> \file
%> Solve the transportation problem as a transhipment problem (Example 22.12 od \cite Bier15-book
%>
%> Calls \ref transhipment
%> 
%> @ingroup Running
%> @ingroup chap22
%> @author Michel Bierlaire
%> @date Sat Apr 11 11:28:52 2015

adj = [ 0  0  0  1  2  3  4 ; 
        0  0  0  5  6  7  8 ;
        0  0  0  9 10 11 12 ;
        0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0 ;
        0  0  0  0  0  0  0 ];

cost = [ 18 ; 6 ; 10 ; 9 ; 9 ; 16 ; 13 ; 7 ; 14 ; 9 ; 16 ; 5 ];
lb = [ 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ] ;
ub = [  16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ; 16513 ] ;

supply = [ 3110 ; 3198 ; 10205 ; -8961 ; -3777 ; -2517 ; -1258 ] ;

useGlpk = 0 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

useGlpk = 1 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

