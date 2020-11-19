### updates contents of input fields to currently saved values in DB
function UpdateDisplayedData
  data = guidata(gcf);
  set(data.UI.addressCknecessaryCkB,"value",data.data.site.targetDB(data.UI.currentEntrySite,26){}); ##checkbox flag
    ### CustomerName ###add angebotsnummer!
  if !isempty(data.data.site.raw(data.UI.currentEntrySite,13){})
    set(data.UI.currentCustomerName,"title",strcat(data.data.site.raw(data.UI.currentEntrySite,13){}," (",num2str(data.data.site.targetDB(data.UI.currentEntrySite,4){}),")"));
    set(data.UI.currentCustomerLastOfferID,"string",GetOfferID(data.data.site.targetDB(data.UI.currentEntrySite,4){}));
  endif
   ###Kontakt vor Ort
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,17){})
    ModifyDisplayedData(data.UI.ansprechpartnerNAME,data.data.site.targetDB(data.UI.currentEntrySite,17){});  
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.ansprechpartnerNAME,data.data.site.targetDB(data.UI.currentEntrySite-1,17){});
    else
      ModifyDisplayedData(data.UI.ansprechpartnerNAME,"");
    endif
  endif
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,18){})
    ModifyDisplayedData(data.UI.ansprechpartnerTEL,data.data.site.targetDB(data.UI.currentEntrySite,18){});    
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.ansprechpartnerTEL,data.data.site.targetDB(data.UI.currentEntrySite-1,18){});
    else
      ModifyDisplayedData(data.UI.ansprechpartnerTEL,"");
    endif
  endif
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,19){})
    ModifyDisplayedData(data.UI.ansprechpartnerMAIL,data.data.site.targetDB(data.UI.currentEntrySite,19){});    
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.ansprechpartnerMAIL,data.data.site.targetDB(data.UI.currentEntrySite-1,19){});
    else
      ModifyDisplayedData(data.UI.ansprechpartnerMAIL,"");
    endif  
  endif
  
  ###Kontakt Kunde
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,20){})
    ModifyDisplayedData(data.UI.kundenkontaktNAME,data.data.site.targetDB(data.UI.currentEntrySite,20){});   
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.kundenkontaktNAME,data.data.site.targetDB(data.UI.currentEntrySite-1,20){}); 
    else
      ModifyDisplayedData(data.UI.kundenkontaktNAME,"");
    endif
  endif
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,21){})
    ModifyDisplayedData(data.UI.kundenkontaktTEL,data.data.site.targetDB(data.UI.currentEntrySite,21){});    
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.kundenkontaktTEL,data.data.site.targetDB(data.UI.currentEntrySite-1,21){});
    else
      ModifyDisplayedData(data.UI.kundenkontaktTEL,"");
    endif
  endif
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,22){})
    ModifyDisplayedData(data.UI.kundenkontaktMAIL,data.data.site.targetDB(data.UI.currentEntrySite,22){});    
  else
    if data.UI.currentEntrySite-1 != 1 && !data.data.site.entryEdited(data.UI.currentEntrySite,1){}
      ModifyDisplayedData(data.UI.kundenkontaktMAIL,data.data.site.targetDB(data.UI.currentEntrySite-1,22){});
    else
      ModifyDisplayedData(data.UI.kundenkontaktMAIL,"");
    endif
  endif
  
  ###Adresseintrag
  #if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,12){})
  #  ModifyDisplayedData(data.UI.streetIF,data.data.site.targetDB(data.UI.currentEntrySite,12){});    
  #else
  #  if data.UI.currentEntrySite-1 != 1
  #    ModifyDisplayedData(data.UI.streetIF,data.data.site.targetDB(data.UI.currentEntrySite-1,12){});
  #  endif
  #endif
  #if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,13){})
  #  ModifyDisplayedData(data.UI.housenumberIF,data.data.site.targetDB(data.UI.currentEntrySite,13){});    
  #else
  #  if data.UI.currentEntrySite-1 != 1
  #    ModifyDisplayedData(data.UI.housenumberIF,data.data.site.targetDB(data.UI.currentEntrySite-1,13){});
  #  endif
  #endif
  
  ###LabbaseID
  if !isempty(data.data.site.targetDB(data.UI.currentEntrySite,8){})
    ModifyDisplayedData(data.UI.kundeLabbaseID,data.data.site.targetDB(data.UI.currentEntrySite,8){});    
  else
    if data.UI.currentEntrySite-1 != 1
      ModifyDisplayedData(data.UI.kundeLabbaseID,data.data.site.targetDB(data.UI.currentEntrySite-1,8){});
    endif
  endif
  
  ###Versorgte Häuser
  #1
  for i = 1:1:20
    ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))),data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6){});
  
    ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))),data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7){});
  endfor
  
  SaveFields();
endfunction
