%> \file
%> Run the function that prepares the network
%> 
%> @note Calls \ref prepareNetwork
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Sun Mar 29 17:12:25 2015
%> @ingroup chap21

A = [0 1  0  0  0  0  0 0 ; 
        0 0  2  3  0  0  0 0 ;
        4 0  0  0  5  0  0 0 ;
        0 6  0  0  7  0  0 0 ;
        0 0  0  8  0  0  0 0 ;
        0 0  0  0  0  0  9 0 ; 
        0 0  0  0  0 10  0 0 ; 
        0 0  0  0  0  0  0 0 ] ;

arcs = prepareNetwork(A) 

