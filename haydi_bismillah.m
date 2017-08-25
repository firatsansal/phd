n=112000;

oldcd=cd;
cd /home/firat/Desktop/mercury;
names=dir;
  
%data=cell(10,2,2);
meas={'cnt','ni','BP'};
cond={'_sup','_upr'};

for i=1:10
    for j=1:2%measurements 1 2 3 {'cnt','ni','BP'}
        for k=1:4 %conditions
            
    switch j
        %%
        case 1  % eeg 
    %Fileter parameters
    c_f = [0.009 50] ;
    wd  = [ 15 15 ];
    f_t = 3 ;%(1 low 2 high 3 band 4 none)
    f_s = 200 ;
%     
         if k==1 || k==2
        c=1;
         else
        c=2;
         end
    
    str=strcat(meas(j),cond(c));
    nd= names(i+2).name;
    datapath=char(fullfile(cd,nd(3:end),str));
    
    % get channel info eeg
    %chanels_EEG{i,j,c}  = loadvariables(datapath,str,'clab');
    %%
    data{i,j,c}     = loadvariables(datapath,str,'x');
    %get data if it is not loaded
    %value   =  getfield(data, char(strcat(meas(j),cond(c))));
    %filter data
%     if k==1 || k==3
%   
%      data_filtered{i,j,k} = x_filterdata_phd(data{i,j,c}(1:n,:),c_f,wd,f_t,f_s);
%     else
%         
%      data_filtered{i,j,k} = x_filterdata_phd(data{i,j,c}(n+1:end,:),c_f,wd,f_t,f_s);
% 
%     end
    %%
    
     %m_a_d{i,j,k}= mean_abs_dev(data_filtered{i,j,c}(1:n,:));


        
         case 2 % nirs
%             
%  %Fileter parameters
     c_f = [0.009 0.2] ;
%     
        if k==1 || k==2
        c=1;
         else
        c=2;
        end
    str=strcat(meas(j),cond(c));
    nd= names(i+2).name;
    datapath=char(fullfile(cd,nd(3:end),str));
%     
     data{i,j,c}     = loadvariables(datapath,str,'x');
     
    %value   =  getfield(data, char(strcat(meas(j),cond(c))));
    
%     if k==1 || k==3
%   
%      data_filtered{i,j,k} = x_filterdata_phd(data{i,j,c}(1:n,:),c_f,wd,f_t,f_s);
%     else
%         
%      data_filtered{i,j,k} = x_filterdata_phd(data{i,j,c}(n+1:end,:),c_f,wd,f_t,f_s);
% 
%     end
    %%    
        case 3 % BP
            
            
            
            
            
    %% 
    end    
        end
    end 
end


%[P R s_ind]=x_Bslope_ofchs(m_a_d,chanels_EEG);

