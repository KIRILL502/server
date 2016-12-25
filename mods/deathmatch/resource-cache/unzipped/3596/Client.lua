----------------------------- TEXTO DEL MARKER DE ENTRADA -----------------------------

local alpha = 0
local r, g, b = 255, 255, 255
local size = 5
local typem = "cylinder"
local posx, posy, posz = 1976.0625, -1251.630859375, 22.8203125

local entradaB = createMarker (posx, posy, posz, typem, size, r, g, b, alpha)

addEventHandler( "onClientRender", root, function (  )
       local x, y, z = getElementPosition( entradaB )
       local Mx, My, Mz = getCameraMatrix(   )
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 30 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +1, 0.07 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("Pike\nTIKAY Z DOMA", WorldPositionX - 1, WorldPositionY - 1, WorldPositionX - 1, WorldPositionY - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Pike\nTIKAY Z DOMA.", WorldPositionX + 1, WorldPositionY - 1, WorldPositionX + 1, WorldPositionY - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Pike\nTIKAY Z DOMA", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Pike\nTIKAY Z DOMA.", WorldPositionX + 1, WorldPositionY + 1, WorldPositionX + 1, WorldPositionY + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Pike\nTIKAY Z DOMA.", WorldPositionX, WorldPositionY, WorldPositionX, WorldPositionY, tocolor(255, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
            end
      end
end 
)

----------------------------- TEXTO DEL MARKER DE SALIDA -----------------------------

local alpha = 0
local r, g, b = 255, 255, 255
local size = 1.5
local typem = "cylinder"
local posx, posy, posz = 1971.837890625, -1223.1513671875, 24.001644134521

local salidaB = createMarker (posx, posy, posz, typem, size, r, g, b, alpha)

addEventHandler( "onClientRender", root, function (  )
       local x, y, z = getElementPosition( salidaB )
       local Mx, My, Mz = getCameraMatrix(   )
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 30 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +1, 0.07 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("Salida\nBase S.W.A.T.", WorldPositionX - 1, WorldPositionY - 1, WorldPositionX - 1, WorldPositionY - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Salida\nBase S.W.A.T.", WorldPositionX + 1, WorldPositionY - 1, WorldPositionX + 1, WorldPositionY - 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Salida\nBase S.W.A.T.", WorldPositionX - 1, WorldPositionY + 1, WorldPositionX - 1, WorldPositionY + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Salida\nBase S.W.A.T.", WorldPositionX + 1, WorldPositionY + 1, WorldPositionX + 1, WorldPositionY + 1, tocolor(0, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
			    dxDrawText("Salida\nBase S.W.A.T.", WorldPositionX, WorldPositionY, WorldPositionX, WorldPositionY, tocolor(255, 0, 0, 255), 1.00, "bankgothic", "center", "center", false, false, false, false, false)
            end
      end
end 
)