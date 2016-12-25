local resourceroot = getResourceRootElement(getThisResource())
function DXdraw()
-- weapons categories
	local noreloadweapons = {} --Weapons that doesn't reload (including the flamethrower, minigun, which doesn't have reload anim).
	noreloadweapons[16] = true
	noreloadweapons[17] = true
	noreloadweapons[18] = true
	noreloadweapons[19] = true
	noreloadweapons[25] = true
	noreloadweapons[33] = true
	noreloadweapons[34] = true
	noreloadweapons[35] = true
	noreloadweapons[36] = true
	noreloadweapons[37] = true
	noreloadweapons[38] = true
	noreloadweapons[39] = true
	noreloadweapons[41] = true
	noreloadweapons[42] = true
	noreloadweapons[43] = true

	local meleespecialweapons = {} --Weapons that don't shoot, and special weapons.
	meleespecialweapons[0] = true
	meleespecialweapons[1] = true
	meleespecialweapons[2] = true
	meleespecialweapons[3] = true
	meleespecialweapons[4] = true
	meleespecialweapons[5] = true
	meleespecialweapons[6] = true
	meleespecialweapons[7] = true
	meleespecialweapons[8] = true
	meleespecialweapons[9] = true
	meleespecialweapons[10] = true
	meleespecialweapons[11] = true
	meleespecialweapons[12] = true
	meleespecialweapons[13] = true
	meleespecialweapons[14] = true
	meleespecialweapons[15] = true
	meleespecialweapons[40] = true
	meleespecialweapons[44] = true
	meleespecialweapons[45] = true
	meleespecialweapons[46] = true
	
	
		local ammoinclip = getPedAmmoInClip (getLocalPlayer()) -- The ammo inside the clip
		local totalammo = getPedTotalAmmo(getLocalPlayer())-getPedAmmoInClip(getLocalPlayer()) -- The total ammo minus ammo inside clip
		local totalammo2 = getPedTotalAmmo(getLocalPlayer())
		local showammo1 = ammoinclip
		local showammo2 = totalammo
		local showammo3 = totalammo2


