%Neutral model for the Leslie Stuff

% ------------------------------------------
%  Parameters initialization
% ------------------------------------------

% fitness = ones(1,29);

burntime = 100000;

Chis=zeros(1,burntime);

% ------------------------------------------
%  Discrete
% ------------------------------------------
% 
% fecundity = ones(1,30);

% fecundity=cell(1,burntime);
% 
% fitness0 = rand(1,29);
% fitness=cell(1,burntime);

% ------------------------------------------
%  Gaussian
% ------------------------------------------
% 
% mu0 = 1;
% 
% sig0 = 14;
% 
A0=1;

B0=5;
% 
% A =zeros(1,burntime);
% B = zeros(1,burntime);
% 
% mu = zeros(1,burntime);
% 
% sig = zeros(1,burntime);
% ------------------------------------------
%  Decay
% ------------------------------------------

k0 = 0.002;
% l0 = rand(1);
% A0=rand(1);
% B0=rand(1);


K=zeros(1,burntime);

A =zeros(1,burntime);
B = zeros(1,burntime);



treshold=0.05;

Statio=cell(1,burntime);

maximum=30;
l=maximum;
T=1:maximum;
% %  
% % ------------------------------------------
% %  Main loop exponential
% % ------------------------------------------
% 
pop_par1 = Leslie_perron(l,k0,A0,B0);

% pop_par1 = Leslie_perron(l,k0,fitness);

Chi1=sum(power((pop-pop_par1),2));

for n=1:burntime

i=1;

while i<2
    
  


k1=k0+0.04*randn(1);

Trues=(k1>0) & (k1<=0.2);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end

i=1;
% 
while i<2
    
  
A1=A0+0.4*randn(1);

Trues=(A1>0) &(A1<=30) ;

% Constrained module & (fecundity1 <= 1);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end

i=1;

while i<2
    
  
B1=B0+0.04*randn(1);

Trues=(B1>1)&(B1<=8) ;


Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end

pop_par2 = Leslie_perron(l,k1,A1,B1);

%  pop_par2 = Leslie_perron(l,k1,fitness);

Chi2=sum(power((pop-pop_par2),2));


ratio = exp(-Chi2+Chi1);

% ------------------------------------------
% Evaluation
% ------------------------------------------

test = rand(1);


if ratio >= 1
    
      Chi1=Chi2;

    k0=k1;
 
    A0=A1;
    B0=B1;
%     
Chis(n)= Chi1;

elseif test<ratio
    
  Chi1=Chi2;
   
      
    
    k0=k1;

    A0=A1;
    B0=B1;
  
Chis(n)= Chi1;

else
      Chi1=Chi1;

      A0=A0;

B0=B0;  


k0=k0;
   Chis(n)= Chi1; 
end

if Chi1<treshold
   
Statio{n}=Leslie_perron(l,k1,A1,B1);

%    
% Statio{n}=Leslie_perron(l,k1,fitness);


end
 
K(n)= k1;
A(n)=A1;
B(n)=B1;
end


