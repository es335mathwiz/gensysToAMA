function [residual, g1, g2] = ehl2000_dynamic(y, x)
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

residual = zeros(12, 1);
lhs =y(5);
rhs =y(17)-params(1)*(y(6)-y(18)+y(19)-y(8));
residual(1)= lhs-rhs;
lhs =y(5);
rhs =y(9)+(1.0-params(5))*y(10);
residual(2)= lhs-rhs;
lhs =y(11);
rhs =y(10)+y(12)-y(5);
residual(3)= lhs-rhs;
lhs =y(13);
rhs =y(8)+y(5)*1.0/params(1)+y(10)*params(2);
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(18)*params(4)+params(14)*(y(11)+y(15));
residual(5)= lhs-rhs;
lhs =y(14);
rhs =params(4)*y(20)+params(15)*(y(13)-y(12));
residual(6)= lhs-rhs;
lhs =y(6);
rhs =params(9)*y(1)+(1.0-params(9))*(y(7)*params(12)+y(5)*params(13))+y(16);
residual(7)= lhs-rhs;
lhs =y(12);
rhs =y(14)+y(4)-y(7);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =params(10)*y(3)+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(8);
rhs =params(11)*y(2)+x(it_, 2);
residual(10)= lhs-rhs;
lhs =y(16);
rhs =x(it_, 3);
residual(11)= lhs-rhs;
lhs =y(15);
rhs =x(it_, 4);
residual(12)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(12, 24);

	% 
	% Jacobian matrix
	% 

  g1(1, 5)=  g1(1, 5)+1.0;
  g1(1, 17)=  g1(1, 17)+(-1.0);
  g1(1, 6)=  g1(1, 6)+params(1);
  g1(1, 18)=  g1(1, 18)+(-params(1));
  g1(1, 19)=  g1(1, 19)+params(1);
  g1(1, 8)=  g1(1, 8)+(-params(1));
  g1(2, 5)=  g1(2, 5)+1.0;
  g1(2, 9)=  g1(2, 9)+(-1.0);
  g1(2, 10)=  g1(2, 10)+(-(1.0-params(5)));
  g1(3, 5)=  g1(3, 5)+1.0;
  g1(3, 10)=  g1(3, 10)+(-1.0);
  g1(3, 11)=  g1(3, 11)+1.0;
  g1(3, 12)=  g1(3, 12)+(-1.0);
  g1(4, 5)=  g1(4, 5)+(-(1.0/params(1)));
  g1(4, 8)=  g1(4, 8)+(-1.0);
  g1(4, 10)=  g1(4, 10)+(-params(2));
  g1(4, 13)=  g1(4, 13)+1.0;
  g1(5, 18)=  g1(5, 18)+(-params(4));
  g1(5, 11)=  g1(5, 11)+(-params(14));
  g1(5, 7)=  g1(5, 7)+1.0;
  g1(5, 15)=  g1(5, 15)+(-params(14));
  g1(6, 12)=  g1(6, 12)+params(15);
  g1(6, 13)=  g1(6, 13)+(-params(15));
  g1(6, 14)=  g1(6, 14)+1.0;
  g1(6, 20)=  g1(6, 20)+(-params(4));
  g1(7, 5)=  g1(7, 5)+(-((1.0-params(9))*params(13)));
  g1(7, 6)=  g1(7, 6)+1.0;
  g1(7, 7)=  g1(7, 7)+(-((1.0-params(9))*params(12)));
  g1(7, 1)=  g1(7, 1)+(-params(9));
  g1(7, 16)=  g1(7, 16)+(-1.0);
  g1(8, 12)=  g1(8, 12)+1.0;
  g1(8, 7)=  g1(8, 7)+1.0;
  g1(8, 14)=  g1(8, 14)+(-1.0);
  g1(8, 4)=  g1(8, 4)+(-1.0);
  g1(9, 9)=  g1(9, 9)+1.0;
  g1(9, 3)=  g1(9, 3)+(-params(10));
  g1(9, 21)=  g1(9, 21)+(-1.0);
  g1(10, 8)=  g1(10, 8)+1.0;
  g1(10, 2)=  g1(10, 2)+(-params(11));
  g1(10, 22)=  g1(10, 22)+(-1.0);
  g1(11, 16)=  g1(11, 16)+1.0;
  g1(11, 23)=  g1(11, 23)+(-1.0);
  g1(12, 15)=  g1(12, 15)+1.0;
  g1(12, 24)=  g1(12, 24)+(-1.0);
end
if nargout >= 3,
  g2 = sparse([],[],[],12, 576, 2880);

	% 
	% Hessian matrix
	% 

end;
