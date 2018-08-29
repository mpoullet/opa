%> \file
%> Run to illustrate algorithm 12.1
%> 
%> @ingroup Running
%> @ingroup chap12
%> @author Michel Bierlaire
%> @date Sat Mar 21 15:41:35 2015

%> @note Calls \ref intersectionTrustRegion

delta = 2.0 ;
x = [ 1 ; 0 ] ;
d = [0 ; 1];
lambda = intersectionTrustRegion(x,d,delta)

d = [1 ; 0];
lambda = intersectionTrustRegion(x,d,delta)

x = [0 ; 0] ;
d = [12.34 ; -23.4] ;
lambda = intersectionTrustRegion(x,d,delta)
2/norm(d)