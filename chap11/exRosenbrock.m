%> \file
%> Rosenbrock function in \f$n\f$ dimensions.
%> \f[f(x)=\sum_{i=1}^{n-1} 100(x_{i+1} - x_i^2)^2 + (1-x_i)^2.\f] 
%> If \f$n=2\f$, we have \f$ f(x)=100(x_2 - x_1^2)^2 + (1-x_1)^2\f$. 
%> The minimum is 0 at \f$x=(1,1,\ldots,1)^T\f$.
%> @author <a href="http://learning.eng.cam.ac.uk/carl/">Carl Edward Rasmussen</a>
%> @date 2001-07-21 
%> @ingroup Examples
%> @ingroup chap11

%> Example presented in Section 11.6 of \cite Bier15-book
function [f, df, ddf] = exRosenbrock(x);
# Carl Edward Rasmussen, 2001-07-21.

D = length(x);
f = sum(100*(x(2:D)-x(1:D-1).^2).^2 + (1-x(1:D-1)).^2);

if nargout > 1
  df = zeros(D, 1);
  df(1:D-1) = - 400*x(1:D-1).*(x(2:D)-x(1:D-1).^2) - 2*(1-x(1:D-1));
  df(2:D) = df(2:D) + 200*(x(2:D)-x(1:D-1).^2);
end

if nargout > 2
  ddf = zeros(D,D);
  ddf(1:D-1,1:D-1) = diag(-400*x(2:D) + 1200*x(1:D-1).^2 + 2);
  ddf(2:D,2:D) = ddf(2:D,2:D) + 200*eye(D-1);
  ddf = ddf - diag(400*x(1:D-1),1) - diag(400*x(1:D-1),-1);
end
endfunction
