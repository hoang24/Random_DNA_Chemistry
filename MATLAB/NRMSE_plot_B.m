load('/u/hoang24/MATLAB/Random_Chemistry/NRMSE_Experiments_Data/29-Mar-2019 16:10:13.mat');

% Data to be plotted as a bar graph
model_series = avg_NRMSE_B;

%Data to be plotted as the error bars
model_error = std_NRMSE_B;

figure;
% Creating axes and the bar graph
ax = axes;
h = bar(model_series,'BarWidth',1);
% Set color for each bar face
% h(1).FaceColor = 'blue';
% h(2).FaceColor = 'yellow';
% Properties of the bar graph as required
ax.YGrid = 'on';
ax.GridLineStyle = '-';
xticks(ax,[1 2 3 4 5]);

% Naming each of the bar groups
xticklabels(ax,{'0.0001', '0.0002', '0.0003', '0.0004', '0.0005'});

% title, X and Y labels
%title ('Task B');
xlabel ('Input range (Base influx rate)');
ylabel ('Error (NRMSE)');

% Creating a legend and placing it outside the bar plot
lg = legend('\tau = 0.2', '\tau = 0.3', '\tau = 0.4', '\tau = 0.5', 'AutoUpdate', 'off');
lg.Location = 'BestOutside';
lg.Orientation = 'Horizontal';
hold on;
% Finding the number of groups and the number of bars in each group
ngroups = size(model_series, 1);
nbars = size(model_series, 2);
% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
end