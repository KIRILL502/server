﻿--Script by Jumper
local tagName = "cars"
local rootElement = getRootElement()
function loadXml()
  local i = 0
  local xmlRoot = xmlLoadFile("vehicles.xml")
  local xmlTag = xmlFindChild(xmlRoot, "group", i)
  local xmlName = xmlNodeGetAttribute(xmlTag, "name")
  while xmlName ~= tagName do
    xmlTag = xmlFindChild(xmlRoot, "group", i)
    xmlName = xmlNodeGetAttribute(xmlTag, "name")
    i = i + 1
  end
  i = 0
  idstable = {}
  namestbl = {}
  local xmlCars = xmlFindChild(xmlTag, "vehicle", i)
  while xmlCars do
    table.insert(idstable, tonumber(xmlNodeGetAttribute(xmlCars, "id")))
    table.insert(namestbl, xmlNodeGetAttribute(xmlCars, "name"))
    i = i + 1
    xmlCars = xmlFindChild(xmlTag, "vehicle", i)
  end
  xmlUnloadFile(xmlRoot)
end
addEventHandler("onResourceStart", rootElement, loadXml)
function carEnterHandle(theVehicle)
  setPlayerHudComponentVisible(source, "vehicle_name", true)
  for i, v in ipairs(idstable) do
    if v == getElementModel(theVehicle) then
      setPlayerHudComponentVisible(source, "vehicle_name", false)
      triggerClientEvent(source, "ShowCustomCarName", rootElement, namestbl[i])
      break
    end
  end
end
addEventHandler("onPlayerVehicleEnter", rootElement, carEnterHandle)