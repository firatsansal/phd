function met=x_calc_metric(data,metric)
% metric 1 falff-falpha 
%        2 normalise
%        3 filter data  


for i=1:10;
    for j=1:2;
        for k=1:4;
            
switch metric
    
case 1 
                    
                    for ch=1:size(data{i,j,k},2)
    
                        if j==1 %eeg
                           f_range1 =[8 12];  
                           f_range2 =[0 40]; 
                           met{i,j,k}(ch)= bandpower(data{i,j,k}(:,ch),200,f_range1)/bandpower(data{i,j,k}(:,ch),200,f_range2)   ;

                        else  % nirs
                           f_range1 =[0.01 0.08];  
                           f_range2 =[0 1]; 
                           met{i,j,k}(ch)= bandpower(data{i,j,k}(:,ch),200,f_range1)/bandpower(data{i,j,k}(:,ch),200,f_range2)   ;

                        end
     
                    end
case 2
                    for ch=1:size(data{i,j,k},2)
                    met{i,j,k}(:,ch)=x_normalise(data{i,j,k}(:,ch));
                    end
                    
case 3
    
    if i==1
    c_f = [0.001 1] ;
    wd  = [ 15 15 ];
    f_t = 3 ;%(1 low 2 high 3 band 4 none)
    f_s = 200 ;
    n=112000;
    end
    
    if j==1
  
     met{i,j,k} =  data{i,j,k};
    
    else
        
     met{i,j,k} = x_filterdata_phd(data{i,j,k}(1:n,:),c_f,wd,f_t,f_s);
 
    end
                    
            end
        end
    end
end

%[P R s_ind]=x_Bslope_ofchs(met,chanels_EEG);