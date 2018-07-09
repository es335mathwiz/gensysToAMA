function [residual, g1, g2] = mod2c_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 3, 1);

	% 
	% Model equations
	% 

lhs =y(1);
rhs =params(1)*y(1)+params(4)*y(3)+x(1);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =params(2)*y(2)+y(3)*params(5)+x(2);
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(3)+y(1)-y(2)*params(3);
residual(3)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(3, 3);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(1, 3)=  g1(1, 3)+(-params(4));
  g1(2, 3)=  g1(2, 3)+(-params(5));
  g1(2, 2)=  g1(2, 2)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  g1(3, 1)=  g1(3, 1)+(-1.0);
  g1(3, 3)=  g1(3, 3)+(-1.0);
  g1(3, 2)=  g1(3, 2)+params(3);
  g1(3, 3)=  g1(3, 3)+1.0;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
