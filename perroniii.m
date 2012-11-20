%Leslie model MCMC Metropolis-Hastings algorithm

% ------------------------------------------
%  Parameters initialization
% ------------------------------------------

burntime = 100000;

fecundity0 = rand(1,30);

fitness0 = rand(1,29);

Chis=zeros(1,burntime);

% ------------------------------------------
%  Data
% ------------------------------------------

pop;

% ------------------------------------------
%  Likelyhood ratio computation
% ------------------------------------------
pop_par1 = Leslie_perron(30, fecundity0, fitness0);

Chi1=sum(power((pop-pop_par1),2));

for n=1:burntime

i=1;

while i<2
    
fecundity1=fecundity0+0.1*randn(1,30);
% 
% fecundity1=rand(1,30);

Trues=(fecundity1>= 0) & (fecundity1 <= 1);

Compare = ones(1,30);

if Trues == Compare
    i=1+i;
end
end

 i=1;

while i<2
    
fitness1=fitness0+0.1*randn(1,29);

% fitness1=rand(1,29);


Trues=(fitness1>= 0) & (fitness1 <= 1);

Compare = ones(1,29);

if Trues == Compare
    i=1+i;
end
end  

pop_par2 = Leslie_perron(30, fecundity1, fitness1);

Chi2=sum(power((pop-pop_par2),2));


ratio = exp(-Chi2+Chi1);

% ------------------------------------------
% Evaluation
% ------------------------------------------

test = rand(1);



if ratio >= 1
    
    Chi1=Chi2;
    fecundity0=fecundity1;
    fitness0 = fitness1;
    Chis(n)= Chi1;

elseif test<ratio

    Chi1=Chi2;
    fecundity0=fecundity1;
    fitness0 = fitness1;
    Chis(n)= Chi1;
else
    
     Chi1=Chi1;
    fecundity0=fecundity0;
    fitness0 = fitness0;
    Chis(n)= Chi1;
end



end

% ------------------------------------------
% Output
% ------------------------------------------


S=Leslie_perron(30, fecundity1, fitness1);


