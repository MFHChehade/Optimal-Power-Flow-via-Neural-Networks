function names = nameColumns(n_gens, n_loads)

% names contains the names of the columns of the dataset (eg: PG1, PD3)
% n_gens is the number of generators
% n_loads is the number of loads

names = cell(1,n_gens + n_loads) ;  

for i = 1:n_loads
    
    str = string(i) ;
    str = convertStringsToChars( str ) ;
    names{i} = strcat('PD',str) ; 

end

for i = 1:n_gens
    
    str = string(i) ;
    str = convertStringsToChars( str ) ;
    names{i + n_loads} = strcat('PG',str) ; 

end

end