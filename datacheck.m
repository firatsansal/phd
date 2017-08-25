

eeg   = data_raw{1,1,1}(:,2);
nirs  = data_raw{1,2,1}(:,1);

eegf  = data_filtered{1,1,1}(:,1);
nirsf = data_filtered{1,2,1}(:,1);


bandpower(eegf)

x  = eeg;
fs = 200;
freqrange = [8 12]

p = bandpower(x,fs,[0.01 100])  
p = bandpower(x,fs,freqrange)


for i=1:50
    
    x = data_raw{1,1,1}(:,i);
    
    ratio_p(i)= bandpower(x,fs,[8 12])/bandpower (x);
end