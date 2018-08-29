%> \file
%> Runs example 26.4 of  \cite Bier15-book
%>
%> 
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Sat Apr 11 12:58:38 2015
%> @ingroup chap26

c = [ 1 ; -2 ] ;
A = [ -4 6 ; 1 1 ] ;
lb = [0 ; 0] ;
b = [5 ; 5] ;
ub = [5 ; 5] ;
ctype = "UU" ;
vtype = "II" ;
[xopt, fmin, errnum, extra] = glpk (c, A, b, lb, ub, ctype, vtype)