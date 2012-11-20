function [fecundity] = stair(l,P1,P2,P3,P4)


% ------------------------------------------
% Determines a stair function for fecundity
% ------------------------------------------

maximum=l;

fecundity=zeros(maximum,1);
T=1:maximum;


for i=1:maximum

if 0<= T(i) <= P1
    fecundity(i)=12;

elseif P1< T(i) <= P2
    fecundity(i)=8;

elseif P2< T(i) <= P3
    fecundity(i)=4;

elseif P3< T(i) <= P4
    fecundity(i)=2;
else T(i)=1;

end

