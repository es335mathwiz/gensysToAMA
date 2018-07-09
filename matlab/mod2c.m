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
M_.fname = 'mod2c';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete mod2c.log;
warning on;
warning backtrace;
logname_ = 'mod2c.log';
diary 'mod2c.log';
erase_compiled_function('mod2c_static');
erase_compiled_function('mod2c_dynamic');
M_.exo_names = 'e_x';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'e_y');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'dx';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'dy');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'coint_err');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'rho_x';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'rho_y');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'b');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'a1');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'a2');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.Sigma_e = zeros(2, 2);
M_.endo_nbr = 3;
M_.recur_nbr = 0;
M_.param_nbr = 5;
M_.lead_lag_incidence = [
	 1 4;
	 2 5;
	 3 6;]';
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(3, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = zeros(5, 1);
M_.params( 1 ) = 0.5;
rho_x = M_.params( 1 );
M_.params( 2 ) = (-0.3);
rho_y = M_.params( 2 );
M_.params( 3 ) = 1;
b = M_.params( 3 );
M_.params( 4 ) = (-0.1);
a1 = M_.params( 4 );
M_.params( 5 ) = 0.2;
a2 = M_.params( 5 );
save('mod2c_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
