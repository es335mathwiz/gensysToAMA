hmat=[1 3 .5];
[qq,rts,newh,hels,auxels,qrows,essential,aimcode,spinmat] =...
sparseAim(hmat,1,10000,0);
