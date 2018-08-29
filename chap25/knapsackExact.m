%> \file
%> Solves the knapsack problem using integer optimization. See section 25.2.1 of  \cite Bier15-book 
%>
%> @note Tested with \ref run2702.m
%>
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:27:36 2015
%> @ingroup Algorithms
%> @ingroup chap25

function xopt = knapsackExact(u,w,capacity)
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

   ctype = "U" ;
   vtype = repmat('I',1,n) ;   
   lb = zeros(n,1) ;
   ub = ones(n,1) ;
   [xopt, fmin, errnum, extra] = glpk (-u, w', capacity, lb, ub, ctype, vtype) ;
endfunction