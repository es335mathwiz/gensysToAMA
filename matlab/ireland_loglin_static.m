function [residual, g1, g2] = ireland_loglin_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 9, 1);

	% 
	% Model equations
	% 

T997351791 = params(5)/params(1);
T997351794 = T997351791-1.0+params(2);
YK = T997351794/params(3);
IK = params(2)+params(5)-1.0;
HS = log((1.0-params(3))/params(6)/(1.0-IK/YK));
YS = log(params(7)^(1.0/(1.0-params(3)))*(1.0/YK)^(params(3)/(1.0-params(3))))+HS;
KS = log(1.0/YK)+YS;
IS = log(params(2)+params(5)-1.0)+KS;
CS = log(exp(YS)-exp(IS));
lhs =y(1);
rhs =y(2)+params(3)*y(3)+(1.0-params(3))*y(6);
residual(1)= lhs-rhs;
lhs =y(2);
rhs =params(4)*y(2)+x(1);
residual(2)= lhs-rhs;
lhs =T997351794*y(1);
rhs =(T997351794-params(3)*(params(2)+params(5)-1.0))*y(4)+params(3)*(params(2)+params(5)-1.0)*y(5);
residual(3)= lhs-rhs;
lhs =params(5)*y(3);
rhs =y(3)*(1.0-params(2))+(params(2)+params(5)-1.0)*y(5);
residual(4)= lhs-rhs;
lhs =y(1);
rhs =y(6)+y(4);
residual(5)= lhs-rhs;
lhs =T997351791*y(4);
rhs =T997351791*y(4)-T997351794*y(1)+T997351794*y(3);
residual(6)= lhs-rhs;
lhs =y(7);
rhs =YS+y(1);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(4)+CS;
residual(8)= lhs-rhs;
lhs =y(9);
rhs =HS+y(6);
residual(9)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(9, 9);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+1.0;
  g1(1, 2)=  g1(1, 2)+(-1.0);
  g1(1, 3)=  g1(1, 3)+(-params(3));
  g1(1, 6)=  g1(1, 6)+(-(1.0-params(3)));
  g1(2, 2)=  g1(2, 2)+1.0;
  g1(2, 2)=  g1(2, 2)+(-params(4));
  g1(3, 1)=  g1(3, 1)+T997351794;
  g1(3, 4)=  g1(3, 4)+(-(T997351794-params(3)*(params(2)+params(5)-1.0)));
  g1(3, 5)=  g1(3, 5)+(-(params(3)*(params(2)+params(5)-1.0)));
  g1(4, 3)=  g1(4, 3)+(-(1.0-params(2)));
  g1(4, 5)=  g1(4, 5)+(-(params(2)+params(5)-1.0));
  g1(4, 3)=  g1(4, 3)+params(5);
  g1(5, 1)=  g1(5, 1)+1.0;
  g1(5, 6)=  g1(5, 6)+(-1.0);
  g1(5, 4)=  g1(5, 4)+(-1.0);
  g1(6, 4)=  g1(6, 4)+T997351791;
  g1(6, 3)=  g1(6, 3)+(-T997351794);
  g1(6, 4)=  g1(6, 4)+(-T997351791);
  g1(6, 1)=  g1(6, 1)+T997351794;
  g1(7, 1)=  g1(7, 1)+(-1.0);
  g1(7, 7)=  g1(7, 7)+1.0;
  g1(8, 4)=  g1(8, 4)+(-1.0);
  g1(8, 8)=  g1(8, 8)+1.0;
  g1(9, 6)=  g1(9, 6)+(-1.0);
  g1(9, 9)=  g1(9, 9)+1.0;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
