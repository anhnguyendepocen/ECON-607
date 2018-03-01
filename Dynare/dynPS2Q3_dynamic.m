function [residual, g1, g2, g3] = dynPS2Q3_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(4, 1);
T33 = (params(9)/params(7))^((params(4)-1)/(params(4)*params(3)-params(3)-1));
lhs =y(2);
rhs =(1-params(1))*params(11)+params(1)*y(1)+x(it_, 1);
residual(1)= lhs-rhs;
lhs =0;
rhs =params(15)*exp(y(5))-T33*((1-params(12)*exp(y(2)))*(params(9)+params(8))/(params(4)*(1-params(2))))^(1/(params(4)*params(3)-params(3)-1));
residual(2)= lhs-rhs;
lhs =0;
rhs =params(14)*exp(y(4))-params(7)*(params(15)*exp(y(5)))^params(3);
residual(3)= lhs-rhs;
lhs =0;
rhs =params(13)*exp(y(3))-params(14)*exp(y(4))/params(9);
residual(4)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(4, 6);

  %
  % Jacobian matrix
  %

  g1(1,1)=(-params(1));
  g1(1,2)=1;
  g1(1,6)=(-1);
  g1(2,2)=T33*(params(9)+params(8))*(-(params(12)*exp(y(2))))/(params(4)*(1-params(2)))*getPowerDeriv((1-params(12)*exp(y(2)))*(params(9)+params(8))/(params(4)*(1-params(2))),1/(params(4)*params(3)-params(3)-1),1);
  g1(2,5)=(-(params(15)*exp(y(5))));
  g1(3,4)=(-(params(14)*exp(y(4))));
  g1(3,5)=params(7)*params(15)*exp(y(5))*getPowerDeriv(params(15)*exp(y(5)),params(3),1);
  g1(4,3)=(-(params(13)*exp(y(3))));
  g1(4,4)=params(14)*exp(y(4))/params(9);

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],4,36);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],4,216);
end
end
end
end
