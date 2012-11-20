
%Leslie model MCMC Metropolis-Hastings algorithm

% ------------------------------------------
%  Parameters initialization
% ------------------------------------------

burntime = 10;

fecundity0 = rand(1,30);

fitness0 = rand(1,29);

% ------------------------------------------
%  Data
% ------------------------------------------
seed=sort(binornd(200,0.12,200,1));

maximum=30;

pop=zeros(maximum,1);
T=1:maximum;

count=0;

for k=1:maximum
    pop(k)=(sum(seed==k));
end

pop=pop/sum(pop);

% ------------------------------------------
%  Likelyhood ratio computation
% ------------------------------------------
pop_par1 = Leslie2(30, fecundity0, fitness0);

Chi1=sum(power((pop-pop_par1),2));

for n=1:burntime

i=1;

while i<2
    
fecundity1=fecundity0+0.05*randn(1,30);

Trues=(fecundity1>= 0) & (fecundity1 <= 1);

Compare = ones(1,30);

if Trues == Compare
    i=1+i;
end
end

 i=1;

while i<2
    
fitness1=fitness0+0.05*randn(1,29);

Trues=(fitness1>= 0) & (fitness1 <= 1);

Compare = ones(1,29);

if Trues == Compare
    i=1+i;
end
end  

pop_par2 = Leslie2(30, fecundity1, fitness1);

Chi2=sum(power((pop-pop_par2),2));


ratio = exp(-Chi2+Chi1);

% ------------------------------------------
% Evaluation
% ------------------------------------------

test = rand(1);

if test<ratio
    Chi1=Chi2;
    fecundity0=fecundity1;
    fitness0 = fitness1;
end

end

    