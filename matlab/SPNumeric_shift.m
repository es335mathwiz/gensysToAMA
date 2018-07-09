%  [h,q,iq,nnumeric,lilA,ia,js] = ...
%             SPNumeric_shift(h,q,iq,qrows,qcols,neq,condn)
%
% Compute the numeric shiftrights and store them in q.

function [h,q,iq,nnumeric,lilh,ia,js] =...
 SPNumeric_shift(h,q,iq,qrows,qcols,neq,condn)

nnumeric = 0;
left     = 1:qcols;
right    = qcols+1:qcols+neq;

[Q,R,E]  = qr( h(:,right) );
zerorows = find( abs(diag(R)) <= condn );

while( any(zerorows) && iq <= qrows )
%   h=sparse(h);
%   Q=sparse(Q);
   h = Q'*h;
   nz = length(zerorows);
   q(iq+1:iq+nz,:) = h(zerorows,left);
   h(zerorows,:)   = SPShiftright( h(zerorows,:), neq );
   iq       = iq + nz;
   nnumeric = nnumeric + nz;
%   [Q,R,E] = qr( full(h(:,right)) );
   [Q,R,E] = qr( (h(:,right)) );
   zerorows = find( abs(diag(R)) <= condn );
end

%eliminate inessentials
nlagplead=qcols/neq;
lilh= [zeros(qcols-neq,neq) eye(qcols-neq);h(:,left)];
js       = 1:qcols;
icnt=0;
forFinal=[];
zerocols = sum(abs(lilh)) == 0;
while( any(zerocols) )
icnt=icnt+1;
  lilh(:,zerocols) = [];
if(icnt<nlagplead)
  lilh(zerocols,:) = [];
else
forFinal=zerocols;
end
  js(zerocols)  = [];
  zerocols = sum(abs(lilh)) == 0;
end
ia = length(js);
theBottom=(1:neq)+(size(lilh,1)-neq);


%rightNow=js(find(js>qcols-neq))+neq;



forInv=(-1)*(E * (R \ Q'));
%h=  forInv* h;
lilh(theBottom,:)=forInv*lilh(theBottom,:);
lilh(forFinal,:)=[];


