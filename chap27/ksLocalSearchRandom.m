%> \file
%> Implementation of a variant of the local search algorithm with random neighbors for the knapsack problen.
%>
%> @note Tested with \ref run2702localSearchRandom.m
%> @note Calls \ref ksRandomNeighbor
%> @note Called by \ref ksVns
%>
%> @author Michel Bierlaire
%> @date Wed Apr 15 09:02:29 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> Perform a variant of the local search for the knapsack problem with a neighborhood of a given size, where neighbord are selected randomly, and accepted if hey improve the objective function.
%> @param u utility of each item 
%> @param w weight of each item 
%> @param c capacity of the knapsack
%> @param x0 current solution
%> @param s size of the neighborhood
%> @param maxiter number of candidates being evaluated (Default: 1000)
%> @return x local optimum

function x = ksLocalSearchRandom(u,w,c,x0,s,maxiter=1000)
  current = x0 ;
  totalWeight = w'*x0 ;
  if (totalWeight > c)
    error("The initial solution is infeasible. Total weight: %f. Capacity %f.",totalWeight,c) 
  endif
  currentValue = u'*x0 ;
  iter = 0 ;
  while (iter <= maxiter)
    iter += 1  ;
    candidate = ksRandomNeighbor(current,s)  ;
    if (w'*candidate <= c)
      if (u'*candidate > currentValue)
	current = candidate ;
	currentValue = u'*candidate ;
	iter = 0 ;
      endif
    endif
  endwhile
  x = current ;
endfunction
