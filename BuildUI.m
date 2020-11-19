###builds the UI and saves loaded data to figure for further editing
function BuildUI(appdata)
  
  [xStart, yStart, xEnd, yEnd] = GetFigureDimensions(100,100); #get figure dimensions with x and y offsets as input variable
  
  ### Create mainFigure
  figureHandle = figure(
                      "Position", [xStart, yStart, xEnd, yEnd],
                      "numbertitle", "off", 
                      "name", "dBevaluate",
                      "resize","off",
                      "toolbar","none",
                      "menubar","none");
  ###
  ####
  ####
  ### Add Kunde (HV,…) NameDisplay and SiteID
  appdata.UI.currentCustomerName = uipanel(figureHandle,
                                  "Position",[ .25 0.96 .65 .03],
                                  "units","normalized");
  appdata.UI.currentCustomerLastOfferID = uicontrol(figureHandle,
                                                    "style","edit",
                                                    "units","normalized",
                                                    "string","-1",
                                                    "position",[.8 0.96 .15 .03]);
  ###
  ####
  ####
  ### Add Navigation buttons
  buttonWidth = 250;
  buttonHeight = 42;
  offset = 0;
  prevEntryB = uicontrol (figureHandle,
                      "style","pushbutton" ,
                      "string", "<=", 
                      "position",[offset offset buttonWidth buttonHeight],
                      "callback", {@SwitchEntry,1});
  nextEntryB = uicontrol (figureHandle,
                      "style","pushbutton",
                      "string", "=>", 
                      "position",[xEnd-buttonWidth-offset offset buttonWidth buttonHeight],
                      "callback", {@SwitchEntry,0});
  ###
  ### Add save button
  saveB = uicontrol (figureHandle,
                      "style","pushbutton" ,
                      "string", "Änderungen Speichern", 
                      "position",[xEnd/2-buttonWidth/2-offset/2 offset buttonWidth buttonHeight],
                      "callback", {@SaveData});
  ###
  ####          
  ####
  ### currentEntrySite Display
  currentEntryPanelSite = uipanel(figureHandle,
                                  "Position",[ 0.01 0.96 .1 .03],
                                  "title", "EintragsID Anlage");
  ## GOTO entrySite inputfield
  appdata.UI.gotoIFSite = uicontrol (figureHandle,
                                    "style","edit",
                                    "string", "-1", 
                                    "position",[150 yEnd-40 100 40],
                                    "callback", {@SwitchEntry,2});
  
  ### currentEntryAction Display DEPRECATED
  currentEntryPanelAktion = uipanel(figureHandle,
                              "Position",[ 0.2 0.96 .1 .03],
                              "title", "EintragsID Aktion",
                              "visible","off");
  ## GOTO entryAction inputfield DEPRECATED
  appdata.UI.gotoIFAction = uicontrol (figureHandle,
                      "style","edit",
                      "string", "-1", 
                      "position",[450 yEnd-40 100 40],
                      "callback", {@SwitchEntry,3},
                      "visible","off");
                      
  
  ###
  ####
  ####
  ### 
  dataTargetBG = uibuttongroup(figureHandle,
                               "Position",[ 0 .05 1 .9]);
  ansprechpartnerBG = uibuttongroup(dataTargetBG,
                                    "units","normalized",
                                    "Position",[ 0 .925 .95 .075],
                                    "title","Ansprechpartner/Hausmeister");
  appdata.UI.ansprechpartnerNAME = uicontrol(ansprechpartnerBG, "style","edit","units","normalized", "position", [0 0 .3 1]);
  appdata.UI.ansprechpartnerTEL = uicontrol(ansprechpartnerBG, "style","edit","units","normalized", "position", [0.33 0 .3 1]);
  appdata.UI.ansprechpartnerMAIL = uicontrol(ansprechpartnerBG, "style","edit","units","normalized", "position", [0.66 0 .3 1]);
  editB1 = uicontrol (dataTargetBG,
                      "style","pushbutton",
                      "units","normalized",
                      "string", "Bearbeiten", 
                      "position",[.95 .875 .05 .1],
                      "callback", {@ShowRawDataAnsprechpartnerKundenkontakt});
  ###  
  ###  
  kundenkontaktBG = uibuttongroup(dataTargetBG,
                                  "units","normalized",
                                  "Position",[ 0 .85 .95 .075],
                                  "title","Kundenkontakt");
  appdata.UI.kundenkontaktNAME = uicontrol(kundenkontaktBG, "style","edit","units","normalized", "position", [0 0 .3 1]);
  appdata.UI.kundenkontaktTEL = uicontrol(kundenkontaktBG, "style","edit","units","normalized", "position", [0.33 0 .3 1]);
  appdata.UI.kundenkontaktMAIL = uicontrol(kundenkontaktBG, "style","edit","units","normalized", "position", [0.66 0 .3 1]);
  ###
  ####
  ####
  ### 
  kundeLabbaseIDBG = uibuttongroup(dataTargetBG,
                                  "units","normalized",
                                  "Position",[ 0 .775 .95 .075],
                                  "title","Kunde Labbase ID");
  appdata.UI.kundeLabbaseID = uicontrol(kundeLabbaseIDBG, "style","edit","units","normalized", "position",[0 0 1 1]);
  editB3 = uicontrol (dataTargetBG,
                      "style","pushbutton",
                      "units","normalized",
                      "string", "Bearbeiten", 
                      "position",[.95 .785 .05 .05],
                      "callback", {@ShowKundeLabbaseID});
  ###
  ####
  ####
  ### Versorgte Häuser
  suppliedHousesBG = uibuttongroup(dataTargetBG,
                                    "units","normalized",
                                    "Position",[ 0 0.15 .95 .625],
                                    "title","Versorgte Häuser");
                                    
  #for loops generating 2x10 input fields for suppliedHouses
  for i = 1:1:10 
    appdata.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))) = uicontrol(suppliedHousesBG, "style","edit","units","normalized", "position",[0 0.9-((i-1)*.1) .45 .08]);
    appdata.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))) = uicontrol(suppliedHousesBG, "style","edit","units","normalized", "position",[0.45 0.9-((i-1)*.1) .05 .08]);
  endfor
  set(appdata.UI.suppliedHouseStreet1,"backgroundcolor", [0.25 .75 0]);
  set(appdata.UI.suppliedHouseNumber1,"backgroundcolor", [0.25 .75 0]);
  for i = 11:1:20
    appdata.UI.(genvarname(strcat("suppliedHouseStreet",num2str(i)))) = uicontrol(suppliedHousesBG, "style","edit","units","normalized", "position",[0.5 0.9-((i-11)*.1) .45 .08]);
    appdata.UI.(genvarname(strcat("suppliedHouseNumber",num2str(i)))) = uicontrol(suppliedHousesBG, "style","edit","units","normalized", "position",[0.95 0.9-((i-11)*.1) .05 .08]);
  endfor
  editB4 = uicontrol (dataTargetBG,
                      "style","pushbutton",
                      "units","normalized",
                      "string", "Bearbeiten", 
                      "position",[.2 .1 .05 .05],
                      "callback", {@ShowSuppliedHouses,0});
  editB4 = uicontrol (dataTargetBG,
                      "style","pushbutton",
                      "units","normalized",
                      "string", "Bearbeiten", 
                      "position",[.66 .1 .05 .05],
                      "callback", {@ShowSuppliedHouses,1});
                      
  appdata.UI.addressCknecessaryCkB = uicontrol(dataTargetBG,
                                            "style","checkbox",
                                            "units","normalized",
                                            "position",[0.4 0.05 0.2 0.05],
                                            "string","Anlagen Adresse unklar");
  
  guidata(figureHandle, appdata); # save data to figure
  UpdateCurrentEntryDisplay(appdata.UI.currentEntrySite,appdata.UI.currentEntryAction); # set entry display to current entryID
  UpdateDisplayedData(); # fill input fields with available data
endfunction
