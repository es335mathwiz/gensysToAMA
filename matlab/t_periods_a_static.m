function [residual, g1, g2] = t_periods_a_static( y, x )
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

T1330404424 = (1.0+params(4))^(-1.0);
T1330404433 = T1330404424*(1.0+params(5)*params(1)*x(1)*y(2)^(params(1)-1.0)-params(3));
T1330404435 = y(1)^(-params(2));
T1330404446 = T1330404424*params(5)*params(1)*x(1)*(params(1)-1.0)*y(2)^(params(1)-1.0-1.0);
T1330404461 = (-params(2))*y(1)^((-params(2))-1.0);
lhs =y(1)+y(2)-params(5)*x(1)*y(2)^params(1)-y(2)*(1.0-params(3));
rhs =0.0;
residual(1)= lhs-rhs;
lhs =y(1)^(-params(2))-T1330404433*T1330404435;
rhs =0.0;
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
  g1(1, 2)=  g1(1, 2)+1.0;
  g1(1, 2)=  g1(1, 2)+(-(params(5)*x(1)*params(1)*y(2)^(params(1)-1.0)))-(1.0-params(3));
  g1(2, 1)=  g1(2, 1)+(-params(2))*y(1)^((-params(2))-1.0);
  g1(2, 2)=  g1(2, 2)+(-(T1330404435*T1330404446));
  g1(2, 1)=  g1(2, 1)+(-(T1330404433*T1330404461));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
