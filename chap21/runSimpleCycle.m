%> \file
%> Run the algorithm extracting cycle flow vector on the example represented in Figure 21.15 of \cite Bier15-book
%> 
%> @note Calls \ref simpleCycle
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Fri Mar 27 17:57:43 2015
%> @ingroup chap21

modA = [0 1  0  0  0  0  0 0 0; 
        0 0  2  3  0  0  0 0 0;
        4 0  0  0  5  0  0 0 0;
        0 6  0  0  7  0  0 0 0;
        0 0  0  8  0  0  0 0 0;
        0 0  0  0  0  0  9 0 0; 
        0 0  0  0  0 10  0 0 0; 
        0 0  0  0  0  0  0 0 0;
       11 0 12 13 14 15 16 0 0] ;


circ = [ 4 ;  # (1,2) 
         0 ;  # (2,3) 
       1.5 ;  # (2,4)
         1 ;  # (3,1)
         0 ;  # (3,5)
      -2.5 ;  # (4,2)     
         4 ;  # (4,5)
         1 ;  # (5,4)
         2 ;  # (6,7)
         0 ;  # (7,6)
         3 ;  # (A,1)
         1 ;  # (A,3)
        -1 ;  # (A,4)
        -3 ;  # (A,5)
         2 ;  # (A,6)
        -2 ;  # (A,7) 
          ];

cycleflow = simpleCycle(modA,circ,1) ;

circ -= cycleflow ;

cycleflow = simpleCycle(modA,circ,1) ;

circ -= cycleflow ;

cycleflow = simpleCycle(modA,circ,1);

circ -= cycleflow ;

cycleflow = simpleCycle(modA,circ,1);

circ -= cycleflow;

cycleflow = simpleCycle(modA,circ,1);

circ -= cycleflow;

cycleflow = simpleCycle(modA,circ,1) ;

circ -= cycleflow ;

