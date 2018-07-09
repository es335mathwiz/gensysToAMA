function [CC,G1,impact,ywt,fmat,fwt]=...
convertToGensysOut(bb,phi,theF,cc,g0,g1,psi,ncpi)
%function [CC,G1,impact,ywt,fmat,fwt]=...
%convertToGensysOut(bb,phi,theF,cc,g0,g1,psi,ncpi)

[nr,nc]=size(g1);
[nrpsi,ncpsi]=size(psi);
stateDim=size(bb,2)-ncpi;
G1=bb(1:nr,1:nc);

ststate=(g0-g1)\cc;
CC=(eye(nr)-G1)*ststate;

thePsi=[psi;zeros(ncpi,ncpsi)];
aa=phi*thePsi;
impact=aa(1:nr,:);
%no unique way to represent these components
[ywt,fmat,fwt]=smallF(theF,aa,stateDim);

function [onLeft,inMiddle,onRight]=smallF(anF,bigPhi,nn)
[fRows,fCols]=size(anF);
lilFL=anF(nn+1:fRows,nn+1:fRows);
uu=null(full(lilFL));
theNull=size(uu,2);
eOpts.disp=0;
lilFU=anF(1:nn,nn+1:fRows);
onLeft=lilFU;
onRight=bigPhi(nn+1:fRows,:);
inMiddle=lilFL;
