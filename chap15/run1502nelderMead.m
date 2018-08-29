%> \file
%> Runs example 15.2 illustrating the Nelder-Nead algorithm (Table 15.1)
%> 
%> @note Calls \ref nelderMead
%>
%> @ingroup Running
%> @ingroup chap15
%> @author Michel Bierlaire
%> @date Sat Mar 21 18:25:02 2015
x0 = [1 2  1.1 ; 1 1.1 2] ; 
solution = nelderMead('ex1101',x0,1.0e-5,100)

