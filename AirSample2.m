 %     Path        = 'D:\MATLAB\AirsOut\';  
 %      Dir         = dir(fullfile(Path,'*.mat')); 
 %   baseFName_Eq = natsortfiles({Dir.name});
 %     Path        = 'D:\MATLAB\AirsOutSouth\';
       Path        = '/u/j/nng26/AirsOuttatime/';
       Path_S       = '/u/j/nng26/AirsOuttatime2/';      
       Dir         = dir(fullfile(Path,'KO*.mat'));  
       Dir_S       = dir(fullfile(Path_S,'SouthKO*.mat'));   
     baseFName_Eq = natsortfiles({Dir.name});
     baseFName_S = natsortfiles({Dir_S.name});  
  %   data=struct();
  %   data_S=struct();
 %
 %
  %        /\                        /\
  %       |||\        _______      /||||   
  %      ||  ||\     /////\\\\    /||  ||
  %     /||  /|\\||///\\\ ///\\\||||\  /||\
  %    //////|||   |||/    ||   \||   |||\\\\
  %      //||||      [{}]    [{}]      ||||\\
  %     //|||||||///                \\\||||||\\\\          
  %  ||||||||||\\\\\\\\            \//////||||||||||\
  %          |||||\\\\\\\ ___ \\  ___\\||////////|||||||\
  %              ||||||\\\\___|_|___////|||||||
  %                ||||\\   \/   \/   //|||||||
  %                 \\\\\\|   &    &  \\||/
  %                 \|||\  /|__|\   //||||/
  %                    \||||||||||||||\
  %                       \|||||||\
  %                         \||/  
for k              = 1 : numel(baseFName_Eq)
       fullFN_Eq  = fullfile(Path, baseFName_Eq{k});
       data(k).d     = load(fullFN_Eq);
end
clear Path k fullFN_Eq Dir  baseFName_Eq
for k              = 1 : numel(baseFName_S)
       fullFN_S  = fullfile(Path_S, baseFName_S{k});
       data_S(k).d     = load(fullFN_S);
end
clear Path2 k fullFN_S Dir_S  baseFName_S
kv20kmD=double.empty ;
 kv30kmD=double.empty ;
 kv40kmD=double.empty ;
 kv50kmD=double.empty ;
 kh20kmD=double.empty ;
kh30kmD=double.empty ;
kh40kmD=double.empty ;
kh50kmD=double.empty ;
 Amp20kmD=double.empty ;
 Amp30kmD=double.empty ;
 Amp40kmD=double.empty ;
 Amp50kmD=double.empty ;
  bg20kmD=double.empty ;
 bg30kmD=double.empty ;
 bg40kmD=double.empty ;
 bg50kmD=double.empty ;
  Temp_dash20kmD=double.empty ;
 Temp_dash30kmD=double.empty ;
 Temp_dash40kmD=double.empty ;
 Temp_dash50kmD=double.empty ;
kv20kmDS=double.empty ;
 kv30kmDS=double.empty ;
 kv40kmDS=double.empty ;
 kv50kmDS=double.empty ;
 kh20kmDS=double.empty ;
kh30kmDS=double.empty ;
kh40kmDS=double.empty ;
kh50kmDS=double.empty ;
 Amp20kmDS=double.empty ;
 Amp30kmDS=double.empty ;
 Amp40kmDS=double.empty ;
 Amp50kmDS=double.empty ;
  bg20kmDS=double.empty ;
 bg30kmDS=double.empty ;
 bg40kmDS=double.empty ;
 bg50kmDS=double.empty ;
  Temp_dash20kmDS=double.empty ;
 Temp_dash30kmDS=double.empty ;
 Temp_dash40kmDS=double.empty ;
 Temp_dash50kmDS=double.empty ;
 
% for D =1:1:length(data)
%  X = mean(data(D).d.kv20km);
%  kv20kmD(D)= X;
%  end
% clear X D
for D =1:1:length(data)
 X= mean(data(D).d.kv30km);
 kv30kmD(D)=X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.kv40km);
 kv40kmD(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.kv50km);
 kv50kmD(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data(D).d.kh20km);
