%> \file
%>  Algorithm 18.2:  Interior point algorithm with restricted steps. Implementation of algorithm 18.2 of \cite Bier15-book
%>
%> @note Tested with \ref run1807restrictedSteps.m
%>
%> @author Michel Bierlaire
%> @date Mon Mar 23 10:59:13 2015
%> @ingroup Algorithms
%> @ingroup chap18

%> Applies the interior point algorithm with restricted steps to solve \f[\min_x c^Tx  \f] subject to \f[Ax = b\f] and \f[ x \geq 0 \f].
%> @param A the constraint matrix
%> @param b the constraint right hand side
%> @param c the cost vector for the objective function
%> @param x0 starting primal point (nx1)
%> @param lambda0 starting dual point for equality constraints (mx1)
%> @param mu0 starting dual point for inequality constraints (nx1)
%> @param eps algorithm stops if \f$\|d_k\| \leq \varepsilon \f$. 
%> @param theta parameter such that 0 <= theta <= 1 (default: 0.4)
%> @param maxiter maximum number of iterations (default: 100)
%> @return [x,lambda,mu]
%> @return x: primal solution
%> @return lambda: dual solution for equality constraints
%> @return mu: dual solution for inequality constraints 
function [x,lambda,mu] = restrictedSteps(A,b,c,x0,lambda0,mu0,eps, theta=0.4,maxiter=100)

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

  primalcons = norm(A*x0 - b) 
  if (primalcons > eps) 
    error("Initial point is not primal feasible") ;
  endif
  dualcons = norm(A' * lambda0 + mu0 - c) ;
  if (dualcons > eps) 
    error("Initial point is not dual feasible") ;
  endif

  sigma = 1.0 - theta / sqrt(n) ;
  x = x0 ;
  lambda = lambda0 ;
  mu = mu0 ;

  e = ones(n,1) ;

  k=0 ;
  do 
    nu = (mu' * x ) / n ;
    S = diag(mu) ;
    X = diag(x) ;
    voisinage = norm(X*S*e-nu*e) / nu ;
    if (voisinage > theta)
      error("Iterate not in the vicinity of the central path")
    endif
    if (k==0)
      printf("%d\t%e\t\t%e\n",k,voisinage,nu) ;
    else
      printf("%d\t%e\t%e\t%e\n",k,voisinage,norm(d),nu) ;
    endif
    Q = [ A zeros(m,m) zeros(m,n) ; zeros(n,n) A' eye(n,n) ; S zeros(n,m) X] ;
    lefthand = [ zeros(m+n,1) ;  -X*S*e + nu * sigma * e] ;
    d = Q \ lefthand ;
    x = x + d(1:n) ;
    lambda = lambda + d(n+1:n+m) ;
    mu = mu + d(n+m+1:n+m+n) ;
    k=k+1 ;
  until (nu <= eps || k >= maxiter)
endfunction