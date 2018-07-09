function [residual, g1, g2] = t_sgu_ex1_static( y, x )
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

T1330404427 = params(2)*exp(y(1))^(-params(4));
T1330404433 = params(1)*exp(y(3))*exp(y(2))^(params(1)-1.0);
T1330404435 = 1.0+T1330404433-params(3);
T1330404447 = exp(y(1))*(-params(4))*exp(y(1))^((-params(4))-1.0);
T1330404451 = exp(y(2))*(params(1)-1.0)*exp(y(2))^(params(1)-1.0-1.0);
T1330404458 = exp(y(3))*exp(y(2))*params(1)*exp(y(2))^(params(1)-1.0);
T1330404464 = exp(y(1))*(-params(4))*exp(y(1))^((-params(4))-1.0);
T1330404465 = params(2)*T1330404464;
lhs =exp(y(1))+exp(y(2));
rhs =(1.0-params(3))*exp(y(2))+exp(y(3))*exp(y(2))^params(1);
residual(1)= lhs-rhs;
lhs =exp(y(1))^(-params(4));
rhs =T1330404427*T1330404435;
residual(2)= lhs-rhs;
lhs =y(3);
rhs =params(5)*y(3)+x(1);
residual(3)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(3, 3);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+exp(y(1));
  g1(1, 2)=  g1(1, 2)+exp(y(2));
  g1(1, 2)=  g1(1, 2)+(-((1.0-params(3))*exp(y(2))+T1330404458));
  g1(1, 3)=  g1(1, 3)+(-(exp(y(3))*exp(y(2))^params(1)));
  g1(2, 1)=  g1(2, 1)+T1330404447;
  g1(2, 2)=  g1(2, 2)+(-(T1330404427*params(1)*exp(y(3))*T1330404451));
  g1(2, 1)=  g1(2, 1)+(-(T1330404435*T1330404465));
  g1(2, 3)=  g1(2, 3)+(-(T1330404427*T1330404433));
  g1(3, 3)=  g1(3, 3)+1.0;
  g1(3, 3)=  g1(3, 3)+(-params(5));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
