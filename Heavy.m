function T = Heavy(t,f)

%Generates a parameterised switch function

if f-t >= 0
T= 0;
else
T=1;
end
