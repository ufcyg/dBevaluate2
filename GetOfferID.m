function offerID = GetOfferID(siteID)
  offerID = "N/A";
  data = guidata(gcf);
  for i =2:1:data.data.action.size
    if data.data.action.raw(i,1){} == siteID && !isempty(data.data.action.raw(i,2){})
      offerID = data.data.action.raw(i,2){};
    endif
  endfor
endfunction