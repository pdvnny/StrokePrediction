function preview_table = preview_data(entire_table,fieldslogical,rowselect,rowrange)
%{

This function serves to extract and display data from the
"strokedata" table that has been imported.
This function should be easy to adapt to actually extract subsets of data
that we want to use later.
Inputs:
    (1) entire_table - passing in the stroke data table to extract from
    (2) fieldslogical - the user selected the fields that are desired as a
    logical. These can be directly used to extract certain fields of the
    table. A unique feature of tables rather than structs.
    (3) rowselect - approach desired for selecting rows
             1 = extract all rows
             2 = extract specific rows based on "rowrange"
    (4) rowrange - a vector of the rows that need to be extracted
Returns:
    (1) preview_table = an appreviated version of table passed to the function
%}

col_names = ["id","gender","age","hypertension","heart_disease","ever_married","work_type","Residence_type","avg_glucose_level","bmi","smoking_status","stroke"];
cols_selected = col_names(fieldslogical);

if rowselect == 1
    preview_table = entire_table(:,cols_selected);
elseif rowselect == 2
    if (size(rowrange,1) > 1) && (size(rowrange,2) > 1)
        error("The vector or rows passed to 'preview_data' cannot be a matrix")
    else
        preview_table = entire_table(rowrange,cols_selected);
    end
else
    fprintf("\nBe sure to select one of the two types of row extraction. (1) All rows (2) Specify your own rows.\n")
    preview_table = zeros(1,1);
end
end