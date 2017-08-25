function x=x_p_std(data) % percentage standard deviation

for i=1:size(data,2);
x(:,i)=std(data(:,i)./mean(data(:,i)))
end
end

