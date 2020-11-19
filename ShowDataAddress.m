###deprecated
function ShowDataAddress(h,evt)
  data = guidata(gcf);
  currentIndex = data.UI.currentEntrySite;
  
  prompt = {"FROM: Objektbezeichnung","FROM: Objektadresse","FROM: Standort Anlage","TO: Straße","TO: Hausnummer"};
  rowscols =   [1,150; 1,150; 1,150; 1,150; 1,150];
  title = "Adresse";  
  defaults = {data.data.site.raw(currentIndex,18){},
              data.data.site.raw(currentIndex,19){},
              data.data.site.raw(currentIndex,26){},
              data.data.site.targetDB(currentIndex,12){},
              data.data.site.targetDB(currentIndex,13){}};
              
  inputSTR = inputdlg (prompt, title, rowscols, defaults);
  if size(inputSTR,1) > 0
    ModifyDisplayedData(data.UI.streetIF,inputSTR(4,1){});
    data.data.site.targetDB(currentIndex,12) = inputSTR(4){};
    ModifyDisplayedData(data.UI.housenumberIF,inputSTR(5,1){});
    data.data.site.targetDB(currentIndex,13) = inputSTR(5){};
  else
    disp("user cancelled");
  endif
  guidata(gcf,data);
endfunction