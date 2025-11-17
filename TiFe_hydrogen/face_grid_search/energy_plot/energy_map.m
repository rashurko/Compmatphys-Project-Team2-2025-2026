% -------------------------------------------------------------------------
% Read QE grid scan data and plot energy heatmap
% -------------------------------------------------------------------------

% Filename of the data file
filename = 'energy_map_25.dat';

% Open file
fid = fopen(filename,'r');

% Skip comment lines and read numeric data
data = textscan(fid, '%f %f %f', 'CommentStyle', '#');
fclose(fid);

% Columns: y, z, Energy
y = data{1};
z = data{2};
E = data{3};

% Create a grid
y_unique = unique(y);
z_unique = unique(z);

[Y, Z] = meshgrid(y_unique, z_unique);

% Reshape energy to match the grid
E_grid = reshape(E, length(z_unique), length(y_unique));

% Plot heatmap



figure;
imagesc(y_unique, z_unique, E_grid);
set(gca,'YDir','normal'); % so Z=0 is at bottom
colorbar;
xlabel('y (fractional)');
ylabel('z (fractional)');
title('H atom energy map on x=0 face');
n = 1024;
x = linspace(0,1,n).^0.5;
custom_map = interp1(linspace(0,1,n), jet(n), x);
colormap(custom_map);
%colormap('jet');
clim([-449.719 -449]);

% Optional: overlay contour lines
hold on;
contour(y_unique, z_unique, E_grid, 15, 'k'); % 15 contour levels
hold off;

Emin = min(E_grid(:));
dE = E_grid - Emin; 
dE(dE == 0) = min(dE(dE > 0));
E_log = log10(dE);
figure;
imagesc(y_unique, z_unique, E_log);
set(gca,'YDir','normal');
colormap(jet(512));
colorbar;
title('log_{10}(E - E_{min}) energy landscape');
xlabel('y (fractional)');
ylabel('z (fractional)');