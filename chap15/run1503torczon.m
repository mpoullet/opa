%> \file
%> Runs example 15.3, the McKinnon example with Torczon's algorithm (Table 15.3)
%>
%> @note Calls \ref torczon
%>
%> @ingroup Running
%> @ingroup chap15
%> @author Michel Bierlaire
%> @date Sun Mar 22 10:28:53 2015
x0 = [1 (1.0+sqrt(33))/8.0 0 ; 1 (1.0-sqrt(33))/8.0  0] ;
solution = torczon('ex1503mcKinnon',x0,1.0e-5,100)
