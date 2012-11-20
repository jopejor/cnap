function [Leslie] = Leslie_punky(l,k,Z,A,B)

%Leslie model for aging populations, stationary distribution analysis

% ------------------------------------------
% Building the Leslie matrix
% ------------------------------------------

% pop=[0;0;0;0;0;0;0;0;0; 0; 0; 0 ; 0.005 ; 0.0110; 0.0221; 0.0331; 0.0387; 0.0276 ; 0.0442 ; 0.0608 ; 0.1050 ; 0.0994 ; 0.0884; 0.0663; 0.0663 ; 0.0773 ; 0.0939; 0.0387 ; 0.0663 ;0.0552];


maximum=l;



T=1:maximum;

fecundity = Z*exp(-k*T);

fitness = sigmoid(T,A,B);
    fitness(end)=[];



protoleslie=diag(fitness);
    addon=zeros(maximum-1,1);
    preleslie=[protoleslie addon];
    Leslie=[fecundity;preleslie];
    
%     pop1=Leslie*pop;
    
%     Chi=sum(power((pop-pop1),2));
    
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

% [r,v]=perron(Leslie, 'right');
% 
% 
% 
% S = v;


