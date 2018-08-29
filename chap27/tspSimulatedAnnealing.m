%> \file
%>  Algorithm 27.7: simulated annealing for the TSP. Implementation of algorithm 27.7 of \cite Bier15-book
%>
%> @note Tested with \ref run2703simAnn.m
%> @note Calls \ref tspTourLength
%> @note Calls \ref twoOptRandomNeighbor
%> 
%> @author Michel Bierlaire
%> @date Sun Apr 19 13:30:57 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> Simulated annealing for the TSP 
%> @param tour initial solution
%> @param dist the distance matrix
%> @return bestTour best tour found
%> @return bestTourLength length of the best tour found
%> @return The file \c tspSimAnnIters.dat is also created, containing the details of the iterations. 
function [bestTour, bestTourLength] = tspSimulatedAnnealing(tour,dist)
  [fff,msg] = fopen("tspSimAnnIters.dat","w") ;
  fprintf(fff,"Iter\tTemp\tCurrent\tBest\n") ;
  printf("Iter\tTemp\tCurrent\tBest\n") ;
  lastTemp = 0.000001 ; 
  maxiter = 50 ;
  nbrcooling = 100 ;
  current = tour ;
  bestTour = tour ;
  currentLength =  tspTourLength(current,dist) ;
  bestTourLength = currentLength ;
  typicalIncrease = 5.0 ; 
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
      fprintf(fff,"%d\t%f\t%f\t%f\n",n,temp,currentLength,bestTourLength)
      printf("%d\t%f\t%f\t%f\n",n,temp,currentLength,bestTourLength)
      iter += 1 ;
      if (mod(iter,10) == 0 ) 
      endif
      chosenNeighborhood = twoOptRandomNeighbor(current) ;
      l = tspTourLength(chosenNeighborhood,dist) ;
      delta = l - currentLength ;
      if (delta < 0)
	current = chosenNeighborhood ;
	currentLength = l ;
	if (l < bestTourLength)
	  bestTour = current ;
	  bestTourLength = currentLength ;
	endif
      else
	r = rand() ;
	if r < exp(-delta/temp)
	  current = chosenNeighborhood ;
	  currentLength = l ;
	else
	endif
      endif
    endwhile
  endfor
  n += 1 ;
  fprintf(fff,"%d\t%f\t%f\t%f\n",n,temp,currentLength,bestTourLength)
  printf("%d\t%f\t%f\t%f\n",n,temp,currentLength,bestTourLength)
  fclose(fff) ;
endfunction