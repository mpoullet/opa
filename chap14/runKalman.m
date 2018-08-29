%> \file
%> Run to illustrate the Kalman filter algorithm 14.2 (Table 14.3)
%>
%> @note Calls \ref kalmanFilter
%> 
%> @ingroup Running
%> @ingroup chap14
%> @author Michel Bierlaire
%> @date Sat Mar 21 18:14:17 2015

A1 = [ 77005.0	1.0 ;
76315.0	1.0 ;
70891.0	1.0 ;
67667.0	1.0 ;
64643.0	1.0 ;
61770.0	1.0 ;
61593.0	1.0 ;
63227.0	1.0 ;
63684.0	1.0 ;
66914.0	1.0 ;
72407.0	1.0 ;
82413.0	1.0 ];

b1 = [ 57312.0 ;
56839.0 ;
55501.0 ;
55491.0 ;
54217.0 ;
53098.0 ;
54701.0 ;
56596.0 ;
56663.0 ;
58622.0 ;
59660.0 ;
59896.0 ];

A2 = [86515.0 1.0 ] ;
b2 = [	61643.0 ] ;

A3 = [84896.0 1.0 ] ;
b3 = [	61105.0 ] ;

A4 = [79660.0 1.0 ] ;
b4 = [	59333.0 ] ;

A5 = [75827.0 1.0 ] ;
b5 = [	60024.0 ] ;

A6 = [72606.0 1.0 ] ;
b6 = [	58684.0 ] ;

A7 = [69423.0 1.0 ] ;
b7 = [	57075.0 ] ;

A8 = [69690.0 1.0 ] ;
b8 = [	58826.0 ] ;

A9 = [69744.0 1.0 ] ;
b9 = [	60212.0 ] ;

A10 = [70418.0 1.0 ] ;
b10 = [	60654.0 ] ;

A11 = [71998.0 1.0 ] ;
b11 = [	61445.0 ] ;

A12 = [77268.0 1.0 ] ;
b12 = [	61805.0 ] ;

A13 = [87299.0 1.0 ] ;
b13 = [	62138.0 ] ;

x = zeros(2,1) ;
H = zeros(2,2) ;

[x,H] = kalmanFilter(x,H,A1,b1) ;
printf("1 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A2,b2) ;
printf("2 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A3,b3) ;
printf("3 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A4,b4) ;
printf("4 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A5,b5) ;
printf("5 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A6,b6) ;
printf("6 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A7,b7) ;
printf("7 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A8,b8) ;
printf("8 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A9,b9) ;
printf("9 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A10,b10) ;
printf("10 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A11,b11) ;
printf("11 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A12,b12) ;
printf("12 \t %.6g \t %.6g \n",x(1),x(2)) ; 
[x,H] = kalmanFilter(x,H,A13,b13) ;
printf("13 \t %.6g \t %.6g \n",x(1),x(2)) ; 
