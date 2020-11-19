### displaying an input field asking for the matching labbase ID for this customer, this field needs to be extracted from labbase directly
function ShowKundeLabbaseID(h,evt)
  data = guidata(gcf); # get data from figure
  currentIndex = data.UI.currentEntrySite; # remember current index
  
  prompt = {"TO: KundeLabbaseID"};
  rowscols =   [1,150];
  title = "KundeLabbaseID";  
  defaults = {data.data.site.targetDB(currentIndex,8){}};
              
  inputSTR = inputdlg (prompt, title, rowscols, defaults); # opens an input dialog to request user input; prompt, rowscols and defaults need to be the same size
  if size(inputSTR,1) > 0
    ModifyDisplayedData(data.UI.kundeLabbaseID,inputSTR(1,1){}); # modify displayed data in UI
    data.data.site.targetDB(data.UI.currentEntrySite,8) = inputSTR(1); # modify database entry
  else
    disp("user cancelled");
  endif
  guidata(gcf,data); # save data to figure
endfunction
