var c k a;
varexo e;
parameters alpha beta delta gamma rho;

beta = 0.95;
delta = 1;
alpha = 0.3;
rho = 0;
gamma = 2;

model;
exp(c) + exp(k) = (1-delta) * exp(k(-1)) + exp(a) * exp(k(-1))^alpha;
exp(c)^(-gamma) = beta * exp(c(+1))^(-gamma) * (exp(a(+1)) * alpha * exp(k)^(alpha-1) + 1 - delta);
a = rho * a(-1) + e;
end;

initval;
k=0;
c=0;
a=0;
e=0;
end;


