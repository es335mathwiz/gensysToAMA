var A, Disp, G, Int, L,
		   LStar, pi, Welf, WelfStar, diffwelf, x0,
		   Y, YGap, YStar, z1, z2,
		   y1, y2, W, Wstar, DW, Z, ALdisp, Cbar;
varexo eps1 eps2;

parameters alpha  beta  gamma  rhoa  rhog  phi  chi  chi0  theta  xi  
ABar  GBar  KBar  ZBar  piBar thetaw xiw;
alpha = 0.3;
  beta = 0.99;
  gamma = 15;
  rhoa = 0.8;
  rhog = 0.7;
  phi = 1.5;
  chi = 1.5;
  chi0 = 1;
  theta = 0.3333333333;
  xi = 0.75;
  ABar = 4.0266;
  GBar = 0.3163;
  ZBar = .03;
  piBar = 1;
  thetaw= 0.3333333333;
  xiw=.70;
  KBar = 9.489;


model;
z1 - ((Y-G)^(1-phi) + beta *xi *piBar *pi(+1)^(1/theta) *z1(+1));
z2 - (Y *chi0 *(L)^(chi) / ((1-alpha) *A *KBar^alpha
	*L^(-alpha)) + beta *xi *pi(+1)^((1+theta)/theta) *z2(+1));
x0 - (1+theta)*z2 /z1;
pi^(-1/theta) - ((1-xi) *(x0*pi)^(-1/theta) + xi *piBar^(-1/theta));
y2 - (W^((1+chi)*(1+thetaw)/(thetaw))*L^(1+chi)+xiw*beta*y2(+1));
y1 - (W^((1+thetaw)/(thetaw))*L*(Y-G)^(-phi)+xiw*beta*piBar*y1(+1));
Wstar^(1+chi*((1+thetaw)/(thetaw)))-(1+thetaw)*y2/y1;
(Wstar/W)^(1/thetaw)-Z;
Z-(1-xiw)-xiw*(piBar)^(-1/thetaw)*(Wstar/Wstar(-1))^(1/thetaw)*Z(-1);
Y - (Disp^(-1) *A *KBar^alpha *L^(1-alpha));
Disp - ((1-xi) *x0^(-(1+theta)/theta)
	+ xi *(piBar/pi)^(-(1+theta)/theta) *Disp(-1));
DW=(1-xiw)*(Z)^(-(1+thetaw))+xiw*(piBar)^(-(1+thetaw)/thetaw)*(W(-1)/W)^(-(1+thetaw)/thetaw)*DW(-1);
log(A/ABar) - (rhoa *log(A(-1)/ABar) + eps1);
log(G/GBar) - (rhog *log(G(-1)/GBar) + eps2);
(Y-G)^(-phi) - (beta *(Int/pi(+1)) *(Y(+1)-G(+1))^(-phi));
Welf - ((Y-G)^(1-phi) /(1-phi)
	- chi0*(ALdisp) /(1+chi) + beta *Welf(+1));
ALdisp=L^(1+chi)*DW;
(1-alpha) *A *KBar^alpha *LStar^(-alpha)
	- (1+theta)*YStar*(YStar-G)^(phi-1) *chi0
	*(LStar)^(chi);
YStar - A *KBar^alpha *LStar^(1-alpha);
YGap - (log(Y/YStar));
WelfStar - ((YStar-G)^(1-phi) /(1-phi)
	- chi0*(LStar)^(1+chi) /(1+chi) + beta *WelfStar(+1));
Int - (1/beta) *(pi^gamma);
diffwelf = WelfStar - Welf;
Cbar=((1-phi)*((1-beta)*Welf-chi0*(LStar)^(1+chi)/(1+chi)))^(1/(1-phi));
end;

initval;
A=            4.022;	       
Disp=	      1;	       
G=	      0.3163;	       
Int=	      1;	       
L=	      0.56;	       
LStar=	       0.56;	       
pi=	      1;	       
Welf=	   -100;
WelfStar=  -100;
x0=	      1;	       
Y=	       5.27;	       
YGap=	      0;	       
YStar=	     5.27;	       
z1=	      1.7;	       
z2=	      1.3;             
diffwelf = 0;
y1=0.00004;
y2=0;
DW=1;
W=0.129;
Wstar=0.129;
Z= 1;
ALdisp=0.2;
Cbar = 3.3;
end;
