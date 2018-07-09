%  [w,rts,lgroots] = SPEigensystem(a,uprbnd)
%
%  Compute the roots and the left eigenvectors of the companion
%  matrix, sort the roots from large-to-small, and sort the
%  eigenvectors conformably.  Map the eigenvectors into the real
%  domain. Count the roots bigger than uprbnd.

function [w,rts,lgroots] = SPEigensystem(a,uprbnd,rowsLeft) 
eigOpt.disp=0;
rowsLeft=rowsLeft-1;
%[ws,d]   = notEigs(a',rowsLeft,'LM',eigOpt);
[ws,d]   = eigs(a',rowsLeft,'LM',eigOpt);
%[ws,d]   = eigs(a');
%[uuu,ttt]=schur(a');
%[ws,tt]=ordschur(uuu,ttt,ordeig(ttt)>1e-8); 
%[ws,tt]=ordschur(uuu,ttt,'udo'); 
rts     = diag(d);
%rts     = diag(tt);
mag     = abs(rts);
[mag,k] = sort(-mag);
rts     = rts(k);

%ws=SPSparse(w);
ws       = ws(:,k);

%  Given a complex conjugate pair of vectors W = [w1,w2], there is a
%  nonsingular matrix D such that W*D = real(W) + imag(W).  That is to
%  say, W and real(W)+imag(W) span the same subspace, which is all
%  that aim cares about. 

%ws = real(ws) + imag(ws);

lgroots = sum(abs(rts) > uprbnd);

w=full(ws);

