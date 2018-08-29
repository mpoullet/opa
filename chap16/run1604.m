%> \file
%> Runs example 16.4 illustrating the vertex enumeration algorithm
%> 
%> @note Calls \ref vertexEnumeration
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 11:09:14 2015
A = [1 1 1 0 ; 1 -1 0 1] ;
b = [1 ; 1] ;
c = [-1 ; -2 ; 0 ; 0 ] ;
[solution,optvalue] = vertexEnumeration(A,b,c) 

