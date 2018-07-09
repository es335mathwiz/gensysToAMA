function [G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensysToAMA(g0,g1,cc,psi,pi,div,varargin)
%function [G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensysToAMA(g0,g1,cc,psi,pi,div,
%optionalArg)
% gensys interface to both gensys and the Anderson-Moore algorithm.
% Just as with gensys, system given as
%        g0*y(t)=g1*y(t-1)+c+psi*z(t)+pi*eta(t),
% with z an exogenous variable process and eta being endogenously determined
% one-step-ahead expectational errors.  Returned system is
%       y(t)=G1*y(t-1)+C+impact*z(t)+ywt*inv(I-fmat*inv(L))*fwt*z(t+1) .
% If z(t) is i.i.d., the last term drops out.
% If div is omitted from argument list, a div>1 is calculated.
% eu(1)=1 for existence, eu(2)=1 for uniqueness.  eu(1)=-1 for
% existence only with not-s.c. z; eu=[-2,-2] for coincident zeros.
% By Christopher A. Sims
% >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
% when called with no optional args,
%        program first tries to find gensys on the matlab path
%        if that fails, the program runs gensys2007 in the gensysToAMA directory
%
% an optional string argument may follow the original gensys arguments
% 'gensys'   run gensys
%        program first tries to find gensys on the matlab path
%        if that fails, the program runs gensys2007 in the gensysToAMA directory
%
% 'gensys2007'   run gensys
%        the program runs gensys2007 in the gensysToAMA directory
%
% 'ama'    run the anderson-moore algorithm with gensys inputs and outputs
%
%'both'    run the anderson-moore algorithm and the gensys program
%        verify that solutions are equivalent print out execution times
%        


reps=5;%for timing tests average

G1='not set';
CC='not set';
impact='not set';
fmat='not set';
fwt='not set';
ywt='not set';
gev='not set';
eu='not set';
div=1.0;
switch nargin
case 6%assume calling as though original gensys
try
disp('gensysToAMA: trying gensys on your matlab path')
[G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensys(g0,g1,cc,psi,pi,div);
sss=which('gensys');
disp(sprintf('used gensys located at:  %s', sss));
catch
disp('gensysToAMA:  that failed, using gensys2007 in gensysToAMA dir')
[G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensys2007(g0,g1,cc,psi,pi,div);
sss=which('gensys2007');
disp(sprintf('used gensys2007 located at:  %s', sss));
end
case 7%assume calling as though original gensys but with a trailing optional arg
arg1=varargin{1};
switch arg1
case 'gensys'
disp('gensysToAMA:running gensys');
try
disp('gensysToAMA: trying gensys on your matlab path')
[G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensys(g0,g1,cc,psi,pi,div);
sss=which('gensys');
disp(sprintf('used gensys located at:  %s', sss));
catch
disp('gensysToAMA:  that failed, using gensys2007 in gensysToAMA dir')
[G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensys2007(g0,g1,cc,psi,pi,div);
sss=which('gensys2007');
disp(sprintf('used gensys2007 located at:  %s', sss));
end
disp('gensysToAMA:done');
case 'gensys2007'
disp('gensysToAMA:running gensys2007');
[G1,CC,impact,fmat,fwt,ywt,gev,eu]=gensys2007(g0,g1,cc,psi,pi,div);
sss=which('gensys2007');
disp(sprintf('used gensys2007 located at:  %s', sss));
disp('gensysToAMA:done');
case 'ama'
%disp('gensysToAMA:running ama');
%disp('gensysToAMA:converting gensys inputs to ama format');
[theHM,theH0,theHP]=convertFromGensysIn(g0,g1,pi);
  condn  = 1.e-10;%SPAmalg uses this in zero tests
  uprbnd = 1 + 1.e-6;%allow unit roots
theH=[theHM,theH0,theHP];
neq=size(theHM,1);
%disp('gensysToAMA:running ama');
[bb,rts,ia,nexact,nnumeric,lgroots,aimcode] =...
SPAmalg(theH,neq,1,1,condn,uprbnd);
eu=setEu(aimcode);
if(aimcode==1)
%    scof = SPObstruct(theH,bb,neq,1,1);not needed for generating sims output
phi=inv(theH0+theHP*sparse(bb));
theF=-phi*theHP;
ncpi=size(pi,2);
%disp('gensysToAMA:converting ama output to gensys format');
[CC,G1,impact,ywt,fmat,fwt]=...
convertToGensysOut(bb,phi,theF,cc,g0,g1,psi,ncpi);
else
disp('no unique solution: not bothering to try and convert to gensys output')
end
disp('gensysToAMA:done');
case 'both'
disp('gensysToAMA:running both ama and gensys for comparison');
disp(sprintf('problem dimensions: g0:%d x %d, psi:%d x %d, pi:%d x %d',...
size(g0,1),size(g0,2),size(psi,1),size(psi,2),size(pi,1),size(pi,2)));
disp(sprintf('gensysToAMA: doing  %d reps for timing averages',reps));
disp('gensysToAMA:running gensys');
try
disp('gensysToAMA: trying gensys on your matlab path')
[sG1,sCC,simpact,sfmat,sfwt,sywt,sgev,eu]=gensys(g0,g1,cc,psi,pi,div);
sss=which('gensys');
disp(sprintf('used gensys located at:  %s', sss));
catch
disp('gensysToAMA: that failed, using gensys2007 in gensysToAMA dir')
[sG1,sCC,simpact,sfmat,sfwt,sywt,sgev,eu]=gensys2007(g0,g1,cc,psi,pi,div);
sss=which('gensys2007');
disp(sprintf('used gensys2007 located at:  %s', sss));
end
gensysDone=0;
for ii=1:reps
gensysStart=cputime;
try
[sG1,sCC,simpact,sfmat,sfwt,sywt,sgev,eu]=gensys(g0,g1,cc,psi,pi,div);
catch
[sG1,sCC,simpact,sfmat,sfwt,sywt,sgev,eu]=gensys2007(g0,g1,cc,psi,pi,div);
end
gensysDone=gensysDone+(cputime-gensysStart);
end
gensysDone=gensysDone/reps;
%disp('gensysToAMA:running ama');
convertToStart=cputime;
[theHM,theH0,theHP]=convertFromGensysIn(g0,g1,pi);
theH=[theHM,theH0,theHP];
  condn  = 1.e-10;%SPAmalg uses this in zero tests
  uprbnd = 1 + 1.e-6;%allow unit roots
neq=size(theHM,1);
convertToDone=cputime-convertToStart;
[bb,rts,ia,nexact,nnumeric,lgroots,aimcode] =...
SPAmalg(theH,neq,1,1,condn,uprbnd);
AMADone=0;
for ii=1:reps
AMAStart=cputime;
[bb,rts,ia,nexact,nnumeric,lgroots,aimcode] =...
SPAmalg(theH,neq,1,1,condn,uprbnd);
%    scof = SPObstruct(theH,bb,neq,1,1);%not needed for generating sims output
%phi=inv(theH0+theHP*sparse(bb));
AMADone=AMADone+(cputime-AMAStart);
end
AMADone=AMADone/reps;
if(aimcode==1)
%NAStart=cputime;
%[qq,bb,info,sinv]=numericAim(1,theH);
%NADone=cputime-NAStart;

AMAFStart=cputime;
theF=-((theH0+theHP*sparse(bb))\theHP);
AMAFDone=cputime-AMAFStart;
%disp('gensysToAMA:converting ama output to gensys format');
AMAConvertStart=cputime;
eu=setEu(aimcode);
phi=inv(theH0+theHP*sparse(bb));
%note only need column dimension of pi for conversion
ncpi=size(pi,2);
[CC,G1,impact,ywt,fmat,fwt]=...
convertToGensysOut(bb,phi,theF,cc,g0,g1,psi,ncpi);
AMAConvertDone=cputime-AMAConvertStart;
else
disp('no unique solution: not bothering to try and convert to gensys output')
end
disp('gensysToAMA:runs complete');
%[newvv,newfmat,newNz]=smallF(sfmat);
if(aimcode==1)
try
theDiffs=...
[norm(real(sG1) -G1),norm(real(sCC) - CC),norm(real(simpact)-impact),...
simMats(sfmat,fmat),...
norm(real(sywt*sfwt) -ywt*fwt),norm(real(sywt*sfmat*sfwt) -ywt*fmat*fwt)];
catch
disp(sprintf('detected a difference in sims and AMA results'));
disp(sprintf('dims of matrices, G1''s , C''s. impact''s, fmat''s, ywt''s, fwt''s'))
[size(sG1) size(G1);size(sCC) size(CC);...
size(simpact) size(impact);size(sfmat) size(fmat);...
size(sywt) size(ywt);size(sfwt) size(fwt)]
end
if(any(theDiffs>1e-7))
disp(sprintf('detected a difference in sims and AMA results'));
theDiffs
else
disp(sprintf('no difference in sims and AMA results'));
end
disp(sprintf('gensysToAMA: after one primer run and   %d reps',reps));
disp(sprintf('AMATime=%d  AMAFTime=%d  \n convertToTime=%d convertFromTime=%d  \n genSysTime=%d',...
AMADone,AMAFDone,convertToDone,AMAConvertDone,gensysDone));
else
disp('did not compute conversion, no comparisons to gensys output');
disp(sprintf('AMATime=%d   genSysTime=%d',...
AMADone,gensysDone));
end
otherwise
error('gensysToAMA:unknown optional string')
end
otherwise
error('gensysToAMA:wrong number of args')
end










function euVal=setEu(aimCode)
euVal=zeros(2,1);
switch aimCode
case 1
euVal(1,1)=1;
euVal(2,1)=1;
case 2
euVal(1,1)=-2;
euVal(2,1)=-2;
case 3
euVal(1,1)=0;
euVal(2,1)=0;
case 4
euVal(1,1)=1;
euVal(2,1)=0;
case 5
euVal(1,1)=-5;
euVal(2,1)=-5;
end

function res=simMats(newfmat,fmat)
tol=1e-8;
evA=eig(full(newfmat));
evB=eig(full(fmat));
aNz=find(abs(evA)>tol);
bNz=find(abs(evB)>tol);
diffLen=length(aNz)-length(bNz);
switch sign(diffLen)
case -1
res=norm(sort(real(evB(bNz)))-(sort(real([evA(aNz);zeros(-diffLen,1)]))));
case 0
res=norm(sort(real(evB(bNz)))-(sort(real(evA(aNz)))));
case 1
res=norm(sort(real([evB(bNz);zeros(diffLen,1)]))-sort(real(evA(aNz))));
end


