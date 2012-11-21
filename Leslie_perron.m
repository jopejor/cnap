function [S] = Leslie_perron(l,mu,sig,A,B)

%Leslie model for aging populations, stationary distribution analysis



% ------------------------------------------
% Building the Leslie matrix discrete l,fitness, fecundity
% ------------------------------------------

% maximum=l;
% 
% pop=zeros(maximum,1);
% T=1:maximum;
% 
% protoleslie=diag(fitness);
%     addon=zeros(maximum-1,1);
%     preleslie=[protoleslie addon];
%     Leslie=[fecundity;preleslie];
%     
    
% ------------------------------------------
% Building the Leslie matrix gaussian mu,sig,A,B
% ------------------------------------------

% maximum=l;
% 
% 
% T=1:maximum;
% 
% fecundity = 10*gaussmf(T,[sig mu])+0.001;
% 
% fitness = gaussmf(T,[B A])+0.001;
% 
% % fitness = sigmoid(T,A,B)+0.0001;
%     fitness(end)=[];
% 
% protoleslie=diag(fitness);
%     addon=zeros(maximum-1,1);
%     preleslie=[protoleslie addon];
%     Leslie=[fecundity;preleslie];
    
% ------------------------------------------
% Building the Leslie matrix decay l,k,fitness
% ------------------------------------------
% 
% maximum=l;
% 
% 
% 
% T=1:maximum;
% 
% fecundity = 10*exp(-k*T)+0.01;
% 
% % fecundity = sigmoid_reverse(T,k,Z);
% % 
%  fitness = sigmoid(T,A,B);
%      fitness(end)=[];
% 
% 
% protoleslie=diag(fitness);
%     addon=zeros(maximum-1,1);
%     preleslie=[protoleslie addon];
%     Leslie=[fecundity;preleslie];
% % %         
    
% ------------------------------------------
% Building the Leslie matrix complete l,k,A,B
% ------------------------------------------
% 
% maximum=l;
% 
% 
% 
% T=1:maximum;
% 
% fecundity = round(exp(-k*T)*10+1);
% 
% 
% 
% fitness = sigmoid(T,A,B);
%     fitness(end)=[];
% 
% 
% 
% protoleslie=diag(fitness);
%     addon=zeros(maximum-1,1);
%     preleslie=[protoleslie addon];
%     Leslie=[fecundity;preleslie];
%         
%     
% ------------------------------------------
% Building the Leslie matrix gaussian mu,sig,fecundity
% ------------------------------------------

maximum=l;


T=1:maximum;


fecundity = 10*gaussmf(T,[sig mu])+0.00001;


fitness = gaussmf(T,[B A])+0.00001;
  fitness(end)=[];
  
protoleslie=diag(fitness);
    addon=zeros(maximum-1,1);
    preleslie=[protoleslie addon];
    Leslie=[fecundity;preleslie];
          
% ------------------------------------------
% Find the eigens
% ------------------------------------------

[r,v]=perron(Leslie, 'right');



S = v;

end
