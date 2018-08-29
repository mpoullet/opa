%> \file
%>  Algorithm 18.3:  Predictor-corrector interior point algorithm. Implementation of algorithm 18.3 of \cite Bier15-book
%>
%> @note Tested with \ref run1807predictorCorrector.m
%>
%> @author Michel Bierlaire
%> @date Mon Mar 23 12:10:29 2015
%> @ingroup Algorithms
%> @ingroup chap18

%> Applies the predictor-corrector interior point algorithm  to solve \f[\min_x c^Tx  \f] subject to \f[Ax = b\f] and \f[ x \geq 0 \f].
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @param x0 starting primal point (nx1)
%> @param lambda0 starting dual point for equality constraints (mx1)
%> @param mu0 starting dual point for inequality constraints (nx1)
%> @param eps algorithm stops if \f$\|d_k\| \leq \varepsilon \f$. 
%> @param thetapred parameter such that 0 <= theta <= 1 (default: 0.5)
%> @param thetacorr parameter such that 0 <= theta <= 1 (default: 0.25)
%> @param maxiter maximum number of iterations (default: 100)
%> @return [x,lambda,mu]
%> @return x: primal solution
%> @return lambda: dual solution for equality constraints
%> @return mu: dual solution for inequality constraints 
function [x,lambda,mu] = predictorCorrector(A,b,c,x0,lambda0,mu0,eps,thetapred=0.5,thetacorr=0.25,maxiter=100)

  [m,n] = size(A) ;
  if (m != size(b))
    error("The number of rows in A and b do not match") ;
  endif
  if (n != size(c))
    error("The number of columns in A and do not match the size of c") ;
  endif
  if (n != size(x0))
    error("The number of columns in A and do not match the size of x0") ;
  endif
  if (m != size(lambda0))
    error("The number of rows in A and do not match the size of lambda0") ;
  endif
  if (n != size(mu0))
    error("The number of columns in A and do not match the size of mu0") ;
  endif

  primalcons = norm(A*x0 - b) ;
  if (primalcons > eps) 
    error("Initial point is not primal feasible") ;
  endif
  dualcons = norm(A' * lambda0 + mu0 - c) ;
  if (dualcons > eps) 
    error("Initial point is not dual feasible") ;
  endif

  if (min(x0) <= 0) 
    error("x0 must be strictly positive")
  endif
  if (min(mu0) <= 0) 
    error("mu0 must be strictly positive")
  endif



  x = x0 ;
  lambda = lambda0 ;
  mu = mu0 ;
  e = ones(n,1) ;
  sigma = 0 ;

  k=0 ;
  do 
    nu = (mu' * x ) / n ;
    S = diag(mu) ;
    X = diag(x) ;
    voisinage = norm(X*S*e-nu*e) / nu ;
    if (voisinage > thetacorr)
      error("Iterate outside the neighborhood: %e > %f",voisinage,thetacorr)
    endif
    if (k==0)
      printf("%d\t%e\t\t%e\n",k,voisinage,nu) ;
    else
      if (sigma == 0)
	printf("%d\t%e\t%e\t%e\t%e\tCorr\n",k,voisinage,norm(alpha*d),nu,alpha);
      else
	printf("%d\t%e\t%e\t%e\t%e\tPred\n",k,voisinage,norm(alpha*d),nu,alpha);
      endif
    endif
    Q = [ A zeros(m,m) zeros(m,n) ; zeros(n,n) A' eye(n,n) ; S zeros(n,m)  X] ;
    lefthand = [ zeros(m+n,1) ;  -X*S*e + nu * sigma * e] ;
    d = Q \ lefthand ;
    alpha = 1.0 ;
    if (sigma == 0)
				# Prediction step
      ok = 0 ;
      while (ok != 1)
				# Candidate
	cx = x + alpha * d(1:n) ;
	clambda = lambda + alpha * d(n+1:n+m) ;
	cmu = mu + alpha * d(n+m+1:n+m+n) ;
	if (min(cx) <= 0 || min(cmu) <= 0) 
	  ok = 0 ;
	  alpha = alpha / 2.0 ;
	else 
	  cnu = (cmu' * cx ) / n ;
	  if (cnu <= eps)
				# Solution found
	    x = cx ;
	    lambda = clambda ;
	    mu = cmu ;
	    return ;
	  endif 
	  cS = diag(cmu) ;
	  cX = diag(cx) ;
	  cvoisinage = norm(cX*cS*e-cnu*e) / cnu ;
	  if (cvoisinage <= thetapred)
	    x = cx ;
	    lambda = clambda ;
	    mu = cmu ;
	    ok = 1 ;
	  else
	    ok = 0 ;
	    alpha = alpha / 2 ;
	  endif
	endif
      endwhile 
    else
      # Correction step
      x = x + d(1:n) ;
      lambda = lambda + d(n+1:n+m) ;
      mu = mu + d(n+m+1:n+m+n) ;
    endif
    k=k+1 ;
    sigma = 1 - sigma ; 
  until (nu <= eps || k >= maxiter)
endfunction

