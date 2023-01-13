function [] = generateSheet(bus, N, delta, extension)

% the first 3 input parameters are used by generateData
% extension is to specify the file extension (eg: .csv, .xlsx)
% the function generates the output data in a ".csv" file

[data, n_gens, n_loads] = generateData(bus, N, delta) ; % extract the matrix of the data
T = array2table(data) ; % convert the matrix into a table
T.Properties.VariableNames = nameColumns(n_gens, n_loads) ;

name = "data" ; % file name 
filename = strcat(name, extension) ; % file name with extension
writetable(T,filename) ; % write the data into the file

end