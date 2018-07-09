%not a function isGensysToAMAOK
try
load canada2lagas1;
[ggg,ccc,iii,fff,ffw,yyw,gev,eue]=gensysToAMA(g0,g1,cc,psi,pi,1.0,'both');
'isGensysToAMAOK:SUCCESS'
catch
'isGensysToAMAOK:some problems loading files and running gensysToAMA'
end

