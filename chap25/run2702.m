%> \file
%> Runs example 27.2 of \cite Bier15-book, solving the problem using an exact method
%>
%> @note Calls \ref knapsackExact
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:36:46 2015
%> @ingroup chap25

u = [80 31 48 17 27 84 34 39 46 58 23 67]' ;
w = [84 27 47 22 21 96 42 46 54 53 32 78]' ;
capacity = 300 ;
xopt = knapsackExact(u,w,capacity)
printf("Optimal utility: %d, Optimal weight: %d\n",xopt'*u, xopt'*w)