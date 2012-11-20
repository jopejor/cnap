function S = assembly_matrix(t,P)
%Generates a matrix for the assembly story


k = length(P);

for m=1:k
    int = P(m);
D(m)=Heavy(t,int);

end

S=diag(D);


