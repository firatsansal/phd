
% row=1;
% col=0;
% close all
% for i=1:9
% 
% if i==1
%   h=subplot(4,7,i); imshow(z)
%   colormap(map)
% %colorbar;
% caxis([-1 1])
%   p = get(h, 'pos');
%   prow=p;
% end
% 
% 
% if i~=1  
% if col<8         
%   
%     h=subplot(4,7,i); imshow(z)
%     colormap(map)
% %colorbar;
% caxis([-1 1])
%     pc=p;
%     pc(1)=pc(1)+pc(3);
%    set(h,'pos',pc)
%    p=pc;
% else
%    
%       h=subplot(4,7,i); imshow(z)
%         colormap(map)
% %colorbar;
% caxis([-1 1])
%     col=-1;
%     row=row+1;
%     
%     pc=prow;
%     pc(2)=prow(2)-prow(4);
%    set(h,'pos',pc);
%    p=pc;
%    prow=pc;
%    row=1;
% end
%     
% end
% 
% col=col+1;
% 
% end
close all
figure

Gs=jet(N);

map=colormap(Gs(40:end-50,:));
map=[[1 1 1];map;[0 0 0]];
map(1,:)=[0 0 0];
[ha, pos] = tight_subplot(4,7,[.01 .0003],[.1 .01],[.01 .01],26) ;
for ii = 1:26; axes(ha(ii)); imshow(z);colormap(map);caxis([-1 1]); end 
set(ha(1:4),'XTickLabel',''); set(ha,'YTickLabel','')
hb=colorbar;
set(hb,'Units','normalized', 'position', [0.8 0.1 0.01 0.2]);

% colormap(map)
% colorbar;
% caxis([-1 1])