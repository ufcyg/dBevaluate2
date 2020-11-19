### writes the current contents of every input field into the locally loaded DB
function SaveFields
  data = guidata(gcf); # load data from figure
  ###SetEditedFlag
  data.data.site.entryEdited(data.UI.currentEntrySite,1) = true; # flags entry as edited, this will prevent copying data from previous entries if revisited
  ###Kontakt vor Ort
  data.data.site.targetDB(data.UI.currentEntrySite,17) = get(data.UI.ansprechpartnerNAME,"string");
  data.data.site.targetDB(data.UI.currentEntrySite,18) = get(data.UI.ansprechpartnerTEL,"string");
  data.data.site.targetDB(data.UI.currentEntrySite,19) = get(data.UI.ansprechpartnerMAIL,"string");
  ###Kontakt Kunde
  data.data.site.targetDB(data.UI.currentEntrySite,20) = get(data.UI.kundenkontaktNAME,"string");
  data.data.site.targetDB(data.UI.currentEntrySite,21) = get(data.UI.kundenkontaktTEL,"string");
  data.data.site.targetDB(data.UI.currentEntrySite,22) = get(data.UI.kundenkontaktMAIL,"string");
  ###Adresseintrag
  data.data.site.targetDB(data.UI.currentEntrySite,12) = get(data.UI.suppliedHouseStreet1,"string");
  data.data.site.targetDB(data.UI.currentEntrySite,13) = get(data.UI.suppliedHouseNumber1,"string");
  ###LabbaseID
  data.data.site.targetDB(data.UI.currentEntrySite,8) = get(data.UI.kundeLabbaseID,"string");
  ###AddressCkNecessary
  data.data.site.targetDB(data.UI.currentEntrySite,26) = get(data.UI.addressCknecessaryCkB,"value");
  ### Versorgte Häuser
  siteID = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(2,5){};
  pcode = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(2,8){};
  city = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(2,9){};
  for i=1:1:20
    streetName = get(data.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))),"string");
    houseNumber = get(data.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))),"string");
    if !isempty(streetName) && !isempty(houseNumber)
      ##write user input
      data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6) = streetName;
      data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7) = houseNumber;
      ##copy down plz + ort + id
      data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,5) = siteID;
      data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,8) = pcode;
      data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,9) = city;
    endif
  endfor
  guidata(gcf,data); # save modified data (for security reasons)
  #SaveData(); # saving to HDD disabled due to long waiting times
endfunction
