var y a k c i h oy oc oh;
varexo e;

parameters bet delta theta rho eta gam aa;

bet = 0.99;
delta = 0.025;
theta = 0.2;
rho = 0.9975; 
eta = 1.0051;  
gam = 0.0045;
aa = 6.0;

model;
# YK = (eta/bet-1+delta)/theta;
# IK = eta-1+delta;
# HS = log((1-theta)/gam/(1-IK/YK));
# YS = log(aa^(1/(1-theta))*(1/YK)^(theta/(1-theta)))+HS;
# KS = log(1/YK)+YS;
# IS = log((eta-1+delta))+KS;
# CS = log(exp(YS)-exp(IS));
y = a + theta*k(-1) + (1-theta)*h;
a = rho*a(-1) + e;
(eta/bet-1+delta)*y = ((eta/bet-1+delta)-theta*(eta-1+delta))*c + theta*(eta-1+delta)*i;
eta*k = (1-delta)*k(-1) + (eta-1+delta)*i;
y = c + h;
(eta/bet)*c = (eta/bet)*c(+1) - (eta/bet-1+delta)*y(+1) + (eta/bet-1+delta)*k;
oy = y + YS;
oc = c + CS;
oh = h + HS;
end;


