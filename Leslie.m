function [S] = Leslie(l,fecundity,fitness)

%Leslie model for aging populations, stationary distribution analysis

% ------------------------------------------
% Building the Leslie matrix
% ------------------------------------------
fitness = ones(1,29);

fecundity = ones(1,30);

l=30;


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

S_1 = V(:,1);
S=S_1/sum(S_1);

end

