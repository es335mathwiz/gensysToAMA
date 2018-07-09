function [residual, g1, g2] = t_periods_a_dynamic(y, x)
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
T1330404424 = (1.0+params(4))^(-1.0);
T1330404433 = T1330404424*(1.0+params(5)*params(1)*x(it_ + 1, 1)*y(3)^(params(1)-1.0)-params(3));
T1330404435 = y(4)^(-params(2));
T1330404446 = T1330404424*params(5)*params(1)*x(it_ + 1, 1)*(params(1)-1.0)*y(3)^(params(1)-1.0-1.0);
T1330404461 = (-params(2))*y(4)^((-params(2))-1.0);
lhs =y(2)+y(3)-params(5)*x(it_, 1)*y(1)^params(1)-y(1)*(1.0-params(3));
rhs =0.0;
residual(1)= lhs-rhs;
lhs =y(2)^(-params(2))-T1330404433*T1330404435;
rhs =0.0;
residual(2)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(2, 5);

	% 
	% Jacobian matrix
	% 

  g1(1, 2)=  g1(1, 2)+1.0;
  g1(1, 3)=  g1(1, 3)+1.0;
  g1(1, 5)=  g1(1, 5)+(-(params(5)*y(1)^params(1)));
  g1(1, 1)=  g1(1, 1)+(-(params(5)*x(it_, 1)*params(1)*y(1)^(params(1)-1.0)))-(1.0-params(3));
  g1(2, 2)=  g1(2, 2)+(-params(2))*y(2)^((-params(2))-1.0);
  g1(2, 3)=  g1(2, 3)+(-(T1330404435*T1330404446));
  g1(2, 6)=  g1(2, 6)+(-(T1330404435*T1330404424*params(5)*params(1)*y(3)^(params(1)-1.0)));
  g1(2, 4)=  g1(2, 4)+(-(T1330404433*T1330404461));
end
if nargout >= 3,
  g2 = sparse([],[],[],2, 25, 125);

	% 
	% Hessian matrix
	% 

  g2(1, 5) = (-(params(5)*params(1)*y(1)^(params(1)-1.0)));
  g2(1, 1) = (-(params(5)*x(it_, 1)*params(1)*(params(1)-1.0)*y(1)^(params(1)-1.0-1.0)));
  g2(2, 7) = (-params(2))*((-params(2))-1.0)*y(2)^((-params(2))-1.0-1.0);
  g2(2, 13) = (-(T1330404435*T1330404424*params(5)*params(1)*x(it_ + 1, 1)*(params(1)-1.0)*(params(1)-1.0-1.0)*y(3)^(params(1)-1.0-1.0-1.0)));
  g2(2, 28) = (-(T1330404435*T1330404424*params(5)*params(1)*(params(1)-1.0)*y(3)^(params(1)-1.0-1.0)));
  g2(2, 18) = (-(T1330404446*T1330404461));
  g2(2, 21) = (-(T1330404424*params(5)*params(1)*y(3)^(params(1)-1.0)*T1330404461));
  g2(2, 19) = (-(T1330404433*(-params(2))*((-params(2))-1.0)*y(4)^((-params(2))-1.0-1.0)));
  g2(1, 21) = g2(1, 5);
  g2(2, 16) = g2(2, 28);
  g2(2, 14) = g2(2, 18);
  g2(2, 29) = g2(2, 21);
end;
