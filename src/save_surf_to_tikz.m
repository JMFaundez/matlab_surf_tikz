function save_surf_to_tikz(ax,figname,xmin,xmax,ymin,ymax,cmin,cmax,cmap)

box off
%ax = gca;
colorbar("off")
set(ax,'Visible','off')
export_fig(figname,'-png')

fname = figname+"_axisvalues.tex";

fileID = fopen(fname, 'w');

fprintf(fileID,['\\def\\xmin{',num2str(xmin),'}\n']);
fprintf(fileID,['\\def\\xmax{',num2str(xmax),'}\n']);
fprintf(fileID,['\\def\\ymin{',num2str(ymin),'}\n']);
fprintf(fileID,['\\def\\ymax{',num2str(ymax),'}\n']);
fprintf(fileID,['\\def\\cmin{',num2str(cmin),'}\n']);
fprintf(fileID,['\\def\\cmax{',num2str(cmax),'}\n']);

fclose(fileID);

fname_colorbar = figname+"_colorbar";
fig1=figure;
axis off
caxis([cmin, cmax]);
colormap(cmap);
% h = colorbar([0.1 0.1  0.8  0.7],...
%   'location','Southoutside',...
%   'XTick',[-1 -0.5 0 0.5 1] ...
%   );
h= colorbar('Ticks',[cmin,cmax],'TickLabels',{});
%set(h,'OuterPosition',[0.1 0.1 0.8 0.8]);
%
%colorbar
%cbar_handle = colorbar
%axis off

export_fig(fname_colorbar,'-png');
close(fig1)











