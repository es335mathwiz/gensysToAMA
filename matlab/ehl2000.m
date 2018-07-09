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
M_.fname = 'ehl2000';
% 
% Some global variables initialisation
% 
global_initialization;
diary off;
warning off;

delete ehl2000.log;
warning on;
warning backtrace;
logname_ = 'ehl2000.log';
diary 'ehl2000.log';
erase_compiled_function('ehl2000_static');
erase_compiled_function('ehl2000_dynamic');
M_.exo_names = 'ea';
M_.exo_names_tex = '';
M_.exo_names = strvcat(M_.exo_names,'eg');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.exo_names = strvcat(M_.exo_names,'ems');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.exo_names = strvcat(M_.exo_names,'elamda');
M_.exo_names_tex = strvcat(M_.exo_names_tex,'');
M_.endo_names = 'y';
M_.endo_names_tex = '';
M_.endo_names = strvcat(M_.endo_names,'r');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'dp');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'g');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'a');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'n');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'mc');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'realw');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'mrs');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'dw');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'lamda');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.endo_names = strvcat(M_.endo_names,'ms');
M_.endo_names_tex = strvcat(M_.endo_names_tex,'');
M_.param_names = 'sigma';
M_.param_names_tex = '';
M_.param_names = strvcat(M_.param_names,'gamma');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'thetap');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'betta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'dellta');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'eps');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'thetaw');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'phi');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rhor');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rhoa');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'rhog');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'gammainf');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'gammaogap');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'kp');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.param_names = strvcat(M_.param_names,'kw');
M_.param_names_tex = strvcat(M_.param_names_tex,'');
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.Sigma_e = zeros(4, 4);
M_.endo_nbr = 12;
M_.recur_nbr = 0;
M_.param_nbr = 15;
options_.linear = 1;
M_.lead_lag_incidence = [
	 0 5 17;
	 1 6 0;
	 0 7 18;
	 2 8 19;
	 3 9 0;
	 0 10 0;
	 0 11 0;
	 4 12 0;
	 0 13 0;
	 0 14 20;
	 0 15 0;
	 0 16 0;]';
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(12, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = zeros(15, 1);
options_.periods = 500;
options_.simul = 1;
M_.params( 1 ) = 0.5;
sigma = M_.params( 1 );
M_.params( 2 ) = 2;
gamma = M_.params( 2 );
M_.params( 3 ) = 0.9;
thetap = M_.params( 3 );
M_.params( 4 ) = 0.9;
betta = M_.params( 4 );
M_.params( 5 ) = 0.4;
dellta = M_.params( 5 );
M_.params( 6 ) = 6;
eps = M_.params( 6 );
M_.params( 7 ) = 0.01;
thetaw = M_.params( 7 );
M_.params( 8 ) = 6;
phi = M_.params( 8 );
M_.params( 9 ) = 0.9;
rhor = M_.params( 9 );
M_.params( 10 ) = 0.9;
rhoa = M_.params( 10 );
M_.params( 11 ) = 0.9;
rhog = M_.params( 11 );
M_.params( 12 ) = 1.5;
gammainf = M_.params( 12 );
M_.params( 13 ) = 0.125;
gammaogap = M_.params( 13 );
M_.params( 14 ) = ((((1-M_.params(5))*(1-(M_.params(4)*M_.params(3))))*(1-M_.params(3)))/(M_.params(3)*(1+(M_.params(5)*(M_.params(6)-1)))));
kp = M_.params( 14 );
M_.params( 15 ) = (((1-(M_.params(4)*M_.params(7)))*(1-M_.params(7)))/(M_.params(7)*(1+(M_.params(8)*M_.params(2)))));
kw = M_.params( 15 );
% 
% INITVAL instructions 
% 
options_.initval_file = 0;
endval_=0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 2 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 6 ) = 0;
oo_.steady_state( 7 ) = 0;
oo_.steady_state( 8 ) = 0;
oo_.steady_state( 9 ) = 0;
oo_.steady_state( 10 ) = 0;
oo_.steady_state( 11 ) = 0;
oo_.steady_state( 5 ) = 0;
oo_.steady_state( 12 ) = 0;
oo_.y_simul=[oo_.steady_state*ones(1,M_.maximum_lag)];
if M_.exo_nbr > 0;
	oo_.exo_simul = [ones(M_.maximum_lag,1)*oo_.exo_steady_state'];
end;
if M_.exo_det_nbr > 0;
	oo_.exo_det_simul = [ones(M_.maximum_lag,1)*oo_.exo_det_steady_state'];
end;
save('ehl2000_results', 'oo_');
diary off

disp(['Total computing time : ' sec2hms(round(toc)) ]);
