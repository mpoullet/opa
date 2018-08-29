%> \file
%> Calculate the divergence of the example in Figure 21.10 of \cite Bier15-book
%>
%> @note Calls \ref nodeDivergence
%> 
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:31:46 2015
%> @ingroup chap21

A = [0 1  0  0  0  0  0 0 ; 
     0 0  2  3  0  0  0 0 ;
     4 0  0  0  5  0  0 0 ;
     0 6  0  0  7  0  0 0 ;
     0 0  0  8  0  0  0 0 ;
     0 0  0  0  0  0  9 0 ; 
     0 0  0  0  0 10  0 0 ; 
     0 0  0  0  0  0  0 0 ] ;


flow = [ 2.3 ;  # (1,2) 
         -1 ;  # (2,3) 
       -2.1 ;  # (2,4)
         4 ;  # (3,1)
         0 ;  # (3,5)
         3 ;  # (4,2)     
         -5 ;  # (4,5)
         -5 ;  # (5,4)
         3 ;  # (6,7)
         2.5    # (7,6)
          ];

d = nodeDivergence(A,flow) 


