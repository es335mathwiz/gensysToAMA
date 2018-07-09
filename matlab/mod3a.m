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
M_.fname = 'mod3a';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete mod3a.log;
warning on;
warning backtrace;
logname_ = 'mod3a.log';
diary 'mod3a.log';
erase_compiled_function('mod3a_static');
erase_compiled_function('mod3a_dynamic');
M_.exo_names = 'e_x';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'e_y');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'dx';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'dy');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'rho_x';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'rho_y');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.Sigma_e = zeros(2, 2);
M_.endo_nbr = 2;
M_.recur_nbr = 0;
M_.param_nbr = 2;
M_.lead_lag_incidence = [
	 1 3;
	 2 4;]';
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(2, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = zeros(2, 1);
M_.params( 1 ) = 0.5;
rho_x = M_.params( 1 );
M_.params( 2 ) = (-0.3);
rho_y = M_.params( 2 );
save('mod3a_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
