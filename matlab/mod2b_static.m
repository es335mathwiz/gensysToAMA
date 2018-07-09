function [residual, g1, g2] = mod2b_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 4, 1);

	% 
	% Model equations
	% 

lhs =y(1);
rhs =params(1)*y(1)+params(4)*(y(3)-params(3)*y(4))+x(1);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =params(2)*y(2)+(y(3)-params(3)*y(4))*params(5)+x(2);
residual(2)= lhs-rhs;
lhs =y(3);
rhs =y(1)+y(3);
residual(3)= lhs-rhs;
lhs =y(4);
rhs =y(4)+y(2);
residual(4)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(4, 4);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(1, 3)=  g1(1, 3)+(-params(4));
  g1(1, 4)=  g1(1, 4)+(-(params(4)*(-params(3))));
  g1(2, 3)=  g1(2, 3)+(-params(5));
  g1(2, 4)=  g1(2, 4)+(-(params(5)*(-params(3))));
  g1(2, 2)=  g1(2, 2)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  g1(3, 1)=  g1(3, 1)+(-1.0);
  g1(3, 3)=  g1(3, 3)+(-1.0);
  g1(3, 3)=  g1(3, 3)+1.0;
  g1(4, 4)=  g1(4, 4)+(-1.0);
  g1(4, 2)=  g1(4, 2)+(-1.0);
  g1(4, 4)=  g1(4, 4)+1.0;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
