%> \file
%> Solves the knapsack problem using the greedy heuristic described in section 27.1.1 of  \cite Bier15-book 
%>
%> @note Tested by run2702greedy.m
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 11:22:01 2015
%> @ingroup Algorithms
%> @ingroup chap27

function xopt = knapsackGreedy(u,w,capacity)
   [n,shouldBeOne] = size(u) ;
   if (shouldBeOne != 1)
     error("A column vector is expected for u") ;
   endif
   [nw,shouldBeOne] = size(w) ;
   if (shouldBeOne != 1)
     error("A column vector is expected for w") ;
   endif
   if (nw != n)
     error("The two vectors must have the same size") 
   endif
   xopt = zeros(n,1) ;
   
   ratio = -u ./ w ;

   [ sorted, index] = sort(ratio) ;

   totalWeight = 0 ;
   
   for i = 1:n
     elem = index(i) ;
     if (totalWeight + w(elem) <= capacity)
       xopt(elem) = 1 ;
       totalWeight += w(elem) ;
     endif
   endfor

endfunction