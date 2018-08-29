function [f,g,H,fL,gL,HL,constraints] = Lc(problem,x,lambda,c)
  m = size(lambda,1) ;
  [f0,g0,H0] = feval(problem,x,0) ;
  f = f0 ;
  fL = f0 ; 
  g = g0 ;  
  gL = g0 ;
  H = H0 ; 
  HL = H0 ;
  constraints = zeros(m,1) ;
  for i=1:m
    [fi,gi,Hi] = feval(problem,x,i) ;
    constraints(i) = fi  ;
    f += lambda(i) * fi ;
    fL += lambda(i) * fi ;
    f += c * fi * fi / 2.0 ;
    g += lambda(i) * gi ;
    gL += lambda(i) * gi ;
    g += c * fi * gi ;
    H += lambda(i) * Hi ;
    HL += lambda(i) * Hi ;
    H += c * gi * gi' ;
    H += fi * Hi ;
  endfor
endfunction