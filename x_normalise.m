function datan=x_normalise(data);

data1 = data-(min(data));
datan = data1/max(data1);
end