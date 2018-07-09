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
M_.fname = 'fs2000a';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete fs2000a.log;
warning on;
warning backtrace;
logname_ = 'fs2000a.log';
diary 'fs2000a.log';
erase_compiled_function('fs2000a_static');
erase_compiled_function('fs2000a_dynamic');
M_.exo_names = 'e_a';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'e_m');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'm';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'P');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'c');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'e');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'W');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'R');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'k');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'d');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'n');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'l');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'gy_obs');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'gp_obs');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Y_obs');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'P_obs');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'y');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'dA');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'alp';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'bet');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'gam');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'mst');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rho');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'psi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'del');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 2;
M_.Sigma_e = zeros(2, 2);
M_.endo_nbr = 16;
M_.recur_nbr = 0;
M_.param_nbr = 7;
M_.lead_lag_incidence = [
	 1 7 23 0;
	 2 8 24 28;
	 0 9 25 29;
	 0 10 26 0;
	 0 11 0 0;
	 0 12 0 0;
	 3 13 0 0;
	 0 14 0 0;
	 0 15 27 0;
	 0 16 0 0;
	 0 17 0 0;
	 0 18 0 0;
	 4 19 0 0;
	 5 20 0 0;
	 6 21 0 0;
	 0 22 0 0;]';
M_.exo_names_orig_ord = [1:2];
M_.maximum_lag = 1;
M_.maximum_lead = 2;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 2;
oo_.steady_state = zeros(16, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(2, 1);
M_.params = zeros(7, 1);
M_.params( 1 ) = 0.33;
alp = M_.params( 1 );
M_.params( 2 ) = 0.99;
bet = M_.params( 2 );
M_.params( 3 ) = 0.003;
gam = M_.params( 3 );
M_.params( 4 ) = 1.011;
mst = M_.params( 4 );
M_.params( 5 ) = 0.7;
rho = M_.params( 5 );
M_.params( 6 ) = 0.787;
psi = M_.params( 6 );
M_.params( 7 ) = 0.02;
del = M_.params( 7 );
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.steady_state( 7 ) = 6;
oo_.steady_state( 1 ) = M_.params(4);
oo_.steady_state( 2 ) = 2.25;
oo_.steady_state( 3 ) = 0.45;
oo_.steady_state( 4 ) = 1;
oo_.steady_state( 5 ) = 4;
oo_.steady_state( 6 ) = 1.02;
oo_.steady_state( 8 ) = 0.85;
oo_.steady_state( 9 ) = 0.19;
oo_.steady_state( 10 ) = 0.86;
oo_.steady_state( 15 ) = 0.6;
oo_.steady_state( 11 ) = exp(M_.params(3));
oo_.steady_state( 12 ) = exp((-M_.params(3)));
oo_.steady_state( 16 ) = exp(M_.params(3));
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
steady;
save('fs2000a_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
