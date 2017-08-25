function [P R s_ind]=x_corr_pstd(data_filtered,chanels_EEG);
n=112000;
for i=[1 2 3 4 5 6 7 8 9 10];
    for j=1:2;
        for k=1:4;
            
     p_std{i,j,k}= x_p_std(data_filtered{i,j,k})    ;
     
        end
    end
end

[P R s_ind]=x_Bslope_ofchs(p_std,chanels_EEG);