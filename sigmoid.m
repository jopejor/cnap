

function y=sigmoid(x,A,B);

% returns the value of x mapped through the sigmoid function
% with parameters:
% A the sigmoid center
% B the sigmoid width

% 
% 
% 
% y=A+1./(1+exp(-x*B))*(1-A);


y=1./(1+power((A./x),B));

end

