function [gx,hx,rtsWithInf,rnk,info]=mjdggesToAMA(dd,ee,nmFrwrdVrs,uprbnd,task)
%replace 8/1/07 dr1.m code for forward lookin models with AMA routines
gx=[];hx=[];rtsWithInf=[];rnk=[];info=[];
neq=size(dd,1);
frwrdRng=1:nmFrwrdVrs;
stateRng=(1:(neq-nmFrwrdVrs))+nmFrwrdVrs;
  condn  = 1.e-10;%SPAmalg uses this in zero tests
%  uprbnd = 1 + 1.e-6;%allow unit roots
%disp('gensysToAMA:running ama');
hmat=genHmat(dd,ee,stateRng,frwrdRng);
strt=cputime;
[bb,rts,ia,nexact,nnumeric,lgroots,aimcode] =...
SPAmalg(hmat,neq,1,1,condn,uprbnd);
fin=cputime-strt;
disp(sprintf('just SPAmalg=%d',fin))

if(aimcode>1)
info=handleAimcode(aimcode)
else
%unique solution
hx=-bb(stateRng,stateRng);
gx=bb(frwrdRng,stateRng);
if(task==1)
rnk=nmFrwrdVrs;
end
info(1)=0;
info(2)=0;
nmExpld = nnz(abs(rts) >  uprbnd);
rtsWithInf=[inf*ones(nmFrwrdVrs-nmExpld,1);rts];
end


function info=handleAimcode(aimcode)
switch aimcode
case 2
%problems with real schur computation
info(1)=2;
info(2)=aimcode;
case 3
%too many big roots
case 35
%too many big roots and q right singular
info(1)=2;
info(2)=aimcode;
case 4
%too few big roots
info(1)=2;
info(2)=aimcode;
case 45
%too few big roots and q right singular
info(1)=2;
info(2)=aimcode;
case 5
%right number of roots but q right singular
info(1)=2;
info(2)=aimcode;
case 61
%too many exact shift rights
info(1)=1;
info(2)=aimcode;
case 62
%too many numeric shift rights
info(1)=1;
info(2)=aimcode;
otherwise
disp('fell through switch')
info(1)=1;
info(2)=aimcode;
end



function hmat=genHmat(dd,ee,stateRng,frwrdRng)
neq=size(dd,1);
nmFrwrdVrs=length(frwrdRng);
hmat=[zeros(neq,nmFrwrdVrs) ee(:,stateRng) ...
ee(:,frwrdRng) dd(:,stateRng) ...
dd(:,frwrdRng) zeros(neq,neq-nmFrwrdVrs)];

