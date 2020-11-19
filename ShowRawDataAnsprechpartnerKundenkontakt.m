### Shows an input dialog displaying the "Ansprechpartner" and "Bemerkung" fields from source DB to the user
### the user should preferably pick data from "Ansprechpartner" to fill the "Ansprechpartner vor Ort" fields and preferably use the "Bemerkung" field to fill the "Kundenkontakt" fields
function ShowRawDataAnsprechpartnerKundenkontakt
  data = guidata(gcf); # load data from figure
  currentIndex = data.UI.currentEntrySite; # remember current index
  
  prompt = {"FROM: Ansprechpartner/Hausmeister", ...
            "FROM: Bemerkung", ...
            "TO: AnsprechpartnerNAME", ... 
            "TO: AnsprechpartnerTEL", ... 
            "TO: AnsprechpartnerMAIL", ... 
            "TO: KundenkontaktNAME", ...
            "TO: KundenkontaktTEL" ...
            ,"TO: KundenkontaktMAIL"};
  rowscols =   [1,150; 1,150; 1,150; 1,150; 1,150; 1,150; 1,150; 1,150];
  title = "Ansprechpartner-Hausmeister-Bemerkung";  
  defaults = {data.data.site.raw(currentIndex,29){}, #Ansprechpartner
              data.data.site.raw(currentIndex,32){}, #Bemerkung
              data.data.site.targetDB(currentIndex,17){}, #AnsprechpartnerVOname
              data.data.site.targetDB(currentIndex,18){}, #AnsprechpartnerVOtel
              data.data.site.targetDB(currentIndex,19){}, #AnsprechpartnerVOmail
              data.data.site.targetDB(currentIndex,20){}, #KundenkontaktName
              data.data.site.targetDB(currentIndex,21){}, #KundenkontaktTel
              data.data.site.targetDB(currentIndex,22){}};#KundenkontaktMail
              
  inputSTR = inputdlg (prompt, title, rowscols, defaults); # opens an input dialog to request user input; prompt, rowscols and defaults need to be the same size
  if size(inputSTR,1) > 0
    ModifyDisplayedData(data.UI.ansprechpartnerNAME,inputSTR(3,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,17) = inputSTR(3){}; # modify database entry
    ModifyDisplayedData(data.UI.ansprechpartnerTEL,inputSTR(4,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,18) = inputSTR(4){}; # modify database entry
    ModifyDisplayedData(data.UI.ansprechpartnerMAIL,inputSTR(5,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,19) = inputSTR(5){}; # modify database entry
    ModifyDisplayedData(data.UI.kundenkontaktNAME,inputSTR(6,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,20) = inputSTR(6){}; # modify database entry
    ModifyDisplayedData(data.UI.kundenkontaktTEL,inputSTR(7,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,21) = inputSTR(7){}; # modify database entry
    ModifyDisplayedData(data.UI.kundenkontaktMAIL,inputSTR(8,1){}); #modify displayed data in UI
    data.data.site.targetDB(currentIndex,22) = inputSTR(8){}; # modify database entry
  else
    disp("user cancelled");
  endif
 guidata(gcf,data); # save data to figure
endfunction