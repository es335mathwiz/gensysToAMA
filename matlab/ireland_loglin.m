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
M_.fname = 'ireland_loglin';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete ireland_loglin.log;
warning on;
warning backtrace;
logname_ = 'ireland_loglin.log';
diary 'ireland_loglin.log';
erase_compiled_function('ireland_loglin_static');
erase_compiled_function('ireland_loglin_dynamic');
M_.exo_names = 'e';
M_.exo_names_tex = '';
M_.endo_names = 'y';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'a');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'k');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'c');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'i');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'h');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'oy');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'oc');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'oh');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'bet';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'delta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'theta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rho');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'eta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'gam');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'aa');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.Sigma_e = zeros(1, 1);
M_.endo_nbr = 9;
M_.recur_nbr = 0;
M_.param_nbr = 7;
M_.lead_lag_incidence = [
	 0 3 12;
	 1 4 0;
	 2 5 0;
	 0 6 13;
	 0 7 0;
	 0 8 0;
	 0 9 0;
	 0 10 0;
	 0 11 0;]';
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(9, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = zeros(7, 1);
M_.params( 1 ) = 0.99;
bet = M_.params( 1 );
M_.params( 2 ) = 0.025;
delta = M_.params( 2 );
M_.params( 3 ) = 0.2;
theta = M_.params( 3 );
M_.params( 4 ) = 0.9975;
rho = M_.params( 4 );
M_.params( 5 ) = 1.0051;
eta = M_.params( 5 );
M_.params( 6 ) = 0.0045;
gam = M_.params( 6 );
M_.params( 7 ) = 6.0;
aa = M_.params( 7 );
save('ireland_loglin_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
