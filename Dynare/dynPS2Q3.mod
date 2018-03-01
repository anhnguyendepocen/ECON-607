// ECON 607 PS 2 Q 3 Dynare file
// Russell Morton
// 2018.02.07


// Variable specification
var ITC K I P;
varexo epsilon;

// Parameter specification
parameters rho tau theta alpha bar_r bar_delta A r delta sigma ITC_bar
ITC_ss K_ss I_ss P_ss;

// Model parameter assignment
rho = .25;
tau = 0;
theta = 1;
alpha = .5;
bar_r = .04;
bar_delta = .1;
A = 1;
r = bar_r * .25;
delta = bar_delta * .25;
sigma = 1;
ITC_bar = 0;

// Steady state assignment
ITC_ss = 0;
K_ss = 68.8612;
I_ss = 1.7125;
P_ss = 1.7125;

// Set up model
// ITC = (1 - rho)*ITC_bar + rho * ITC(-1) + epsilon
model;
// 0 = ITC_ss * exp(ITC) -  (1 - rho)*ITC_bar - rho * exp(ITC(-1)) - epsilon;
ITC = (1 - rho)*ITC_bar + rho * ITC(-1) + epsilon;
0 = P_ss * exp(P) - (delta / A) ^ ( (alpha - 1)/(theta*alpha-theta-1))  *  (((1 - ITC_ss*exp(ITC))*(r+delta)) / ((1-tau)*alpha))^(1/(theta*alpha-theta-1));
0 = I_ss * exp(I) - A *( (P_ss * exp(P))^(theta));
0 = K_ss * exp(K) - (I_ss * exp(I) ) / delta;
end;
 
// Specify initial state
initval;
ITC = 0;
P = 0;
I = 0;
K = 0;
end;

steady;

check;

shocks;
var epsilon = sigma ^ 2;
end;

stoch_simul(order = 1, periods = 10000, drop = 500, graph_format=pdf);