%  
% ------------------------------------------
%  Main loop Gaussian
% ------------------------------------------
% 
% pop_par1 = Leslie_perron(l,mu0,sig0,A0,B0) ;
% 
% % pop_par1 = Leslie_perron(l,mu0,sig0,fitness) ;
% 
% Chi1=sum(power((pop-pop_par1),2));
% 
% for n=1:burntime
% 
% i=1;
% 
% while i<2
%     
%   
% 
% 
% mu1=mu0+0.2*randn(1);
% 
% Trues=(mu1>-1) & (mu1 <= 3);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% i=1;
% 
% while i<2
% 
% sig1=sig0+0.2*randn(1);
% 
% Trues=(sig1>3) & (sig1<=20);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% i=1;
% 
% 
% while i<2
%  A1=A0+0.2*randn(1);
% 
% Trues= (A1>15) & (A1<=40) ;
% 
% % Constrained module & (fecundity1 <= 1);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% i=1;
% 
% while i<2
%     
%   
% B1=B0+0.2*randn(1);
% 
% Trues=(B1>4) & (B1<=20);
% 
% % Constrained module & (fecundity1 <= 1);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% pop_par2 = Leslie_perron(l,mu1,sig1,A1,B1);
% % 
% % pop_par2 = Leslie_perron(l,mu1,sig1,fitness);
% 
% Chi2=sum(power((pop-pop_par2),2));
% 
% 
% ratio = exp(-Chi2+Chi1);
% 
% % ------------------------------------------
% % Evaluation
% % ------------------------------------------
% 
% test = rand(1);
% 
% 
% if ratio >= 1
%     
%       Chi1=Chi2;
% 
%     mu0=mu1;
%     sig0=sig1;
%     
%      A0=A1;
%      B0=B1;
%      
% Chis(n)= Chi1;
% 
% elseif test<ratio
%     
%   Chi1=Chi2;
%    
%    
%     mu0=mu1;
%     sig0=sig1;
%     
%       A0=A1;
%      B0=B1;
%     
% 
% Chis(n)= Chi1;
% 
% else
%       Chi1=Chi1;
% 
%     mu0=mu0;
%     sig0=sig0;
%     
%      A0=A0;
%      B0=B0;
%       
%    Chis(n)= Chi1; 
% end
% 
% mu(n)= mu1;
% sig(n)=sig1;
% 
% 
% A(n)=A1;
%      B(n)=B1;
% 
% if Chi1<treshold
%    
% Statio{n}=Leslie_perron(l, mu1,sig1,A1,B1);
% 
% % Statio{n}=Leslie_perron(l, mu1,sig1,fitness);
% 
% 
% end
% end
%  
% 
% 
% 
% 
% 
% % ------------------------------------------
% %  Main loop exponential fitness
% % ------------------------------------------
% % 
% % pop_par1 = Leslie_perron(l,mu0,sig0,A0,B0);
% % 
% % Chi1=sum(power((pop-pop_par1),2));
% % 
% % for n=1:burntime
% % 
% % i=1;
% % 
% % 
% % while i<2
% %     
% %   
% % 
% % 
% % mu1=mu0+0.2*randn(1);
% % 
% % Trues=(mu1>0) & (mu1 <= 30);
% % 
% % Compare = ones(1);
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end
% % 
% % i=1;
% % 
% % while i<2
% % 
% % sig1=sig0+0.2*randn(1);
% % 
% % Trues=(sig1>2) & (sig1<=16);
% % 
% % Compare = ones(1);
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end
% % 
% % 
% % i=1;
% % 
% % while i<2
% %     
% % A1=A0+0.3*randn(1);
% % 
% % Trues=(A1>= 0) & (A1 <= 30);
% % 
% % Compare = ones(1);
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end
% % 
% % i=1;
% % 
% % while i<2
% %     
% % B1=B0+0.3*randn(1);
% % 
% % Trues=(B1>2) & (B1<=15);
% % 
% % Compare = ones(1);
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end 
% % 
% % 
% % pop_par2 = Leslie_perron(l,mu1,sig1,A1,B1);
% % 
% % Chi2=sum(power((pop-pop_par2),2));
% % 
% % 
% % ratio = exp(-Chi2+Chi1);
% % 
% % % ------------------------------------------
% % % Evaluation
% % % ------------------------------------------
% % 
% % test = rand(1);
% % 
% % 
% % if ratio >= 1
% %     
% %       Chi1=Chi2;
% % 
% %     
% %     A0 = A1;
% %     B0=B1;
% %     mu0=mu1;
% %     sig0=sig1;
% %     
% % Chis(n)= Chi1;
% % 
% % elseif test<ratio
% %     
% %   Chi1=Chi2;
% %    
% %       
% % 
% %     A0 = A1;
% %     B0=B1;
% %     
% %     mu0=mu1;
% %     sig0=sig1;
% %     
% % Chis(n)= Chi1;
% % 
% % else
% %     
% %     mu0=mu0;
% %     sig0=sig0;  
% %     
% %     Chi1=Chi1;
% %     
% %     A0 = A0;
% %     B0=B0;
% %    Chis(n)= Chi1; 
% % end
% % 
% % if Chi1<treshold
% %    
% % Statio{n}=Leslie_perron(l,mu1,sig1,A1,B1);
% % 
% % 
% % A(n)=A1;
% % 
% % B(n)=B1;
% % 
% % mu(n)= mu1;
% % sig(n)=sig1;
% % end
% %  
% % 
% % 
% % 
% % end
% 
% % ------------------------------------------
% %  Main loop semi-free
% % ------------------------------------------
% % 
% % pop_par1 = Leslie_perron(l,k0,fitness0);
% % 
% % Chi1=sum(power((pop-pop_par1),2));
% % 
% % for n=1:burntime
% % 
% % i=1;
% % 
% % 
% % while i<2
% % 
% % k1=k0+0.03*randn(1);
% % 
% % Trues=(k1>0) & (k1 <= 3);
% % 
% % Compare = ones(1);
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end
% % 
% % i=1;
% % 
% % while i<2
% %     
% % 
% % fitness1=fitness0+0.05*randn(1,29);
% % 
% % 
% % Trues=(fitness1>= 0) & (fitness1 <= 1);
% % 
% % Compare = ones(1,29);
% % 
% % 
% % if Trues == Compare
% %     i=1+i;
% % end
% % end
% % 
% % i=1;
% % 
% % 
% % 
% % pop_par2 = Leslie_perron(l,k1,fitness1);
% % 
% % Chi2=sum(power((pop-pop_par2),2));
% % 
% % 
% % ratio = exp(-Chi2+Chi1);
% % 
% % % ------------------------------------------
% % % Evaluation
% % % ------------------------------------------
% % 
% % test = rand(1);
% % 
% % 
% % if ratio >= 1
% %     
% %       Chi1=Chi2;
% % 
% %     k0=k1;
% %     fitness0=fitness1;
% %     
% % Chis(n)= Chi1;
% % 
% % elseif test<ratio
% %     
% %   Chi1=Chi2;
% %    
% %       
% % 
% %     k0=k1;
% %    fitness0=fitness1;
% %     
% % Chis(n)= Chi1;
% % 
% % else
% %       Chi1=Chi1;
% %     k0=k0;
% %     fitness0=fitness0;
% % end
% % 
% % if Chi1<treshold
% %    
% % Statio{n}=Leslie_perron(l,k1,fitness1);
% % 
% % k(n)= k1;
% % 
% % fitness{n}= fitness1;
% % 
% % end
% %  
% % 
% % 
% % 
% % end    


