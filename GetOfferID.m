function offerID = GetOfferID(siteID)
  offerID = "N/A";
  data = guidata(gcf);
  for i =2:1:data.data.action.size
    if data.data.action.raw(i,4){} == siteID && !isempty(data.data.action.raw(i,14){})
      offerID = data.data.action.raw(i,14){};
    endif
  endfor
endfunction