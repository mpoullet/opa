%> @file
%> Example 14.1 in \cite Bier15-book
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:03:42 2015
%> @ingroup Examples
%> @ingroup chap14

%> Example 14.1 in \cite Bier15-book
function [g,gradg] = ex1401(x)
 
  A = [ 77005.0	1.0 ;
       76315.0	1.0 ;
       70891.0	1.0 ;
       67667.0	1.0 ;
       64643.0	1.0 ;
       61770.0	1.0 ;
       61593.0	1.0 ;
       63227.0	1.0 ;
       63684.0	1.0 ;
       66914.0	1.0 ;
       72407.0	1.0 ;
       82413.0	1.0 ;
       86515.0 1.0  ;
       84896.0 1.0  ;
       79660.0 1.0  ;
       75827.0 1.0  ;
       72606.0 1.0  ;
       69423.0 1.0  ;
       69690.0 1.0  ;
       69744.0 1.0  ;
       70418.0 1.0  ;
       71998.0 1.0  ;
       77268.0 1.0  ;
       87299.0 1.0  ] ;

  b = [ 57312.0 ;
       56839.0 ;
       55501.0 ;
       55491.0 ;
       54217.0 ;
       53098.0 ;
       54701.0 ;
       56596.0 ;
       56663.0 ;
       58622.0 ;
       59660.0 ;
       59896.0 ;
       61643.0  ;
       61105.0  ;
       59333.0  ;
       60024.0  ;
       58684.0  ;
       57075.0  ;
       58826.0  ;
       60212.0  ;
       60654.0  ;
       61445.0  ;
       61805.0  ;
       62138.0  ] ;

  [m n] = size(A) ;
  if (size(x,1) != n)
    error("Incompatible size between A and x") ;
  endif
  if (size(b,1) != m)
    error("Incompatible size between A and b") ;
  endif
  g = A*x-b ;
  gradg = A';
endfunction
