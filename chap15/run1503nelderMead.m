%> \file
%> Runs example 15.3 illustrating the Nelder-Nead algorithm (Table 15.2)
%> 
%> @note Calls \ref nelderMead
%>
%> @ingroup Running
%> @ingroup chap15
%> @author Michel Bierlaire
%> @date Sat Mar 21 18:25:02 2015
x0 = [1 (1.0+sqrt(33))/8.0 0 ; 1 (1.0-sqrt(33))/8.0  0] ;
solution = nelderMead('ex1503mcKinnon',x0,1.0e-5,100)

