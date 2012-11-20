

function [S] = Leslie2(l,fecundity,fitness)

%Leslie model for aging populations, stationary distribution analysis

% ------------------------------------------
% Building the Leslie matrix
% ------------------------------------------

maximum=l;

pop=zeros(maximum,1);
T=1:maximum;

protoleslie=diag(fitness);
    addon=zeros(maximum-1,1);
    preleslie=[protoleslie addon];
    Leslie=[fecundity;preleslie];
    
% ------------------------------------------
% Find the eigens
% ------------------------------------------

[V,D] = eig(Leslie);

[D order] = sort(diag(D),'descend');  %# sort eigenvalues in descending order

V = V(:,order);

S_1 = V(:,1);

Trues = isreal(S_1);

if Trues == 1
    
S=S_1/sum(S_1);

else S=zeros(maximum,1);

end