%  kh20kmD(D)= X;
%  end
%  clear X D
for D =1:1:length(data)
 X = mean(data(D).d.kh30km);
 kh30kmD(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.kh40km);
 kh40kmD(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.kh50km);
 kh50kmD(D)= X;
 end
 clear X D
%   for D =1:1:length(data)
%  X = mean(data(D).d.Amp20km);
%  Amp20kmD(D)= X;
%  end
%  clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.Amp30km);
 Amp30kmD(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.Amp40km);
 Amp40kmD(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.Amp50km);
 Amp50kmD(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data(D).d.Temp_dash20km);
%  Temp_dash20kmD(D)= X;
%  end
%  clear X D
for D =1:1:length(data)
 X = mean(data(D).d.Temp_dash30km);
 Temp_dash30kmD(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.Temp_dash40km);
 Temp_dash40kmD(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.Temp_dash50km);
 Temp_dash50kmD(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data(D).d.bg20km);
%  bg20kmD(D)= X;
%  end
%  clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.bg30km);
 bg30kmD(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data(D).d.bg40km);
 bg40kmD(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data(D).d.bg50km);
 bg50kmD(D)= X;
 end
 clear X D
 
% for D =1:1:length(data)
%  X = mean(data_S(D).d.kv20kmS);
%  kv20kmDS(D)= X;
%  end
% clear X D
for D =1:1:length(data)
 X= mean(data_S(D).d.kv30kmS);
 kv30kmDS(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.kv40kmS);
 kv40kmDS(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.kv50kmS);
 kv50kmDS(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data_S(D).d.kh20kmS);
%  kh20kmDS(D)= X;
%  end
%  clear X D
for D =1:1:length(data)
 X = mean(data_S(D).d.kh30kmS);
 kh30kmDS(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.kh40kmS);
 kh40kmDS(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.kh50kmS);
 kh50kmDS(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data_S(D).d.Amp20kmS);
%  Amp20kmDS(D)= X;
%  end
%  clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.Amp30kmS);
 Amp30kmDS(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.Amp40kmS);
 Amp40kmDS(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.Amp50kmS);
 Amp50kmDS(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data_S(D).d.Temp_dash20kmS);
%  Temp_dash20kmDS(D)= X;
%  end
%  clear X D
for D =1:1:length(data)
 X = mean(data_S(D).d.Temp_dash30kmS);
 Temp_dash30kmDS(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.Temp_dash40kmS);
 Temp_dash40kmDS(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.Temp_dash50kmS);
 Temp_dash50kmDS(D)= X;
 end
 clear X D
%  for D =1:1:length(data)
%  X = mean(data_S(D).d.bg20kmS);
%  bg20kmDS(D)= X;
%  end
%  clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.bg30kmS);
 bg30kmDS(D)= X;
 end
 clear X D
 for D =1:1:length(data)
 X = mean(data_S(D).d.bg40kmS);
 bg40kmDS(D)= X;
 end
 clear X D
  for D =1:1:length(data)
 X = mean(data_S(D).d.bg50kmS);
 bg50kmDS(D)= X;
 end
 clear X D
 
 
 newpath ='/u/j/nng26/';

%     matname = fullfile(newpath,'kh20kmDaily.mat');
%  save(matname, 'kh20kmD');
   matname = fullfile(newpath,'kh30kmDaily.mat');
 save(matname, 'kh30kmD');
  matname = fullfile(newpath,'kh40kmDaily.mat');
 save(matname, 'kh40kmD');
   matname = fullfile(newpath,'kh50kmDaily.mat');
 save(matname, 'kh50kmD');
 %   matname = fullfile(newpath,'kv20kmDaily.mat');
%  save(matname, 'kv20kmD');
    matname = fullfile(newpath,'kv30kmDaily.mat');
 save(matname, 'kv30kmD');
  matname = fullfile(newpath,'kv40kmDaily.mat');
 save(matname, 'kv40kmD');
   matname = fullfile(newpath,'kv50kmDaily.mat');
 save(matname, 'kv50kmD');
 %   matname = fullfile(newpath,'Amp20kmDaily.mat');
