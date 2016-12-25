﻿--Script by Jumper
font_bs_nfsw = dxCreateFont("font_cl.ttf", 14)
local BannedIDs = {432, 532}
local rootElem = getRootElement()
local thisRoot = getResourceRootElement(getThisResource())
local player = getLocalPlayer()
local vehicle
local size = 1.2
local modo = 0.01
local score = 0
local screenScore = 0
local tick, idleTime, multTime, driftTime
local Yellow = tocolor(60, 60, 60)
local green = tocolor(255, 106, 0)
local Red = tocolor(180, 0, 3)
local TempCol = Yellow
local mult = 1
local tablamult = {
  350,
  1400,
  4200,
  11200
}
local anterior = 0
local mejor = 0
local total = 0
local bsb = 0
local spd = 0
local bsbs = "true"
local global_mejor = 0
local global_nombre = "N/A"
local screenWidth, screenHeight = guiGetScreenSize()
local x1, y1, x2, y2 = screenWidth * 0.2, screenHeight * 0.1, screenWidth * 0.8, screenHeight * 0.8
local xt1 = screenWidth * 0.86
local xt2 = screenWidth * 0.64
addEventHandler("onClientResourceStart", thisRoot, function()
  addEventHandler("onClientRender", rootElem, showText)
  setPlayerHudComponentVisible("money", false)
  setPlayerHudComponentVisible("clock", false)
end)
addEventHandler("onClientResourceStop", thisRoot, function()
  removeEventHandler("onClientRender", rootElem, showText)
  setPlayerHudComponentVisible("money", true)
  setPlayerHudComponentVisible("clock", true)
end)
function isValidVehicle()
  local temp = getPedOccupiedVehicle(player)
  if not temp or getVehicleOccupant(temp, 0) ~= player or getVehicleType(temp) ~= "Automobile" then
    return false
  end
  local vehID = getElementModel(temp)
  for k, v in ipairs(BannedIDs) do
    if vehID == v then
      return false
    end
  end
  return temp
