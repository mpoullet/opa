%> \file
%>  Algorithm 15.2: Torczon algorithm. Implementation of algorithm 15.2 of \cite Bier15-book
%>
%> @note Tested with \ref run1503torczon.m
%> 
%> @author Michel Bierlaire
%> @date Sun Mar 22 10:26:50 2015
%> @ingroup Algorithms
%> @ingroup chap15

%> Applies Torczon's algorithm to solve \f$\min_x f(x)\f$ where \f$f:\mathbb{R}^n\to\mathbb{R}\f$. 
%> @param obj the name of the Octave function defining f(x)
%> @param x0 matrix nx(n+1) containnig the initial simplex
%> @param eps  algorithm stops if \f$\|x_{n+1}-x_1\| \leq \varepsilon \f$. 
%> @param maxiter maximum number of iterations (Default: 100)
%> @return [solution,simplex]: the solution and the final simplex. 
function [solution,simplex] = torczon(obj,x0,eps,maxiter=100)
  x = x0 ;
  [n,m] = size(x0) ;
  if (m != n+1) 
    error("Incorrect size") ;
  endif
  iter = 0 ;
  do 
  iter = iter + 1 ;
  f = [] ;
  fr = [] ;
  fe = [] ;
  for k = 1:n+1
    f = [ f ; feval(obj,x(:,k)) ] ;
  endfor
  
  ## Worst value
  [worst,worstindex] = max(f) ;
  ## Best value
  [best,bestindex] = min(f) ;

  for jj=1:n
    printf("%e\t",x(jj,bestindex)) ;
  endfor
  printf("%e\t",best) ;

  d = x(:,worstindex) - x(:,bestindex) ; 
  
  ## Reflexion
  for k = 1:n+1
    if (k == bestindex)
      xr(:,k) = x(:,k) ;
    else
      xr(:,k) = 2 * x(:,bestindex) - x(:,k) ;
    endif
  endfor

  for k = 1:n+1
    fr = [ fr ; feval(obj,xr(:,k)) ] ;
  endfor
  
  ## Best value
  [bestr,bestrindex] = min(fr) ;

  if (bestr >= best)
    ## Contraction
    printf("C\n") ;
    for k = 1:n+1
      if (k != bestindex)
	x(:,k) = 0.5 * (x(:,bestindex) + x(:,k)) ;
      endif
    endfor
  else
    ## Expansion
    for k = 1:n+1
      if (k == bestindex)
	xe(:,k) = x(:,k) ;
      else
	xe(:,k) = 3 * x(:,bestindex) - 2 * x(:,k) ;
      endif
    endfor
    
    for k = 1:n+1
      fe = [ fe ; feval(obj,xe(:,k)) ] ;
    endfor
    
    ## Best value
    [beste,besteindex] = min(fe) ;
    
    if (beste >= bestr) 
      printf("R\n") ;
      x = xr ;
    else
      printf("E\n") ;
      x = xe ;
    endif
  endif
    
  until (norm(d) < eps || iter >= maxiter)
  solution = x(:,bestindex) ;
  simplex = x ;
endfunction