%> \file
%>  Algorithm 20.1: local SQP algorithm. Implementation of algorithm 20.1 of \cite Bier15-book
%>
%> @note Tested with \ref run2002.m
%> @note Tested with \ref run2003.m
%> @note Tested with \ref run2004.m
%>
%> @author Michel Bierlaire
%> @date Thu Mar 26 13:33:44 2015
%> @ingroup Algorithms
%> @ingroup chap20

%> Applies the local SQP method  to solve \f[\min_x f(x)  \f] subject to \f[h(x)=0,\f] where \f$f:\mathbb{R}^n \to \mathbb{R}\f$ and \f$h:\mathbb{R}^n \to \mathbb{R}^m \f$.
%> @param problem  the name of the Octave function defining f(x), h(x) and their derivatives. The funtion has two arguments: x and index.  If index=0, the objective function \f$f\f$ and its derivatives  are evaluated. If index=\f$i\f$, the constraint \f$h_i\f$ and its derivtives are evaluated. 
%> @param x0 starting primal point (nx1)
%> @param lambda0 starting dual point  (mx1)
%> @param eps algorithm stops if \f$\|\nabla L(x_k,\lambda_k\| \leq \varepsilon \f$ and \f$\|h(x_k)\|^2\f$. 
%> @param maxiter maximum number of iterations (default: 100)
%> @return [solution,lambda]
%> @return x: primal solution
%> @return lambda: dual solution
function [solution,lambda] = localSqp(problem,x0,lambda0,eps,maxiter=100)
  n = size(x0,1) ;
  m = size(lambda0,1) ;
  xk = x0 ;
  lambdak = lambda0 ;
  dx = [ 0  ; 0] ;
#  printf("x(1)\tx(2)\tlambda\tdx1\tdx2\tnorm\n") ;
    k = 0 ;
  do
  printf("%d\t\%12.5e\t%12.5e\t%12.5e\t",k,xk(1),xk(2),lambdak) ;
#  printf("%f,%f\n",xk(1),xk(2)) ;
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
    [dx,qobj,info,dl] = qp(xk,hesslagrangien,g,-gradcontr',contr);

    gradlagrangien = [g + gradcontr * lambdak ; contr] ;
    printf("%12.5e\n", norm(gradlagrangien)) ;
    xk = xk + dx ;
    lambdak = dl ;
    k = k + 1 ;
  until (norm(gradlagrangien) <= eps || k >= maxiter)
  solution = xk ;
  lambda = lambdak ;
endfunction 
