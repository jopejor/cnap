%Leslie model Sigmoid MCMC

% ------------------------------------------
%  Parameters initialization
% ------------------------------------------

burntime = 1000;

k0 = rand(1);

Z0 = rand(1);

A0=rand(1);

B0=rand(1);

pop;

% ------------------------------------------
%  Data
% ------------------------------------------
% seed=sort(binornd(200,0.12,200,1));
% 
% maximum=30;
% 
% pop=zeros(maximum,1);
% T=1:maximum;
% 
% count=0;
% 
% for k=1:maximum
%     pop(k)=(sum(seed==k));
% end
% 
% pop=pop/sum(pop);po


% ------------------------------------------
%  Likelihood ratio computation
% ------------------------------------------
Leslie = Leslie_punky(30,k0,Z0,A0,B0);

pop0=Leslie*pop;

Chi1=sum(power((pop-pop0),2));

for n=1:burntime

i=1;

while i<2
    
k1=k0+0.05*randn(1);

Trues=(k1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end

 i=1;

while i<2
    
Z1=Z0+0.05*randn(1);

Trues=(Z1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end  

while i<2
    
A1=A0+0.05*randn(1);

Trues=(A1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end 


while i<2
    
B1=B0+0.05*randn(1);

Trues=(B1>= 0);

Compare = ones(1);

if Trues == Compare
    i=1+i;
end
end 



Leslie = Leslie_punky(30,k1,Z1,A1,B1);



pop1=Leslie*pop;

Chi2=sum(power((pop-pop1),2));


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

elseif test<ratio

    Chi1=Chi2;
    k0=k1;
    Z0=Z1;
    A0 = A1;
    B0=B1;

else
    
    k0=k0;
    Z0=Z0;
    A0 = A0;
    B0=B0;
    
end

end

% ------------------------------------------
% Output
% ------------------------------------------



fecundity = Z1*exp(-k1*T);

fitness = sigmoid(T,A1,B1);

    