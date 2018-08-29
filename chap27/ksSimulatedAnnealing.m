%> \file
%>  Algorithm 27.7: simulated annealing for the knapsack problem. Implementation of algorithm 27.7 of \cite Bier15-book
%>
%> @note Tested with \ref run2702simAnn.m
%> @note Calls \ref ksRandomNeighbor
%> 
%> @author Michel Bierlaire
%> @date Sun Apr 19 13:20:29 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> Simulated annealing for the knapsack problem
%> @param u utility of each item 
%> @param w weight of each item 
%> @param c capacity of the knapsack
%> @param x0 current solution
%> @return bestSack best solution found
%> @return bestSackUtility  utility of the best solution
%> @return bestSackWeight weight of the best solution
%> @return The file \c ksSimAnnIters.dat is also created, containing the details of the iterations. 
function [bestSack, bestSackUtility, bestSackWeight] = ksSimulatedAnnealing(u,w,c,x0)
  [fff,msg] = fopen("ksSimAnnIters.dat","w") 
  fprintf(fff,"Iter\tTemp\tCurrent_u\tCurrent_w\tBest_u\tBest_w\n") ;
  printf("Iter\tTemp\tCurrent_u\tCurrent_w\tBest_u\tBest_w\n") ;
  lastTemp = 0.000001 ; 
  maxiter = 5 ;
  nbrcooling = 1000 ;
  current = x0 ;
  bestSack = x0 ;
  if (w'*x0 > c)
    error("Infeasible starting point") ;
  endif
  currentLength =  u'*current;
  currentWeight = w'*current ;
  bestSackUtility = currentLength ;
  bestSackWeight = currentWeight ;
  typicalIncrease = 20.0 ; 
  firstTau = 0.999 ;
  lastTau = 0.00001 ;
  n = 0 ;
  for tt =1:nbrcooling
    a = (lastTau - firstTau) / nbrcooling ;
    temp = -typicalIncrease/log(firstTau + a * tt) ;
    k = 1 ;
    iter = 0 ;
    while (iter <= maxiter)
      n += 1 ;
      fprintf(fff,"%d\t%f\t%f\t%f\t%f\t%f\n",n,temp,currentLength,currentWeight,bestSackUtility,bestSackWeight)
      printf("%d\t%f\t%f\t%f\t%f\t%f\n",n,temp,currentLength,currentWeight,bestSackUtility,bestSackWeight)
      iter += 1 ;
      chosenNeighborhood = ksRandomNeighbor(current,1) ;
      l = chosenNeighborhood'*u ;
      weight = chosenNeighborhood'* w ;
      delta = l - currentLength ;
      if (weight > c)
      elseif (delta > 0)
	current = chosenNeighborhood ;
	currentLength = l ;
	currentWeight = current'*w ;
	if (l > bestSackUtility)
	  bestSack = current ;
	  bestSackUtility = currentLength ;
	  bestSackWeight = currentWeight ;
	endif
      else
	r = rand() ;
	if r < exp(delta/temp)
	  current = chosenNeighborhood ;
	  currentLength = l ;
	  currentWeight = current'*w ;
	else
	endif
      endif
    endwhile
  endfor
  n += 1 ;
  fprintf(fff,"%d\t%f\t%f\t%f\t%f\t%f\n",n,temp,currentLength,currentWeight,bestSackUtility,bestSackWeight)
  printf("%d\t%f\t%f\t%f\t%f\t%f\n",n,temp,currentLength,currentWeight,bestSackUtility,bestSackWeight)
  fclose(fff) ;
endfunction
