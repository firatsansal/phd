function [P,R,s_ind]=x_Bslope_ofchs(met,chanels_EEG,alpha,ch_roi,inc_s)
% this function computes the slope of linear fit of channels over subjects

n_s=10; %number of subject


List_ch= {'Fp1','Fpz','Fp2','F7','F5','F3','F1','Fz','F2',...
    'F4','F6','F8','FC5','FC3','FC1','FCz','FC2','FC4','FC6',...
    'T7','C5','C3','C1','Cz','C2','C4','C6','T8',...
    'CCP5','CCP3','CCP1','CCP2','CCP4','CCP6','CP5','CP3',...
    'CP1','CPz','CP2','CP4','CP6',...
    'P5','P3','P1','Pz','P2','P4','P6','PPO1','PPO2',...
    'PO7','PO1','POz','PO2','PO8','O1','Oz','O2'};

    s_ind=zeros(n_s,length(List_ch));%subject index
  labels = {'1', '2', '3', '4','5','6','7','8','9','10'} ;
for k=1:4;
for ch_nirs=1:26

    for ch_eeg=1:length(List_ch); % length of list channels
    x1=[];
    y1=[];
    iss=0;
            for i_s=inc_s;
                iss=iss+1;
                        if k==1 || k==2 
                            c=1;
                        else
                            c=2;
                        end
                        
    ones_str=strmatch(List_ch{ch_eeg},chanels_EEG{i_s,1,c});%find subject  matrix where subjects including ch-(i) 
                       
  
        if i_s==3 && i_s==9 && i_s==10
            
   
            s_ind(i_s,ch_eeg)=0;
        else
            if ~isempty (ones_str); 
                           s_ind(i_s,ch_eeg)=1;
                    
                          
          ch_match=strmatch(List_ch{ch_eeg},chanels_EEG{i_s,1,c},'exact' );
    
             
                           x1=[x1 met{i_s,1,k}(ch_match)];
                           y1=[y1 met{i_s,2,k}(ch_nirs)];
   
                           
                           
                        else
                           s_ind(i_s,ch_eeg)=0;
          end
                        
        end
            end
            
          p=[];r=[];
       %    [r,p]=corrcoef(x1, y1);
          [r,p]=corr(x1', y1','type','Spearman');
          
if (p(1) <alpha) %*  ch_roi(ch_eeg,ch_nirs)                  
Fit = polyfit(x1,y1,1); % x = x data, y = y data, 1 = order of the polynomial.
figure
scatter(x1,y1)
hold on
plot(x1,polyval(Fit,x1),'r');
title([List_ch(ch_eeg) '-' num2str(ch_nirs) '-' num2str(k) 'r=' num2str(r(1))]);
text (x1*1.05, y1*1.05, labels( find(s_ind(:,ch_eeg)==1)), 'FontSize', 18, 'Color', 'b') 
end 
          
          P(ch_eeg,ch_nirs,k)=p(1);
          R(ch_eeg,ch_nirs,k)=r(1);
          
         
            
    end
end
end




    
    % find(~cellfun('isempty', strfind(chanels_EEG{i_s,1,1},List_ch{i})))
    % strfind (chanels_EEG{i_s,1,1},List_ch{i},'exact' );
    % strmatch(List_ch{ch_eeg},chanels_EEG{i_s,1,1},'exact' )

%   ones_str=strfind ( chanels_EEG{i_s,1,1},char(List_ch(ch_eeg)));
%   find(cell2mat(ones_str)==1);
%   
%   
%     if ~isempty (ones_str);
%             check_ch=[check_ch 1];
%             x1(:,i) =[x1 met{i_s,1,1}(ones_str)];
%             y1(:,) =[y1 met{i_s,2,1}(ones_str)];
%     else
%             check_ch=[check_ch 0];
%            
%     end
% 
% 
%     end


%polyfit(x1, y1, 1)