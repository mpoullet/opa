%> \file
%>  Algorithms 14.2 and 14.3: Kalman filter update. Implementation of algorithms 14.2 and 14.3 of \cite Bier15-book
%> 
%> @note Tested with \ref runKalman.m
%>
%> @author Michel Bierlaire
%> @date Fri May  9 16:06:12 2014
%> @ingroup Algorithms
%> @ingroup chap14

%> Applies one update of the Kalman filter algorithm. 
%> @param x the current estimate of the parameters
%> @param H the current filter matrix
%> @param A the data matrix for the next block
%> @param b the RHS for the next block
%> @param lambda the discount factor
%> @return [x,H] 
%> @return x: the updated value of the parameters. 
%> @return H: the updated value of the filter matrix. 
function [x,H] = kalmanFilter(x,H,A,b,lambda=1.0)
  H = lambda * H + A'*A ;
  d = H \ (A' * (b - A*x)) ;
  x = x + d ; 
endfunction
