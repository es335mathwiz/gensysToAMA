function [residual, g1, g2] = mod3a_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 2, 1);

	% 
	% Model equations
	% 

lhs =y(1);
rhs =params(1)*y(1)+x(1);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =params(2)*y(2)+x(2);
residual(2)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(2, 2);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+1.0;
  g1(1, 1)=  g1(1, 1)+(-params(1));
  g1(2, 2)=  g1(2, 2)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(2));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