%  save(matname, 'Amp20kmD');
   matname = fullfile(newpath,'Amp30kmDaily.mat');
 save(matname, 'Amp30kmD');
  matname = fullfile(newpath,'Amp40kmDaily.mat');
 save(matname, 'Amp40kmD');
   matname = fullfile(newpath,'Amp50kmDaily.mat');
 save(matname, 'Amp50kmD');
%    matname = fullfile(newpath,'Temp_dash20kmDaily.mat');
%  save(matname, 'Temp_dash20kmD');
  matname = fullfile(newpath,'Temp_dash30kmDaily.mat');
 save(matname, 'Temp_dash30kmD');
 matname = fullfile(newpath,'Temp_dash40kmDaily.mat');
 save(matname, 'Temp_dash40kmD');
matname = fullfile(newpath,'Temp_dash50kmDaily.mat');
 save(matname, 'Temp_dash50kmD');
%     matname = fullfile(newpath,'bg20kmDaily.mat');
%  save(matname, 'bg20kmD');
   matname = fullfile(newpath,'bg30kmDaily.mat');
 save(matname, 'bg30kmD');
  matname = fullfile(newpath,'bg40kmDaily.mat');
 save(matname, 'bg40kmD');
   matname = fullfile(newpath,'bg50kmDaily.mat');
 save(matname, 'bg50kmD');

%     matname = fullfile(newpath,'kh20kmDailyS.mat');
%  save(matname, 'kh20kmDS');
   matname = fullfile(newpath,'kh30kmDailyS.mat');
 save(matname, 'kh30kmDS');
  matname = fullfile(newpath,'kh40kmDailyS.mat');
 save(matname, 'kh40kmDS');
   matname = fullfile(newpath,'kh50kmDailyS.mat');
 save(matname, 'kh50kmDS');
%     matname = fullfile(newpath,'kv20kmDailyS.mat');
%  save(matname, 'kv20kmDS');
   matname = fullfile(newpath,'kv30kmDailyS.mat');
 save(matname, 'kv30kmDS');
  matname = fullfile(newpath,'kv40kmDailyS.mat');
 save(matname, 'kv40kmDS');
   matname = fullfile(newpath,'kv50kmDailyS.mat');
 save(matname, 'kv50kmDS');
%     matname = fullfile(newpath,'Amp20kmDailyS.mat');
%  save(matname, 'Amp20kmDS');
   matname = fullfile(newpath,'Amp30kmDailyS.mat');
 save(matname, 'Amp30kmDS');
  matname = fullfile(newpath,'Amp40kmDailyS.mat');
 save(matname, 'Amp40kmDS');
   matname = fullfile(newpath,'Amp50kmDailyS.mat');
 save(matname, 'Amp50kmDS');
%    matname = fullfile(newpath,'Temp_dash20kmDailyS.mat');
%  save(matname, 'Temp_dash20kmDS');
  matname = fullfile(newpath,'Temp_dash30kmDailyS.mat');
 save(matname, 'Temp_dash30kmDS');
 matname = fullfile(newpath,'Temp_dash40kmDailyS.mat');
 save(matname, 'Temp_dash40kmDS');
matname = fullfile(newpath,'Temp_dash50kmDailyS.mat');
 save(matname, 'Temp_dash50kmDS');
%     matname = fullfile(newpath,'bg20kmDailyS.mat');
%  save(matname, 'bg20kmDS');
   matname = fullfile(newpath,'bg30kmDailyS.mat');
 save(matname, 'bg30kmDS');
  matname = fullfile(newpath,'bg40kmDailyS.mat');
 save(matname, 'bg40kmDS');
   matname = fullfile(newpath,'bg50kmDailyS.mat');
 save(matname, 'bg50kmDS'); 
 
 %%
 
% load('kh20kmDaily.mat');
 load('kh30kmDaily.mat');
