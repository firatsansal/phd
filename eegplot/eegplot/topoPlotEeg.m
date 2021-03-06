 cd /Users/firatmac/Dropbox/eeg-nirs/phd
% 
%  brain=imread('brain.png');         
%          imshow(brain);
%          size=58; %number of channels
%          [y x]=ginput(size);
%          
         
         %ch=[y x];
        
       %  mag=R(:,ch_nirs);
       load ch_locations
          mag=rand(58,1) ;
         ch_disp=1;
         unorm=1;
         method='cubic';
         color_res=256;
         load('eegplotdat.mat')

if(isempty(ch)),
    disp('***Select Channel Values From Image-- Hit Return When Done***')
    figure;imshow(brain);
    nch=length(mag);
    str=['Select ',num2str(nch),' Electrodes from the 10/20 Electrode ',...
        'Position System (Maurer, 1999)'];
    title(str);
    [chy,chx]=ginput;
    close
    if(length(chx)~=length(mag))
        error('Number of channels selected does not match size of data input!!');
        return
    end
else
    chx=ch(:,1);
    chy=ch(:,2);
    if(length(chx)~=length(mag))
        error('Number of channels selected does not match size of data input!!');
        return
    end
end
disp('*** Wait...***')
chx=floor(chx);
chy=floor(chy);


if(isempty(color_res)),
    N=256;
elseif(color_res >255),
    N=256;
    disp('***Colorbar Resolution set to 255 values***');
else
    N=color_res;
end

I=zeros(397,392);


%Normalize Data 
if(isempty(unorm))
    if (min(mag(:)) <0),
        mag = (mag - min(mag(:)) ); 
    end
    mag= mag./(max(mag(:)));
    
end

mag=[mag ; zeros(1089,1)];

%Set Image values equal to input values
for i=1:length(chx),
    I(chx(i),chy(i))=mag(i);
end

cx=chx;cy=chy;
chx=[chx ; mx];
chy=[chy ; my];

x=[1:397]; 
y=[1:392];
[xx,yy] = meshgrid(x,y);

if(isempty(method)),
    z = griddata(chy,chx,mag,xx,yy,'cubic');
else
    z = griddata(chy,chx,mag,xx,yy,method);
end

%Save memory
%clear chy chx mag xx yy x y brain str nch


%Adjust colorbar to include black background
ma=max(z(:));
mi=min(z(:));
%step=(ma-mi)/(N-2);
%black= mi + (-2)*step;
black=1;
z(isnan(z))=-1; %outer head
z(z>0.4)=0.4;
%Set Electrode sites equal to black
if(~isempty(ch_disp)),
    for i=1:length(cx),
        z(cx(i),cy(i))=black;
        z(cx(i)+1,cy(i))=black;
        z(cx(i)-1,cy(i))=black;
        z(cx(i)-1,cy(i)-1)=black;
        z(cx(i),cy(i)-1)=black;
        z(cx(i)+1,cy(i)-1)=black;
        z(cx(i)-1,cy(i)+1)=black;
        z(cx(i),cy(i)+1)=black;
        z(cx(i)+1,cy(i)+1)=black;
    end
end

%Display

figure;imshow(z);
Gs=jet(N);

map=colormap(Gs(40:end-50,:));
map=[[1 1 1];map;[0 0 0]];
%map(1,:)=[0 0 0];
colormap(map)
colorbar;
caxis([-1 1])