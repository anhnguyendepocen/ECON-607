T = [1:99,1]
epsilon = normrnd(0,10,1,100)
alpha = .2
tuning = 1600
fakeY = T*0


for i = 2:length(fakeY)
   j = i - 1
   fakeY(1,i) = alpha * fakeY(1,j) + epsilon(i)  
end

hpfilter = hp(tuning,fakeY);

detrended = fakeY - hpfilter';

%test = cat(1,detrended,fakeY)
%plot(test')


%Part C: Read in FRED data


filenamexl = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/GDPdataexcel.xlsx';
gdpdata = xlsread(filenamexl)
gdpdata = gdpdata(:, 2); 

lngdp = log(gdpdata)'

plot(lngdp');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_C1.pdf');


hpfilter_gdp = hp(1600,lngdp);
detrended_gdp = lngdp - hpfilter_gdp'

plot(detrended_gdp');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_C2.pdf');

std_hp_gdp = std(detrended_gdp');
    
%Part D: Do as above for other series:
%i. personal consumption non durables (pcnd)
%ii. non-res investment (inres)
%iii. res investment (ires)

%i: pcnd

filenamexl = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PCNDdataexcel.xlsx';
pcnddata = xlsread(filenamexl);
pcnddata = pcnddata(:, 2);  

lnpcnd = log(pcnddata)';

plot(lnpcnd');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D1_Nondur.pdf');

hpfilter_pcnd = hp(1600,lnpcnd);
detrended_pcnd = lnpcnd - hpfilter_pcnd'

plot(detrended_pcnd');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D2_Nondur.pdf');

std_hp_pcnd = std(detrended_pcnd');

%ii: inres

filenamexl = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/INRESdataexcel.xlsx';
inresdata = xlsread(filenamexl);
inresdata = inresdata(:, 2);  

lninres = log(inresdata)';

plot(lninres');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D1_InvstNonRes.pdf');

hpfilter_inres = hp(1600,lninres);
detrended_inres = lninres - hpfilter_inres'

plot(detrended_inres');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D2_InvstNonRes.pdf');

std_hp_inres = std(detrended_inres');

%iii: ires

filenamexl = '/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/IRESdataexcel.xlsx';
iresdata = xlsread(filenamexl);
iresdata = iresdata(:, 2);  

lnires = log(iresdata)';

plot(lnires');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D1_InvstRes.pdf');

hpfilter_ires = hp(1600,lnires);
detrended_ires = lnires - hpfilter_ires'

plot(detrended_ires');
saveas(gcf,'/Users/russellmorton/Desktop/Coursework/Winter 2018/ECON 607/PS_Figures/PS3_Q2_D2_InvstRes.pdf');

std_hp_ires = std(detrended_ires');


%e: Let   ?yt_
%denote  HP-filtered  GDP  at  time t.   
%Using  the  data  constructed in (c) and (d),
%construct a table with the cross correlation coefficients
%??x,j=Cov[ ?xt?j, ?yt]/?( ?yt)?( ?xt)?

%need to standardize dates

corr_gdp_pcnd = corrcoef(detrended_gdp,detrended_pcnd);

len_gdp = length(detrended_gdp);
len_inres = length(detrended_inres);
len_diff = len_gdp - len_inres
detrended_gdp_truncated = detrended_gdp(:,len_diff+1:len_gdp);
corr_gdp_inres = corrcoef(detrended_gdp_truncated,detrended_inres);

corr_gdp_ires = corrcoef(detrended_gdp_truncated,detrended_ires);



