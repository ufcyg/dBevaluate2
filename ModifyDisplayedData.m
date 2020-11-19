###modifies the given handle to contain the given string
function ModifyDisplayedData(handle,stringToDisplay)
  if !isempty(stringToDisplay)
    set(handle,"string",stringToDisplay);
  else
    set(handle,"string","");
  endif
endfunction
