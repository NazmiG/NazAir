% Airs Temperature Data; 2016-2018 Analysis;  % Preloads: 
                                H = 7 ;    % Scale Height   
                             Es_X = linspace(0,1,90)' ;     % 0 to 1 linear spaced as factors along X_Track distance i.e. 1/90 to 90/90                             
%                            Theta = kh30km ;
                           kh20km = double.empty ;   %(0,263520) ; % total number of granules
                           kh30km = kh20km ;
                           kh40km = kh20km ;
                           kh50km = kh20km ;
                           kv20km = kh20km ;
                           kv30km = kh20km ;
                           kv40km = kh20km ;
                           kv50km = kh20km ; 
                           bg20km = kh20km ;
                           bg30km = kh20km ;
                           bg40km = kh20km ;
                           bg50km = kh20km ;
                          Amp20km = kh20km ; 
                          Amp30km = kh20km ;
                          Amp40km = kh20km ;
                          Amp50km = kh20km ; 
                    Temp_dash20km = kh20km ;
                    Temp_dash30km = kh20km ;
                    Temp_dash40km = kh20km ;
                    Temp_dash50km = kh20km ; 
                           kh20kmS = double.empty ;   %(0,263520) ; % total number of granules
                           kh30kmS = kh20km ;
                           kh40kmS = kh20km ;
                           kh50kmS = kh20km ;
                           kv20kmS = kh20km ;
                           kv30kmS = kh20km ;
                           kv40kmS = kh20km ;
                           kv50kmS = kh20km ; 
                           bg20kmS = kh20km ;
                           bg30kmS = kh20km ;
                           bg40kmS = kh20km ;
                           bg50kmS = kh20km ;
                          Amp20kmS = kh20km ; 
                          Amp30kmS = kh20km ;
                          Amp40kmS = kh20km ;
                          Amp50kmS = kh20km ; 
                    Temp_dash20kmS = kh20km ;
                    Temp_dash30kmS = kh20km ;
                    Temp_dash40kmS = kh20km ;
                    Temp_dash50kmS = kh20km ; 
                                zz = [0,3,6,9,12,15,18,21,24,27,30,33,36,39,42,45,48,51,54,57,60,65,70,75,80,85,90];
                                zz = reshape(zz,[1,1,27]);
 %                   Path          = '/media/GWR/AIRS/3d_airs/';  %for: eepc-291
 %                   Path          = '/beegfs/scratch/user/j/nng26/';   %for: Balena
 %                   Path          = 'D:\MATLAB\Airs_Waves\';  % Week31\';    % for: personal Matlab 
                     Path          = '/media/GWR/AIRS/3d_airs/';
                     OutFilePath   = '/u/j/nng26/AirsOuttatime/';
                     OutFilePath2  = '/u/j/nng26/AirsOuttatime2/';                    
%                    Path          = 'D:\MATLAB\Mat\Airs_Waves\Week31\';
%                    OutFilePath   = 'D:\MATLAB\AirsOuttatime\';
%                    Dir           = dir(fullfile(Path,'*','*','*.nc'));
% <<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>                                   
                     YearsWanted   = 2012;
                     DaysWanted    = 90:365;
                     GransWanted   = 1:240;
