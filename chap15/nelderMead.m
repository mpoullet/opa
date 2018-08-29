%> \file
%>  Algorithm 15.1: Nelder-Mead algorithm. Implementation of algorithm 15.1 of \cite Bier15-book
%>
%> @note Tested with \ref run1502nelderMead.m
%> @note Tested with \ref run1503nelderMead.m
%> 
%> @author Michel Bierlaire
%> @date Sat Mar 21 18:23:57 2015
%> @ingroup Algorithms
%> @ingroup chap15

%> Applies the Nelder-Mead algorithm to solve \f$\min_x f(x)\f$ where \f$f:\mathbb{R}^n\to\mathbb{R}\f$. 
%> @param obj the name of the Octave function defining f(x)
%> @param x0 matrix nx(n+1) containnig the initial simplex
%> @param eps  algorithm stops if \f$\|d_k\| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return [solution,simplex]: the solution and the final simplex. 
function [solution,simplex] = nelderMead(obj,x0,eps,maxiter=100)
  x = x0 ;
  [n,m] = size(x0) ;
  if (m != n+1) 
    error("Incorrect size") ;
  endif

  iter = 0 ;
  do 
  iter = iter + 1 ;
    f = [] ;
    for k = 1:n+1
     f = [ f ; feval(obj,x(:,k)) ] ;
    endfor
  
    ## Worst value
    [worst,worstindex] = max(f) ;
    ## Best value
    [best,bestindex] = min(f) ;
    tmp = f ;
    tmp(worstindex) = best - 10.0 ;
    xworst =  x(:,worstindex) ;
    [secondworst,secondworstindex] = max(tmp) ;

    xc = (sum(x,2) - xworst) / n;
    d = xc - x(:,worstindex) ;
    xr = 2 * xc - xworst ;
    fxr = feval(obj,xr) ;
    if (fxr < best)
      xe = 2 * xr - xc ;
      fxe = feval(obj,xe) ;
      if (fxe < fxr) 
	xnew = xe ;
      else
	xnew = xr ;
      endif
    else
      if (secondworst > fxr)
	xnew = xr ;
      else
	if (fxr >= worst)
	  xnew = 0.5 * (xworst + xc) ;
	else
	  xnew = 0.5 * (xr + xc) ;
	endif
      endif
    endif
    fxnew = feval(obj,xnew) ;
    printf("%d\t",iter) ;
    for k = 1:n+1
      printf("%e\t",x(1,k))
    endfor
    printf("%e\t",xr(1)) ;
    printf("%e\n",xnew(1)) ;
    printf("\t") ;
    for k = 1:n+1
      printf("%e\t",x(2,k))
    endfor
    printf("%e\t",xr(2)) ;
    printf("%e\n",xnew(2)) ;
    printf("---------------------\n") ;
    printf("f\t") ;
    for k = 1:n+1
      printf("%e\t",f(k))
    endfor
    printf("%e\t",fxr) ;
    printf("%e\n",fxnew) ;
    printf("---------------------\n") ;
    x(:,worstindex) = xnew ;
    
  until (norm(d) < eps || iter >= maxiter)
  solution = x(:,bestindex) ;
  simplex = x ;
endfunction
