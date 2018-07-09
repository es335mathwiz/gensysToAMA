function [residual, g1, g2] = fs2000_static( y, x )
% 
% Status : Computes static model for Dynare
% 
% Warning : this file is generated automatically by Dynare
%   from model file (.mod)

global M_ 
if M_.param_nbr > 0
  params = M_.params;
end
  residual = zeros( 14, 1);

	% 
	% Model equations
	% 

T1129268358 = y(7)^(params(1)-1.0);
T1129268359 = params(1)*exp((-params(1))*(params(3)+log(y(4))))*T1129268358;
T1129268362 = y(9)^(1.0-params(1));
T1129268369 = T1129268359*T1129268362+(1.0-params(7))*exp((-(params(3)+log(y(4)))));
T1129268387 = (-(params(6)/(1.0-params(6))));
T1129268398 = exp((params(3)+x(1))*(-params(1)));
T1129268401 = y(7)^params(1);
T1129268403 = y(9)^(-params(1));
T1129268412 = y(9)^(1.0-params(1));
T1129268413 = T1129268401*T1129268398*(1.0-params(1))*y(2)*params(2)*T1129268412;
T1129268416 = y(2)*y(3)*y(1)*y(10);
T1129268473 = T1129268416*T1129268416;
T1129268489 = y(1)*y(3)*y(2)*y(1)*y(3)*y(2);
T1129268546 = y(3)*y(2)*y(1)*y(3)*y(2)*y(1);
T1129268555 = exp((-params(1))*(params(3)+log(y(4))))*(-params(1))*1.0/y(4);
T1129268562 = T1129268362*T1129268358*params(1)*T1129268555+(1.0-params(7))*exp((-(params(3)+log(y(4)))))*(-(1.0/y(4)));
T1129268569 = params(1)*exp((-params(1))*(params(3)+log(y(4))))*(params(1)-1.0)*y(7)^(params(1)-1.0-1.0);
T1129268570 = T1129268362*T1129268569;
T1129268576 = (1.0-params(1))*y(9)^(1.0-params(1)-1.0);
T1129268612 = (-params(1))*y(9)^((-params(1))-1.0);
T1129268618 = (1.0-params(1))*y(9)^(1.0-params(1)-1.0);
T1129268633 = params(1)*y(7)^(params(1)-1.0);
T1129268895 = y(5)*y(5)*y(5)*y(5);
T1129268966 = params(1)*(params(1)-1.0)*y(7)^(params(1)-1.0-1.0);
T1129268987 = T1129268416*y(2)*y(3)*y(10)+T1129268416*y(2)*y(3)*y(10);
T1129269138 = (1.0-params(1))*(1.0-params(1)-1.0)*y(9)^(1.0-params(1)-1.0-1.0);
lhs =y(14);
rhs =exp(params(3)+x(1));
residual(1)= lhs-rhs;
lhs =log(y(1));
rhs =(1.0-params(5))*log(params(4))+params(5)*log(y(1))+x(2);
residual(2)= lhs-rhs;
lhs =(-y(2))/(y(1)*y(3)*y(2))+y(2)*params(2)*T1129268369/(y(3)*y(2)*y(1));
rhs =0.0;
residual(3)= lhs-rhs;
lhs =y(5);
rhs =y(10)/y(9);
residual(4)= lhs-rhs;
lhs =y(10)/y(9)+T1129268387*y(2)*y(3)/(1.0-y(9));
rhs =0.0;
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(2)*(1.0-params(1))*T1129268398*T1129268401*T1129268403/y(5);
residual(6)= lhs-rhs;
lhs =1.0/(y(2)*y(3))-T1129268413/T1129268416;
rhs =0.0;
residual(7)= lhs-rhs;
lhs =y(7)+y(3);
rhs =T1129268412*T1129268398*T1129268401+y(7)*(1.0-params(7))*exp((-(params(3)+x(1))));
residual(8)= lhs-rhs;
lhs =y(2)*y(3);
rhs =y(1);
residual(9)= lhs-rhs;
lhs =y(1)-1.0+y(8);
rhs =y(10);
residual(10)= lhs-rhs;
lhs =y(4);
rhs =exp(x(1));
residual(11)= lhs-rhs;
lhs =y(13);
rhs =T1129268398*T1129268401*T1129268412;
residual(12)= lhs-rhs;
lhs =y(11);
rhs =y(14)*y(13)/y(13);
residual(13)= lhs-rhs;
lhs =y(12);
rhs =y(1)*y(2)/y(2)/y(14);
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

	% 
	% Jacobian matrix
	% 

  g1(1, 14)=  g1(1, 14)+1.0;
  g1(2, 1)=  g1(2, 1)+1.0/y(1);
  g1(2, 1)=  g1(2, 1)+(-(params(5)*1.0/y(1)));
  g1(3, 1)=  g1(3, 1)+(-((-y(2))*y(3)*y(2)))/T1129268489;
  g1(3, 2)=  g1(3, 2)+(-(y(1)*y(3)*y(2)))/T1129268489;
  g1(3, 3)=  g1(3, 3)+(-((-y(2))*y(1)*y(2)))/T1129268489;
  g1(3, 2)=  g1(3, 2)+(-((-y(2))*y(1)*y(3)))/T1129268489+y(3)*y(2)*y(1)*params(2)*T1129268369/T1129268546;
  g1(3, 4)=  g1(3, 4)+y(3)*y(2)*y(1)*y(2)*params(2)*T1129268562/T1129268546;
  g1(3, 7)=  g1(3, 7)+y(3)*y(2)*y(1)*y(2)*params(2)*T1129268570/T1129268546;
  g1(3, 9)=  g1(3, 9)+y(3)*y(2)*y(1)*y(2)*params(2)*T1129268359*T1129268576/T1129268546;
  g1(3, 3)=  g1(3, 3)+(-(y(2)*params(2)*T1129268369*y(2)*y(1)))/T1129268546;
  g1(3, 2)=  g1(3, 2)+(-(y(2)*params(2)*T1129268369*y(3)*y(1)))/T1129268546;
  g1(3, 1)=  g1(3, 1)+(-(y(2)*params(2)*T1129268369*y(3)*y(2)))/T1129268546;
  g1(4, 5)=  g1(4, 5)+1.0;
  g1(4, 10)=  g1(4, 10)+(-(y(9)/(y(9)*y(9))));
  g1(4, 9)=  g1(4, 9)+(-((-y(10))/(y(9)*y(9))));
  g1(5, 2)=  g1(5, 2)+T1129268387*y(3)*(1.0-y(9))/((1.0-y(9))*(1.0-y(9)));
  g1(5, 10)=  g1(5, 10)+y(9)/(y(9)*y(9));
  g1(5, 9)=  g1(5, 9)+(-y(10))/(y(9)*y(9))+T1129268387*y(2)*y(3)/((1.0-y(9))*(1.0-y(9)));
  g1(5, 3)=  g1(5, 3)+T1129268387*y(2)*(1.0-y(9))/((1.0-y(9))*(1.0-y(9)));
  g1(6, 2)=  g1(6, 2)+(-(y(5)*T1129268403*T1129268401*(1.0-params(1))*T1129268398/(y(5)*y(5))));
  g1(6, 5)=  g1(6, 5)+(-((-(y(2)*(1.0-params(1))*T1129268398*T1129268401*T1129268403))/(y(5)*y(5))));
  g1(6, 9)=  g1(6, 9)+(-(y(5)*y(2)*(1.0-params(1))*T1129268398*T1129268401*T1129268612/(y(5)*y(5))));
  g1(6, 6)=  g1(6, 6)+1.0;
  g1(6, 7)=  g1(6, 7)+(-(y(5)*T1129268403*y(2)*(1.0-params(1))*T1129268398*T1129268633/(y(5)*y(5))));
  g1(7, 1)=  g1(7, 1)+(-((-(T1129268413*y(2)*y(3)*y(10)))/T1129268473));
  g1(7, 2)=  g1(7, 2)+(-y(3))/(y(2)*y(3)*y(2)*y(3))-T1129268416*T1129268412*T1129268401*T1129268398*params(2)*(1.0-params(1))/T1129268473;
  g1(7, 3)=  g1(7, 3)+(-((-(T1129268413*y(2)*y(1)*y(10)))/T1129268473));
  g1(7, 2)=  g1(7, 2)+(-((-(T1129268413*y(3)*y(1)*y(10)))/T1129268473));
  g1(7, 10)=  g1(7, 10)+(-((-(T1129268413*y(2)*y(1)*y(3)))/T1129268473));
  g1(7, 9)=  g1(7, 9)+(-(T1129268416*T1129268401*T1129268398*(1.0-params(1))*y(2)*params(2)*T1129268618/T1129268473));
  g1(7, 3)=  g1(7, 3)+(-y(2))/(y(2)*y(3)*y(2)*y(3));
  g1(7, 7)=  g1(7, 7)+(-(T1129268416*T1129268412*T1129268398*(1.0-params(1))*y(2)*params(2)*T1129268633/T1129268473));
  g1(8, 7)=  g1(8, 7)+1.0;
  g1(8, 9)=  g1(8, 9)+(-(T1129268398*T1129268401*T1129268618));
  g1(8, 3)=  g1(8, 3)+1.0;
  g1(8, 7)=  g1(8, 7)+(-((1.0-params(7))*exp((-(params(3)+x(1))))+T1129268412*T1129268398*T1129268633));
  g1(9, 1)=  g1(9, 1)+(-1.0);
  g1(9, 2)=  g1(9, 2)+y(3);
  g1(9, 3)=  g1(9, 3)+y(2);
  g1(10, 1)=  g1(10, 1)+1.0;
  g1(10, 10)=  g1(10, 10)+(-1.0);
  g1(10, 8)=  g1(10, 8)+1.0;
  g1(11, 4)=  g1(11, 4)+1.0;
  g1(12, 9)=  g1(12, 9)+(-(T1129268398*T1129268401*T1129268618));
  g1(12, 7)=  g1(12, 7)+(-(T1129268398*T1129268412*T1129268633));
  g1(12, 13)=  g1(12, 13)+1.0;
  g1(13, 14)=  g1(13, 14)+(-(y(13)*y(13)/(y(13)*y(13))));
  g1(13, 13)=  g1(13, 13)+(-(y(14)*y(13)/(y(13)*y(13))));
  g1(13, 11)=  g1(13, 11)+1.0;
  g1(13, 13)=  g1(13, 13)+(-((-(y(14)*y(13)))/(y(13)*y(13))));
  g1(14, 14)=  g1(14, 14)+(-((-(y(1)*y(2)/y(2)))/(y(14)*y(14))));
  g1(14, 1)=  g1(14, 1)+(-(y(14)*y(2)/y(2)/(y(14)*y(14))));
  g1(14, 2)=  g1(14, 2)+(-(y(14)*y(1)*y(2)/(y(2)*y(2))/(y(14)*y(14))));
  g1(14, 12)=  g1(14, 12)+1.0;
  g1(14, 2)=  g1(14, 2)+(-(y(14)*y(1)*(-y(2))/(y(2)*y(2))/(y(14)*y(14))));
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
end
