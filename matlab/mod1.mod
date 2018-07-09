var dx dy x y;
varexo e_x e_y;

parameters rho_x rho_y;

rho_x = 0.5;
rho_y = -0.3;

model;
dx = rho_x*dx(-1)+e_x;
dy = rho_y*dy(-1)+e_y;
x = x(-1)+dx;
y = y(-1)+dy;
end;



