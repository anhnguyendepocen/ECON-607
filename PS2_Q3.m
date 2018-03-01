%Created by RM on 2018.02.07 for PS 2 Q3
clear;

%Plug in Parameters specified in problem and solve for SS using equations
%from 3.c

ITC = 0;
tau = 0;
theta = 1;
alpha = .5;
bar_r = .04;
bar_delta = .1;
A = 1;

r = bar_r * .25;
delta = bar_delta * .25;

%[(\frac{\delta}{A})^{\alpha-1}(\frac{(1-ITC)(r+\delta)}{(1-\tau)\alpha})]^\frac{1}{\theta\alpha-\theta-1} &= P
P_SS = [((delta/A)^(alpha - 1))*((1-ITC)*(r+delta))/((1-tau)*alpha)]^(1/(theta*alpha-theta-1));

%K_{SS} &= (\frac{(1-ITC)P(r+\delta)}{(1-\tau)\alpha})^\frac{1}{\alpha-1}
K_SS = [[(1-ITC)*P_SS*(r+delta)]/[(1-tau)*alpha]]^(1/(alpha-1));

I_SS = delta * K_SS;

%e
rhos = [.25, .5, .75, .9, 1];

dir_orig = pwd;

% Specify folder containing Dynare files
dir_dyn = strcat(dir_orig,'/Dynare');
dyn = 'dynPS2Q3';
gform = '.pdf';

cd(dir_dyn); 
output = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/'

for i = 1:length(rhos)
   if i == 1

    dynare dynPS2Q3 noclearall;
  else
       set_param_value('rho', rhos(i));
       info = stoch_simul(var_list_);
   end
 movefile(strcat(dyn, '_IRF_epsilon',gform), ...
 strcat(strcat(output,'PS2Q3_IRF_eps_rho_'),num2str(i),gform));

end
%set_param_value('rho', .25);
%info = stoch_simul(var_list_);
%f
deltas = [.2, .1, .05, .02, .01];

for i = 1:length(deltas)
   if i == 1
       set_param_value('rho', .9);
   end
   
   set_param_value('bar_delta', deltas(i));
   info = stoch_simul(var_list_);
   
 movefile(strcat(dyn, '_IRF_epsilon',gform), ...
 strcat(strcat(output,'PS2Q3_IRF_eps_del_'),num2str(i),gform));
end

cd(dir_orig); 
