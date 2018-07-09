function [residual, g1, g2] = variance_0_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 6, 1);

	% 
	% Model equations
	% 

T1330404425 = y(2)*exp(y(6))/(exp(y(6))*y(2));
T1330404432 = params(3)*exp(y(6))*y(1)+y(3)*(1.0-params(4));
T1330404440 = exp(y(4))*y(3)^params(3);
T1330404441 = y(5)^(1.0-params(3));
T1330404442 = T1330404440*T1330404441;
T1330404467 = exp(y(6))*y(2)*exp(y(6))*y(2);
T1330404468 = exp(y(6))*exp(y(6))*y(2)/T1330404467;
T1330404487 = y(2)*exp(y(6))*exp(y(6))*y(2)/T1330404467;
T1330404493 = (-(y(2)*exp(y(6))*exp(y(6))*y(2)))/T1330404467;
T1330404501 = (-(y(2)*exp(y(6))*exp(y(6))))/T1330404467;
T1330404514 = (-(T1330404441*exp(y(4))*params(3)*y(3)^(params(3)-1.0)));
lhs =y(2)*params(5)*y(5)^(1.0+params(6));
rhs =(1.0-params(3))*y(1);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =params(1)*T1330404425*T1330404432;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T1330404442;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =exp(y(6))*(y(1)-y(2))+(1.0-params(4))*y(3);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =params(2)*y(4)+params(7)*y(6)+x(1);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(4)*params(7)+params(2)*y(6)+x(2);
residual(6)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(6, 6);

	% 
	% Jacobian matrix
	% 

  g1(1, 2)=  g1(1, 2)+params(5)*y(5)^(1.0+params(6));
  g1(1, 5)=  g1(1, 5)+y(2)*params(5)*(1.0+params(6))*y(5)^(1.0+params(6)-1.0);
  g1(1, 1)=  g1(1, 1)+(-(1.0-params(3)));
  g1(2, 2)=  g1(2, 2)+(-(params(1)*T1330404432*T1330404468));
  g1(2, 3)=  g1(2, 3)+1.0-params(1)*T1330404425*(1.0-params(4));
  g1(2, 6)=  g1(2, 6)+(-(params(1)*T1330404432*T1330404487));
  g1(2, 6)=  g1(2, 6)+(-(params(1)*(T1330404432*T1330404493+T1330404425*params(3)*exp(y(6))*y(1))));
  g1(2, 2)=  g1(2, 2)+(-(params(1)*T1330404432*T1330404501));
  g1(2, 1)=  g1(2, 1)+(-(params(1)*T1330404425*params(3)*exp(y(6))));
  g1(3, 5)=  g1(3, 5)+(-(T1330404440*(1.0-params(3))*y(5)^(1.0-params(3)-1.0)));
  g1(3, 1)=  g1(3, 1)+1.0;
  g1(3, 4)=  g1(3, 4)+(-T1330404442);
  g1(3, 3)=  g1(3, 3)+T1330404514;
  g1(4, 2)=  g1(4, 2)+exp(y(6));
  g1(4, 1)=  g1(4, 1)+(-exp(y(6)));
  g1(4, 3)=  g1(4, 3)+1.0;
  g1(4, 6)=  g1(4, 6)+(-(exp(y(6))*(y(1)-y(2))));
  g1(4, 3)=  g1(4, 3)+(-(1.0-params(4)));
  g1(5, 4)=  g1(5, 4)+1.0;
  g1(5, 4)=  g1(5, 4)+(-params(2));
  g1(5, 6)=  g1(5, 6)+(-params(7));
  g1(6, 6)=  g1(6, 6)+1.0;
  g1(6, 4)=  g1(6, 4)+(-params(7));
  g1(6, 6)=  g1(6, 6)+(-params(2));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
