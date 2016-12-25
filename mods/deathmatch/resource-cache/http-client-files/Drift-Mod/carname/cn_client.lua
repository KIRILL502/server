--Script by Jumper
local posY = 0.78
local fontWidth = 20
local totalTime = 5000
local rootElement = getRootElement()
local screenWidth, screenHeight = guiGetScreenSize()
local x, y = 0, screenHeight * posY
local x1, y1, x2, y2 = screenWidth * 0.2, screenHeight * 0.1, screenWidth * 0.8, screenHeight * 0.8
local carName = "default"
local startTime = 0
font_bs_nfsw = dxCreateFont("font_cl.ttf", 14)
function getAlpha(aux)
  if aux > totalTime then
    return 0
  end
  local alpha = 255
  if aux <= 1000 then
    alpha = aux / 4
  elseif aux >= totalTime - 1000 then
    alpha = (totalTime - aux) / 4
  end
  return alpha
end
function createText()
  h = getTime()
  if h > 21 then
    Yellow2z = tocolor(76, 255, 3, 255)
  elseif h < 6 then
    Yellow2z = tocolor(76, 255, 3, 255)
  else
    Yellow2z = tocolor(255, 255, 255, 255)
  end
  local aux = getTickCount() - startTime
  local alpha = getAlpha(aux)
  dxDrawText(carName, x - 1, y - 2, screenWidth, screenHeight, Yellow2z, 2, font_bs_nfsw)
  dxDrawText(carName, x, y, screenWidth, screenHeight, tocolor(60, 60, 60, 255), 2, font_bs_nfsw)
  if aux > totalTime then
    removeEventHandler("onClientRender", rootElement, createText)
  end
end
function HandleText(var)
  carName = var
  x = (screenWidth - fontWidth * string.len(carName)) / 2
  startTime = getTickCount()
  addEventHandler("onClientRender", rootElement, createText)
end
addEvent("ShowCustomCarName", true)
addEventHandler("ShowCustomCarName", rootElement, HandleText)
