function R = plotcross_corr(P)

%Evaluates the cross correlation of all matrixes given

%P={X1,X2,X3,A1,A2,A3,B1,B2,B3,C1,C2,C3,D1,D2,D3,E1,E2,E3,F1,F2,F3,G1,G2,G3,H1,H2,H3,I1,I2,I3};

k = length(P);

for m=1:k
    
    Mat = P{m};
    
    row =length(Mat(:,1));
    
    n=1;
    
    while n <= row
        
      
        
        for l=1:row
            
           itako{n} = xcorr(Mat(n,:),Mat(l,:),'coeff');
           
           h = plot(itako{n});
           
           xlabel(sprintf('plot-%i-%i-%i.pdf',m,n,l));
           
           export_fig(sprintf('plot-%i-%i-%i.pdf',m,n,l),gcf);
           
          % saveas(h,sprintf('plot-%f-%f',m,n),'png');   
           
        end
        
        kyo{n} = itako;
        
        n=n+1;
        
    
    end
        
        R{m}=kyo;
        
    

end



