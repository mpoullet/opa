%> \file
%> Runs example 16.12 illustrating the pivoting
%> 
%> @note Calls \ref pivoting
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 12:45:21 2015
tab = [0 1.5 1 1 -0.5 0 10 ; 1 0.5 1 0 0.5 0 10 ; 0 1 -1 0 -1 1 0 ; 0 -7 -2 0 5 0 100 ] ;
newtab = pivoting(tab,3,2) 


