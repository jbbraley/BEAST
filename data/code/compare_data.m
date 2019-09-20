% get filename and path of data file
fname1 = 'C:\Users\John B\Projects_Git\rutgers_misc\BEAST\data\deck_pour\CR6Series-BEASToffice_AVG_DATA_deck-cure_1_2019_07_08_14_06_04.dat';
fname2 = 'C:\Users\John B\Projects_Git\rutgers_misc\BEAST\data\CR6Series-BEASToffice_AVG_DATA_2019_6_11_2019_07_11_15_34_36.dat';

% import data
[date1,rec1,data1,names1] = import_campbell_data(fname1);
[date2,rec2,data2,names2] = import_campbell_data(fname2);



%% Plot formatting
% Date time format
dateform_l = 'eee h:mm a'; % For viewing long time histories. Ex: Wed 10:25 PM
dateform_s = 'h:mm:ss a'; % For viewing short time histories. Ex: 10:25:15 PM

%% Plot Time History
channels = [73:80]; % channels to be included in the plot

figure
plot([date1 date2], [data1(:,channels); data2(:,channels)],'DatetimeTickFormat',dateform_s);
legend(names1(channels))


figure
plot([data1(1:8800,channels); data2(600:end,channels)]);
legend(names1(channels))

%% Humidity data
% get filename and path of data file
clear all
fname1 = 'C:\Users\John B\Projects_Git\rutgers_misc\BEAST\data\deck_pour\CR1000-BEASToffice_AVG_DATA_deck-cure_1_2019_07_08_14_20_10.dat';
fname2 = 'C:\Users\John B\Projects_Git\rutgers_misc\BEAST\data\CR1000-BEASToffice_AVG_DATA_7_11_2019_07_11_15_36_20.dat';

% import data
[date1,rec1,data1,names1] = import_campbell_data(fname1);
[date2,rec2,data2,names2] = import_campbell_data(fname2);



%% Plot formatting
% Date time format
dateform_l = 'eee h:mm a'; % For viewing long time histories. Ex: Wed 10:25 PM
dateform_s = 'h:mm:ss a'; % For viewing short time histories. Ex: 10:25:15 PM

%% Plot Time History
channels = [19:24]; % channels to be included in the plot

figure
plot([date1 date2], [data1(:,channels); data2(:,channels)],'DatetimeTickFormat',dateform_s);
legend(names1(channels))


figure
plot([data1(1:1300,channels); data2(:,channels)]);
legend(names1(channels))