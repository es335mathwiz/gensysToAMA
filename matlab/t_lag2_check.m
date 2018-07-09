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
M_.fname = 't_lag2_check';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete t_lag2_check.log;
warning on;
warning backtrace;
logname_ = 't_lag2_check.log';
diary 't_lag2_check.log';
erase_compiled_function('t_lag2_check_static');
erase_compiled_function('t_lag2_check_dynamic');
M_.exo_names = 'e';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'u');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'y';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'c');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'k');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'a');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'h');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'b');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'b1');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'beta';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'rho');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'alpha');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'delta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'theta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'psi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'tau');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'phi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.Sigma_e = zeros(2, 2);
M_.endo_nbr = 7;
M_.recur_nbr = 0;
M_.param_nbr = 8;
M_.lead_lag_incidence = [
	 0 5 12;
	 0 6 13;
	 1 7 0;
	 2 8 0;
	 0 9 0;
	 3 10 14;
	 4 11 0;]';
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(7, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = zeros(8, 1);
options_.periods = 400;
options_.simul = 1;
M_.params( 3 ) = 0.36;
alpha = M_.params( 3 );
M_.params( 2 ) = 0.95;
rho = M_.params( 2 );
M_.params( 7 ) = 0.025;
tau = M_.params( 7 );
M_.params( 1 ) = 0.99;
beta = M_.params( 1 );
M_.params( 4 ) = 0.025;
delta = M_.params( 4 );
M_.params( 6 ) = 0;
psi = M_.params( 6 );
M_.params( 5 ) = 2.95;
theta = M_.params( 5 );
M_.params( 8 ) = 0.1;
phi = M_.params( 8 );
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.steady_state( 1 ) = 1.08068253095672;
oo_.steady_state( 2 ) = 0.80359242014163;
oo_.steady_state( 5 ) = 0.29175631001732;
oo_.steady_state( 3 ) = 5;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.exo_steady_state( 1 ) = 0;
oo_.exo_steady_state( 2 ) = 0;
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
save('t_lag2_check_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
