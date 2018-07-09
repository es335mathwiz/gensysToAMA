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
M_.fname = 'rbc';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete rbc.log;
warning on;
warning backtrace;
logname_ = 'rbc.log';
diary 'rbc.log';
erase_compiled_function('rbc_static');
erase_compiled_function('rbc_dynamic');
M_.exo_names = 'e';
M_.exo_names_tex = '';
M_.endo_names = 'y';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'c');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'k');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'i');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'l');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'y_l');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'z');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'beta';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'psi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'delta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'alpha');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rho');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.Sigma_e = zeros(1, 1);
M_.endo_nbr = 7;
M_.recur_nbr = 0;
M_.param_nbr = 5;
M_.lead_lag_incidence = [
	 0 3 0;
	 0 4 10;
	 1 5 0;
	 0 6 0;
	 0 7 11;
	 0 8 0;
	 2 9 12;]';
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = zeros(5, 1);
close all;
M_.params( 4 ) = 0.33;
alpha = M_.params( 4 );
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 3 ) = 0.023;
delta = M_.params( 3 );
M_.params( 2 ) = 1.75;
psi = M_.params( 2 );
M_.params( 5 ) = 0.95;
rho = M_.params( 5 );
sigma   = (0.007/(1-alpha));
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.steady_state( 3 ) = 9;
oo_.steady_state( 2 ) = 0.76;
oo_.steady_state( 5 ) = 0.3;
oo_.steady_state( 7 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
save('rbc_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
