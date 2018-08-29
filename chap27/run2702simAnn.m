%> \file
%> Runs example 27.2 of \cite Bier15-book, solving the problem using the simulated annealing method (see Section 27.4.1 of \cite Bier15-book). 
%>
%> @note Calls \ref ksSimulatedAnnealing
%>
%> @ingroup Running
%> @author Michel Bierlaire
%> @date Sun Apr 19 13:24:43 2015
%> @ingroup chap27

u = [80 31 48 17 27 84 34 39 46 58 23 67]' ;
w = [84 27 47 22 21 96 42 46 54 53 32 78]' ;
capacity = 300 ;
x0 = zeros(12,1) ;
[bestSack, bestSackUtility, bestSackWeight] = ksSimulatedAnnealing(u,w,capacity,x0) ;
printf("Solution found: ") ;
printf("%d ",bestSack) ;
printf("\n");
printf("Final utility: %d, final weight: %d\n",bestSackUtility, bestSackWeight)