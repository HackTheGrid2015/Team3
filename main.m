clear all
close all
clc

%  siteid=importdata('siteattributes.csv');
siteid = read_mixed_csv('siteattributes.csv',',');
% for i=2:length(siteid(:,1))

% ftry2 = cell(length(siteid),1);

% for i=2:length(siteid);
%     ii=siteid{i,1};
%     iin = regexprep(ii,'"','');
%     ftry=(sprintf('%s.csv',iin));
% 
%     ftry2{i,1}(:,1)=xlsread(ftry);
% end
% load('ftry2.mat');
% anomaly_peak = cell(249,2);
% for i=2:length(ftry2)
%     k = 1;
%     h = 1;
%     [lb, ub] = outlier_detector(ftry2{i,1},3);
%     for j=1:length(ftry2{i,1})
%         if ftry2{i,1}(j,1) > ub || ftry2{i,1}(j,1) < lb 
%             anomaly_peak{i,1}(k,1) = ftry2{i,1}(j,1);
%             anomaly_peak{i,1}(k,2) = j;
%             k = k+1;
%         end
% 
%     end
%     
%     maxes = find(max(ftry2{i,1}(:,1))==ftry2{i,1}(:,1));
%     for t=1:length(maxes)
%         anomaly_peak{i,2}(h,1) = max(ftry2{i,1}(:,1));
%         anomaly_peak{i,2}(h,2) = maxes(t,1);
%         h = h+1;
%     end
% end
% % 
 load('anomaly_peak.mat','anomaly_peak')
% k = 1;
% for i=1:length(anomaly_peak)
%     if isempty(anomaly_peak{i,1}) == 0
%         anomaly_peak_f{k,1} = anomaly_peak{i,1};
%         anomaly_peak_f{k,2} = anomaly_peak{i,2};
%         anomaly_peak_f{k,3} = i;
%         k = k +1;
%     end
% end
% 
% load('anomaly_peak_f.mat','anomaly_peak_f')
% 
% for i=1:length(anomaly_peak_f)
%     ii{i,1}=siteid{anomaly_peak_f{i,3},3};
% end
%     
% for i =1:length(ii)
%     anomaly_peak_f{i,8} = ii{i,1};
% end

load('anomaly_peak_f.mat','anomaly_peak_f')

data = sortrows(anomaly_peak_f,4);

U1 = {' Bishop, CA','Crown Point, IN','Arizona'};
U2 = {'Clarksville, TN','Rock Hall, MD','Cromwell, KY','Otway, OH'};
U3 = {'Cordova, MD','Bowling Green, VA','Adelanto, CA','PACIFIC OCEAN',...
    ' Bear Creek Village, PA','Lower Alloways Creek, NJ'};
U4 = {'Millington, MD','Derry, PA','Andover, OH'};


figure(1)
title('Commercial Property')
for i=1:3
    subplot(3,1,i)
    scatter(data{i,1}(:,2),data{i,1}(:,1),'fill')
    xlim([0 105123])
    ylim([0 100])   
    set(gca,'XTick', 0:288*30:105123-288*30)
    xlabel = {'January', 'February', 'March', 'April','May','June',...
         'July', 'August', 'September', 'October', 'November','December'};
    set(gca,'xTickLabel',xlabel)
    title(sprintf('%s',U1{i}),'FontSize',16)
    ylabel('Demand (kWh)','FontSize',12)
   grid on
%     text(5000,100,1,strcat('Commercial Property','','Color','magenta','FontSize',12))

 %   text(5000,100,texlabel('Commercial Property','literal'),'Color','magenta','FontSize',12)
end

figure(2)
title('Education')
for i=5:8
    subplot(4,1,i-4)
    scatter(data{i,1}(:,2),data{i,1}(:,1),'fill')
    xlim([0 105123])
    ylim([0 100])
    set(gca,'XTick', 0:288*30:105123-288*30)
    xlabel = {'January', 'February', 'March', 'April','May','June',...
         'July', 'August', 'September', 'October', 'November','December'};
    set(gca,'xTickLabel',xlabel,'FontSize',16)
    grid on
    title(sprintf('%s',U2{i-4}),'FontSize',16)
    ylabel('Demand (kWh)','FontSize',12)
end

figure(3)
title('Food Sales and Storages')
for i=9:14
    subplot(6,1,i-8)
    scatter(data{i,1}(:,2),data{i,1}(:,1),'fill')
    xlim([0 105123])
    ylim([0 100])
    set(gca,'XTick', 0:288*30:105123-288*30)
    xlabel = {'January', 'February', 'March', 'April','May','June',...
         'July', 'August', 'September', 'October', 'November','December'};
    set(gca,'xTickLabel',xlabel,'FontSize',16)
    grid on
    title(sprintf('%s',U3{i-8}),'FontSize',16)
    ylabel('Demand (kWh)','FontSize',12)
end
  
figure(4)
title('Light Industrial')
for i=17:19
    subplot(3,1,i-16)
    scatter(data{i,1}(:,2),data{i,1}(:,1),'fill')
    xlim([0 105123])
    ylim([0 100])
    set(gca,'XTick', 0:288*30:105123-288*30)
    xlabel = {'January', 'February', 'March', 'April','May','June',...
         'July', 'August', 'September', 'October', 'November','December'};
    set(gca,'xTickLabel',xlabel,'FontSize',16)
    grid on
    title(sprintf('%s',U4{i-16}),'FontSize',16)
    ylabel('Demand (kWh)','FontSize',12)
end
