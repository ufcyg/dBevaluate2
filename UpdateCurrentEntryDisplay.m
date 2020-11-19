###updates display of currently selected entry visible for the user
function UpdateCurrentEntryDisplay(currentEntrySite)
  data = guidata(gcf);
  if isnumeric(currentEntrySite)
    currentEntrySite = num2str(currentEntrySite);
  endif
  set(data.UI.gotoIFSite,"string",currentEntrySite);
endfunction