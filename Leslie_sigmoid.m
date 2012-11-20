%Leslie model Sigmoid MCMC

% ------------------------------------------
%  Parameters initialization
% ------------------------------------------

burntime = 1000;

k0 = rand(1);

Z0 = rand(1);

A0=rand(1);

B0=rand(1);

A1=zeros(1);

Chis=zeros(1,burntime);

treshold=0.05;

% fitness=cell(1,burntime);
% 
% fecundity=cell(1,burntime);


Statio=cell(1,burntime);
A=cell(1,burntime);
Z=cell(1,burntime);
K=cell(1,burntime);
B=cell(1,burntime);

maximum=30;

 T=1:maximum;

% ------------------------------------------
%  Data
% ------------------------------------------
% seed=sort(binornd(200,0.15,200,1));
% 
% maximum=30;
% 
% pop_0=zeros(maximum,1);
% T=1:maximum;
% 
% count=0;
% 
% for k=1:maximum
%     pop_0(k)=(sum(seed==k));
% end
% 
% pop=pop_0/sum(pop_0);
% 
% pop;


% ------------------------------------------
%  Likelihood ratio computation
% ------------------------------------------

pop_par1 = Leslie_sig(30,k0,Z0,A0,B0);

Chi1=sum(power((pop-pop_par1),2));

for n=1:burntime

i=1;

while i<2
    
k1=k0+0.5*randn(1);

Trues=(k1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end

 i=1;

while i<2
    
Z1=Z0+0.5*randn(1);

Trues=(Z1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end  


 i=1;

while i<2
    
A1=A0+0.4*randn(1);

Trues=(A1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end 

 i=1;

while i<2
    
B1=B0+3*randn(1);

Trues=(B1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end 



pop_par2 = Leslie_sig(30,k1,Z1,A1,B1);

Chi2=sum(power((pop-pop_par2),2));


ratio = exp(-Chi2+Chi1);

% ------------------------------------------
% Evaluation
% ------------------------------------------



test = rand(1);

if ratio >= 1
    
    Chi1=Chi2;
    k0=k1;
    Z0=Z1;
    A0 = A1;
    B0=B1;
Chis(n)= Chi1;
elseif test<ratio

    Chi1=Chi2;
    k0=k1;
    Z0=Z1;
    A0 = A1;
    B0=B1;
Chis(n)= Chi1;
else
    
    k0=k0;
    Z0=Z0;
    A0 = A0;
    B0=B0;
   Chis(n)= Chi1; 
end

if Chi1<treshold
%     
Statio{n}=Leslie_sig(30,k1,Z1,A1,B1);

% fecundity{n}= Z1*exp(-k1*T);

 Z{n} = [Z1];
 K{n} = [k1];
 A{n} = [A1];
 B{n} = [B1];
 
% fitness{n} = sigmoid(T,A1,B1);

end


end

% ------------------------------------------
% Output
% ------------------------------------------



    