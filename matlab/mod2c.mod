var dx dy coint_err;
varexo e_x e_y;

parameters rho_x rho_y b a1 a2;

rho_x = 0.5;
rho_y = -0.3;
b = 1;
a1 = -0.1;
a2 = 0.2;

model;
dx = rho_x*dx(-1)+a1*coint_err(-1)+e_x;
dy = rho_y*dy(-1)+a2*coint_err(-1)+e_y;
coint_err = dx-b*dy+coint_err(-1);
end;



