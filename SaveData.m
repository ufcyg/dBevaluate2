### saved the current state of DB to HDD
function SaveData
  SaveFields();
  appdata = guidata(gcf); # get data from figure
  save -zip dbConverted.mat appdata; # save data as dbConverted.mat with ZIP compression, other (faster) compression methods failed due to a known error with large cell arrays
endfunction