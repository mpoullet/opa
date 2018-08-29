%> \file
%> Runs example 16.13  of \cite Bier15-book
%> 
%> @note Calls \ref simplexTableau
%>
%> @ingroup Running
%> @ingroup chap16
%> @author Michel Bierlaire
%> @date Sun Mar 22 12:53:36 2015

T = [ 1 2 2 1 0 0 20 ;
      2 1 2 0 1 0 20 ;
      2 2 1 0 0 1 20 ;
     -10 -12 -12 0 0 0 0] ;

opttableau = simplexTableau(T)


