function [extracted_data_array, varargout] = bin_conditional_extract(data_table, targ_col, cond_col,condition)
% This funciton will receive the "strokedata" table and extract data from
% one column of the table (the target column) based on binary information
% in another column (the conditional column).
%{
Inputs:
    (1) data_table - the argument where the "strokedata" table is passed to
    the function
    (2) targ_col - the name or number of the field where the extracted
    data will come from
    (3) cond_col - the name or number of the field that will be used to
    determine to determine if a row will be extracted.
    (4) condition - should be a 1 or 0 (in the current configuration) and
    represents what elements should be extracted - e.g. condition == 1 ...
    then 1 must be in the cond_col for data to be extracted
Output:
    (1) extracted_data_array - the function will extract data based on a
    condition and this vector will return the desired data based on the
    argument condition
    (2) varargout - the data not selected based on the "condition" can also
    be returned if it is requested when called. The function call must
    request two outputs to get this output.

%}

% Preparing the information needed to perform extraction
strokedata_fields = ["id","gender","age","hypertension","heart_disease","ever_married","work_type","Residence_type","avg_glucose_level","bmi","smoking_status","stroke"];

if isa(targ_col, 'int') || isa(targ_col, 'double') %ensuring targ_col is the name of a column
    targ_col = strokedata_fields(targ_col);
elseif ~any(strcmp(strokedata_fields, targ_col))
    error("Your input for targ_col needs to be exactly named after one of the columns or needs to be an 'int' or 'double' that represents the column number.");
end

if isa(cond_col, 'int') || isa(cond_col, 'double') %ensuring targ_col is the name of a column
    cond_col = strokedata_fields(cond_col);
elseif ~any(strcmp(strokedata_fields, cond_col))
    error("Your input for targ_col needs to be exactly named after one of the columns or needs to be an 'int' or 'double' that represents the column number.");
end
    
% each column argument should be assigned the column name now

%Error checking "condition": currently this needs to be a 1 or 0 for this
%function to work.
if condition ~= 1 && condition ~= 0
    error("The 4th argument passed to 'bin_conditional_extract' must be 1 or 0 to tell the function what binary condition to look for.");
end

%Extracting the data now - creates a logical vector and then extracts in
%one line!
extracted_data_array = data_table.(targ_col)(data_table.(cond_col) == condition);

if nargout > 1
    varargout{1} = data_table.(targ_col)(data_table.(cond_col) ~= condition);
end

end