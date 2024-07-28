function y = randomAdjustment(x, delta) % adjusts the vector x by a factor y 

% the purpose of this function 
% is to have each element of x vary on its own by a certain factor

% x is the input vector (eg: PD)
% delta is the portion by which to change PD

n = size(x) ; 
y = zeros(n) ; 

for i = 1:n

    factor = (1 - delta) + delta * 2 * rand ; % factor to multiply x, each element has a different random variable
    y(i) = factor * x(i) ; % adjusted value  

end

end