end
addEvent("driftCarCrashed", true)
addEventHandler("driftCarCrashed", rootElem, function()
  if score ~= 0 then
    score = 0
    mult = 1
    bsb = 2000
    bsbs = "false"
    TempCol = Red
    triggerEvent("onVehicleDriftEnd", rootElem, 0)
    setTimer(bsbreset, 3000, 1)
    setTimer(showText, 400, 1)
  end
end)
function showText()
  h, t = getTime()
  if h > 21 then
    Yellow2 = tocolor(76, 255, 3)
  elseif h < 6 then
    Yellow2 = tocolor(76, 255, 3)
  else
    Yellow2 = tocolor(255, 255, 255)
  end
  
  if bsbs == "true" then
    if bsb > 0 then
      dxDrawText("Earned: " .. bsb .. "$", x1 + x1 / 2 + 140 - 2, screenHeight - 57, x2 + -200, 70, Yellow2, 1.7, font_bs_nfsw, "right", "top")
      dxDrawText("Earned: " .. bsb .. "$", x1 + x1 / 2 + 140, screenHeight - 55, x2 + -200, 70, Yellow, 1.7, font_bs_nfsw, "right", "top")
    end
  elseif bsbs == "false" and bsb > 0 then
    dxDrawText("-" .. bsb .. "$", x1 + x1 / 2 + 140 - 2, screenHeight - 142, x2 + 150, 70, Yellow2, 2, font_bs_nfsw, "right", "top")
    dxDrawText("-" .. bsb .. "$", x1 + x1 / 2 + 140, screenHeight - 140, x2 + 150, 70, Red, 2, font_bs_nfsw, "right", "top")
  end
  TempCol2 = Yellow2
  vehicle = isValidVehicle()
  if not vehicle then
    return
  end
  if size > 1.3 then
    modo = -0.01
  elseif size < 1.2 then
    modo = 0.01
  end
  size = size + modo
  tick = getTickCount()
  local angulo, velocidad = angle()
  local tempBool = tick - (idleTime or 0) < 750
  if not tempBool and score ~= 0 then
    anterior = score
    total = total + anterior
    if score > mejor then
      mejor = score
      setElementData(player, "Record Drift", mejor)
      if getElementData(player, "Record Drift") < 500 then
        setElementData(player, "Drift's Rank", "Newbie")
      elseif getElementData(player, "Record Drift") < 1000 then
        setElementData(player, "Drift's Rank", "Driver")
      elseif getElementData(player, "Record Drift") < 2000 then
        setElementData(player, "Drift's Rank", "Starter")
      elseif getElementData(player, "Record Drift") < 5000 then
        setElementData(player, "Drift's Rank", "Speedy")
      elseif getElementData(player, "Record Drift") < 10000 then
        setElementData(player, "Drift's Rank", "Racer")
      elseif getElementData(player, "Record Drift") < 20000 then
        setElementData(player, "Drift's Rank", "Drift Lover")
      elseif getElementData(player, "Record Drift") < 50000 then
        setElementData(player, "Drift's Rank", "Drifter")
      elseif getElementData(player, "Record Drift") < 75000 then
        setElementData(player, "Drift's Rank", "Street Racer")
      elseif getElementData(player, "Record Drift") < 120000 then
        setElementData(player, "Drift's Rank", "Master")
      elseif getElementData(player, "Record Drift") < 200000 then
        setElementData(player, "Drift's Rank", "Wheel Professional")
      elseif getElementData(player, "Record Drift") > 200000 then
        setElementData(player, "Drift's Rank", "Drift King!")
      end
    end
    triggerEvent("onVehicleDriftEnd", rootElem, tick - driftTime - 750)
    triggerServerEvent("giveMoneyDrift", getLocalPlayer(), score)
    bsb = score
    bsbs = "true"
    score = 0
    setTimer(bsbreset, 3000, 1)
  end
  if angulo ~= 0 then
    if score == 0 then
      triggerEvent("onVehicleDriftStart", rootElem)
      driftTime = tick
    end
    if tempBool then
      score = score + math.floor(angulo * velocidad) * mult
    else
      score = math.floor(angulo * velocidad) * mult
    end
    if TempCol == Red then
      TempCol = Yellow
    end
    screenScore = score
    idleTime = tick
  end
  if velocidad <= 0.3 and mult ~= 1 then
    dxDrawText([[


Very slow!]], 18, 153, screenWidth, screenHeight, Yellow2, 1.2, font_bs_nfsw, "left", "top", false, true, false)
    dxDrawText([[


Very slow!]], 20, 155, screenWidth, screenHeight, Yellow, 1.2, font_bs_nfsw, "left", "top", false, true, false)
  end
  if tick - (idleTime or 0) < 3000 then
    local temp = "Drift"
    if score >= 100000 then
      temp = [[
Drift:

Very hard!]]
    elseif score >= 50000 then
      temp = [[
Drift:

Super!]]
    elseif score >= 20000 then
      temp = [[
Drift:

Beautiful!]]
    elseif score >= 15000 then
      temp = [[
Drift:

Perfect!]]
    elseif score >= 7000 then
      temp = [[
Drift:

Cool!]]
    elseif score >= 3000 then
      temp = [[
Drift:

Good!]]
    elseif score >= 1000 then
      temp = [[
Drift:

Normal!]]
    end
    dxDrawText(temp, x1 - 2, y1 - 2, x2, y2, TempCol2, 1.2, font_bs_nfsw, "center", "top", false, true, false)
    dxDrawText(temp, x1, y1, x2, y2, TempCol, 1.2, font_bs_nfsw, "center", "top", false, true, false)
    dxDrawText(string.format([[

%d]], screenScore), x1 - 2, y1 - 4, x2, y2, TempCol2, size, font_bs_nfsw, "center", "top", false, true, false)
    dxDrawText(string.format([[

%d]], screenScore), x1, y1 - 2, x2, y2, TempCol, size, font_bs_nfsw, "center", "top", false, true, false)
  end
end
function bsbreset()
  bsb = 0
end
function angle()
  local vx, vy, vz = getElementVelocity(vehicle)
  local modV = math.sqrt(vx * vx + vy * vy)
  if not isVehicleOnGround(vehicle) then
    return 0, modV
  end
  local rx, ry, rz = getElementRotation(vehicle)
  local sn, cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))
  local deltaT = tick - (multTime or 0)
  if mult ~= 1 and modV <= 0.3 and deltaT > 750 then
    mult = mult - 1
    multTime = tick
  elseif deltaT > 1500 then
    local temp = 1
    if score >= 11200 then
      temp = 5
    elseif score >= 4200 then
      temp = 4
    elseif score >= 1400 then
      temp = 3
    elseif score >= 350 then
      temp = 2
    end
    if temp > mult then
      mult = temp
      multTime = tick
    end
  end
  if modV <= 0.2 then
    return 0, modV
  end
  local cosX = (sn * vx + cs * vy) / modV
  if cosX > 0.966 or cosX < 0 then
    return 0, modV
  end
  return math.deg(math.acos(cosX)) * 0.5, modV
end