%> \file
%> Algorithm 11.2: Initialization of the exact line search.  Implementation of algorithm 11.2 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 17:24:41 2015
%> @ingroup Algorithms
%> @ingroup chap11

%> \note Called by \ref quadraticInterpolation

%> Calculate \f$a\f$, \f$b\f$ and \f$c\f$ such that \f$a < b < c\f$, \f$h(a) > h(b)\f$ and \f$h(c) > h(b)\f$
%> @param obj the name of the Octave function defining h(x)
%> @param delta value such that \f$h(\delta) < h(0)\f$.
%> @return [a,b,c]
function [a,ha,b,hb,c,hc] = initLineSearch(obj,delta)
  xkm1 = 0 ;
  hxkm1 = feval(obj,xkm1) ;
  xk = delta ; 
  hxk = feval(obj,xk) ;
  do 
   xkm2 = xkm1 ;
   hxkm2 = hxkm1 ;
   xkm1 = xk ; 
   hxkm1 = hxk ; 
   xk = 2.0 * xk ;
   hxk = feval(obj,xk) ;
  until(hxk > hxkm1)
  a = xkm2 ;
  ha = hxkm2 ;
  b = xkm1 ; 
  hb = hxkm1 ; 
  c = xk ;       
  hc = hxk ;       
endfunction