--Maket paneli
		local armour = getPedArmor( getLocalPlayer() )
		local health = getElementHealth ( getLocalPlayer() )
		local money = getPlayerMoney(getLocalPlayer())
		local sWidth, sHeight = guiGetScreenSize() 
		dxDrawRectangle(0,0,sWidth,30,tocolor( 0, 0, 0, 192 ), false)
		dxDrawImage( sWidth*0.01 - 40,4,sWidth/2 + 80,21,"board.png")
		dxDrawImage(sWidth*0.58,4,sWidth/2 + 80,21,"board1.png")
		dxDrawImage(sWidth*0.5-10,30,100,15,"timeboard.png")
		dxDrawImage(sWidth*0.62,6,90,19,"button.png")
		dxDrawImage(sWidth*0.72,6,90,20,"button.png")
		dxDrawImage(sWidth*0.82,6,90,20,"button.png")
		dxDrawImage(sWidth*0.92,6,90,20,"button.png")
		dxDrawImage(sWidth*0.33,6,130,19,"button.png")
		dxDrawImage(sWidth*0.17,6,130,19,"button.png")
		dxDrawImage(sWidth*0.01,6,130,19,"button.png")

		dxDrawImage(sWidth*0.333,6,15,15,"money.png")
		dxDrawImage(sWidth*0.823,6,16,16,"armour.png")
		dxDrawImage(sWidth*0.723,6,16,16,"health.png")
		dxDrawImage(sWidth*0.623,6,16,16,"coin.png")
		dxDrawImage(sWidth*0.173,7,25,25,"exp.png")
		local level = getPedStat( localPlayer, 0 )
		local exp = getPedStat( localPlayer, 1 )
		dxDrawText(tostring(level),sWidth*0.94,6,16,16,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
		dxDrawText(tostring(exp),sWidth*0.193,6,16,16,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
		dxDrawText(""..tostring(math.floor(health+0.5)).."%",sWidth*0.74,6,16,16,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
		dxDrawText(""..money.."",sWidth*0.35,6,17,17,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
		dxDrawText(""..tostring(math.floor(armour+0.5)).."%",sWidth*0.843,6,16,16,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
		--- time dx
		local hour, mins = getTime ()
		local time = hour .. ":" .. (((mins < 10) and "0"..mins) or mins)
		dxDrawText(tostring (time),sWidth*0.5+28,29,100,15,tocolor(250,250,250,200),0.65,"pricedown","left","top",false,false,false)
		local GoldMoney = getElementData(localPlayer, 'GOLD' or 0)
		dxDrawText(tostring(GoldMoney),sWidth*0.64,6,16,16,tocolor(255,255,255,255),0.7,"pricedown","left","top",false,false,false)
	---- dxWeaponIcon
	local weaponID = getPedWeapon (getLocalPlayer()); -- Get weapon ID
	dxDrawImage(sWidth*0.5 -60,0,200,30,"icons/".. tostring( weaponID ) .. ".png",0.0,0.0,0.0,tocolor(255,255,255,200),false) -- Weapon icons image. Check the icons file if you want to take and replace weapon icons.
-- now decide if the optional stuff should be drawn
	if noreloadweapons [getPedWeapon(getLocalPlayer())] then
		dxDrawText(tostring (showammo3),sWidth*0.5 + 80,16,sWidth-288,sHeight-12,tocolor(0,255,255,200),0.5,"bankgothic","left","top",false,false,false) -- No reload weapons (for shotgun, grenades, etc)

	elseif meleespecialweapons [getPedWeapon(getLocalPlayer())] then
-- Draw Nothing for melee and special weapons.

	else --Weapons that reloads.
        dxDrawText(tostring (showammo1),sWidth*0.5 - 40,16,sWidth-369,sHeight-18,tocolor(0,255,255,200),0.5,"bankgothic","left","top",false,false,false)
        --dxDrawText("|",sWidth*0.5,20,sWidth-385,sHeight-8,tocolor(255,255,255,200),0.5,"bankgothic","left","top",false,false,false)
        dxDrawText(tostring (showammo2),sWidth*0.5 + 80,16,sWidth-272,sHeight-12,tocolor(0,255,255,200),0.5,"bankgothic","left","top",false,false,false)
	end
		---- optionsDX
	--local armour = getPedArmor( getLocalPlayer() )
	 --health = getElementHealth( thePlayer() )
	--local money = getPlayerMoney(getLocalPlayer())
end

function hudChanger ()
    addEventHandler("onClientRender", getRootElement(), DXdraw)
    setPlayerHudComponentVisible ( "armour", false )
    setPlayerHudComponentVisible ( "health", false )
    setPlayerHudComponentVisible ( "money", false )
    setPlayerHudComponentVisible ( "clock", false )
    setPlayerHudComponentVisible ( "weapon", false )
    setPlayerHudComponentVisible ("ammo", false)
    setPlayerHudComponentVisible ( "money", false )
	--showPlayerHudComponent ( "area_name", false )
	 setPlayerHudComponentVisible ( "wanted", false )
end

addEventHandler( "onClientResourceStart", resourceroot, hudChanger ) 

function hudChanger2 ()
	 removeEventHandler("onClientRender", getRootElement(), DXdraw)
    setPlayerHudComponentVisible ( "armour", true )    
    setPlayerHudComponentVisible ( "health", true ) 
    setPlayerHudComponentVisible ( "money", true )
    setPlayerHudComponentVisible ( "clock", true )
    setPlayerHudComponentVisible ( "weapon", true )
    setPlayerHudComponentVisible ("ammo", true)
    setPlayerHudComponentVisible ( "money", true)
	setPlayerHudComponentVisible ( "wanted", true )
	setPlayerHudComponentVisible ( "area_name", true )
end
addCommandHandler ( "showstandarthud", hudChanger2) -- Removes the HUD, and shows the GTA HUD.
addCommandHandler ( "showstandarthud", hudChanger2) 
addEventHandler("onClientResourceStop", resourceroot, hudChanger2) -- When you stop the resource, executes.