load('kh40kmDaily.mat');
load('kh50kmDaily.mat');
% load('kv20kmDaily.mat');
load('kv30kmDaily.mat');
load('kv40kmDaily.mat');
load('kv50kmDaily.mat');
% load('Amp20kmDaily.mat');
load('Amp30kmDaily.mat');
load('Amp40kmDaily.mat');
load('Amp50kmDaily.mat');
%load('Temp_dash20kmDaily.mat');
load('Temp_dash30kmDaily.mat');
load('Temp_dash40kmDaily.mat');
load('Temp_dash50kmDaily.mat');
%load('bg20kmDaily.mat');
load('bg30kmDaily.mat');
load('bg40kmDaily.mat');
load('bg50kmDaily.mat');
%load('Amp20kmDaily.mat');
load('Amp30kmDaily.mat');
load('Amp40kmDaily.mat');
load('Amp50kmDaily.mat');
% load('kh20kmDailyS.mat');
 load('kh30kmDailyS.mat');
load('kh40kmDailyS.mat');
load('kh50kmDailyS.mat');
% load('kv20kmDailyS.mat');
load('kv30kmDailyS.mat');
load('kv40kmDailyS.mat');
load('kv50kmDailyS.mat');
%load('Amp20kmDailyS.mat');
load('Amp30kmDailyS.mat');
load('Amp40kmDailyS.mat');
load('Amp50kmDailyS.mat');
%load('Temp_dash20kmDailyS.mat');
load('Temp_dash30kmDailyS.mat');
load('Temp_dash40kmDailyS.mat');
load('Temp_dash50kmDailyS.mat');
%load('bg20kmDailyS.mat');
load('bg30kmDailyS.mat');
load('bg40kmDailyS.mat');
load('bg50kmDailyS.mat');
%load('Amp20kmDailyS.mat');
load('Amp30kmDailyS.mat');
load('Amp40kmDailyS.mat');
load('Amp50kmDailyS.mat'); 


%%
%figure;
%t= 1:1:length(kh30kmD);
%plot(t,kh30kmD,t,kh40kmD,t,kh50kmD,'MarkerSize', 7, 'Linewidth', 2);

