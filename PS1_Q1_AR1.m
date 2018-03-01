%Created by RM on 2017.01.16 for ECON 607 PS 1, Q1

%A: Simulate AR(1) process:
%Initialize values
y0 = 12+25;
rho = (10/11);
sigma_2 = 8;
alpha = 25;

T = 1000;
y = [1:T]';

for i=1:T ;
    if i == 1
        y(i,1) = y0;
        ylag = y0;
       % yalt = y0;
    end;
    if i > 1
        randnorm = randn(1,1)*sigma_2^(1/2);
        y(i,1) = 25 + rho * ylag + randnorm;
        ylag = y(i,1);
       % yalt = [yalt', ylag]';
    end;
end;

y_test = ar1(alpha,rho,sigma_2,T,y0);

%B: Three Results
%2: 

y_b2 = ar1(0,.9,.19*(.1^2),100,0);
std_b2 = std(y_b2);
mean_b2 = mean(y_b2);
plot(y_b2);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B2.pdf');

y_b2_lag = lagmatrix(y_b2,1);

%3:
scatter(y_b2_lag,y_b2);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B3.pdf');

%4: 
y_b4 = ar1(0,.9,0,100,0.01);
plot(y_b4);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B4.pdf');


%5: Three Results, Change Rho to .5
%5-2: 

y_b5_2 = ar1(0,.5,.19*(.1^2),100,0);
std_b5_2 = std(y_b5_2);
mean_b5_2 = mean(y_b5_2);
plot(y_b5_2);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B5_2.pdf');


y_b5_2_lag = lagmatrix(y_b5_2,1);

%5-3:
scatter(y_b5_2_lag,y_b5_2);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B5_3.pdf');

%5-4: 
y_b5_4 = ar1(0,.5,0,100,0.01);
plot(y_b5_4);
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS1_Q1_B5_4.pdf');












       