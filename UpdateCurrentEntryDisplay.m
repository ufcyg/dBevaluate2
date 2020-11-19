###updates display of currently selected entry visible for the user
function UpdateCurrentEntryDisplay(currentEntrySite, currentEntryAction)
  data = guidata(gcf);
  if isnumeric(currentEntrySite)
    currentEntrySite = num2str(currentEntrySite);
  endif
  if isnumeric(currentEntryAction)
    currentEntryAction = num2str(currentEntryAction);
  endif
  set(data.UI.gotoIFSite,"string",currentEntrySite);
  set(data.UI.gotoIFAction,"string",currentEntryAction);
endfunction