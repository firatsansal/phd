function x=mean_abs_dev(data) % mean absolute deviation
m_data=mean(data(:,1:size(data,2))); %mean of channels

for i=1:size(data,2);
s_data(:,i)=sum(abs(data(:,i)-m_data(i)));
end
x=s_data./length(data);% M.A.D


