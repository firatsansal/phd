xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(Fs*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:Fs/length(x):Fs/2;

plot(freq,10*log10(psdx))


for i=1:5
segmentLength = 100;
noverlap = 25;
x=data_filt{i,1,1}(:,1);
pxx = pwelch(x,segmentLength,noverlap);
figure
plot(10*log10(pxx))

end