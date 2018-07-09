function [residual, g1, g2] = example2_static( y, x )
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

T829250621 = exp(y(2))*params(5)*exp(y(5))^(1.0+params(6));
T829250639 = exp(y(2))*exp(y(6))/(exp(y(6))*exp(y(2)));
T829250647 = params(3)*exp(y(6))*exp(y(1))+exp(y(3))*(1.0-params(4));
T829250656 = exp(y(4))*exp(y(3))^params(3);
T829250657 = exp(y(5))^(1.0-params(3));
T829250658 = T829250656*T829250657;
T829250682 = exp(y(6))*exp(y(2))*exp(y(6))*exp(y(2));
T829250683 = exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))/T829250682;
T829250686 = (-(params(1)*T829250647*T829250683));
T829250693 = exp(y(5))*(1.0+params(6))*exp(y(5))^(1.0+params(6)-1.0);
T829250694 = exp(y(2))*params(5)*T829250693;
T829250698 = exp(y(5))*(1.0-params(3))*exp(y(5))^(1.0-params(3)-1.0);
T829250709 = (-(exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))))/T829250682;
T829250710 = T829250647*T829250709;
T829250724 = exp(y(4))*exp(y(3))*params(3)*exp(y(3))^(params(3)-1.0);
T829250743 = (-(params(1)*T829250647*exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))*T829250682/(T829250682*T829250682)));
T829250749 = T829250647*T829250682*(-(exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))))/(T829250682*T829250682);
T829250753 = (-(params(1)*(T829250749+params(3)*exp(y(6))*exp(y(1))*T829250683)));
T829250762 = T829250647*(T829250682*(-(exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))))-(-(exp(y(2))*exp(y(6))*exp(y(6))*exp(y(2))))*(T829250682+T829250682))/(T829250682*T829250682);
T829250763 = params(3)*exp(y(6))*exp(y(1))*T829250709+T829250762;
lhs =T829250621;
rhs =(1.0-params(3))*exp(y(1));
residual(1)= lhs-rhs;
lhs =exp(y(3));
rhs =params(1)*T829250639*T829250647;
residual(2)= lhs-rhs;
lhs =exp(y(1));
rhs =T829250658;
residual(3)= lhs-rhs;
lhs =exp(y(3));
rhs =exp(y(6))*(exp(y(1))-exp(y(2)))+(1.0-params(4))*exp(y(3));
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

  g1(1, 2)=  g1(1, 2)+T829250621;
  g1(1, 5)=  g1(1, 5)+T829250694;
  g1(1, 1)=  g1(1, 1)+(-((1.0-params(3))*exp(y(1))));
  g1(2, 2)=  g1(2, 2)+T829250686;
  g1(2, 3)=  g1(2, 3)+exp(y(3))-params(1)*T829250639*exp(y(3))*(1.0-params(4));
  g1(2, 6)=  g1(2, 6)+T829250686;
  g1(2, 6)=  g1(2, 6)+(-(params(1)*(T829250710+T829250639*params(3)*exp(y(6))*exp(y(1)))));
  g1(2, 2)=  g1(2, 2)+(-(params(1)*T829250710));
  g1(2, 1)=  g1(2, 1)+(-(params(1)*T829250639*params(3)*exp(y(6))*exp(y(1))));
  g1(3, 5)=  g1(3, 5)+(-(T829250656*T829250698));
  g1(3, 1)=  g1(3, 1)+exp(y(1));
  g1(3, 4)=  g1(3, 4)+(-T829250658);
  g1(3, 3)=  g1(3, 3)+(-(T829250657*T829250724));
  g1(4, 2)=  g1(4, 2)+(-(exp(y(6))*(-exp(y(2)))));
  g1(4, 1)=  g1(4, 1)+(-(exp(y(1))*exp(y(6))));
  g1(4, 3)=  g1(4, 3)+exp(y(3));
  g1(4, 6)=  g1(4, 6)+(-(exp(y(6))*(exp(y(1))-exp(y(2)))));
  g1(4, 3)=  g1(4, 3)+(-((1.0-params(4))*exp(y(3))));
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
