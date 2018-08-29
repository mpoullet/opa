%> \file
%> Solve the max flow problem as a transhipment problem (Figure 22.6 of \cite Bier15-book)
%>
%> Calls \ref transhipment
%> 
%> @ingroup Running
%> @ingroup chap22
%> @author Michel Bierlaire
%> @date Sat Apr 11 11:19:43 2015

adj = [ 0 1 2 0 0 ;
        0 0 3 4 0 ;
        0 0 0 0 5 ;
        0 0 0 0 6 ;
        7 0 0 0 0 ] ;

% Arc 1 : 1->2
% Arc 2 : 1->3
% Arc 3 : 2->3
% Arc 4 : 2->4
% Arc 5 : 3->5
% Arc 6 : 4->5
% Arc 7 : 5->1
cost = [0 ; 0 ; 0 ; 0 ; 0 ; 0 ; -1];
lb = [ 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0] ;
ub = [  2 ; 3 ; 3 ; 4 ; 2 ; 1 ; 99 ] ;

supply = [ 0 ; 0 ; 0 ; 0 ; 0 ] ;

useGlpk = 0 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

useGlpk = 1 ;
[x, copt] = transhipment(adj,cost,lb,ub,supply,useGlpk)

