%%% SPIKE AND WAWE DISCHARGES (SWD) AUTODETECTION
%%% DETECTS ABSCENCE SEIZURES BY CEPSTRUM ANALYSIS OF SIGNAL
%%% Ingrid Buller 2020 - ingrid.buller@ed.ac.uk
%%% @Gonzalez-Sulser-Team
%%% CDBS - SIDB - University of Edinburgh 

%%% MAIN SCRIPT TO RUN ANALYSIS
%%% VARIABLES TO FEED

clearvars;
%% DEFINE RECORDING 
uiwait(msgbox("Choose source folder"));
pn= uigetdir(); % Select recording source directory
cd(pn);
uiwait(msgbox("Choose EEG channel file"));
c=uigetfile('*.*'); % EEG Channel to Analyse
x = inputdlg({'Animal_ID','Session/Treatment (i.e BL1)'},'Recording Details', [1 50; 1 50]); % Recording details
ratname = string(x(1,1));
day= string(x(2,1));
clear x;
x = inputdlg({'Enter value in Hz between 250 - 5000, preferably 1000'}, 'Recording Sampling Rate', [1 70]); % Original recording sampling rate
Origin_rate = str2num(x{1});
clear x;

%%% Check Sample rate
if Origin_rate > 5000
   choice = menu('Sampling rate should be up to 5000 Hz, Reset?','Yes','No');
	  if choice==1 | choice==0
	     x = inputdlg({'Enter value in Hz (avoid values over 5000)'}, 'Recording Sampling Rate', [1 70]); % Original recording sampling rate
             Origin_rate = str2num(x{1});
             clear x;
          else
   	     return;
     end
   else	 Origin_rate = Origin_rate
end

%%% Downsample
if Origin_rate > 1000
	Downsamp_factor = Origin_rate/1000;
elseif Origin_rate < 1000
        Downsamp_factor = Origin_rate/1000;
    else
           Downsamp_factor = 1;
end
samprate = Origin_rate/Downsamp_factor;

%%% Load as recordig Matlab matrix (and wait till loaded)
done=1;
while done==1
cn1=load_open_ephys_data(c);
done = exist('cn1')-1;
end

%%% Downsampling
ch=downsample(cn1,Downsamp_factor);

choice = menu('Analyse whole recording?','Yes','No');
	  if choice==1 | choice==0
	     Define_sample = 0;
	  elseif choice==2 | choice==0
	     Define_sample = 1; 	
	     x = inputdlg({'Enter value in Seconds or Enter 1 if no lag'}, 'Lag to start analysis?', [1 70]); % Enter time start 
	     start_t = str2num(x{1}); %% Sample point to start analysis 
	     	if start_t == 1
			start_t = start_t; %% Sample point to start analysis 
	     	else
			start_t = start_t*samprate; %% Sample point to start analysis 
            end
	     y = inputdlg({'Enter time to analyse in Seconds (i.e. 36000 for one Hr)'}, 'Total time for analysis', [1 70]); % Enter time start and time end	 	     
             end_t = str2num(y{1}); %% Sample point to start analysis 
	     end_t = start_t+(end_t*samprate); %% Sample point to end analysis 
          else 
	     rerurn;
       end 	
clear x;
clear y;	
clear choice;

%%% Subsample to part of recording
if Define_sample == 1
	samp_start = start_t+1;
      else
	samp_start = 1;
end

if Define_sample == 1
	samp_end = end_t;
      else
	samp_end = length(ch);
end    

ch1=ch(samp_start:samp_end);	
eegch = ch1;
quality_correction=0;

[Seizures,Seiz_Totals,timesec,freq,logspec,timedomain,cspectral,id_cspectral,seiz_cepstral,Seiz_score] = swd_detection(eegch,samprate,ratname,day,quality_correction);



