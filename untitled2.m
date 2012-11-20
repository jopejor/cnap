------------------------------------------
function prob = my_discrete_odd(r,bb),
%
% To be vectorized in a trivial way
%
%
prob = ((1/2)*(exp(bb)-1))/exp(bb*abs(r));


% ------------------------------------------


% --+----------------
% m | 1 2 3 4 
% --+----------------
% y | -3 -1 1 3
% --+----------------
% r | -2 -1 1 2
% --+----------------


% Target variance
sigma2 = 4.5;
% Find the value of the tuning parameter 'bb' corresponding to sigma2
bb = fzero(inline(['1+2*csch((bb/2)^2)-',num2str(sigma2)]),1.5);


% Num. points where we wanna evaluate the 'odd' distribution
num_point = 20;
% Find the corresponding 'r'
[idx idx2 r] = find(-num_point:num_point);
% Find the corresponding odd integers
y = -(2*num_point-1):2:2*num_point-1; 
ll_y = length(y);
pp = zeros(size(y));


% Evaluate the distribution (to be vectorized in a trivial way)
for m=1:ll_y, 
    pp(m) = my_discrete_odd(r(m),bb);
end


% Plot
plot(y,pp,'.r'),


% Check - sum up to 1?
s = sum(pp);
