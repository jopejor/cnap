


function [S] = Leslie_sig(l,k,Z,A,B)

%Leslie model for aging populations, stationary distribution analysis

% ------------------------------------------
% Building the Leslie matrix
% ------------------------------------------

maximum=l;



T=1:maximum;

fecundity = Z*exp(-k*T);

% fecundity = sigmoid_reverse(T,k,Z);

fitness = sigmoid(T,A,B);
    fitness(end)=[];



protoleslie=diag(fitness);
    addon=zeros(maximum-1,1);
    preleslie=[protoleslie addon];
    Leslie=[fecundity;preleslie];
    
% ------------------------------------------
% Find the eigens
% ------------------------------------------


% [V,D] = eig(Leslie);
% 
% [D order] = sort(diag(D),'descend');  %# sort eigenvalues in descending order
% 
% V = V(:,order);
% 
% S_1 = V(:,1);
% 
% Trues = isreal(S_1);
% 
% if Trues == 1
%     
% S=S_1/sum(S_1);
% 
% else S=zeros(maximum,1);
% 
% 
% end

% ------------------------------------------
% Find the eigens
% ------------------------------------------

[r,v]=perron(Leslie, 'right');



S = v;