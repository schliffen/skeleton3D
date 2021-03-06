function [Timestamp,ppsEvents_onSkinPart_1,ppsEvents_onSkinPart_2,ppsEvents_onSkinPart_3,ppsEvents_onSkinPart_4] = importfile_ppsEvent(filename, startRow, endRow)
%IMPORTFILE_PPSEVENT Import numeric data from a text file as column vectors.
%   Timestamp: time when being received the message
%   ppsEvents_onSkinPart_1(1 - skin_part_id, 2:4 - P(t) on Root, 5:7 - n_c on Root, 8 - activation) 
%   filename: name of data file
%   startRow: optional
%   endRow: optional
%   [TIMESTAMP,PPSEVENTS_ONSKINPART_1,PPSEVENTS_ONSKINPART_2,PPSEVENTS_ONSKINPART_3,PPSEVENTS_ONSKINPART_4]
%   = IMPORTFILE_PPSEVENT(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [TIMESTAMP,PPSEVENTS_ONSKINPART_1,PPSEVENTS_ONSKINPART_2,PPSEVENTS_ONSKINPART_3,PPSEVENTS_ONSKINPART_4]
%   = IMPORTFILE_PPSEVENT(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [Timestamp,ppsEvents_onSkinPart_1,ppsEvents_onSkinPart_2,ppsEvents_onSkinPart_3,ppsEvents_onSkinPart_4] = importfile_ppsEvent('data.log',1, 2519);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/09/13 14:08:02

%% Initialize variables.
delimiter = {' ','(',')'};
if nargin<=2
    startRow = 1;
    endRow = inf;
end

%% Format for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: double (%f)
%   column15: double (%f)
%	column16: double (%f)
%   column17: text (%s)
%	column18: double (%f)
%   column19: double (%f)
%	column20: double (%f)
%   column21: double (%f)
%	column22: double (%f)
%   column23: double (%f)
%	column24: double (%f)
%   column25: double (%f)
%	column26: double (%f)
%   column27: double (%f)
%	column28: double (%f)
%   column29: double (%f)
%	column30: double (%f)
%   column31: double (%f)
%	column32: text (%s)
%   column33: double (%f)
%	column34: double (%f)
%   column35: double (%f)
%	column36: double (%f)
%   column37: double (%f)
%	column38: double (%f)
%   column39: double (%f)
%	column40: double (%f)
%   column41: double (%f)
%	column42: double (%f)
%   column43: double (%f)
%	column44: double (%f)
%   column45: double (%f)
%	column46: double (%f)
%   column47: text (%s)
%	column48: double (%f)
%   column49: double (%f)
%	column50: double (%f)
%   column51: double (%f)
%	column52: double (%f)
%   column53: double (%f)
%	column54: double (%f)
%   column55: double (%f)
%	column56: double (%f)
%   column57: double (%f)
%	column58: double (%f)
%   column59: double (%f)
%	column60: double (%f)
%   column61: double (%f)
%	column62: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%f%f%f%f%f%f%f%f%f%f%f%f%f%f%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,-1000.0,'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'MultipleDelimsAsOne', true, 'EmptyValue' ,-1000.0,'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
VarName1 = dataArray{:, 1};
Timestamp = dataArray{:, 2};

i = 3;
ppsEvents_onSkinPart_1 =   [dataArray{:,i},...                                          % skin_part_id  1 
                            dataArray{:,i+7},dataArray{:,i+8},dataArray{:,i+9},...      % P(t)          2:4
                            dataArray{:,i+10},dataArray{:,i+11},dataArray{:,i+12},...   % n_c           5:7
                            dataArray{:,i+13}];                                         % threat        8
                        
i = 18;
ppsEvents_onSkinPart_2 =   [dataArray{:,i},...
                            dataArray{:,i+7},dataArray{:,i+8},dataArray{:,i+9},... % P(t)
                            dataArray{:,i+10},dataArray{:,i+11},dataArray{:,i+12},... % n_c
                            dataArray{:,i+13}];
                        
i = 3+2*15;
ppsEvents_onSkinPart_3 =   [dataArray{:,i},...
                            dataArray{:,i+7},dataArray{:,i+8},dataArray{:,i+9},... % P(t)
                            dataArray{:,i+10},dataArray{:,i+11},dataArray{:,i+12},... % n_c
                            dataArray{:,i+13}];

i = 3+3*15;
ppsEvents_onSkinPart_4 =   [dataArray{:,i},...
                            dataArray{:,i+7},dataArray{:,i+8},dataArray{:,i+9},... % P(t)
                            dataArray{:,i+10},dataArray{:,i+11},dataArray{:,i+12},... % n_c
                            dataArray{:,i+13}];

