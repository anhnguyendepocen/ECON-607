%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'dynPS2Q3';
M_.dynare_version = '4.5.3';
oo_.dynare_version = '4.5.3';
options_.dynare_version = '4.5.3';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('dynPS2Q3.log');
M_.exo_names = 'epsilon';
M_.exo_names_tex = 'epsilon';
M_.exo_names_long = 'epsilon';
M_.endo_names = 'ITC';
M_.endo_names_tex = 'ITC';
M_.endo_names_long = 'ITC';
M_.endo_names = char(M_.endo_names, 'K');
M_.endo_names_tex = char(M_.endo_names_tex, 'K');
M_.endo_names_long = char(M_.endo_names_long, 'K');
M_.endo_names = char(M_.endo_names, 'I');
M_.endo_names_tex = char(M_.endo_names_tex, 'I');
M_.endo_names_long = char(M_.endo_names_long, 'I');
M_.endo_names = char(M_.endo_names, 'P');
M_.endo_names_tex = char(M_.endo_names_tex, 'P');
M_.endo_names_long = char(M_.endo_names_long, 'P');
M_.endo_partitions = struct();
M_.param_names = 'rho';
M_.param_names_tex = 'rho';
M_.param_names_long = 'rho';
M_.param_names = char(M_.param_names, 'tau');
M_.param_names_tex = char(M_.param_names_tex, 'tau');
M_.param_names_long = char(M_.param_names_long, 'tau');
M_.param_names = char(M_.param_names, 'theta');
M_.param_names_tex = char(M_.param_names_tex, 'theta');
M_.param_names_long = char(M_.param_names_long, 'theta');
M_.param_names = char(M_.param_names, 'alpha');
M_.param_names_tex = char(M_.param_names_tex, 'alpha');
M_.param_names_long = char(M_.param_names_long, 'alpha');
M_.param_names = char(M_.param_names, 'bar_r');
M_.param_names_tex = char(M_.param_names_tex, 'bar\_r');
M_.param_names_long = char(M_.param_names_long, 'bar_r');
M_.param_names = char(M_.param_names, 'bar_delta');
M_.param_names_tex = char(M_.param_names_tex, 'bar\_delta');
M_.param_names_long = char(M_.param_names_long, 'bar_delta');
M_.param_names = char(M_.param_names, 'A');
M_.param_names_tex = char(M_.param_names_tex, 'A');
M_.param_names_long = char(M_.param_names_long, 'A');
M_.param_names = char(M_.param_names, 'r');
M_.param_names_tex = char(M_.param_names_tex, 'r');
M_.param_names_long = char(M_.param_names_long, 'r');
M_.param_names = char(M_.param_names, 'delta');
M_.param_names_tex = char(M_.param_names_tex, 'delta');
M_.param_names_long = char(M_.param_names_long, 'delta');
M_.param_names = char(M_.param_names, 'sigma');
M_.param_names_tex = char(M_.param_names_tex, 'sigma');
M_.param_names_long = char(M_.param_names_long, 'sigma');
M_.param_names = char(M_.param_names, 'ITC_bar');
M_.param_names_tex = char(M_.param_names_tex, 'ITC\_bar');
M_.param_names_long = char(M_.param_names_long, 'ITC_bar');
M_.param_names = char(M_.param_names, 'ITC_ss');
M_.param_names_tex = char(M_.param_names_tex, 'ITC\_ss');
M_.param_names_long = char(M_.param_names_long, 'ITC_ss');
M_.param_names = char(M_.param_names, 'K_ss');
M_.param_names_tex = char(M_.param_names_tex, 'K\_ss');
M_.param_names_long = char(M_.param_names_long, 'K_ss');
M_.param_names = char(M_.param_names, 'I_ss');
M_.param_names_tex = char(M_.param_names_tex, 'I\_ss');
M_.param_names_long = char(M_.param_names_long, 'I_ss');
M_.param_names = char(M_.param_names, 'P_ss');
M_.param_names_tex = char(M_.param_names_tex, 'P\_ss');
M_.param_names_long = char(M_.param_names_long, 'P_ss');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 4;
M_.param_nbr = 15;
M_.orig_endo_nbr = 4;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('dynPS2Q3_static');
erase_compiled_function('dynPS2Q3_dynamic');
M_.orig_eq_nbr = 4;
M_.eq_nbr = 4;
M_.ramsey_eq_nbr = 0;
M_.lead_lag_incidence = [
 1 2;
 0 3;
 0 4;
 0 5;]';
M_.nstatic = 3;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(4, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(15, 1);
M_.NNZDerivatives = [9; -1; -1];
M_.params( 1 ) = .25;
rho = M_.params( 1 );
M_.params( 2 ) = 0;
tau = M_.params( 2 );
M_.params( 3 ) = 1;
theta = M_.params( 3 );
M_.params( 4 ) = .5;
alpha = M_.params( 4 );
M_.params( 5 ) = .04;
bar_r = M_.params( 5 );
M_.params( 6 ) = .1;
bar_delta = M_.params( 6 );
M_.params( 7 ) = 1;
A = M_.params( 7 );
M_.params( 8 ) = .25*M_.params(5);
r = M_.params( 8 );
M_.params( 9 ) = .25*M_.params(6);
delta = M_.params( 9 );
M_.params( 10 ) = 1;
sigma = M_.params( 10 );
M_.params( 11 ) = 0;
ITC_bar = M_.params( 11 );
M_.params( 12 ) = 0;
ITC_ss = M_.params( 12 );
M_.params( 13 ) = 68.8612;
K_ss = M_.params( 13 );
M_.params( 14 ) = 1.7125;
I_ss = M_.params( 14 );
M_.params( 15 ) = 1.7125;
P_ss = M_.params( 15 );
%
% INITVAL instructions
%
options_.initval_file = 0;
oo_.steady_state( 1 ) = 0;
oo_.steady_state( 4 ) = 0;
oo_.steady_state( 3 ) = 0;
oo_.steady_state( 2 ) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
oo_.dr.eigval = check(M_,options_,oo_);
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(10)^2;
options_.drop = 500;
options_.order = 1;
options_.periods = 10000;
options_.graph_format = char('pdf');
var_list_ = char();
info = stoch_simul(var_list_);
save('dynPS2Q3_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('dynPS2Q3_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('dynPS2Q3_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('dynPS2Q3_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('dynPS2Q3_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('dynPS2Q3_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('dynPS2Q3_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
