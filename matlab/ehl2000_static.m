function [residual, g1, g2] = ehl2000_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 12, 1);

	% 
	% Model equations
	% 

lhs =y(1);
rhs =y(1)-params(1)*(y(2)-y(3)+y(4)-y(4));
residual(1)= lhs-rhs;
lhs =y(1);
rhs =y(5)+(1.0-params(5))*y(6);
residual(2)= lhs-rhs;
lhs =y(7);
rhs =y(6)+y(8)-y(1);
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(4)+y(1)*1.0/params(1)+y(6)*params(2);
residual(4)= lhs-rhs;
lhs =y(3);
rhs =y(3)*params(4)+params(14)*(y(7)+y(11));
residual(5)= lhs-rhs;
lhs =y(10);
rhs =params(4)*y(10)+params(15)*(y(9)-y(8));
residual(6)= lhs-rhs;
lhs =y(2);
rhs =params(9)*y(2)+(1.0-params(9))*(y(3)*params(12)+y(1)*params(13))+y(12);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(10)+y(8)-y(3);
residual(8)= lhs-rhs;
lhs =y(5);
rhs =params(10)*y(5)+x(1);
residual(9)= lhs-rhs;
lhs =y(4);
rhs =params(11)*y(4)+x(2);
residual(10)= lhs-rhs;
lhs =y(12);
rhs =x(3);
residual(11)= lhs-rhs;
lhs =y(11);
rhs =x(4);
residual(12)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(12, 12);

	% 
	% Jacobian matrix
	% 

  g1(1, 1)=  g1(1, 1)+1.0;
  g1(1, 1)=  g1(1, 1)+(-1.0);
  g1(1, 2)=  g1(1, 2)+params(1);
  g1(1, 3)=  g1(1, 3)+(-params(1));
  g1(1, 4)=  g1(1, 4)+params(1);
  g1(1, 4)=  g1(1, 4)+(-params(1));
  g1(2, 1)=  g1(2, 1)+1.0;
  g1(2, 5)=  g1(2, 5)+(-1.0);
  g1(2, 6)=  g1(2, 6)+(-(1.0-params(5)));
  g1(3, 1)=  g1(3, 1)+1.0;
  g1(3, 6)=  g1(3, 6)+(-1.0);
  g1(3, 7)=  g1(3, 7)+1.0;
  g1(3, 8)=  g1(3, 8)+(-1.0);
  g1(4, 1)=  g1(4, 1)+(-(1.0/params(1)));
  g1(4, 4)=  g1(4, 4)+(-1.0);
  g1(4, 6)=  g1(4, 6)+(-params(2));
  g1(4, 9)=  g1(4, 9)+1.0;
  g1(5, 3)=  g1(5, 3)+(-params(4));
  g1(5, 7)=  g1(5, 7)+(-params(14));
  g1(5, 3)=  g1(5, 3)+1.0;
  g1(5, 11)=  g1(5, 11)+(-params(14));
  g1(6, 8)=  g1(6, 8)+params(15);
  g1(6, 9)=  g1(6, 9)+(-params(15));
  g1(6, 10)=  g1(6, 10)+1.0;
  g1(6, 10)=  g1(6, 10)+(-params(4));
  g1(7, 1)=  g1(7, 1)+(-((1.0-params(9))*params(13)));
  g1(7, 2)=  g1(7, 2)+1.0;
  g1(7, 3)=  g1(7, 3)+(-((1.0-params(9))*params(12)));
  g1(7, 2)=  g1(7, 2)+(-params(9));
  g1(7, 12)=  g1(7, 12)+(-1.0);
  g1(8, 8)=  g1(8, 8)+1.0;
  g1(8, 3)=  g1(8, 3)+1.0;
  g1(8, 10)=  g1(8, 10)+(-1.0);
  g1(8, 8)=  g1(8, 8)+(-1.0);
  g1(9, 5)=  g1(9, 5)+1.0;
  g1(9, 5)=  g1(9, 5)+(-params(10));
  g1(10, 4)=  g1(10, 4)+1.0;
  g1(10, 4)=  g1(10, 4)+(-params(11));
  g1(11, 12)=  g1(11, 12)+1.0;
  g1(12, 11)=  g1(12, 11)+1.0;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
