function [residual, g1, g2] = t_sgu_ex1_dynamic(y, x)
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
T1330404427 = params(2)*exp(y(6))^(-params(4));
T1330404433 = params(1)*exp(y(7))*exp(y(4))^(params(1)-1.0);
T1330404435 = 1.0+T1330404433-params(3);
T1330404447 = exp(y(3))*(-params(4))*exp(y(3))^((-params(4))-1.0);
T1330404451 = exp(y(4))*(params(1)-1.0)*exp(y(4))^(params(1)-1.0-1.0);
T1330404458 = exp(y(5))*exp(y(1))*params(1)*exp(y(1))^(params(1)-1.0);
T1330404464 = exp(y(6))*(-params(4))*exp(y(6))^((-params(4))-1.0);
T1330404465 = params(2)*T1330404464;
lhs =exp(y(3))+exp(y(4));
rhs =(1.0-params(3))*exp(y(1))+exp(y(5))*exp(y(1))^params(1);
residual(1)= lhs-rhs;
lhs =exp(y(3))^(-params(4));
rhs =T1330404427*T1330404435;
residual(2)= lhs-rhs;
lhs =y(5);
rhs =params(5)*y(2)+x(it_, 1);
residual(3)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(3, 8);

	% 
	% Jacobian matrix
	% 

  g1(1, 3)=  g1(1, 3)+exp(y(3));
  g1(1, 4)=  g1(1, 4)+exp(y(4));
  g1(1, 1)=  g1(1, 1)+(-((1.0-params(3))*exp(y(1))+T1330404458));
  g1(1, 5)=  g1(1, 5)+(-(exp(y(5))*exp(y(1))^params(1)));
  g1(2, 3)=  g1(2, 3)+T1330404447;
  g1(2, 4)=  g1(2, 4)+(-(T1330404427*params(1)*exp(y(7))*T1330404451));
  g1(2, 6)=  g1(2, 6)+(-(T1330404435*T1330404465));
  g1(2, 7)=  g1(2, 7)+(-(T1330404427*T1330404433));
  g1(3, 5)=  g1(3, 5)+1.0;
  g1(3, 2)=  g1(3, 2)+(-params(5));
  g1(3, 8)=  g1(3, 8)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],3, 64, 320);

	% 
	% Hessian matrix
	% 

  g2(1, 19) = exp(y(3));
  g2(1, 28) = exp(y(4));
  g2(1, 1) = (-((1.0-params(3))*exp(y(1))+exp(y(5))*(exp(y(1))*params(1)*exp(y(1))^(params(1)-1.0)+exp(y(1))*params(1)*exp(y(1))*(params(1)-1.0)*exp(y(1))^(params(1)-1.0-1.0))));
  g2(1, 33) = (-T1330404458);
  g2(1, 37) = (-(exp(y(5))*exp(y(1))^params(1)));
  g2(2, 19) = T1330404447+exp(y(3))*(-params(4))*exp(y(3))*((-params(4))-1.0)*exp(y(3))^((-params(4))-1.0-1.0);
  g2(2, 28) = (-(T1330404427*params(1)*exp(y(7))*(T1330404451+exp(y(4))*(params(1)-1.0)*exp(y(4))*(params(1)-1.0-1.0)*exp(y(4))^(params(1)-1.0-1.0-1.0))));
  g2(2, 44) = (-(params(1)*exp(y(7))*T1330404451*T1330404465));
  g2(2, 46) = (-(T1330404435*params(2)*(T1330404464+exp(y(6))*(-params(4))*exp(y(6))*((-params(4))-1.0)*exp(y(6))^((-params(4))-1.0-1.0))));
  g2(2, 52) = (-(T1330404427*params(1)*exp(y(7))*T1330404451));
  g2(2, 54) = (-(T1330404433*T1330404465));
  g2(2, 55) = (-(T1330404427*T1330404433));
  g2(1, 5) = g2(1, 33);
  g2(2, 30) = g2(2, 44);
  g2(2, 31) = g2(2, 52);
  g2(2, 47) = g2(2, 54);
end;
