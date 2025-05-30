# SWD_AUTOSCORE REPOSITORY FOR SPIKE AND WAWE DISCHARGES (SWD) AUTODETECTION IN SYNGAP1 RATS BY CEPSTRUM ANALYSIS OF EEG SIGNAL
 


Contact for code: Dr. Alfredo Gonzalez-Sulser: agonzal2@ed.ac.uk
@Gonzalez-Sulser-Team
CDBS - SIDB - University of Edinburgh 
[[DOI](https://zenodo.org/badge/254316014.svg)](https://zenodo.org/doi/10.5281/zenodo.12700971)

CODE WRITERN ON MATLAB R2018b

1. Create folder on C://SCRIPTS
2. Put inside the provided toolbox folders (analysis-tools-master, openephys and chronux_2_11 packaged on a .rar file)
3. Also put the main SWD-autodetect on codes: SWD_detection.m, SWD_autoscore_v2025.m find_in_interval.m and first_spec.m. 
4. On the Home tab, in the Environment section, click Set Path. Use the Add Folder with Subfolders button to add the new C://SCRIPT folders to MATLAB search path
5. Load the main script SWD_autodetect_v2025.m 
6. Follow instructions given in dialog windows 


POP-UP WINDOWS: ANSWER YES TO CHECK EVENTS AND NO WHEN YOU WANT TO STOP CHECKING
ANSWER YES TO SAVE RESULTS

![SWD Detection](https://github.com/Gonzalez-Sulser-Team/SWD-Automatic-Identification/blob/master/AutomaticSWDDetection.jpg?raw=true "SWD Detection")


Automatic Detection of SWD Example Method. A) Example spectrogram of SWD. B) Raw EEG trace corresponding to time interval of the spectrogram in A (bottom), with two selected SWD epochs (0.2 sec each) marked with blue and red vertical lines. Inserts (top) show respective cestral power analysis showing the fundamental frequency (f0) peak on the pseudo-time domain (top inset) and pseudo-frequency domain (bottom inset). C) Peak absolute maximum value and transformed into z-scores. Threshold for detection SWD events marked with dashed red line. D) Detected SWDs transformed into zeros (below threshold) or ones (threshold or over) in the time interval shown in A and B. Events counted as one (< 1 s) between events) are marked by blue lines, whereas black squares desgignate discarded events (length <0.8 s). 

