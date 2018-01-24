%AR 1 Function for use in PS1 Q1

function ar1vec = ar1(f_alpha,f_rho,f_sigma_2,f_T,f_y0);
pre_ar1vec = [1:f_T]';

for i=1:T ;
    if i == 1
        pre_ar1vec(i,1) = f_y0;
        f_ylag = f_y0;
       % yalt = y0;
    end;
    if i > 1
        randnorm = randn(1,1)*f_sigma_2^(1/2);
        pre_ar1vec(i,1) = f_alpha + f_rho * ylag + randnorm;
        f_ylag = pre_ar1vec(i,1);
       % yalt = [yalt', ylag]';
    end;
end;

ar1vec = pre_ar1vec;

%end;
