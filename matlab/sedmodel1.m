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
M_.fname = 'sedmodel1';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete sedmodel1.log;
warning on;
warning backtrace;
logname_ = 'sedmodel1.log';
diary 'sedmodel1.log';
erase_compiled_function('sedmodel1_static');
erase_compiled_function('sedmodel1_dynamic');
M_.exo_names = 'eps1';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'eps2');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.exo_names = strvcat(M_.exo_names,'eps3');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'A';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'Disp');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'G');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Int');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'L');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'LStar');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'pi');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Welf');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'WelfStar');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'x0');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Y');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'YGap');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'YStar');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'z1');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'z2');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Cbar');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'Cequiv');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'alpha';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'beta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'gamma');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rhoa');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rhog');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rho');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'phi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'chi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'chi0');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'theta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'xi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'ABar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'GBar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'KBar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'ZBar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'piBar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'Istar');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 3;
M_.Sigma_e = zeros(3, 3);
M_.endo_nbr = 17;
M_.recur_nbr = 0;
M_.param_nbr = 17;
M_.lead_lag_incidence = [
	 1 5 0;
	 2 6 0;
	 3 7 22;
	 4 8 0;
	 0 9 0;
	 0 10 0;
	 0 11 23;
	 0 12 24;
	 0 13 25;
	 0 14 0;
	 0 15 26;
	 0 16 0;
	 0 17 0;
	 0 18 27;
	 0 19 28;
	 0 20 0;
	 0 21 0;]';
M_.exo_names_orig_ord = [1:3];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(17, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(3, 1);
M_.params = zeros(17, 1);
M_.params( 1 ) = 0.3;
alpha = M_.params( 1 );
M_.params( 2 ) = 0.99;
beta = M_.params( 2 );
M_.params( 3 ) = 15;
gamma = M_.params( 3 );
M_.params( 4 ) = 0.8;
rhoa = M_.params( 4 );
M_.params( 5 ) = 0.7;
rhog = M_.params( 5 );
M_.params( 7 ) = 1.5;
phi = M_.params( 7 );
M_.params( 8 ) = 1.5;
chi = M_.params( 8 );
M_.params( 9 ) = 1;
chi0 = M_.params( 9 );
M_.params( 10 ) = 0.333333333333;
theta = M_.params( 10 );
M_.params( 11 ) = 0.75;
xi = M_.params( 11 );
M_.params( 12 ) = 4.0266;
ABar = M_.params( 12 );
M_.params( 13 ) = 0.3163;
GBar = M_.params( 13 );
M_.params( 14 ) = 9.489;
KBar = M_.params( 14 );
M_.params( 15 ) = .03;
ZBar = M_.params( 15 );
M_.params( 16 ) = 1;
piBar = M_.params( 16 );
M_.params( 6 ) = .8;
rho = M_.params( 6 );
M_.params( 17 ) = 1.01010101010101;
Istar = M_.params( 17 );
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.steady_state( 1 ) = 4.022;
oo_.steady_state( 2 ) = 1;
oo_.steady_state( 3 ) = 0.3;
oo_.steady_state( 4 ) = 1.0101;
oo_.steady_state( 5 ) = 0.22;
oo_.steady_state( 6 ) = 0.22;
oo_.steady_state( 7 ) = 1;
oo_.steady_state( 8 ) = (-359);
oo_.steady_state( 9 ) = (-359);
oo_.steady_state( 10 ) = 1;
oo_.steady_state( 11 ) = 2.8;
oo_.steady_state( 12 ) = 0;
oo_.steady_state( 13 ) = 2.8;
oo_.steady_state( 14 ) = 2.5;
oo_.steady_state( 15 ) = 1.8;
oo_.steady_state( 16 ) = 0.024;
oo_.steady_state( 17 ) = 0.024;
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
save('sedmodel1_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
