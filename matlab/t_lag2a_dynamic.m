function [residual, g1, g2] = t_lag2a_dynamic(y, x)
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

residual = zeros(7, 1);
T1129268341 = y(6)*exp(y(10))/(exp(y(14))*y(13));
T1129268348 = params(3)*exp(y(14))*y(12)+y(7)*(1.0-params(4));
T1129268356 = exp(y(8))*y(1)^params(3);
T1129268357 = y(9)^(1.0-params(3));
T1129268358 = T1129268356*T1129268357;
T1129268386 = exp(y(14))*y(13)*exp(y(14))*y(13);
T1129268387 = exp(y(10))*exp(y(14))*y(13)/T1129268386;
T1129268406 = y(6)*exp(y(10))*exp(y(14))*y(13)/T1129268386;
T1129268412 = (-(y(6)*exp(y(10))*exp(y(14))*y(13)))/T1129268386;
T1129268420 = (-(y(6)*exp(y(10))*exp(y(14))))/T1129268386;
T1129268433 = (-(T1129268357*exp(y(8))*params(3)*y(1)^(params(3)-1.0)));
lhs =y(6)*params(5)*y(9)^(1.0+params(6));
rhs =(1.0-params(3))*y(5);
residual(1)= lhs-rhs;
lhs =y(7);
rhs =params(1)*T1129268341*T1129268348;
residual(2)= lhs-rhs;
lhs =y(5);
rhs =T1129268358;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =exp(y(10))*(y(5)-y(6))+(1.0-params(4))*y(1);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =params(2)*y(2)+params(7)*y(4)+x(it_, 1);
residual(5)= lhs-rhs;
lhs =y(10);
rhs =y(2)*params(7)+params(2)*y(4)+x(it_, 2);
residual(6)= lhs-rhs;
lhs =y(11);
rhs =y(3);
residual(7)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(7, 16);

	% 
	% Jacobian matrix
	% 

  g1(1, 6)=  g1(1, 6)+params(5)*y(9)^(1.0+params(6));
  g1(1, 9)=  g1(1, 9)+y(6)*params(5)*(1.0+params(6))*y(9)^(1.0+params(6)-1.0);
  g1(1, 5)=  g1(1, 5)+(-(1.0-params(3)));
  g1(2, 6)=  g1(2, 6)+(-(params(1)*T1129268348*T1129268387));
  g1(2, 7)=  g1(2, 7)+1.0-params(1)*T1129268341*(1.0-params(4));
  g1(2, 10)=  g1(2, 10)+(-(params(1)*T1129268348*T1129268406));
  g1(2, 14)=  g1(2, 14)+(-(params(1)*(T1129268348*T1129268412+T1129268341*params(3)*exp(y(14))*y(12))));
  g1(2, 13)=  g1(2, 13)+(-(params(1)*T1129268348*T1129268420));
  g1(2, 12)=  g1(2, 12)+(-(params(1)*T1129268341*params(3)*exp(y(14))));
  g1(3, 9)=  g1(3, 9)+(-(T1129268356*(1.0-params(3))*y(9)^(1.0-params(3)-1.0)));
  g1(3, 5)=  g1(3, 5)+1.0;
  g1(3, 8)=  g1(3, 8)+(-T1129268358);
  g1(3, 1)=  g1(3, 1)+T1129268433;
  g1(4, 6)=  g1(4, 6)+exp(y(10));
  g1(4, 5)=  g1(4, 5)+(-exp(y(10)));
  g1(4, 7)=  g1(4, 7)+1.0;
  g1(4, 10)=  g1(4, 10)+(-(exp(y(10))*(y(5)-y(6))));
  g1(4, 1)=  g1(4, 1)+(-(1.0-params(4)));
  g1(5, 8)=  g1(5, 8)+1.0;
  g1(5, 2)=  g1(5, 2)+(-params(2));
  g1(5, 4)=  g1(5, 4)+(-params(7));
  g1(5, 15)=  g1(5, 15)+(-1.0);
  g1(6, 10)=  g1(6, 10)+1.0;
  g1(6, 2)=  g1(6, 2)+(-params(7));
  g1(6, 4)=  g1(6, 4)+(-params(2));
  g1(6, 16)=  g1(6, 16)+(-1.0);
  g1(7, 11)=  g1(7, 11)+1.0;
  g1(7, 3)=  g1(7, 3)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],7, 256, 1280);

	% 
	% Hessian matrix
	% 

  g2(1, 134) = params(5)*(1.0+params(6))*y(9)^(1.0+params(6)-1.0);
  g2(1, 137) = y(6)*params(5)*(1.0+params(6))*(1.0+params(6)-1.0)*y(9)^(1.0+params(6)-1.0-1.0);
  g2(2, 102) = (-(params(1)*(1.0-params(4))*T1129268387));
  g2(2, 150) = (-(params(1)*T1129268348*exp(y(10))*exp(y(14))*y(13)*T1129268386/(T1129268386*T1129268386)));
  g2(2, 151) = (-(params(1)*(1.0-params(4))*T1129268406));
  g2(2, 154) = (-(params(1)*T1129268348*T1129268386*y(6)*exp(y(10))*exp(y(14))*y(13)/(T1129268386*T1129268386)));
  g2(2, 214) = (-(params(1)*(T1129268348*T1129268386*(-(exp(y(10))*exp(y(14))*y(13)))/(T1129268386*T1129268386)+params(3)*exp(y(14))*y(12)*T1129268387)));
  g2(2, 215) = (-(params(1)*(1.0-params(4))*T1129268412));
  g2(2, 218) = (-(params(1)*(T1129268348*T1129268386*(-(y(6)*exp(y(10))*exp(y(14))*y(13)))/(T1129268386*T1129268386)+params(3)*exp(y(14))*y(12)*T1129268406)));
  g2(2, 222) = (-(params(1)*(params(3)*exp(y(14))*y(12)*T1129268412+T1129268348*(T1129268386*(-(y(6)*exp(y(10))*exp(y(14))*y(13)))-(-(y(6)*exp(y(10))*exp(y(14))*y(13)))*(T1129268386+T1129268386))/(T1129268386*T1129268386)+T1129268341*params(3)*exp(y(14))*y(12)+params(3)*exp(y(14))*y(12)*T1129268412)));
  g2(2, 198) = (-(params(1)*T1129268348*T1129268386*(-(exp(y(10))*exp(y(14))))/(T1129268386*T1129268386)));
  g2(2, 199) = (-(params(1)*(1.0-params(4))*T1129268420));
  g2(2, 202) = (-(params(1)*T1129268348*T1129268386*(-(y(6)*exp(y(10))*exp(y(14))))/(T1129268386*T1129268386)));
  g2(2, 206) = (-(params(1)*(params(3)*exp(y(14))*y(12)*T1129268420+T1129268348*(T1129268386*(-(y(6)*exp(y(10))*exp(y(14))))-(-(y(6)*exp(y(10))*exp(y(14))))*(T1129268386+T1129268386))/(T1129268386*T1129268386))));
  g2(2, 205) = (-(params(1)*T1129268348*(-((-(y(6)*exp(y(10))*exp(y(14))))*(exp(y(14))*exp(y(14))*y(13)+exp(y(14))*exp(y(14))*y(13))))/(T1129268386*T1129268386)));
  g2(2, 182) = (-(params(1)*params(3)*exp(y(14))*T1129268387));
  g2(2, 186) = (-(params(1)*params(3)*exp(y(14))*T1129268406));
  g2(2, 190) = (-(params(1)*(T1129268341*params(3)*exp(y(14))+params(3)*exp(y(14))*T1129268412)));
  g2(2, 189) = (-(params(1)*params(3)*exp(y(14))*T1129268420));
  g2(3, 137) = (-(T1129268356*(1.0-params(3))*(1.0-params(3)-1.0)*y(9)^(1.0-params(3)-1.0-1.0)));
  g2(3, 121) = (-(T1129268356*(1.0-params(3))*y(9)^(1.0-params(3)-1.0)));
  g2(3, 120) = (-T1129268358);
  g2(3, 9) = (-((1.0-params(3))*y(9)^(1.0-params(3)-1.0)*exp(y(8))*params(3)*y(1)^(params(3)-1.0)));
  g2(3, 8) = T1129268433;
  g2(3, 1) = (-(T1129268357*exp(y(8))*params(3)*(params(3)-1.0)*y(1)^(params(3)-1.0-1.0)));
  g2(4, 150) = exp(y(10));
  g2(4, 149) = (-exp(y(10)));
  g2(4, 154) = (-(exp(y(10))*(y(5)-y(6))));
  g2(1, 89) = g2(1, 134);
  g2(2, 87) = g2(2, 102);
  g2(2, 90) = g2(2, 150);
  g2(2, 106) = g2(2, 151);
  g2(2, 94) = g2(2, 214);
  g2(2, 110) = g2(2, 215);
  g2(2, 158) = g2(2, 218);
  g2(2, 93) = g2(2, 198);
  g2(2, 109) = g2(2, 199);
  g2(2, 157) = g2(2, 202);
  g2(2, 221) = g2(2, 206);
  g2(2, 92) = g2(2, 182);
  g2(2, 156) = g2(2, 186);
  g2(2, 220) = g2(2, 190);
  g2(2, 204) = g2(2, 189);
  g2(3, 136) = g2(3, 121);
  g2(3, 129) = g2(3, 9);
  g2(3, 113) = g2(3, 8);
  g2(4, 90) = g2(4, 150);
  g2(4, 74) = g2(4, 149);
end;