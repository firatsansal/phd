n=112000;

for i=1:10
    for j=1:2
        for k=1:4;
            
         if k==1 || k==2
        c=1;
         else
        c=2;
         end
            
            
      if k==1 || k==3
       data_raw{i,j,k}=data{i,j,c}(1:n,:)   ;

     else
    data_raw{i,j,k}=data{i,j,c}(n+1:end,:)   ;
% 
     end   
     
        end
    end
end