function [time_stamp,rec_num,data,names] = import_campbell_data(fdir,name)
%% get_campbell_data
% 
% 
%
% assumes:
% 
% * first 5 rows are header info 
% * first 2 columns are time/date/timestep info 
% 
%
% author: john braley
% create date: 11-Jul-2019

    % setup defaults for optional inputs
    if nargin > 1; fdir = fullfile(fdir, name); end
    
    % Create file handle instance
    f = file();
    f.name = fdir; % populate handle properties
    
    % Read rows to determine channels
    strings = f.read;  % read every row into string
  
    %find number of columns (date column not included)
    match = regexp(strings{3},',');
    num_columns = length(match);
    % format of fields to be read
    format = ['%s' repmat('%f', [1 num_columns])];  % string and floating point
    
    row_start = 5;    
    % preallocate
    time_string = cell((length(strings)-row_start+1),1);
    data = zeros((length(strings)-row_start+1),num_columns);
    % loop through each line 
    for ii = row_start:length(strings)
        dat_ind = ii-row_start+1;
        dat = textscan(strings{ii},format,'collectoutput',1,'delimiter',',','treat','"NAN"');
        time_string(dat_ind) = dat{1};
        data(dat_ind,:) = dat{2};
    end
        
    % pull out record numbers
    rec_num = data(:,1);
    data = data(:,2:end);
    
	% convert time strings to date_time objects
    date_strings = cell2mat(time_string);
    % Find length of strings
    string_length = zeros(1,length(time_string));
    for ii = 1:length(time_string)
        string_length(ii) = length(date_strings(ii,:));
    end
    
    % Index different lengths
    % Date to the second - 21
    sec = find(string_length==21);
    % Date to the millisecond - 24
    milli = find(string_length>24);
            
	% convert string to matlab datetime object 
    time_stamp(sec) = datetime(date_strings(sec,2:end-1),'InputFormat','yyyy-MM-dd HH:mm:ss');
    time_stamp(milli) = datetime(date_strings(milli,2:end-1),'InputFormat','yyyy-MM-dd HH:mm:ss.SS');
    
    % read channel alias names
    format2 = [repmat('%s', [1 num_columns+1])];  % string
    name_string = textscan(strings{2},format2,'collectoutput',1,'delimiter',',');
    for jj=3:length(name_string{1})
        names{jj-2} = name_string{1}{jj}(2:end-1);
    end
    
    %read units
    % placeholder for future work
	
end
