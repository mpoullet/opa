%> \file
%> Runs example 12.3 for the truncated conjugate gradients method
%> 
%> @ingroup Running
%> @ingroup chap12
%> @author Michel Bierlaire
%> @date Sat Mar 21 15:50:29 2015

%> @note Calls \ref truncatedConjugateGradient

xcurrent = [ 9 ;  1] ;
[f,g,H] = ex1101(xcurrent) ;

delta = 4 ;
[dstar,type] = truncatedConjugateGradient(g,H,delta) 
printf("Norm of dstar: %15.8f\n",norm(dstar)) ;
printf("Next iterate: (%15.8f, %15.8f)'\n",xcurrent + dstar) ;



delta = 12  ;
[dstar,type] = truncatedConjugateGradient(g,H,delta) 
printf("Norm of dstar: %15.8f\n",norm(dstar)) ;
printf("Next iterate: (%15.8f, %15.8f)'\n",xcurrent + dstar) ;


