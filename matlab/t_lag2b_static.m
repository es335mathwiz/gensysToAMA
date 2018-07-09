function [residual, g1, g2] = t_lag2b_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 7, 1);

	% 
	% Model equations
	% 

T1129268341 = y(2)*exp(y(6))/(exp(y(6))*y(2));
T1129268348 = params(3)*exp(y(6))*y(1)+y(3)*(1.0-params(4));
T1129268356 = exp(y(4))*y(3)^params(3);
T1129268357 = y(5)^(1.0-params(3));
T1129268358 = T1129268356*T1129268357;
T1129268386 = exp(y(6))*y(2)*exp(y(6))*y(2);
T1129268387 = exp(y(6))*exp(y(6))*y(2)/T1129268386;
T1129268406 = y(2)*exp(y(6))*exp(y(6))*y(2)/T1129268386;
T1129268412 = (-(y(2)*exp(y(6))*exp(y(6))*y(2)))/T1129268386;
T1129268420 = (-(y(2)*exp(y(6))*exp(y(6))))/T1129268386;
T1129268433 = (-(T1129268357*exp(y(4))*params(3)*y(3)^(params(3)-1.0)));
lhs =y(2)*params(5)*y(5)^(1.0+params(6));
rhs =(1.0-params(3))*y(1);
residual(1)= lhs-rhs;
lhs =y(3);
rhs =params(1)*T1129268341*T1129268348;
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T1129268358;
residual(3)= lhs-rhs;
lhs =y(3);
rhs =exp(y(6))*(y(1)-y(2))+(1.0-params(4))*y(3);
residual(4)= lhs-rhs;
lhs =y(4);
rhs =params(2)*y(4)+params(7)*y(7)+x(1);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(4)*params(7)+params(2)*y(7)+x(2);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =y(6);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

	% 
	% Jacobian matrix
	% 

  g1(1, 2)=  g1(1, 2)+params(5)*y(5)^(1.0+params(6));
  g1(1, 5)=  g1(1, 5)+y(2)*params(5)*(1.0+params(6))*y(5)^(1.0+params(6)-1.0);
  g1(1, 1)=  g1(1, 1)+(-(1.0-params(3)));
  g1(2, 2)=  g1(2, 2)+(-(params(1)*T1129268348*T1129268387));
  g1(2, 3)=  g1(2, 3)+1.0-params(1)*T1129268341*(1.0-params(4));
  g1(2, 6)=  g1(2, 6)+(-(params(1)*T1129268348*T1129268406));
  g1(2, 6)=  g1(2, 6)+(-(params(1)*(T1129268348*T1129268412+T1129268341*params(3)*exp(y(6))*y(1))));
  g1(2, 2)=  g1(2, 2)+(-(params(1)*T1129268348*T1129268420));
  g1(2, 1)=  g1(2, 1)+(-(params(1)*T1129268341*params(3)*exp(y(6))));
  g1(3, 5)=  g1(3, 5)+(-(T1129268356*(1.0-params(3))*y(5)^(1.0-params(3)-1.0)));
  g1(3, 1)=  g1(3, 1)+1.0;
  g1(3, 4)=  g1(3, 4)+(-T1129268358);
  g1(3, 3)=  g1(3, 3)+T1129268433;
  g1(4, 2)=  g1(4, 2)+exp(y(6));
  g1(4, 1)=  g1(4, 1)+(-exp(y(6)));
  g1(4, 3)=  g1(4, 3)+1.0;
  g1(4, 6)=  g1(4, 6)+(-(exp(y(6))*(y(1)-y(2))));
  g1(4, 3)=  g1(4, 3)+(-(1.0-params(4)));
  g1(5, 4)=  g1(5, 4)+1.0;
  g1(5, 4)=  g1(5, 4)+(-params(2));
  g1(5, 7)=  g1(5, 7)+(-params(7));
  g1(6, 6)=  g1(6, 6)+1.0;
  g1(6, 4)=  g1(6, 4)+(-params(7));
  g1(6, 7)=  g1(6, 7)+(-params(2));
  g1(7, 7)=  g1(7, 7)+1.0;
  g1(7, 6)=  g1(7, 6)+(-1.0);
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
