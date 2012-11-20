
function y=sigmoid_reverse(x,A,B)

% function y=sigmoid(x,A,B);
%
% returns the value of x mapped through the sigmoid function
% with parameters:
% A the sigmoid center
% B the sigmoid width
%

y=1./(1+exp((x-A)/B));

end

