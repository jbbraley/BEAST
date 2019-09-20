% get filename and path of data file
[fname, fdir] = uigetfile('.dat');

% import data
[date,rec,data,names] = import_campbell_data(fdir,fname);

%% Plot formatting
% Date time format
dateform_l = 'eee h:mm a'; % For viewing long time histories. Ex: Wed 10:25 PM
dateform_s = 'h:mm:ss a'; % For viewing short time histories. Ex: 10:25:15 PM

%% Plot Time History
channels = [19:24]; %[73:80]; % channels to be included in the plot

figure
plot(date, data(:,channels),'DatetimeTickFormat',dateform_s);
legend(names(channels))
   



