function [residual, g1, g2] = mod1_dynamic(y, x)
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

residual = zeros(4, 1);
lhs =y(5);
rhs =params(1)*y(1)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =params(2)*y(2)+x(it_, 2);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(5)+y(3);
residual(3)= lhs-rhs;
lhs =y(8);
rhs =y(6)+y(4);
residual(4)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(4, 10);

	% 
	% Jacobian matrix
	% 

  g1(1, 5)=  g1(1, 5)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(1, 9)=  g1(1, 9)+(-1.0);
  g1(2, 6)=  g1(2, 6)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  g1(2, 10)=  g1(2, 10)+(-1.0);
  g1(3, 5)=  g1(3, 5)+(-1.0);
  g1(3, 7)=  g1(3, 7)+1.0;
  g1(3, 3)=  g1(3, 3)+(-1.0);
  g1(4, 6)=  g1(4, 6)+(-1.0);
  g1(4, 8)=  g1(4, 8)+1.0;
  g1(4, 4)=  g1(4, 4)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],4, 100, 500);

	% 
	% Hessian matrix
	% 

end;
