
mu = 1600;

filenamexl = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/GDPdataexcel.xlsx';
data = xlsread(filenamexl)

lngdp = log(data)'


Y = lngdp;

tau = Y'* Y
tau = tau * 0

len = length(Y);

for  i = 1:len;
     if i == 1 
        tau(1,1) = mu + 1;
        tau(1,2) = - 2 * mu;
        tau(1,3) = mu;
     
     elseif i == 2
         tau(2,1) = -2 * mu;
         tau(2,2) = 5 * mu + 1;
         tau(2,3) = -4 * mu;
         tau(2,4) = mu;
         
     elseif i == len
       tau(len,len-2) =  mu;
       tau(len,len-1) = -2 * mu;
       tau(len,len) = mu + 1;
       
     elseif i == (len-1)
         tau(len-1,len-3) = mu;
         tau(len-1,len-2) = -4 * mu;
         tau(len-1,len-1) = 5 * mu + 1;
         tau(len-1,len) = - 2 * mu;
     
     else
         tau(i,i-2) = mu;
         tau(i,i-1) = -4 * mu;
         tau(i,i)   = 1 + 6 * mu;
         tau(i,i+1) = -4 * mu;
         tau(i,i+2) = mu;
     end;
     
end;



filter = linsolve(tau,Y')';


