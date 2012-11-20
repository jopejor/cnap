%Leslie model for aging populations

% ------------------------------------------
%Initialize the population
% ------------------------------------------

seed=sort(binornd(200,0.05,200,1));

maximum=80;

pop=zeros(maximum,1);
T=1:maximum;

count=0;

for k=1:maximum
    pop(k)=(sum(seed==k));
end

% ------------------------------------------
%Define the Leslie matrix
% ------------------------------------------

fecundity = 100*gaussmf(T,[15 0]);
    A=T;
    
% fecundity=ones(1,maximum);
    A(1)=[];

fitness = ones(1,79);

% % fitness = sigmoid(A,70,30);
% fitness = 0.5 ./ (1 + exp(-0.8*T));
%     fitness(end)=[];


protoleslie=diag(fitness);
    addon=zeros(maximum-1,1);
    preleslie=[protoleslie addon];
    Leslie=[fecundity;preleslie];

% ------------------------------------------
%Find the eigens
% ------------------------------------------
% 
% [V,D] = eigs(Leslie);
% S_1 = V(:,1);
% S=S_1/sum(S_1);
% ------------------------------------------
%Iterate the Leslie matrix
% ------------------------------------------




% ------------------------------------------
%Plots
% ------------------------------------------
