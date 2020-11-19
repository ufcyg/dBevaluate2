### swaps the currently active entry to be displayed and enable modification
function SwitchEntry(h,evt,direction)
  SaveFields(); #Save current entries of input fields to targetDB
  data = guidata(gcf); #get data saved in figure
  if !isnumeric(direction) #convert direction(aka switchcase) to numeric if it is not numeric
    direction = str2num(direction);
  endif
  switch (direction)
      case 0
        data.UI.currentEntrySite = CircleSwap(++data.UI.currentEntrySite, data.data.site.size); # swap to 2 if maximum entry + 1 is reached, or maximum entry of 1 is reached (1 is header)
        data.UI.currentEntryAction = CircleSwap(++data.UI.currentEntryAction, data.data.action.size); # swap to 2 if maximum entry + 1 is reached, or maximum entry of 1 is reached (1 is header)
      case 1
        data.UI.currentEntrySite = CircleSwap(--data.UI.currentEntrySite, data.data.site.size); # swap to 2 if maximum entry + 1 is reached, or maximum entry of 1 is reached (1 is header)
        data.UI.currentEntryAction = CircleSwap(--data.UI.currentEntryAction, data.data.action.size); # swap to 2 if maximum entry + 1 is reached, or maximum entry of 1 is reached (1 is header)
      case 2
        data.UI.currentEntrySite = CapEntry(get(data.UI.gotoIFSite).string,data.UI.currentEntrySite,data.data.site.size); # check if user input is valid, change set current entry accordingly
      case 3
        data.UI.currentEntryAction = CapEntry(get(data.UI.gotoIFAction).string,data.UI.currentEntryAction,data.data.action.size); # check if user input is valid, change set current entry accordingly
   endswitch
   UpdateCurrentEntryDisplay(data.UI.currentEntrySite, data.UI.currentEntryAction); # update displayed current entry
   guidata(gcf,data); # save modified data to figure
   UpdateDisplayedData(); # update displayed data in input fields according to currentEntry
endfunction


function entry = CircleSwap(triedEntry, maxSize)
  if triedEntry < 2
    entry = maxSize;
  elseif triedEntry > maxSize
    entry = 2;
  else
    entry = triedEntry;
  endif
endfunction

function entry = CapEntry(triedEntry,currentEntry, maxSize)
  
  triedEntry = str2num(triedEntry);
  if size(triedEntry,1) > 0
    entry = round(triedEntry(1));
  else
    entry = currentEntry;
    errordlg("You Dummy!");
  endif
  if entry < 2
    entry = 2;
  elseif entry > maxSize
    entry = maxSize;
  endif
endfunction