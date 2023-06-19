clear all
addpath('../src/')
addpath('../../../MATLAB/export_fig/')

x = linspace(0,0.6,100);
y = linspace(-0.1,0.1,40);
[X,Y] = meshgrid(x,y);
C = X.^2+Y.^2;

figure()
pcolor(X,Y,C)
shading interp
axis equal
ylim([min(Y(:)),max(Y(:))])
colorbar()

cmin = 0.1;
cmax = 0.3;
caxis([cmin,cmax])
cmap = 'parula';
colormap(cmap)

% save figure
ax = gca;
figname = "figures/matlab_test";
xmin = min(X(:));
xmax = max(X(:));
ymin = min(Y(:));
ymax = max(Y(:));

save_surf_to_tikz(ax,figname,xmin,xmax,ymin,ymax,cmin,cmax,cmap)