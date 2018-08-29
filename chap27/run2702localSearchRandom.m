%> \file
%> Runs example 27.2 of \cite Bier15-book, solving the problem using the local search method with random neighbors
%>
%> @note Calls \ref ksLocalSearchRandom
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Tue Apr 14 13:15:12 2015
%> @ingroup chap27

u = [80 31 48 17 27 84 34 39 46 58 23 67]' ;
w = [84 27 47 22 21 96 42 46 54 53 32 78]' ;
capacity = 300 ;
x0 = zeros(12,1) ;
xopt = ksLocalSearchRandom(u,w,capacity,x0,1)
printf("Final utility: %d, final weight: %d\n",xopt'*u, xopt'*w)