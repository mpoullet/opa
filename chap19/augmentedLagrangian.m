%> \file
%>  Algorithm 19.1: augmented Lagrangian algorithm. Implementation of algorithm 19.1 of \cite Bier15-book
%>
%> @note Tested with \ref run1905.m
%> @note Tested with \ref run1906.m
%>
%> @author Michel Bierlaire
%> @date Mon Mar 23 15:45:36 2015
%> @ingroup Algorithms
%> @ingroup chap19

%> Applies the augmented Lagrangian method  to solve \f[\min_x f(x)  \f] subject to \f[h(x)=0,\f] where \f$f:\mathbb{R}^n \to \mathbb{R}\f$ and \f$h:\mathbb{R}^n \to \mathbb{R}^m \f$.
%> @param problem  the name of the Octave function defining f(x), h(x) and their derivatives. The funtion has two arguments: x and index.  If index=0, the objective function \f$f\f$ and its derivatives  are evaluated. If index=\f$i\f$, the constraint \f$h_i\f$ and its derivtives are evaluated. 
%> @param x0 starting primal point (nx1)
%> @param lambda0 starting dual point  (mx1)
%> @param eps algorithm stops if \f$\|\nabla L(x_k,\lambda_k\| \leq \varepsilon \f$ and \f$\|h(x_k)\|^2\f$. 
%> @param maxiter maximum number of iterations (default: 100)
%> @return [solution,lambda]
%> @return x: primal solution
%> @return lambda: dual solution
function [solution,lambda] = augmentedLagrangian(problem,x0,lambda0,eps,maxiter=100)
  addpath("../chap11") ;
  n = size(x0,1) ;
  m = size(lambda0,1) ;
  xk = x0 ;
  lambdak = lambda0 ;

  c0 = 10.0 ;
  eta0 = 0.1258925 ;
  tau = 10.0 ;
  alpha = 0.1 ;
  beta = 0.9 ;

  c = c0 ;

  eps0 = 1.0 / c0 ;
  printf("epsk = %f\n",eps0)
  epsk = eps0 ;
  etak = eta0 / (c0^alpha) ;

  k = 0 ;
  niter = 0 ;
  
  [f,g,H,fL,gL,HL,constraints] = Lc(problem,xk,lambdak,c) ; 

  do 
    printf("%d\t",k);
    printf("%e\t",xk);
    printf("%e\t",lambdak);
    printf("%e\t",norm(gL)) ;
    printf("%e\t",norm(constraints)) ;
    printf("%d\t",c) ;
    printf("%e\t",norm(g)) ;
    printf("%e\t",epsk) ;
    printf("%e\t",norm(constraints)) ;
    printf("%e\t",etak) ;
    printf("%d\t",niter) ;
    printf("\n") ;
    [xk,iteres,niter] = newtonLineSearch(@(x)Lc(problem,x,lambdak,c),xk,epsk,0,maxiter) ;
    [f,g,H,fL,gL,HL,constraints] = Lc(problem,xk,lambdak,c) ; 
%    printf("Penalty parameter:        %f\n", c) ;
%    printf("Nbr iterations:           %d\n", niter) ;
%    printf("Gradient norm:            %f\n", norm(g)) ;
%    printf("Required gradient norm:   %f\n",epsk) ;
%    printf("Constraint norm:          %f\n",norm(constraints)) ;
%    printf("Required constraint norm: %f\n",etak)

    if (norm(constraints) <= etak)
%     printf("Updating multipliers\n") ;
      lambdak += c * constraints ;
      epsk = epsk / c ;
      etak = etak / c^beta ;
    else
%      printf("Updating the penalty parameter\n") ;
      c = c * tau ;
      epsk = eps0 / c ;
      etak = eta0  /c^alpha ;
    endif
    k = k + 1 ;
  until ((epsk <= eps && constraints'*constraints <= eps) || k >= maxiter )
  printf("%d\t",k);
  printf("%e\t",xk);
  printf("%e\t",lambdak);
  printf("%e\t",norm(g)) ;
  printf("%e\t",norm(constraints)) ;
  printf("\n") ;
  solution = xk ;
  lambda = lambdak ;
endfunction


