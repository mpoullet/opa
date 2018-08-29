%> \file
%> Calculate the machine epsilon
%> 
%> @ingroup Running
%> @ingroup chap07
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 10:28:45 2015

%> @note Calls \ref machineEpsilon

[epss, epsd] = machineEpsilon() ;
printf("Machine epsilon in single precision: %g\n",epss)
printf("Machine epsilon in double precision: %g\n",epsd)


