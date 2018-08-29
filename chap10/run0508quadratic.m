%> \file
%> Runs example 5.8 with Newton's local with the quadratic model
%> 
%> @ingroup Running
%> @ingroup chap10
%> @author <a href="http://people.epfl.ch/michel.bierlaire">Michel Bierlaire</a>
%> @date Fri Mar 20 16:15:37 2015

%> @note Calls \ref newtonLocalQuadratic

%> @note The second run fails with the following error message: "chol: input matrix must be positive definite". Indeed, the hessian matrix is not positive definite at the starting point, and  the quadratic problem is not bounded. If the conjugate gradient algorithm is used (last statement that is commented out), the error message is "error: The matrix must de positive definite". 

x0 = [-2 ; 1] ;
printf("With direct method\n");
[solution,gradient] = newtonLocalQuadratic('ex0508gradient',x0,1.0e-15,0)
printf("With conjugate gradient\n");
[solution,gradient] = newtonLocalQuadratic('ex0508gradient',x0,1.0e-15,1)

x0 = [1 ; 1] ;
[solution, gradient] = newtonLocalQuadratic('ex0508gradient',x0,1.0e-15,0)
%[solution, gradient] = newtonLocalQuadratic('ex0508gradient',x0,1.0e-15,1)


