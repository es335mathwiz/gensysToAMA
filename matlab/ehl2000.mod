% Frantisek Brazdik, 2005
% Simplyfied version of EHL 2000 model
% based on: Erceg, Christopher, Dale Henderson, and Andrew Levin (2000). 
% "Optimal Monetary Policy with Staggered Wage and Price Contracts," Journal 
% of Monetary Economics, 46 (March), pp. 281-313.
 
periods 500;

var y r dp g a n mc realw  mrs dw lamda ms;

varexo ea eg ems elamda;

parameters sigma  gamma  thetap betta dellta eps thetaw phi rhor rhoa rhog gammainf gammaogap kp kw;

sigma       =   0.5;
gamma       =   2;
thetap      =   0.9;
betta       =   0.9;
dellta      =   0.4;
eps         =   6;
thetaw      =   0.01;
phi         =   6;  
rhor        =   0.9;
rhoa        =   0.9;
rhog        =   0.9;
gammainf    =   1.5;
gammaogap   =   0.125;
     
kp          = (1-dellta)*(1-betta*thetap)*(1-thetap)/(thetap*(1+dellta*(eps-1)));
kw          = (1-betta*thetaw)*(1-thetaw)/(thetaw*(1+phi*gamma));


model(linear);
y   =   y(+1) -sigma*(r-dp(+1)+g(+1)-g);
y   =   a+(1-dellta)*n;
mc  =   realw+n-y;
mrs =   g+1/sigma*y+gamma*n;
dp  =   betta*dp(+1)+kp*(mc+lamda);
dw  =   betta*dw(+1)+kw*(mrs-realw);
r   =   rhor*r(-1)+(1-rhor)*(gammainf*dp+gammaogap*y)+ms;
realw=  realw(-1)+dw-dp;
a   =   rhoa*a(-1)+ea;
g   =   rhog*g(-1)+eg;
ms  =   ems;
lamda=  elamda;   
end;

initval;
y   =   0;
r   =   0;
dp  =   0;
g   =   0;
n   =   0;
mc  =   0;
realw=  0;
mrs =   0;
dw  =   0;
lamda=  0;
a   =   0;
ms  =   0;
end;



