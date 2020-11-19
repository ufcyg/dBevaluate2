### displaying an input field showing fields "Objektbezeichnung", "Objektadresse" and "Standort Anlage" to the user to pick supplied houses addresses
### the entry for the first supplied house should be preferably be picked from the field "Standort Anlage"
function ShowSuppliedHouses(h,evt,switchcase)
  ## from 18,19,26
  data = guidata(gcf); # get data from figure
  currentIndex = data.UI.currentEntrySite; # remember current Index
  rowscols =   [1,150;1,150;1,150; 1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150;1,150];
  title = "Versorgte Häuser";
  ##preset first 3 entries of defaults with FROM fields
  defaults(1,1) = data.data.site.raw(currentIndex,18); # Objektbezeichnung
  defaults(1,2) = data.data.site.raw(currentIndex,19); # Objektadresse
  defaults(1,3) = data.data.site.raw(currentIndex,26); # StandortAnlage
  switch (switchcase)
    case 0
      for i = 1:1:10
        prompt = {"FROM: Objektbezeichnung","FROM: Objektadresse","FROM: Standort Anlage", ...
            "TO: VH1 Straße","TO: VH1 Hausnummer", ...
            "TO: VH2 Straße","TO: VH2 Hausnummer", ...
            "TO: VH3 Straße","TO: VH3 Hausnummer", ...
            "TO: VH4 Straße","TO: VH4 Hausnummer", ...
            "TO: VH5 Straße","TO: VH5 Hausnummer", ...
            "TO: VH6 Straße","TO: VH6 Hausnummer", ...
            "TO: VH7 Straße","TO: VH7 Hausnummer", ...
            "TO: VH8 Straße","TO: VH8 Hausnummer", ...
            "TO: VH9 Straße","TO: VH9 Hausnummer", ...
            "TO: VH10 Straße","TO: VH10 Hausnummer",};
        defaults((i+(i-1))+3) = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6); # i running from 1 to 10 should map for values between 4,6,8...22
        defaults((i+1+(i-1))+3) = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7); # i running from 1 to 10 should map for values between 5,7,9,...23
      endfor
    case 1
      for i = 11:1:20
        prompt = {"FROM: Objektbezeichnung","FROM: Objektadresse","FROM: Standort Anlage", ...
            "TO: VH11 Straße","TO: VH11 Hausnummer", ...
            "TO: VH12 Straße","TO: VH12 Hausnummer", ...
            "TO: VH13 Straße","TO: VH13 Hausnummer", ...
            "TO: VH14 Straße","TO: VH14 Hausnummer", ...
            "TO: VH15 Straße","TO: VH15 Hausnummer", ...
            "TO: VH16 Straße","TO: VH16 Hausnummer", ...
            "TO: VH17 Straße","TO: VH17 Hausnummer", ...
            "TO: VH18 Straße","TO: VH18 Hausnummer", ...
            "TO: VH19 Straße","TO: VH19 Hausnummer", ...
            "TO: VH20 Straße","TO: VH20 Hausnummer",};
        defaults(((i-10)+((i-10)-1))+3) = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6); # i running from 11 to 20 should map for values between 4,6,8...22
        defaults(((i-10)+1+((i-10)-1))+3) = data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7);# i running from 11 to 20 should map for values between 5,7,9,...23
      endfor
    endswitch
              
  inputSTR = inputdlg (prompt, title, rowscols, defaults); # opens an input dialog to request user input; prompt, rowscols and defaults need to be the same size
  if size(inputSTR,1) > 0
    switch (switchcase)
    case 0
      for i =1:1:10 # for-loop iterating over every input field on the left side
        ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))),inputSTR(2*((i-1)+2),1){}); # modify displayed data in UI
        data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6) = inputSTR(2*((i-1)+2)); # modify database entry
        if i == 1
          data.data.site.targetDB(data.UI.currentEntrySite,12) = inputSTR(2*((i-1)+2)); # additionally write first supplied house into site address field (housenumber)
        endif
        
        ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))),inputSTR((2*((i-1)+2))+1,1){}); # modify displayed data in UI
        data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7) = inputSTR((2*((i-1)+2))+1); # modify database entry
        if i == 1
          data.data.site.targetDB(data.UI.currentEntrySite,13) = inputSTR((2*((i-1)+2))+1); # additionally write first supplied house into site address field (housenumber)
        endif
      endfor
    case 1
      for i =11:1:20 # for-loop iterating over every input field on the right side
        ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))),inputSTR(2*(((i-10)-1)+2),1){}); # modify displayed data in UI
        data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,6) = inputSTR(2*(((i-10)-1)+2)); # modify database entry
        
        ModifyDisplayedData(data.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))),inputSTR((2*(((i-10)-1)+2))+1,1){}); # modify displayed data in UI
        data.data.supplied.(genvarname(strcat("targetDBsuppliedEntry",num2str(data.UI.currentEntrySite))))(i+1,7) = inputSTR((2*(((i-10)-1)+2))+1); # modify database entry
      endfor
    endswitch
  else
    disp("user cancelled");
  endif
  guidata(gcf,data); # save modified data to figure
endfunction