% % ------------------------------------------
% %  Main loop ones desespero
% % ------------------------------------------
% 
% pop_par1 = Leslie_perron(l,fecundity0,fitness0);
% 
% Chi1=sum(power((pop-pop_par1),2));
% 
% for n=1:burntime
% 
% i=1;
% 
% 
% 
% while i<2
%     
% 
% fitness1=fitness0+0.05*randn(1,29);
% 
% 
% Trues=(fitness1>= 0) & (fitness1 <= 1);
% 
% Compare = ones(1,29);
% 
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% i=1;
% 
% 
% 
% pop_par2 = Leslie_perron(l,fecundity0,fitness1);
% 
% Chi2=sum(power((pop-pop_par2),2));
% 
% 
% ratio = exp(-Chi2+Chi1);
% 
% % ------------------------------------------
% % Evaluation
% % ------------------------------------------
% 
% test = rand(1);
% 
% 
% if ratio >= 1
%     
%       Chi1=Chi2;
% 
%     
%     fitness0=fitness1;
%     
% Chis(n)= Chi1;
% 
% elseif test<ratio
%     
%   Chi1=Chi2;
%    
%       
% 
%    fitness0=fitness1;
%     
% Chis(n)= Chi1;
% 
% else
%       Chi1=Chi1;
% 
%     fitness0=fitness0;
% end
% 
% if Chi1<treshold
%    
% Statio{n}=Leslie_perron(l,fecundity0,fitness1);
% 
% 
% fitness{n}= fitness1;
% 
% end
%  
% 
% 
% 
% end    

% ------------------------------------------
%  Main loop Gaussian fitnesss
% ------------------------------------------
% 
% pop_par1 = Leslie_perron(l,mu0,sig0,fecundity) ;
% 
% Chi1=sum(power((pop-pop_par1),2));
% 
% for n=1:burntime
% 
% i=1;
% 
% while i<2
%     
%   
% 
% 
% mu1=mu0+0.2*randn(1);
% 
% Trues=(mu1>0) & (mu1 <= 30);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% i=1;
% 
% while i<2
% 
% sig1=sig0+0.2*randn(1);
% 
% Trues=(sig1>0) & (sig1<=5);
% 
% Compare = ones(1);
% 
% if Trues == Compare
%     i=1+i;
% end
% end
% 
% 
% 
% pop_par2 = Leslie_perron(l, mu1,sig1,fecundity);
% 
% Chi2=sum(power((pop-pop_par2),2));
% 
% 
% ratio = exp(-Chi2+Chi1);
% 
% % ------------------------------------------
% % Evaluation
% % ------------------------------------------
% 
% test = rand(1);
% 
% 
% if ratio >= 1
%     
%       Chi1=Chi2;
% 
%     mu0=mu1;
%     sig0=sig1;
%     
% Chis(n)= Chi1;
% 
% elseif test<ratio
%     
%   Chi1=Chi2;
%    
%    
%     mu0=mu1;
%     sig0=sig1;
%        
% 
% Chis(n)= Chi1;
% 
% else
%       Chi1=Chi1;
% 
%     mu0=mu0;
%     sig0=sig0;
%     
%       
%    Chis(n)= Chi1; 
% end
% 
% if Chi1<treshold
%    
% Statio{n}=Leslie_perron(l, mu1,sig1,fecundity);
% 
% mu(n)= mu1;
% sig(n)=sig1;
% 
% end
%  
% 
% 
% 
% end