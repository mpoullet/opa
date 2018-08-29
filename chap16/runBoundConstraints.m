%> \file
%> Example where some combinations of basic variables are associated with a singular matrix B
%> 
%> @note Calls \ref vertexEnumeration
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 11:29:43 2015
A = [1 0 1 0 ; 0 1 0 1] ;
b = [10 ; 5] ;
c = [-1 ; -1 ; 0 ; 0 ] ;
[solution,optvalue] = vertexEnumeration(A,b,c) 