%% <<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>
for y                              = 1:length(YearsWanted)
    for d                          = 1:length(DaysWanted)
        for g                      = 1:length(GransWanted)
            F_Name         = [Path,sprintf('%04d',YearsWanted(y)),'/',sprintf('%03d',DaysWanted(d)),'/','airs_' sprintf('%04d',YearsWanted(y)),'_' sprintf('%03d',DaysWanted(d)),'_',sprintf('%03d',GransWanted(g)),'.nc'];   % 'FileNames'
            
            if                     exist(F_Name,'file') == 0;  continue; end
            try    Air            = nph_getnet(F_Name); catch ;  disp(['Error Loading ' F_Name ', skipped']);
            end
            Day_Lat        = mean(Air.Data.l1_lat(:));              % DayLat = NaN(90,135);       % 90x135 latitudes      -51 right to -72 in 135 A_Track  | down to -48 in 90 X_Track
            
            if    Day_Lat >= -7 && Day_Lat <= 7
          %     if strcmp(fieldnames(Air.Data), 'ret_temp') == 2
                %if isfile(fieldnames(Air.Data))       
             %   if any(strcmp(fieldnames(Air.Data), 'ret_temp'))
                if ~isempty(Air.Data.ret_temp) | ~isempty(Air.Data.l1_lat) | ~isempty(Air.Data.l1_lon) | ~isempty(Air.Data.l1_lon) | ~isempty(Air.Data.ret_z)

                    temps          = permute(Air.Data.ret_temp,[2 3 1]);
                    lat            = Air.Data.l1_lat;
                    lon            = Air.Data.l1_lon;
                    z              = permute(Air.Data.ret_z,[3 2 1]);
                    if z(1,1,:)==0
                        z = zz;
                    end
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    X_Track_Beg   = nph_haversine([lat(1,1),lon(1,1)],[lat(end,1),lon(end,1)])';   % X_Track totals (1800-1825km), for 1-135
                    X_Track_End   = nph_haversine([lat(1,end),lon(1,end)],[lat(end,end),lon(end,end)])';   % X_Track totals (1800-1825km), for 1-135
                    X_Track_lsp   = linspace( X_Track_Beg,X_Track_End,135);   % 90x1, 0 to 1 linear spaced as factors along X_Track distance i.e. 1/90 to 90/90
                    XT_Esp        = Es_X.*X_Track_lsp;   % (90x1 linearly spaced)x(1x135 all of last row of X_Track 1800-1825km);% 90x135 evenly spaced points
                    AT_Esp        = linspace(0,nph_haversine([lat(1,1),lon(1,1)],[lat(1,end),lon(1,end)]),size(lon,2)); % 1x135 evenly spaced Along Track points (2300km) % figure; pcolor(XT_Esp(:,:)) % 90x135 colour map
                    %                    AT_Az         = azimuth(lat(:,1),lon(:,1),lat(:,2),lon(:,2));      % Azimuth along Track. Off by 2-3 degrees in along track direction
                    %                    AT_Az         = 90-AT_Az; %   or 450                                % or 90-a   % but 450 keeps it positive
                    N             = griddedInterpolant({XT_Esp(:,1),AT_Esp,z(1,:)},temps);
                    A_Full        = repmat(AT_Esp,[90,1,27]);         % Repeats A 1x135 by [90x1x27] = 90x(1-135)x27 i.e. for full altitude
                    Z_Full        = repmat(z,[90,135,1]);             % Repeats zkm 27x1 by [90x135x1] = i.e. 27x 135x(0-90) % var_Name  = repelem(var_Name,length(var));  % repeats an element to fill array
                    X_Full        = repmat(XT_Esp,[1,1,27]);          % Repeats evenspaced_X rowxcol(start) 0-1800 to rowxcol(end) 0-1823, 90x135 by [1x1x27] i.e. for full altitude range
                    T_Full        = N(X_Full,A_Full,Z_Full);         % interpolate the temp values in N with new 3D X,A,Z
                    %                  [Nlat, Nlon]   = reckon(repmat(lat(1,:),[size(temps,1),1]),repmat(lon(1,:), [size(temps,1),1]),km2deg(XT_Esp,6368),XT_Az);
                    %%<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    bg                        = NaN(90,135,27) ;
                    s                         = size(T_Full);   % [90,135,27]
                    for     cs              = 1:s(3)   % 1-27  for every height
                        slice           = T_Full(:,:,cs);    % for every height, h, in tempsFit, take a 90x135 slice
                        for       k         = 1:s(2)             %  1-135 for each along track
                            p         = polyfit(1:s(1),slice(:,k)',4);    % 4th order, poly from 1-90 onto (1 to 90)x(1 through 135) of tempsFit
                            bg(:,k,cs) = polyval(p,1:s(1))';   % eval the poly p at each point from 1 to 90 xtrack, save to bg
                        end
                    end
                    T_Dash     = T_Full-bg;  % remove bg % figure ;  pcolor(T_Dash(:,:,18)); shading flat  %37km
                    T_abs    = abs(T_Dash);
                    %           Real_A  = T_Dash<=1.2;   %remove because might not be waves
                    %    T_Dash(Real_A) = NaN;  % figure ; pcolor(T_Dash(:,:,21)); shading flat   % 21x3.41km = 71km
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    z_Mid     = z(ceil(end/2));                % middle level   (up to top then / by 2)
                    scalv     = exp(-(z-z_Mid)/(2*H));         % Presure2/Pressure1  %might not have factor of 2  % H=7
                    Scaled_TD = scalv.*T_Dash;                 % elementwise multp of Temps_dash
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    pspace    = [(XT_Esp(2,1)-XT_Esp(1,1)),(AT_Esp(2)-AT_Esp(1)),(z(2)-z(1))];  % Point Spacing for each dimension 90x135x27 is 20.3km, 17.7km, 3km respectively
                    %                       scales{1} = -15:1:15;                                % 90/15 = 6km% number of times a waves will fit across a box in that dim   % that is a choices of sizes,
                    %                       scales{2} = -15:1:15;                                % Scales needed to compensate for curvature of Earth distorting the shape of altitude
                    %                       scales{3} = 1:1:5;                                   % less curving in z dir, uni-directional (only up), i.e. increasing Amplitude with height
                    %                       ST        = nph_ndst(Scaled_TempD,scales,pspace);    % Stockwell transform; with 3D Scaled_TempD  for (XAZ),
                    Scaled_TD = smoothn(Scaled_TD,[3,3,1]);
                    ST        = nph_ndst(Scaled_TD,460,pspace,[0.25 0.25 0.25],'minwavelengths',[40 40 6],'maxwavelengths',[10000 10000 40]);
                    %                        a         = repmat(AT_Az,1,135,27);                  % Repeat Along track azimuths for each vertical level
                    Nx        = find(ST.A<=1.2);
                    ST.F1(Nx) = NaN;
                    ST.F2(Nx) = NaN;
                    ST.F3(Nx) = NaN;
                    ST.A(Nx)  = NaN;
                    b         = atan2d(ST.F1,ST.F2);                     % F1 and F2 are Freqs                                  % beta = angle of Wave vect from Along_T dir
                    kh        = sqrt(ST.F1.^2 + ST.F2.^2);               % Horizontal freq
                    V         = ST.F3;                                   % Vertical freq
                    %                        M         = kh.*cosd(a+b);                           % A_Track Meridonal freq             % Converts ('rotates') to |_ AT x XT direction, then to |_ lat x lon directions/coords
                    %                        Z         = kh.*sind(a+b);                           % X_Track Zonal freq
                    %                        Theta     = atan2d(circ_mean(M,[],3),circ_mean(Z,[],3));  %  %Horiz propagation direction uses average of both horiz (meridonal and zonal) for all heights
                    %                     Theta(g) = nanmean(nanmean(Theta(:,:)));     % Vertical freq
                    kh20km(g) = nanmean(nanmean(kh(:,:,7)));
                    kh30km(g) = nanmean(nanmean(kh(:,:,11)));     % Horizontal freq
                    kh40km(g) = nanmean(nanmean(kh(:,:,14)));
                    kh50km(g) = nanmean(nanmean(kh(:,:,18)));
                    kv20km(g) = nanmean(nanmean(V(:,:,7)));
                    kv30km(g) = nanmean(nanmean(V(:,:,11)));     % Vertical freq
                    kv40km(g) = nanmean(nanmean(V(:,:,14)));
                    kv50km(g) = nanmean(nanmean(V(:,:,18)));
                    Temp_dash20km(g) = nanmean(nanmean(T_abs(:,:,7)));
                    Temp_dash30km(g) = nanmean(nanmean(T_abs(:,:,11)));  % Perturbed Temperature (bg removed)
                    Temp_dash40km(g) = nanmean(nanmean(T_abs(:,:,14)));
                    Temp_dash50km(g) = nanmean(nanmean(T_abs(:,:,18)));
                    Amp20km(g) = nanmean(nanmean(ST.A(:,:,7)));
                    Amp30km(g) = nanmean(nanmean(ST.A(:,:,11)));       % Amplitude
                    Amp40km(g) = nanmean(nanmean(ST.A(:,:,14)));
                    Amp50km(g) = nanmean(nanmean(ST.A(:,:,18)));
                    bg20km(g) = nanmean(nanmean(bg(:,:,7)));
                    bg30km(g) = nanmean(nanmean(bg(:,:,11)));         % bg
                    bg40km(g) = nanmean(nanmean(bg(:,:,14)));
                    bg50km(g) = nanmean(nanmean(bg(:,:,18)));
                    clear N_Full A_Full Z_Full  T_Full  X_Full AT_Esp bg lat lon N X_Track_lsp ST kh V z temps T_Dash Scaled_TD
                    disp(['Equatorial Granule: ', sprintf('%04d',YearsWanted(y)),':' sprintf('%03d',DaysWanted(d)),':',sprintf('%03d',GransWanted(g))])
              
 else
                    continue;
                end
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            elseif   Day_Lat >= 59 && Day_Lat <= -52
                %  if sum(strcmp(fieldnames(Air.Data), 'ret_temp','l1_lat','l1_lon','ret_z')) == 1
             %   if any(strcmp(fieldnames(Air.Data), 'ret_temp'))
                  if ~isempty(Air.Data.ret_temp) | ~isempty(Air.Data.l1_lat) | ~isempty(Air.Data.l1_lon) | ~isempty(Air.Data.l1_lon) | ~isempty(Air.Data.ret_z)

                    temps         = permute(Air.Data.ret_temp,[2 3 1]);
                    lat           = Air.Data.l1_lat;
                    lon           = Air.Data.l1_lon;
                    z             = permute(Air.Data.ret_z,[3 2 1]);
                    if z(1,1,:) ==0
                        z = zz; end
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    X_Track_Beg   = nph_haversine([lat(1,1),lon(1,1)],[lat(end,1),lon(end,1)])';   % X_Track totals (1800-1825km), for 1-135
                    X_Track_End   = nph_haversine([lat(1,end),lon(1,end)],[lat(end,end),lon(end,end)])';   % X_Track totals (1800-1825km), for 1-135
                    X_Track_lsp   = linspace( X_Track_Beg,X_Track_End,135);   % 90x1, 0 to 1 linear spaced as factors along X_Track distance i.e. 1/90 to 90/90
                    XT_Esp        = Es_X.*X_Track_lsp;   % (90x1 linearly spaced)x(1x135 all of last row of X_Track 1800-1825km);% 90x135 evenly spaced points
                    AT_Esp        = linspace(0,nph_haversine([lat(1,1),lon(1,1)],[lat(1,end),lon(1,end)]),size(lon,2)); % 1x135 evenly spaced Along Track points (2300km) % figure; pcolor(XT_Esp(:,:)) % 90x135 colour map
                    %                    AT_Az         = azimuth(lat(:,1),lon(:,1),lat(:,2),lon(:,2));      % Azimuth along Track. Off by 2-3 degrees in along track direction
                    %                    AT_Az         = 90-AT_Az; %   or 450                                % or 90-a   % but 450 keeps it positive
                    N             = griddedInterpolant({XT_Esp(:,1),AT_Esp,z(1,:)},temps);
                    A_Full        = repmat(AT_Esp,[90,1,27]);         % Repeats A 1x135 by [90x1x27] = 90x(1-135)x27 i.e. for full altitude
                    Z_Full        = repmat(z,[90,135,1]);             % Repeats zkm 27x1 by [90x135x1] = i.e. 27x 135x(0-90) % var_Name  = repelem(var_Name,length(var));  % repeats an element to fill array
                    X_Full        = repmat(XT_Esp,[1,1,27]);          % Repeats evenspaced_X rowxcol(start) 0-1800 to rowxcol(end) 0-1823, 90x135 by [1x1x27] i.e. for full altitude range
                    T_Full        = N (X_Full,A_Full,Z_Full);         % interpolate the temp values in N with new 3D X,A,Z
                    %                  [Nlat, Nlon]   = reckon(repmat(lat(1,:),[size(temps,1),1]),repmat(lon(1,:), [size(temps,1),1]),km2deg(XT_Esp,6368),XT_Az);
                    %%<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    bg                        = NaN(90,135,27) ;
                    s                         = size(T_Full);   % [90,135,27]
                    for     cs              = 1:s(3)   % 1-27  for every height
                        slice           = T_Full(:,:,cs);    % for every height, h, in tempsFit, take a 90x135 slice
                        for       k         = 1:s(2)             %  1-135 for each along track
                            p         = polyfit(1:s(1),slice(:,k)',4);    % 4th order, poly from 1-90 onto (1 to 90)x(1 through 135) of tempsFit
                            bg(:,k,cs) = polyval(p,1:s(1))';   % eval the poly p at each point from 1 to 90 xtrack, save to bg
                        end
                    end
                    T_Dash     = T_Full-bg;  % remove bg % figure ;  pcolor(T_Dash(:,:,18)); shading flat  %37km
                    T_abs     = abs(T_Dash);
                    %          Real_A  = T_Dash<=1.2;   %remove because might not be waves
                    %   T_Dash(Real_A) = NaN;  % figure ; pcolor(T_Dash(:,:,21)); shading flat   % 21x3.41km = 71km
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    z_Mid     = z(ceil(end/2));                % middle level   (up to top then / by 2)
                    scalv     = exp(-(z-z_Mid)/(2*H));         % Presure2/Pressure1  %might not have factor of 2  % H=7
                    Scaled_TD = scalv.*T_Dash;                 % elementwise multp of Temps_dash
                    %<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
                    pspace    = [(XT_Esp(2,1)-XT_Esp(1,1)),(AT_Esp(2)-AT_Esp(1)),(z(2)-z(1))];  % Point Spacing for each dimension 90x135x27 is 20.3km, 17.7km, 3km respectively
                    %                       scales{1} = -15:1:15;                                % 90/15 = 6km% number of times a waves will fit across a box in that dim   % that is a choices of sizes,
                    %                       scales{2} = -15:1:15;                                % Scales needed to compensate for curvature of Earth distorting the shape of altitude
                    %                       scales{3} = 1:1:5;                                   % less curving in z dir, uni-directional (only up), i.e. increasing Amplitude with height
                    %                       ST        = nph_ndst(Scaled_TempD,scales,pspace);    % Stockwell transform; with 3D Scaled_TempD  for (XAZ),
                    Scaled_TD = smoothn(Scaled_TD,[3,3,1]);
                    ST        = nph_ndst(Scaled_TD,320,pspace,[0.25 0.25 0.25],'minwavelengths',[40 40 6],'maxwavelengths',[10000 10000 40]);
                    %                        a         = repmat(AT_Az,1,135,27);                  % Repeat Along track azimuths for each vertical level
                    Nx        = find(ST.A<=1.2);
                    ST.F1(Nx) = NaN;
                    ST.F2(Nx) = NaN;
                    ST.F3(Nx) = NaN;
                    ST.A(Nx)  = NaN;
                    %                       b         = atan2d(ST.F1,ST.F2);                     % F1 and F2 are Freqs                                  % beta = angle of Wave vect from Along_T dir
                    kh        = sqrt(ST.F1.^2 + ST.F2.^2);               % Horizontal freq
                    V         = ST.F3;                                   % Vertical freq
                    %                      M         = kh.*cosd(a+b);                           % A_Track Meridonal freq             % Converts ('rotates') to |_ AT x XT direction, then to |_ lat x lon directions/coords
                    %                      Z         = kh.*sind(a+b);                           % X_Track Zonal freq
                    %                      Theta     = atan2d(circ_mean(M,[],3),circ_mean(Z,[],3));  %  %Horiz propagation direction uses average of both horiz (meridonal and zonal) for all heights
                    %                     ThetaS(g) = nanmean(nanmean(Theta(:,:)));     % Vertical freq
                    kh20kmS(g) = nanmean(nanmean(kh(:,:,7)));
                    kh30kmS(g) = nanmean(nanmean(kh(:,:,11)));     % Horizontal freq
                    kh40kmS(g) = nanmean(nanmean(kh(:,:,14)));
                    kh50kmS(g) = nanmean(nanmean(kh(:,:,18)));
                    kv20kmS(g) = nanmean(nanmean(V(:,:,7)));
                    kv30kmS(g) = nanmean(nanmean(V(:,:,11)));     % Vertical freq
                    kv40kmS(g) = nanmean(nanmean(V(:,:,14)));
                    kv50kmS(g) = nanmean(nanmean(V(:,:,18)));
                    Temp_dash20kmS(g) = nanmean(nanmean(T_abs(:,:,7)));
                    Temp_dash30kmS(g) = nanmean(nanmean(T_abs(:,:,11)));  % Perturbed Temperature (bg removed)
                    Temp_dash40kmS(g) = nanmean(nanmean(T_abs(:,:,14)));
                    Temp_dash50kmS(g) = nanmean(nanmean(T_abs(:,:,18)));
                    Amp20kmS(g) = nanmean(nanmean(ST.A(:,:,7)));
                    Amp30kmS(g) = nanmean(nanmean(ST.A(:,:,11)));       % Amplitude
                    Amp40kmS(g) = nanmean(nanmean(ST.A(:,:,14)));
                    Amp50kmS(g) = nanmean(nanmean(ST.A(:,:,18)));
                    bg20kmS(g) = nanmean(nanmean(bg(:,:,7)));
                    bg30kmS(g) = nanmean(nanmean(bg(:,:,11)));         % bg
                    bg40kmS(g) = nanmean(nanmean(bg(:,:,14)));
                    bg50kmS(g) = nanmean(nanmean(bg(:,:,18)));
                    disp(['South Granule: ', sprintf('%04d',YearsWanted(y)),':' sprintf('%03d',DaysWanted(d)),':',sprintf('%03d',GransWanted(g))])
                    clear N_Full A_Full Z_Full  T_Full  X_Full AT_Esp bg lat lon N X_Track_lsp ST kh V z temps T_Dash Scaled_TD
               else
                    continue; 
 end
           % end
           % disp(['Granule: ', sprintf('%04d',YearsWanted(y)),':' sprintf('%03d',DaysWanted(d)),':',sprintf('%03d',GransWanted(g))])
            continue;
            end
              disp(['Granule: ', sprintf('%04d',YearsWanted(y)),':' sprintf('%03d',DaysWanted(d)),':',sprintf('%03d',GransWanted(g))])
         
        end
        kh20km(d) = nanmean(kh20km);
        kh30km(d) = nanmean(kh30km);
        kh40km(d) = nanmean(kh40km);
        kh50km(d) = nanmean(kh50km);
        kv20km(d) = nanmean(kv20km);
        kv30km(d) = nanmean(kh30km);
        kv40km(d) = nanmean(kh40km);
        kv50km(d) = nanmean(kh50km);
        Amp20km(d) = nanmean(Amp20km);
        Amp30km(d) = nanmean(Amp30km);    % Amplitude
        Amp40km(d) = nanmean(Amp40km);
        Amp50km(d) = nanmean(Amp50km);
        Temp_dash20km(d) = nanmean(Temp_dash20km);
        Temp_dash30km(d) = nanmean(Temp_dash30km);  % Perturbed Temperature (bg removed)
        Temp_dash40km(d) = nanmean(Temp_dash40km);
        Temp_dash50km(d) = nanmean(Temp_dash50km);
        bg20km(d) = nanmean(bg20km);
        bg30km(d) = nanmean(bg30km);      % bg
        bg40km(d) = nanmean(bg40km);
        bg50km(d) = nanmean(bg50km);
        
        kh20kmS(d) = nanmean(kh20kmS);
        kh30kmS(d) = nanmean(kh30kmS);
        kh40kmS(d) = nanmean(kh40kmS);
        kh50kmS(d) = nanmean(kh50kmS);
        kv20kmS(d) = nanmean(kv20kmS);
        kv30kmS(d) = nanmean(kh30kmS);
        kv40kmS(d) = nanmean(kh40kmS);
        kv50kmS(d) = nanmean(kh50kmS);
        Amp20kmS(d) = nanmean(Amp20kmS);
        Amp30kmS(d) = nanmean(Amp30kmS);    % Amplitude
        Amp40kmS(d) = nanmean(Amp40kmS);
        Amp50kmS(d) = nanmean(Amp50kmS);
        Temp_dash20kmS(d) = nanmean(Temp_dash20kmS);
        Temp_dash30kmS(d) = nanmean(Temp_dash30kmS);  % Perturbed Temperature (bg removed)
        Temp_dash40kmS(d) = nanmean(Temp_dash40kmS);
        Temp_dash50kmS(d) = nanmean(Temp_dash50kmS);
        bg20kmS(d) = nanmean(bg20kmS);
        bg30kmS(d) = nanmean(bg30kmS);      % bg
        bg40kmS(d) = nanmean(bg40kmS);
        bg50kmS(d) = nanmean(bg50kmS);
        
        OutFile = [OutFilePath,'KOput_',sprintf('%04d', YearsWanted(y)),'_',sprintf('%03d',DaysWanted(d)),'.mat'];
        save(OutFile,'kh20km','kh30km','kh40km','kh50km','kv20km','kv30km','kv40km','kv50km','Amp20km','Amp30km','Amp40km','Amp50km','Temp_dash20km','Temp_dash30km','Temp_dash40km','Temp_dash50km','bg20km','bg30km','bg40km','bg50km');
        OutFile = [OutFilePath2,'SouthKOput_',sprintf('%04d', YearsWanted(y)),'_',sprintf('%03d',DaysWanted(d)),'.mat'];
        save(OutFile,'kh20kmS','kh30kmS','kh40kmS','kh50kmS','kv20kmS','kv30kmS','kv40kmS','kv50kmS','Amp20kmS','Amp30kmS','Amp40kmS','Amp50kmS','Temp_dash20kmS','Temp_dash30kmS','Temp_dash40kmS','Temp_dash50kmS','bg20kmS','bg30kmS','bg40kmS','bg50kmS');
    end
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%             
 %%
% AllFiles1 = [kh30km;kh40km;kh50km;kv30km;kv40km;kv50km;Amp30km;Amp40km;Amp50km;Temp_dash30km;Temp_dash40km;Temp_dash50km;bg30km;bg40km;bg50km];                  
% save('AirsFiles.mat','AllFiles');
%  save('kh30km.mat','kh30km');
%  save('kh40km.mat','kh40km'); 
%  save('kh50km.mat','kh50km');
%  save('kv30km.mat','kv30km');
%  save('kv40km.mat','kv40km'); 
%  save('kv50km.mat','kv50km');
%  save('Temp_dash30km.mat','Temp_dash30km');
%  save('Temp_dash40km.mat','Temp_dash40km'); 
%  save('Temp_dash50km.mat','Temp_dash50km');
%  save('bg30km.mat','bg30km');
%  save('bg40km.mat','bg40km'); 
%  save('bg50km.mat','bg50km');
% profile off
%<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
%%
% figure;
% t=1:1:length(kh30km);
% subplot(3,1,1);
% plot(t,kh30km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Horizontal Freq at 30km 2015-2017');
% xlabel('Daily'); ylabel(['Horizontal Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(kh40km);
% subplot(3,1,2);
% plot(t,kh40km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Horizontal Freq at 40km 2015-2017');
% xlabel('Daily'); ylabel(['Horizontal Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(kh50km);
% subplot(3,1,3);
% plot(t,kh50km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Horizontal Freq at 50km 2015-2017');
% xlabel('Daily'); ylabel(['Horizontal Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% figure;
% t=1:1:length(kv30km);
% subplot(3,1,1);
% plot(t,kv30km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Vertical Freq at 30km 2015-2017');
% xlabel('Daily'); ylabel(['Vertical Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% %%%%%%%%%
% t=1:1:length(kv40km);
% subplot(3,1,2);
% plot(t,kv40km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Vertical Freq at 40km 2015-2017');
% xlabel('Daily'); ylabel(['Vertical Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% %%%%%
% t=1:1:length(kv50km);
% subplot(3,1,3);
% plot(t,kv50km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Vertical Freq at 50km 2015-2017');
% xlabel('Daily'); ylabel(['Vertical Freq']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% 
% 
% 
% %%%%%
% figure;
% t=1:1:length(Temp_dash30km);
% subplot(3,1,1);
% plot(t,Temp_dash30km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 30km 2015-2017');
% xlabel('Daily'); ylabel(['Temp_dash']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(Temp_dash40km);
% subplot(3,1,2);
% plot(t,Temp_dash40km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 40km 2015-2017');
% xlabel('Daily'); ylabel(['Temp_dash']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(Temp_dash50km);
% subplot(3,1,3);
% plot(t,Temp_dash30km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 50km 2015-2017');
% xlabel('Daily'); ylabel(['Temp_dash']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% %%%%%%
% figure;
% t=1:1:length(Amp30km);
% subplot(3,1,1);
% plot(t,Amp30km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 30km 2015-2017');
% xlabel('Daily'); ylabel(['Amplitude']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(Amp40km);
% subplot(3,1,2);
% plot(t,Amp40km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 40km 2015-2017');
% xlabel('Daily'); ylabel(['Amplitude']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 
% 
% t=1:1:length(Amp50km);
% subplot(3,1,3);
% plot(t,Amp50km,'MarkerSize', 7, 'Linewidth', 2);
% % xlim([1 365]);
% title('Temp_dash at 50km 2015-2017');
% xlabel('Daily'); ylabel(['Amplitude']); 
% hYLabel = get(gca,'YLabel');  % Object Information
% set(hYLabel,'rotation',0);
% 
% month = {'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'};
% set(gca,'xtick',linspace(t(1),t(end),12))
% xticklabels(month)
% 
% xBig=get(gca,'xlabel')
% set(xBig, 'FontSize', 20); 
% set(xBig,'FontWeight','bold');
% yBig=get(gca,'ylabel')
% set(yBig, 'FontSize', 20); 
% set(yBig,'FontWeight','bold');
% titleBig=get(gca,'title');
% set(titleBig, 'FontSize', 20); 


% figure;   
% worldmap([-90,90],[0,360]); 
% load coastlines;
% plotm(coastlat, coastlon, 'k');
%  for t=1:length(kh_week)
% pcolorm(LAT,LON,kh_week{t}); shading flat; 
%  end
% title(['Airs Global freq at 42km for 1 week in 2012 from day 213-219']);
% colorbar;
% 
% figure;   
% worldmap([-90,90],[-180,180]); 
% load coastlines;
% plotm(coastlat, coastlon, 'k');
% for t=1:length(kh.kh)
% pcolorm(LAT,LON,kh.kh{t}); shading flat; 
% end
% title('Airs Global Horizontal Wavelength \lambdah at 42km for 1 week in 2012 from day 213-219');
% colorbar;
% 
% figure;   
% worldmap([-90,90],[-180,180]); 
% load coastlines;
% plotm(coastlat, coastlon, 'k');
% for t=1:length(kv.kv)
% pcolorm(LAT,LON,kv.kv{t}); shading flat; 
% end
% title('Airs Global Amplitude at 42km for 1 week in 2012 from day 213-219');
% colorbar;
% 
% figure;   
% worldmap([-90,90],[-180,180]); 
% load coastlines;
% plotm(coastlat, coastlon, 'k');
% for t=1:length(Temp_dash30km.tdash)
% pcolorm(LAT,LON,Temp_dash30km.tdash{t}); shading flat; 
%  end
% title('Airs Global HA Amplitude at 42km for 1 week in 2012 from day 213-219');
% colorbar;
% 
% figure;   
% worldmap([-90,90],[-180,180]); 
% load coastlines;
% plotm(coastlat, coastlon, 'k');
% for t=1:length(Amp30km.a)
% pcolorm(LAT,LON,Amp30km.a{t}); shading flat; 
% end
% title('Airs Global Amplitude at 30km for 2');
% colorbar;