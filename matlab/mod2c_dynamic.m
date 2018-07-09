function [residual, g1, g2] = mod2c_dynamic(y, x)
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

residual = zeros(3, 1);
lhs =y(4);
rhs =params(1)*y(1)+params(4)*y(3)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(5);
rhs =params(2)*y(2)+y(3)*params(5)+x(it_, 2);
residual(2)= lhs-rhs;
lhs =y(6);
rhs =y(3)+y(4)-y(5)*params(3);
residual(3)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(3, 8);

	% 
	% Jacobian matrix
	% 

  g1(1, 4)=  g1(1, 4)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(1, 3)=  g1(1, 3)+(-params(4));
  g1(1, 7)=  g1(1, 7)+(-1.0);
  g1(2, 3)=  g1(2, 3)+(-params(5));
  g1(2, 5)=  g1(2, 5)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  g1(2, 8)=  g1(2, 8)+(-1.0);
  g1(3, 4)=  g1(3, 4)+(-1.0);
  g1(3, 3)=  g1(3, 3)+(-1.0);
  g1(3, 5)=  g1(3, 5)+params(3);
  g1(3, 6)=  g1(3, 6)+1.0;
end
if nargout >= 3,
  g2 = sparse([],[],[],3, 64, 320);

	% 
	% Hessian matrix
	% 

end;
