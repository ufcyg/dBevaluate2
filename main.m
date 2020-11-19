clear; #clears table of variables
clc;  #clears contents of CLI#

disp(strcat("Starting dBevaluate..."," - ",ctime(time())));
disp(strcat("Loading data..."," - ",ctime(time())));
#load("dbDummy.mat");
load("dbConverted_Beator"); #load data created by dBconstruct
disp(strcat("...done", " - ", ctime(time())));

disp(strcat("Loading UI..."," - ",ctime(time())));
BuildUI(appdata); #build GUI
disp(strcat("...done", " - ", ctime(time())));