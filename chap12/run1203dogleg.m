%> \file
%> Runs example 12.3 for the dogleg method
%> 
%> @ingroup Running
%> @ingroup chap12
%> @author Michel Bierlaire
%> @date Sat Mar 21 15:46:29 2015

%> @note Calls \ref dogleg

xcurrent = [ 9 ;  1] ;
[f,g,H] = ex1101(xcurrent) ;

delta = 1 ;
[dstar,type] = dogleg(g,H,delta) ;
xcurrent + dstar
delta = 4  ;
[dstar,type] = dogleg(g,H,delta) ;
xcurrent + dstar
delta = 8  ;
[dstar,type] = dogleg(g,H,delta) ;
xcurrent + dstar


