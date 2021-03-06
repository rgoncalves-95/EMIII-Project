% Barcelona School of Economics
% Term III - EMIII
% Final Project
% Title: A comparison of direct and iterated multistep AR methods for forecasting
% Venezuelan Inflation
% Author: Ricardo Gonçalves 
% Student ID: 200780

%% Load data and inspect it

table = readtable('Data/Monthly CPI 1950-2022 Venezuela.csv');
cpi_dates = table2array(table(:,1));
cpi = table2array(table(:,2));
log_cpi = log(cpi);


% Define hyper-inflation period
hi_startdate = find(cpi_dates==datetime('2017-01-01'));
hi_enddate = find(cpi_dates==datetime('2020-06-01')); % Find some source to support this

figure
plot(log_cpi(1:hi_startdate-1))
hold on
%ylabel('%');
f = gcf;
exportgraphics(f,strcat(figdir,'TB3MS and TB6MS.png'),'Resolution',300)
close all