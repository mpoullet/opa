%> \file
%> Write the Traveling Salesman Problem (TSP) as an integer optimization problem in standard form. See Section 25.2.3 of \cite Bier15-book
%>
%> @note Tested with \ref run2512.m
%> @note Tested with \ref run2703.m
%> 
%> @author Michel Bierlaire
%> @date Tue Apr 14 10:42:27 2015
%> @ingroup Algorithms
%> @ingroup chap25

%> Write the TSP as an integer optimization problem in standard form
%> @param dist distance matrix
%> @return [A,b,c]

function tour = tspExact(dist)
  n = rows(dist) ;
  if (columns(dist) != n) 
    error("Distance matrix must be square") ;
  endif

% Numbering of variables
% 1--> n(n-1)  x_ij 
  vtype1 = repmat('I',1,n*(n-1)) ;
% n(n-1) + 1 --> n(n-1) + n-1   u_i (for the subtour elimination constraint)
  vtype2 = repmat('I',1,n-1) ;
% n(n-1) + n-1 + 1 --> n(n-1) + n-1 + n(n-1) slack variables for x_ij <= 1
  vtype3 = repmat('C',1,n*(n-1)) ;
% n(n-1) + n-1 + n(n-1) + 1 --> n(n-1) + n-1 + n(n-1) + (n-1)*(n-2) slack variables for subrout constraints
  vtype4 = repmat('C',1,(n-1)*(n-2)) ;
  vtype = [vtype1 vtype2 vtype3 vtype4] ;

  indices = zeros(size(dist)) ;
  index = 1 ;
  for i = 1:n
    for j = 1:n
      if i != j
	indices(i,j) = index ;
	index += 1 ;
      endif
    endfor
  endfor
  numberOfVariables = (n-1) * (3*n-1) ;

% Objective function

  c = zeros(numberOfVariables,1) ;
  for i = 1:n
    for j = 1:n
      if i != j
	c(indices(i,j))= dist(i,j) ;
      endif
    endfor
  endfor


% Each city has exactly one predecessor
  A1 = zeros(n,numberOfVariables) ;
  b1 = ones(n,1) ;
  ctype1 = repmat('S',1,n) ;
  for j = 1:n
    for i = 1:n
      if i != j
	A1(j,indices(i,j)) = 1 ;
      endif
    endfor
  endfor

% Each city has exactly one successor
  A2 = zeros(n,numberOfVariables) ;
  b2 = ones(n,1) ;
  ctype2 = repmat('S',1,n) ;
  for i = 1:n
    for j = 1:n
      if i != j
	A2(i,indices(i,j)) = 1 ;
      endif
    endfor
  endfor

% Subtour elimination

  A3 = zeros((n-1)*(n-2),numberOfVariables) ;
  b3 = zeros((n-1)*(n-2),1) ;
  ctype3 = repmat('S',1,(n-1)*(n-2)) ;
  index = 1 ;
  for i = 2:n
    for j = 2:n
      if i != j
	A3(index,n*(n-1) + i-1) = 1 ;
	A3(index,n*(n-1) + j-1) = -1 ;
	A3(index,indices(i,j)) = n-1 ;
        A3(index,n*(n-1) + n-1 + n*(n-1) + index) = 1 ;
	b3(index) = n-2 ;
	index += 1 ;
      endif
    endfor
  endfor

% x_ij <= 1

  A4 = zeros(n*(n-1),numberOfVariables) ;
  b4 = ones(n*(n-1),1) ;
  ctype4 = repmat('S',1,n*(n-1)) ;
  for i = 1:n
    for j = 1:n
      if i != j
	A4(indices(i,j),indices(i,j)) = 1 ;
	A4(indices(i,j),n * (n-1) + n + indices(i,j)-1) = 1 ;
      endif
    endfor
  endfor


  A = [A1 ; A2 ; A3 ; A4] ;
  b = [b1 ; b2 ; b3 ; b4] ;

  [mm,nn] = size(A) ;
  lb = zeros(numberOfVariables,1) ;
  ub = 1000*ones(numberOfVariables,1) ;
  ctype = [ctype1 ctype2 ctype3 ctype4] ;
  [x_min,tot_cost,errnum,extra] = glpk(c,A,b,lb,ub,ctype,vtype,1) ;
  for i=1:n
    for j=1:n
      if (i != j)
	if (x_min(indices(i,j)) == 1)
	  printf("%d --> %d\n",i,j)
	endif
      endif
    endfor
  endfor

  printf("%d cities\n",n) ;
  printf("Total cost: %f\n",tot_cost) ;
  tour = [1] ;
  currentcity = 1 ;
  do
    for j = 1:n
      if currentcity != j
	if (x_min(indices(currentcity,j)) == 1)
	  currentcity = j ;
	  tour = [tour ; currentcity ]  ;
	  break ;
	endif
      endif
    endfor
  until(currentcity == 1)

  
endfunction

