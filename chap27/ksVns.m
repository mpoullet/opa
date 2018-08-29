%> \file
%> Algorithm 27.5: VNS for the knapsack problem. Implementation of algorithm 27.5 of \cite Bier15-book
%>
%> @note Tested with \ref run2702vns.m
%> @note Calls \ref ksLocalSearchRandom
%> 
%> @author Michel Bierlaire
%> @date Wed Apr 15 09:21:56 2015
%> @ingroup Algorithms
%> @ingroup chap27
%> 
%> VNS algorithm for the knapsack problem. 
%> @param u utility of each item 
%> @param w weight of each item 
%> @param c capacity of the knapsack
%> @param x0 current solution
%> @return x local optimum
%> @return The file \c ksIters.dat is also created, containing the details of the iterations. 
function best = ksVns(u,w,c,x0)
  [fff,msg] = fopen("ksIters.dat","w") ;
  fprintf(fff,"Neighborhood\Candidate\tBest\n") ;
  n = size(u,1) ;
  if (size(w) != n)
    error("Vectors of incompatible sizes: %d and %d\n",n,size(w))
  endif
  best = x0 ;
  s = 1 ;
  while (s <= n)
    candidate = ksLocalSearchRandom(u,w,c,best,s) ;
    fprintf(fff,"%d\t%f\t%f\n",s,u'*candidate,u'*best) ;
    if (u'*candidate > u'*best)
      best = candidate ;
      s = 1 ;
    else
      s += 1 ;
    endif
  endwhile
  fclose(fff) ;
endfunction