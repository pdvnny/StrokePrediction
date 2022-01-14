function prepared_data = datacleanandprep(rawdatatable)
%This function is receiving a "raw" data table and...
%   NOTE: "raw" because participants under 18 were already removed
%   (1) Creating a new feature from the attributes "smoking_status",
%   "hypertension" and "heart_disease"
%   (2) Removing the aformentioned three attributes
%The function will return a table which should be ready to be analyzed by a
%machine learning model.

%Extract the 1 or 0 for each of the "smoking_status" attribute since it is
%currently categorical
smoking_binary = zeros(length(rawdatatable.smoking_status),1); %pre-allocating
for i = 1:length(rawdatatable.smoking_status)
    if rawdatatable.smoking_status(i) == "smokes" || rawdatatable.smoking_status(i) == "formerly smoked"
        smoking_binary(i) = 1;
    end
end


%creating the new feature
medical_risk_feature = smoking_binary + rawdatatable.hypertension + rawdatatable.heart_disease;


%removing the old features then assigning the new feature to the original datatable
rawdatatable = rawdatatable(:,["gender","age","work_type","avg_glucose_level","bmi","stroke"]);
rawdatatable.medical_risk = medical_risk_feature;


%assigning the new datatable to the output
%prepared_data = "Successfully ran";
prepared_data = rawdatatable;

end