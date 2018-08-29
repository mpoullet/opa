%> \file
%> Run the flow decomposition algorithm  on the examples represented in Figures 21.14 and 21.19 of \cite Bier15-book
%>
%> @note Calls \ref flowDecomposition
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


flow = [ 4 ;  # (1,2) 
         0 ;  # (2,3) 
       1.5 ;  # (2,4)
         1 ;  # (3,1)
         0 ;  # (3,5)
      -2.5 ;  # (4,2)     
         4 ;  # (4,5)
         1 ;  # (5,4)
         2 ;  # (6,7)
         0    # (7,6)
          ];

simplePathFlows = flowDecomposition(A,flow) 


printf("***********************\n") ;

A = [0 1 0 2  0 0 0  0  0 ;
     0 0 3 0  4 0 0  0  0 ;
     0 0 0 0  0 5 0  0  0 ;
     0 0 0 0  6 0 7  0  0 ;
     0 8 0 0  0 9 0  0  0 ; 
     0 0 0 0  0 0 0  0 10 ;
     0 0 0 0  0 0 0 11  0 ; 
     0 0 0 0 12 0 0  0 13 ;
     0 0 0 0  0 0 0  0  0 ] ;

flow = [ 3 ; #1(1,2) 
         7 ; #2(1,4)
         8 ; #3(2,3)
         2 ; #4(2,5)
         8 ; #5(3,6)
         3 ; #6(4,5)
         4 ; #7(4,7)
         7 ; #8(5,2)
         2 ; #9(5,6)
        10 ; #10(6,9)
         4 ; #11(7,8)
         4 ; #12(8,5)
         0 #13(8,9) 
       ];
          
simplePathFlows = flowDecomposition(A,flow) 

