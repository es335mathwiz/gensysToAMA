function [residual, g1, g2] = t_lag2_dynamic(y, x)
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

residual = zeros(6, 1);
T1129268341 = y(5)*exp(y(9))/(exp(y(12))*y(11));
T1129268348 = params(3)*exp(y(12))*y(10)+y(6)*(1.0-params(4));
T1129268356 = exp(y(7))*y(2)^params(3);
T1129268357 = y(8)^(1.0-params(3));
T1129268358 = T1129268356*T1129268357;
T1129268383 = exp(y(12))*y(11)*exp(y(12))*y(11);
T1129268384 = exp(y(9))*exp(y(12))*y(11)/T1129268383;
T1129268403 = y(5)*exp(y(9))*exp(y(12))*y(11)/T1129268383;
T1129268409 = (-(y(5)*exp(y(9))*exp(y(12))*y(11)))/T1129268383;
T1129268417 = (-(y(5)*exp(y(9))*exp(y(12))))/T1129268383;
T1129268430 = (-(T1129268357*exp(y(7))*params(3)*y(2)^(params(3)-1.0)));
lhs =y(5)*params(5)*y(8)^(1.0+params(6));
rhs =(1.0-params(3))*y(4);
residual(1)= lhs-rhs;
lhs =y(6);
rhs =params(1)*T1129268341*T1129268348;
residual(2)= lhs-rhs;
lhs =y(4);
rhs =T1129268358;
residual(3)= lhs-rhs;
lhs =y(6);
rhs =exp(y(9))*(y(4)-y(5))+(1.0-params(4))*y(2);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =params(2)*y(3)+params(7)*y(1)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(3)*params(7)+params(2)*y(1)+x(it_, 2);
residual(6)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(6, 14);

	% 
	% Jacobian matrix
	% 

  g1(1, 5)=  g1(1, 5)+params(5)*y(8)^(1.0+params(6));
  g1(1, 8)=  g1(1, 8)+y(5)*params(5)*(1.0+params(6))*y(8)^(1.0+params(6)-1.0);
  g1(1, 4)=  g1(1, 4)+(-(1.0-params(3)));
  g1(2, 5)=  g1(2, 5)+(-(params(1)*T1129268348*T1129268384));
  g1(2, 6)=  g1(2, 6)+1.0-params(1)*T1129268341*(1.0-params(4));
  g1(2, 9)=  g1(2, 9)+(-(params(1)*T1129268348*T1129268403));
  g1(2, 12)=  g1(2, 12)+(-(params(1)*(T1129268348*T1129268409+T1129268341*params(3)*exp(y(12))*y(10))));
  g1(2, 11)=  g1(2, 11)+(-(params(1)*T1129268348*T1129268417));
  g1(2, 10)=  g1(2, 10)+(-(params(1)*T1129268341*params(3)*exp(y(12))));
  g1(3, 8)=  g1(3, 8)+(-(T1129268356*(1.0-params(3))*y(8)^(1.0-params(3)-1.0)));
  g1(3, 4)=  g1(3, 4)+1.0;
  g1(3, 7)=  g1(3, 7)+(-T1129268358);
  g1(3, 2)=  g1(3, 2)+T1129268430;
  g1(4, 5)=  g1(4, 5)+exp(y(9));
  g1(4, 4)=  g1(4, 4)+(-exp(y(9)));
  g1(4, 6)=  g1(4, 6)+1.0;
  g1(4, 9)=  g1(4, 9)+(-(exp(y(9))*(y(4)-y(5))));
  g1(4, 2)=  g1(4, 2)+(-(1.0-params(4)));
  g1(5, 7)=  g1(5, 7)+1.0;
  g1(5, 3)=  g1(5, 3)+(-params(2));
  g1(5, 1)=  g1(5, 1)+(-params(7));
  g1(5, 13)=  g1(5, 13)+(-1.0);
  g1(6, 9)=  g1(6, 9)+1.0;
  g1(6, 3)=  g1(6, 3)+(-params(7));
  g1(6, 1)=  g1(6, 1)+(-params(2));
  g1(6, 14)=  g1(6, 14)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],6, 196, 980);

	% 
	% Hessian matrix
	% 

  g2(1, 103) = params(5)*(1.0+params(6))*y(8)^(1.0+params(6)-1.0);
  g2(1, 106) = y(5)*params(5)*(1.0+params(6))*(1.0+params(6)-1.0)*y(8)^(1.0+params(6)-1.0-1.0);
  g2(2, 75) = (-(params(1)*(1.0-params(4))*T1129268384));
  g2(2, 117) = (-(params(1)*T1129268348*exp(y(9))*exp(y(12))*y(11)*T1129268383/(T1129268383*T1129268383)));
  g2(2, 118) = (-(params(1)*(1.0-params(4))*T1129268403));
  g2(2, 121) = (-(params(1)*T1129268348*T1129268383*y(5)*exp(y(9))*exp(y(12))*y(11)/(T1129268383*T1129268383)));
  g2(2, 159) = (-(params(1)*(T1129268348*T1129268383*(-(exp(y(9))*exp(y(12))*y(11)))/(T1129268383*T1129268383)+params(3)*exp(y(12))*y(10)*T1129268384)));
  g2(2, 160) = (-(params(1)*(1.0-params(4))*T1129268409));
  g2(2, 163) = (-(params(1)*(T1129268348*T1129268383*(-(y(5)*exp(y(9))*exp(y(12))*y(11)))/(T1129268383*T1129268383)+params(3)*exp(y(12))*y(10)*T1129268403)));
  g2(2, 166) = (-(params(1)*(params(3)*exp(y(12))*y(10)*T1129268409+T1129268348*(T1129268383*(-(y(5)*exp(y(9))*exp(y(12))*y(11)))-(-(y(5)*exp(y(9))*exp(y(12))*y(11)))*(T1129268383+T1129268383))/(T1129268383*T1129268383)+T1129268341*params(3)*exp(y(12))*y(10)+params(3)*exp(y(12))*y(10)*T1129268409)));
  g2(2, 145) = (-(params(1)*T1129268348*T1129268383*(-(exp(y(9))*exp(y(12))))/(T1129268383*T1129268383)));
  g2(2, 146) = (-(params(1)*(1.0-params(4))*T1129268417));
  g2(2, 149) = (-(params(1)*T1129268348*T1129268383*(-(y(5)*exp(y(9))*exp(y(12))))/(T1129268383*T1129268383)));
  g2(2, 152) = (-(params(1)*(params(3)*exp(y(12))*y(10)*T1129268417+T1129268348*(T1129268383*(-(y(5)*exp(y(9))*exp(y(12))))-(-(y(5)*exp(y(9))*exp(y(12))))*(T1129268383+T1129268383))/(T1129268383*T1129268383))));
  g2(2, 151) = (-(params(1)*T1129268348*(-((-(y(5)*exp(y(9))*exp(y(12))))*(exp(y(12))*exp(y(12))*y(11)+exp(y(12))*exp(y(12))*y(11))))/(T1129268383*T1129268383)));
  g2(2, 131) = (-(params(1)*params(3)*exp(y(12))*T1129268384));
  g2(2, 135) = (-(params(1)*params(3)*exp(y(12))*T1129268403));
  g2(2, 138) = (-(params(1)*(T1129268341*params(3)*exp(y(12))+params(3)*exp(y(12))*T1129268409)));
  g2(2, 137) = (-(params(1)*params(3)*exp(y(12))*T1129268417));
  g2(3, 106) = (-(T1129268356*(1.0-params(3))*(1.0-params(3)-1.0)*y(8)^(1.0-params(3)-1.0-1.0)));
  g2(3, 92) = (-(T1129268356*(1.0-params(3))*y(8)^(1.0-params(3)-1.0)));
  g2(3, 91) = (-T1129268358);
  g2(3, 22) = (-((1.0-params(3))*y(8)^(1.0-params(3)-1.0)*exp(y(7))*params(3)*y(2)^(params(3)-1.0)));
  g2(3, 21) = T1129268430;
  g2(3, 16) = (-(T1129268357*exp(y(7))*params(3)*(params(3)-1.0)*y(2)^(params(3)-1.0-1.0)));
  g2(4, 117) = exp(y(9));
  g2(4, 116) = (-exp(y(9)));
  g2(4, 121) = (-(exp(y(9))*(y(4)-y(5))));
  g2(1, 64) = g2(1, 103);
  g2(2, 62) = g2(2, 75);
  g2(2, 65) = g2(2, 117);
  g2(2, 79) = g2(2, 118);
  g2(2, 68) = g2(2, 159);
  g2(2, 82) = g2(2, 160);
  g2(2, 124) = g2(2, 163);
  g2(2, 67) = g2(2, 145);
  g2(2, 81) = g2(2, 146);
  g2(2, 123) = g2(2, 149);
  g2(2, 165) = g2(2, 152);
  g2(2, 66) = g2(2, 131);
  g2(2, 122) = g2(2, 135);
  g2(2, 164) = g2(2, 138);
  g2(2, 150) = g2(2, 137);
  g2(3, 105) = g2(3, 92);
  g2(3, 100) = g2(3, 22);
  g2(3, 86) = g2(3, 21);
  g2(4, 65) = g2(4, 117);
  g2(4, 51) = g2(4, 116);
end;
