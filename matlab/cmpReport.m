function cmpReport(...
agx,ahx,aeval,arnk,ainfo,...
bgx,bhx,beval,brnk,binfo,...
cgx,chx,ceval,crnk,cinfo,...
atime,btime,ctime)
gDiff=norm(agx-bgx);
hDiff=norm(ahx-bhx);
rDiff=arnk -brnk;
if(isempty(rDiff))
rDiff=inf;
end
[evDiff,sameLn]=evcmp(aeval,beval);


disp(sprintf('gDiff=%d,hDiff=%d,rDiff=%d,evDiff=%d',gDiff,hDiff,rDiff,evDiff))
gDiff=norm(agx-cgx);
hDiff=norm(ahx-chx);
rDiff=arnk -crnk;
if(isempty(rDiff))
rDiff=inf;
end
[evDiff,sameLn]=evcmp(aeval,ceval);
disp(sprintf('gDiff=%d,hDiff=%d,rDiff=%d,evDiff=%d',gDiff,hDiff,rDiff,evDiff))


function [theDiff,sameLn]=evcmp(aevs,bevs)
theDiff=[];sameLn=[];
lila=aevs(find(finBig(aevs)));
lilb=bevs(find(finBig(bevs)));
if(length(lila)<=length(lilb))
theDiff=norm(lila+lilb(1:length(lila)));
sameLn=1;
else
theDiff=inf;
sameLn=0;
end

function theRes=finBig(aval)
theRes=and(isfinite(aval),abs(aval)>1);