figure;
t= 1:1:length(kh30kmD);
plot(t,kh30kmD,t,kh40kmD,t,kh50kmD,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily kh (Horizontal Freq) at 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['mean daily kh']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kh30kmD);
plot(t,1./kh30kmD,t,1./kh40kmD,t,1./kh50kmD,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Horizontal Wavelength 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Horizontal WL']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kv30kmD);
plot(t,kv30kmD,t,kv40kmD,t,kv50kmD,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Vertical Freqs 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Vert Freq']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kv30kmD);
plot(t,1./kv30kmD,t,1./kv40kmD,t,1./kv50kmD,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Vertical Wavelength 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Vertical WL']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(Amp30kmD);
plot(t,Amp30kmD,t,Amp40kmD,t,Amp50kmD,'MarkerSize', 7, 'Linewidth', 2);
% xlim([1 666]);
title('Mean Daily Amplitude 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Amplitude']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(Temp_dash30kmD);
plot(t,Temp_dash30kmD,t,Temp_dash40kmD,t,Temp_dash50kmD,'MarkerSize', 7, 'Linewidth', 2);
% xlim([1 666]);
title('Mean Daily Temperatures 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Temperature']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(bg30kmD);
plot(t,bg30kmD,t,bg40kmD,t,bg50kmD,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Mean Daily bg Temperature 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['bg Temperature']); 
hYLabel = get(gca,'YLabel');  
%
figure;
t= 1:1:length(kh30kmDS);
plot(t,kh30kmDS,t,kh40kmDS,t,kh50kmDS,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily kh (Horizontal Freq) at 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['mean daily kh']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kh30kmDS);
plot(t,1./kh30kmDS,t,1./kh40kmDS,t,1./kh50kmDS,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Horizontal Wavelength 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Horizontal WL']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kv30kmDS);
plot(t,kv30kmDS,t,kv40kmDS,t,kv50kmDS,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Vertical Freqs 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Vert Freq']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(kv30kmDS);
plot(t,1./kv30kmDS,t,1./kv40kmDS,t,1./kv50kmDS,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Zonal mean Daily Vertical Wavelength 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Vertical WL']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(Amp30kmDS);
plot(t,Amp30kmDS,t,Amp40kmDS,t,Amp50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% xlim([1 666]);
title('Mean Daily Amplitude 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Amplitude']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(Temp_dash30kmDS);
plot(t,Temp_dash30kmDS,t,Temp_dash40kmDS,t,Temp_dash50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% xlim([1 666]);
title('Mean Daily Temperatures 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['Temperature']); 
hYLabel = get(gca,'YLabel');  
%set(hYLabel,'rotation',0);
figure;
t= 1:1:length(bg30kmDS);
plot(t,bg30kmDS,t,bg40kmDS,t,bg50kmDS,'MarkerSize', 7, 'Linewidth', 2);
%xlim([1 666]);
title('Mean Daily bg Temperature 30-50km (2016-2018)');
xlabel('Daily'); ylabel(['bg Temperature']); 
hYLabel = get(gca,'YLabel');  

%%%%%%%%%%%
% figure;
% t= 1:1:length(kh30kmD);
% plot(t,kh20kmD,t,kh30kmD,t,kh40kmD,t,kh50kmD,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily kh (Horizontal Freq) at 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['mean daily kh']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kh30kmD);
% plot(t,1./kh20kmD,t,1./kh30kmD,t,1./kh40kmD,t,1./kh50kmD,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Horizontal Wavelength 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Horizontal WL']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kv30kmD);
% plot(t,kv20kmD,t,kv30kmD,t,kv40kmD,t,kv50kmD,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Vertical Freqs 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Vert Freq']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kv30kmD);
% plot(t,1./kv20kmD,t,1./kv30kmD,t,1./kv40kmD,t,1./kv50kmD,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Vertical Wavelength 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Vertical WL']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(Amp30kmD);
% plot(t,Amp20kmD,t,Amp30kmD,t,Amp40kmD,t,Amp50kmD,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 666]);
% title('Mean Daily Amplitude 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Amplitude']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(Temp_dash30kmD);
% plot(t,Temp_dash20kmD,t,Temp_dash30kmD,t,Temp_dash40kmD,t,Temp_dash50kmD,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 666]);
% title('Mean Daily Temperatures 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Temperature']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(bg30kmD);
% plot(t,bg20kmD,t,bg30kmD,t,bg40kmD,t,bg50kmD,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Mean Daily bg Temperature 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['bg Temperature']); 
% hYLabel = get(gca,'YLabel');  
% %
% figure;
% t= 1:1:length(kh30kmDS);
% plot(t,kh20kmDS,t,kh30kmDS,t,kh40kmDS,t,kh50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily kh (Horizontal Freq) at 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['mean daily kh']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kh30kmDS);
% plot(t,1./kh20kmDS,t,1./kh30kmDS,t,1./kh40kmDS,t,1./kh50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Horizontal Wavelength 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Horizontal WL']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kv30kmDS);
% plot(t,kv20kmDS,t,kv30kmDS,t,kv40kmDS,t,kv50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Vertical Freqs 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Vert Freq']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(kv30kmDS);
% plot(t,1./kv20kmDS,t,1./kv30kmDS,t,1./kv40kmDS,t,1./kv50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Zonal mean Daily Vertical Wavelength 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Vertical WL']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(Amp30kmDS);
% plot(t,Amp20kmDS,t,Amp30kmDS,t,Amp40kmDS,t,Amp50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 666]);
% title('Mean Daily Amplitude 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Amplitude']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(Temp_dash30kmDS);
% plot(t,Temp_dash20kmDS,t,Temp_dash30kmDS,t,Temp_dash40kmDS,t,Temp_dash50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 666]);
% title('Mean Daily Temperatures 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['Temperature']); 
% hYLabel = get(gca,'YLabel');  
% %set(hYLabel,'rotation',0);
% figure;
% t= 1:1:length(bg30kmDS);
% plot(t,bg20kmDS,t,bg30kmDS,t,bg40kmDS,t,bg50kmDS,'MarkerSize', 7, 'Linewidth', 2);
% %xlim([1 666]);
% title('Mean Daily bg Temperature 30-50km (2016-2018)');
% xlabel('Daily'); ylabel(['bg Temperature']); 
% hYLabel = get(gca,'YLabel');






 