function [residual, g1, g2] = mod1a_dynamic(y, x)
% 
% Status : Computes dynamic model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ it_
if M_.param_nbr > 0
  params =  M_.params;
end

	% 
	% Model equations
	% 

residual = zeros(2, 1);
lhs =y(3);
rhs =params(1)*y(1)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =params(2)*y(2)+x(it_, 2);
residual(2)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(2, 6);

	% 
	% Jacobian matrix
	% 

  g1(1, 3)=  g1(1, 3)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(1, 5)=  g1(1, 5)+(-1.0);
  g1(2, 4)=  g1(2, 4)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  g1(2, 6)=  g1(2, 6)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],2, 36, 180);

	% 
	% Hessian matrix
	% 

end;
