function [DataSet, n_gens, n_loads] = generateData(bus, N, delta)

% DataSet is the output matrix 
% n_gens is the number of generator nodes (for proper column naming)
% n_loads is the number of load nodes (for proper column naming)

% Bus is the name of of the system (eg: case3, case9, etc)
% N is the number of data samples needed (eg: 1 million samples)
% delta is the range of variation of the states (eg: vary demand by 10%)

file = strcat(bus,".m") ; % name of the system file found in the data section of MATPOWER
mpc = loadcase(file) ; % load the system 

n_gens = size(mpc.gen,1) ; % number of generators nodes
n_loads = sum(mpc.bus(:,3)>0) ; % number of load nodes

n = n_gens + n_loads ; % number of rows of DataSet
m = N ; % number of columns of DataSet
DataSet = zeros( m , n ) ; % generate an m-by-n matrix for the output

idx_load = mpc.bus(:,3)>0 ; % index of the load nodes
P = mpc.bus(:,3) ; % vector of power consumed (whether loads or not)
PD_Default = P(idx_load) ; % vector of only load nodes, contains default values for demand

for i = 1:N

    mpc.bus(idx_load,3) = randomAdjustment(PD_Default, delta) ; % adjust demand by delta % from default value
    
    mpopt = mpoption('verbose', 0, 'out.all', 0); % avoid printing the results
    results = rundcopf(mpc, mpopt) ; % run DC OPF
    
    PD = mpc.bus(idx_load,3) ; % store the demand at this iteration
    PG = results.gen(:,2) ; % store the (optimal) generation at this iteration
    DataSet(i,:) = [PD', PG'] ; % add a row at each iteration

end

end