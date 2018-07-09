function [residual, g1, g2] = rbc_static( y, x )
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

T1129268324 = params(1)*1.0/y(2);
T1129268329 = params(4)*y(3)^(params(4)-1.0);
T1129268335 = (exp(y(7))*y(5))^(1.0-params(4));
T1129268339 = 1.0+T1129268329*T1129268335-params(3);
T1129268348 = y(3)^params(4);
T1129268352 = exp(y(7))^(1.0-params(4));
T1129268353 = (1.0-params(4))*T1129268348*T1129268352;
T1129268355 = y(5)^(-params(4));
T1129268363 = (y(5)*exp(y(7)))^(1.0-params(4));
T1129268386 = params(1)*(-1.0)/(y(2)*y(2));
T1129268392 = params(4)*(params(4)-1.0)*y(3)^(params(4)-1.0-1.0);
T1129268393 = T1129268335*T1129268392;
T1129268399 = exp(y(7))*y(5)*(1.0-params(4))*(exp(y(7))*y(5))^(1.0-params(4)-1.0);
T1129268400 = T1129268329*T1129268399;
T1129268403 = exp(y(7))*(1.0-params(4))*(exp(y(7))*y(5))^(1.0-params(4)-1.0);
T1129268404 = T1129268329*T1129268403;
T1129268411 = (-params(4))*y(5)^((-params(4))-1.0);
T1129268416 = exp(y(7))*(1.0-params(4))*(y(5)*exp(y(7)))^(1.0-params(4)-1.0);
T1129268424 = params(4)*y(3)^(params(4)-1.0);
T1129268426 = T1129268352*(1.0-params(4))*T1129268424;
T1129268434 = exp(y(7))*(1.0-params(4))*exp(y(7))^(1.0-params(4)-1.0);
T1129268435 = (1.0-params(4))*T1129268348*T1129268434;
T1129268438 = y(5)*exp(y(7))*(1.0-params(4))*(y(5)*exp(y(7)))^(1.0-params(4)-1.0);
T1129268472 = (1.0-params(4)-1.0)*(exp(y(7))*y(5))^(1.0-params(4)-1.0-1.0);
T1129268474 = (1.0-params(4))*exp(y(7))*y(5)*T1129268472;
T1129268534 = (1.0-params(4)-1.0)*(y(5)*exp(y(7)))^(1.0-params(4)-1.0-1.0);
T1129268536 = (1.0-params(4))*exp(y(7))*T1129268534;
lhs =1.0/y(2);
rhs =T1129268324*T1129268339;
residual(1)= lhs-rhs;
lhs =y(2)*params(2)/(1.0-y(5));
rhs =T1129268353*T1129268355;
residual(2)= lhs-rhs;
lhs =y(2)+y(4);
rhs =y(1);
residual(3)= lhs-rhs;
lhs =y(1);
rhs =T1129268348*T1129268363;
residual(4)= lhs-rhs;
lhs =y(4);
rhs =y(3)-y(3)*(1.0-params(3));
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(1)/y(5);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =params(5)*y(7)+x(1);
residual(7)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(7, 7);

	% 
	% Jacobian matrix
	% 

  g1(1, 2)=  g1(1, 2)+(-1.0)/(y(2)*y(2));
  g1(1, 2)=  g1(1, 2)+(-(T1129268339*T1129268386));
  g1(1, 3)=  g1(1, 3)+(-(T1129268324*T1129268393));
  g1(1, 7)=  g1(1, 7)+(-(T1129268324*T1129268400));
  g1(1, 5)=  g1(1, 5)+(-(T1129268324*T1129268404));
  g1(2, 2)=  g1(2, 2)+params(2)*(1.0-y(5))/((1.0-y(5))*(1.0-y(5)));
  g1(2, 5)=  g1(2, 5)+y(2)*params(2)/((1.0-y(5))*(1.0-y(5)))-T1129268353*T1129268411;
  g1(2, 3)=  g1(2, 3)+(-(T1129268355*T1129268426));
  g1(2, 7)=  g1(2, 7)+(-(T1129268355*T1129268435));
  g1(3, 2)=  g1(3, 2)+1.0;
  g1(3, 4)=  g1(3, 4)+1.0;
  g1(3, 1)=  g1(3, 1)+(-1.0);
  g1(4, 5)=  g1(4, 5)+(-(T1129268348*T1129268416));
  g1(4, 3)=  g1(4, 3)+(-(T1129268363*T1129268424));
  g1(4, 7)=  g1(4, 7)+(-(T1129268348*T1129268438));
  g1(4, 1)=  g1(4, 1)+1.0;
  g1(5, 3)=  g1(5, 3)+(-1.0);
  g1(5, 3)=  g1(5, 3)+1.0-params(3);
  g1(5, 4)=  g1(5, 4)+1.0;
  g1(6, 5)=  g1(6, 5)+(-((-y(1))/(y(5)*y(5))));
  g1(6, 1)=  g1(6, 1)+(-(y(5)/(y(5)*y(5))));
  g1(6, 6)=  g1(6, 6)+1.0;
  g1(7, 7)=  g1(7, 7)+1.0;
  g1(7, 7)=  g1(7, 7)+(-params(5));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
