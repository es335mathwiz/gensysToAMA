
function runIt(anArg)
save darnedClearAlls  anArg;

disp(anArg)

try
eval(anArg)
options_.order=1;
[dr,info]=resol(oo_.steady_state,1);
catch
load darnedClearAlls
disp(sprintf('problems running %s',anArg))
end
