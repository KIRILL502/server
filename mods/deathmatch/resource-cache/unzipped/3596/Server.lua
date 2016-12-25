---------------------------------------- MARKER DE ENTRADA A BASE ----------------------------------------

local alpha = 150
local r, g, b = 255, 255, 255
local size = 5
local typem = "cylinder"
local posx, posy, posz = 1976.0625, -1251.630859375, 22.8203125

entradaB = createMarker ( posx, posy, posz, typem, size, r, g, b, alpha, getRootElement() )

local x, y, z = 1973.83984375, -1235.0791015625, 24.51535987854 -- Posicion en la que el Jugador va Aparecer despues de Entrar
local r, g, b = 255, 255, 0 -- Colores R G B
local text = "[SERVER] #FF0000PIKE PIDOR LOX AZAZAZ" -- Mensaje al Salir del Marker

function alEntrar(hitElement)
    outputChatBox(text, getRootElement(), r, g, b, true)
    setElementPosition(hitElement, x, y, z)
end
addEventHandler("onMarkerHit", entradaB, alEntrar)

---------------------------------------- MARKER DE SALIDA DE LA BASE ----------------------------------------

local alpha = 150
local r, g, b = 255, 255, 255
local size = 1.5
local typem = "cylinder"
local posx, posy, posz = 1971.837890625, -1223.1513671875, 24.001644134521

salidaB = createMarker ( posx, posy, posz, typem, size, r, g, b, alpha, getRootElement() )

local x, y, z = 1975.4501953125, -1246.87109375, 23.992124557495 -- Posicion en la que el Jugador va Aparecer despues de Salir
local r, g, b = 255, 255, 0 -- Colores R G B
local text = "[SERVER] #FF0000Salistes de la Base S.W.A.T., Vuelve Pronto!" -- Mensaje al Salir del Marker

function alSalir(hitElement)
    outputChatBox(text, getRootElement(), r, g, b, true)
    setElementPosition(hitElement, x, y, z)
end
addEventHandler("onMarkerHit", salidaB, alSalir)