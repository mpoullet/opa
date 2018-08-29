%> \file
%> Algorithm 7.1: calculation of the machine epsilon. Implementation of algorithm 7.2 of \cite Bier15-book
%> 
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 10:27:04 2015
%> @ingroup Algorithms
%> @ingroup chap07 

%> @note Tested with \ref runMachineEpsilon.m

%> Calculate the machine epsilon in single and double precision
%> @return epss: single precision
%> @return epsd: double precision
function [epss, epsd] = machineEpsilon()
  epss = single(1.0) ;
  while (epss + 1.0 != 1.0)
    epss /= 2.0 ;
  endwhile
  
  epsd = double(1.0) ;
  while (epsd + 1.0 != 1.0)
    epsd /= 2.0 ;
  endwhile
endfunction

