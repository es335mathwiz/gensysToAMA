function [residual, g1, g2] = ireland_loglin_dynamic(y, x)
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

residual = zeros(9, 1);
T997351791 = params(5)/params(1);
T997351794 = T997351791-1.0+params(2);
YK = T997351794/params(3);
IK = params(2)+params(5)-1.0;
HS = log((1.0-params(3))/params(6)/(1.0-IK/YK));
YS = log(params(7)^(1.0/(1.0-params(3)))*(1.0/YK)^(params(3)/(1.0-params(3))))+HS;
KS = log(1.0/YK)+YS;
IS = log(params(2)+params(5)-1.0)+KS;
CS = log(exp(YS)-exp(IS));
lhs =y(3);
rhs =y(4)+params(3)*y(2)+(1.0-params(3))*y(8);
residual(1)= lhs-rhs;
lhs =y(4);
rhs =params(4)*y(1)+x(it_, 1);
residual(2)= lhs-rhs;
lhs =T997351794*y(3);
rhs =(T997351794-params(3)*(params(2)+params(5)-1.0))*y(6)+params(3)*(params(2)+params(5)-1.0)*y(7);
residual(3)= lhs-rhs;
lhs =params(5)*y(5);
rhs =y(2)*(1.0-params(2))+(params(2)+params(5)-1.0)*y(7);
residual(4)= lhs-rhs;
lhs =y(3);
rhs =y(8)+y(6);
residual(5)= lhs-rhs;
lhs =T997351791*y(6);
rhs =T997351791*y(13)-T997351794*y(12)+T997351794*y(5);
residual(6)= lhs-rhs;
lhs =y(9);
rhs =YS+y(3);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =y(6)+CS;
residual(8)= lhs-rhs;
lhs =y(11);
rhs =HS+y(8);
residual(9)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(9, 14);

	% 
	% Jacobian matrix
	% 

  g1(1, 3)=  g1(1, 3)+1.0;
  g1(1, 4)=  g1(1, 4)+(-1.0);
  g1(1, 2)=  g1(1, 2)+(-params(3));
  g1(1, 8)=  g1(1, 8)+(-(1.0-params(3)));
  g1(2, 4)=  g1(2, 4)+1.0;
  g1(2, 1)=  g1(2, 1)+(-params(4));
  g1(2, 14)=  g1(2, 14)+(-1.0);
  g1(3, 3)=  g1(3, 3)+T997351794;
  g1(3, 6)=  g1(3, 6)+(-(T997351794-params(3)*(params(2)+params(5)-1.0)));
  g1(3, 7)=  g1(3, 7)+(-(params(3)*(params(2)+params(5)-1.0)));
  g1(4, 2)=  g1(4, 2)+(-(1.0-params(2)));
  g1(4, 7)=  g1(4, 7)+(-(params(2)+params(5)-1.0));
  g1(4, 5)=  g1(4, 5)+params(5);
  g1(5, 3)=  g1(5, 3)+1.0;
  g1(5, 8)=  g1(5, 8)+(-1.0);
  g1(5, 6)=  g1(5, 6)+(-1.0);
  g1(6, 6)=  g1(6, 6)+T997351791;
  g1(6, 5)=  g1(6, 5)+(-T997351794);
  g1(6, 13)=  g1(6, 13)+(-T997351791);
  g1(6, 12)=  g1(6, 12)+T997351794;
  g1(7, 3)=  g1(7, 3)+(-1.0);
  g1(7, 9)=  g1(7, 9)+1.0;
  g1(8, 6)=  g1(8, 6)+(-1.0);
  g1(8, 10)=  g1(8, 10)+1.0;
  g1(9, 8)=  g1(9, 8)+(-1.0);
  g1(9, 11)=  g1(9, 11)+1.0;
end
if nargout >= 3,
  g2 = sparse([],[],[],9, 196, 980);

	% 
	% Hessian matrix
	% 

end;
