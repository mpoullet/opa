%> \file
%>  Algorithm 20.2: global SQP algorithm. Implementation of algorithm 20.2 of \cite Bier15-book
%>
%> @note Tested with \ref run2007.m
%>
%> @author Michel Bierlaire
%> @date Fri Mar 27 15:54:09 2015
%> @ingroup Algorithms
%> @ingroup chap20

%> Applies the global SQP method  to solve \f[\min_x f(x)  \f] subject to \f[h(x)=0,\f] where \f$f:\mathbb{R}^n \to \mathbb{R}\f$ and \f$h:\mathbb{R}^n \to \mathbb{R}^m \f$.
%> @param problem  the name of the Octave function defining f(x), h(x) and their derivatives. The funtion has two arguments: x and index.  If index=0, the objective function \f$f\f$ and its derivatives  are evaluated. If index=\f$i\f$, the constraint \f$h_i\f$ and its derivtives are evaluated. 
%> @param x0 starting primal point (nx1)
%> @param lambda0 starting dual point  (mx1)
%> @param eps algorithm stops if \f$\|\nabla L(x_k,\lambda_k\| \leq \varepsilon \f$ and \f$\|h(x_k)\|^2\f$. 
%> @param maxiter maximum number of iterations (default: 100)
%> @return [solution,lambda]
%> @return x: primal solution
%> @return lambda: dual solution
function [solution,lambda] = globalSqp(problem,x0,lambda0,eps,maxiter)
  addpath("../chap11") ;
  n = size(x0,1) ;
  m = size(lambda0,1) ;
  xk = x0 ;
  beta1 = 0.3 ;
  cconst = 0.1 ;
  lambdak = lambda0 ;
  c = norm(lambda0,Inf) + cconst ;
  dx = [ 0  ; 0] ;
#  printf("x(1)\tx(2)\tlambda\tdx1\tdx2\tnorm\n") ;
    k = 0 ;
  do
    printf("%d\t%12.5e\t%12.5e\t%12.5e",k,xk(1),xk(2),lambdak) ;
    [f,g,H] = feval(problem,xk,0) ;
    contr = [] ;
    gradcontr = [] ;
    hesslagrangien = H ;
    for i=1:m
      [fi,gi,Hi] = feval(problem,xk,i) ;
      contr = [contr ; fi] ;
      gradcontr = [gradcontr ; gi] ;
      hesslagrangien += lambdak(i) * Hi ; 
    endfor
    
    [L,tau] = modifiedCholesky(hesslagrangien) ;

#    printf("   tau = %f\n", tau) ;
    hesslagrangien = L * L' ;

    [dx,qobj,info,dl] = qp(xk,hesslagrangien,g,-gradcontr',contr);
    gradlagrangien = [g + gradcontr * lambdak ; contr] ;

    %Update the penalty parameter
    target = norm(dl,Inf) + cconst ;
    if (c >= 1.1 * target) 
      % reduce c
      c = (c + target) / 2.0 ;
    else 
      if ( c < target)
	c = max(1.5 * c, target) ;
      endif
    endif

    normConstraint = norm(contr,1) ;
    derivdirect = g' * dx - c * normConstraint ;

    if (derivdirect < 0)
      phi = f + c * normConstraint ;
      alpha = 2.0 ;
      do 
        alpha /= 2.0 ;
	cand = xk + alpha * dx ;
	fcand = feval(problem,cand,0) ;
	contrcand = [] ;
	for i=1:m
	  fi = feval(problem,cand,i) ;
	  contrcand = [contrcand ; fi] ;
	endfor
	phicand = fcand + c * norm(contrcand,1) ;
      until (phicand <= phi + alpha * beta1 * derivdirect )
      xk = xk + alpha * dx ;
      lambdak = dl ;
      k = k + 1 ;
    endif
    printf("\t%8.1e\t%8.1e\t%8.1e\t%12.5e\n", c,alpha,tau,norm(gradlagrangien)) ;
  until (norm(gradlagrangien) <= eps || derivdirect >= -eps|| k >= maxiter)
  solution = xk ;
  lambda = lambdak ;
endfunction 
