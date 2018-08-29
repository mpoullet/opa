%> \file
%> Runs example 25.12 of \cite Bier15-book
%>
%> @note Calls \ref tspExact
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:46:37 2015
%> @ingroup chap25
% 1=L  2=B  3=G  4=Z
dist = [    0 104  64 228 ;
          104   0 158 125 ;
           64 158   0 279 ;
          228 125 279   0 ] ;
tour = tspExact(dist)
