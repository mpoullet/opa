%> \file
%> Solve a transhipment problem with bound constraints
%>
%> @note Tested with runTransportationTrans.m
%> @note Tested with runMaxFlowTrans.m
%> @note Tested with runAssignmentTrans.m
%> @note Calls \ref transhipmentTransform
%> @note Calls \ref incidenceMatrix
%> @note Calls \ref twoPhasesSimplex
%> 
%> @author Michel Bierlaire
%> @date Sat Apr 11 11:46:00 2015
%> @ingroup Algorithms
%> @ingroup chap22

%> Solve the transhipment problem with bound constraints
%> @param adj the adjacency matrix of the network (dim m x m)
%> @param cost the cost vector (dim n)
%> @param lb the vector of lower bounds (dim n)
%> @param ub the vector of upper bounds (dim n)
%> @param supply the vector of supply (dim m)
%> @param useGlpk if not 0, solve the linear problem using the glpk routine from Octave. (Default: 0)
%> @return cycle flow a simple cycle flow
function [x,copt] = transhipment(adj,cost,lb,ub,supply,useGlpk=0)
  addpath("../chap16") ;  
  nnodes = rows(adj) ;
  narcs = max(max(adj)) ;
  if (columns(adj) != nnodes) 
    error("Adjacency matrix must be square") ;
  endif
  if (length(cost) != narcs) 
    error("cost vector has incorrect size") ;
  endif
  if (length(lb) != narcs) 
    error("lb vector has incorrect size") ;
  endif
  
  if (length(ub) != narcs) 
    error("ub vector has incorrect size") ;
  endif
  
  for i=1:narcs
    if lb(i) > ub(i)
      error("Incompatible bounds") ;
    endif
  end
  if (length(supply) != nnodes) 
    error("supply vector has incorrect size") ;
  endif
  
  if (sum(supply) != 0.0) 
    error("Infeasible supply/demand vector. Must sum up to 0") ;
  endif
   
   if (useGlpk != 0)
     incidenceMatrix = incidenceMatrix(adj);
     [nconstraints, nvariables] = size(incidenceMatrix) ;
     ctype = repmat('S',1,nconstraints) ;
     [x, copt, errnum, extra] = glpk(cost,incidenceMatrix,supply,lb,ub,ctype) ;
     return ;
   else
     
     [tadj,tcost,tsupply] = transhipmentTransform(adj,cost,lb,ub,supply)  ;
     incidenceMatrix = incidenceMatrix(tadj);
     [xext,copt,opttable,feasible,bounded] = twoPhasesSimplex(incidenceMatrix,tsupply,tcost) ;
     if (feasible == 0)
       printf("Problem is infeasible\n") ;
       return ;
     endif
     if (bounded == 0)
       printf("Problem is unbounded\n") ;
       return ;
     endif
     x = xext(1:narcs) ;
     x += lb;
   endif
 endfunction
 