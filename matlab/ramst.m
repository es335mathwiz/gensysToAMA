% 
% Status : main Dynare file 
% 
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

clear all
tic;
global M_ oo_ exedet_ exdet_ recur_ recurs_ 
global options_ endval_
global ys0_ recurs0_ ex0_ ct_
options_ = [];
M_.fname = 'ramst';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete ramst.log;
warning on;
warning backtrace;
logname_ = 'ramst.log';
diary 'ramst.log';
erase_compiled_function('ramst_static');
erase_compiled_function('ramst_dynamic');
M_.exo_names = 'x';
M_.exo_names_tex = '';
M_.endo_names = 'c';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'k');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'alph';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'gam');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'delt');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'bet');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'aa');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.Sigma_e = zeros(1, 1);
M_.endo_nbr = 2;
M_.recur_nbr = 0;
M_.param_nbr = 5;
M_.lead_lag_incidence = [
	 0 2 4;
	 1 3 0;]';
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(2, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 1;
oo_.exo_steady_state = zeros(1, 1);
M_.params = zeros(5, 1);
M_.params( 1 ) = 0.5;
alph = M_.params( 1 );
M_.params( 2 ) = 0.5;
gam = M_.params( 2 );
M_.params( 3 ) = 0.02;
delt = M_.params( 3 );
M_.params( 4 ) = 0.05;
bet = M_.params( 4 );
M_.params( 5 ) = 0.5;
aa = M_.params( 5 );
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.exo_steady_state( 1 ) = 1;
oo_.steady_state( 2 ) = (((M_.params(3)+M_.params(4))/((1.0*M_.params(5))*M_.params(1)))^(1/(M_.params(1)-1)));
oo_.steady_state( 1 ) = ((M_.params(5)*(oo_.steady_state(2)^M_.params(1)))-(M_.params(3)*oo_.steady_state(2)));
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
save('ramst_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
