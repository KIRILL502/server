function saveAccountData ( account )
	if isGuestAccount ( account ) then
		return false
	end
	local source = getAccountPlayer ( account )
	local money = getPlayerMoney ( source )
	local skin = getElementModel ( source )
	local health = getElementHealth ( source )
	local armor = getPedArmor ( source )
	setAccountData ( account, 'Money', money )
	setAccountData ( account, 'Skin', skin )
	setAccountData ( account, 'Health', health )
	setAccountData ( account, 'Armor', armor )
	return true
end


addEventHandler ( 'onResourceStart', resourceRoot, function ( )
	for i,p in ipairs( getElementsByType ( 'player' ) ) do
		local acc = getPlayerAccount ( p )
		if isGuestAccount  ( acc ) then
			return
		end
		local accData_money = getAccountData ( acc, 'Money' )
		local accData_skin = getAccountData ( acc, 'Skin' )
		local accData_health = getAccountData ( acc, 'Health' )
		local accData_armor = getAccountData ( acc, 'Armor' )
		if accData_money and accData_skin and accData_health and accData_armor then
			givePlayerMoney ( p, tonumber( accData_money ) )
			setElementModel ( p, tonumber( accData_skin ) )
			setElementHealth ( p, tonumber( accData_health ) )
			setPedArmor ( p, tonumber( accData_armor ) )
			outputChatBox ( '* [Server] : Ваши данные успешно сохранены!', p, 255, 255, 255, true )
		else
			local save = saveAccountData ( acc )
			if save then
				outputChatBox ( '* [Server] : Всегда используйте именно этот аккаунт!', p, 255, 255, 255, true )
				outputChatBox ( '* [Server] : Идёт сохранение ...', p, 255, 255, 255, true )
				setTimer ( function ( )
					outputChatBox ( '* [Server] : Ваши данные успешно сохранены!', p, 255, 255, 255, true )
				end, 3000, 1 )	
			else
				outputChatBox ( '* [Server] : Нам не удалось сохранить ваши данные', p, 255, 255, 255, true )
				outputChatBox ( '* [Server] : Свяжитесь с администрацией сервера', p, 255, 255, 255, true )
			end
		end
	end
end )

addEventHandler ( 'onPlayerLogin', root, function ( _,acc )
	if isGuestAccount ( acc ) then
		return
	end
	local accData_money = getAccountData ( acc, 'Money' )
	local accData_skin = getAccountData ( acc, 'Skin' )
	local accData_health = getAccountData ( acc, 'Health' )
	local accData_armor = getAccountData ( acc, 'Armor' )
	if accData_money and accData_skin and accData_health and accData_armor then
		givePlayerMoney ( source, tonumber( accData_money ) )
		setElementModel ( source, tonumber( accData_skin ) )
		setElementHealth ( source, tonumber( accData_health ) )
		setPedArmor ( source, tonumber( accData_armor ) )
		outputChatBox ( '* [Server] : Ваши данные успешно сохранены!', p, 255, 255, 255, true )
	else
		local save = saveAccountData ( acc )
		if save then
			outputChatBox ( '* [Server] : Всегда используйте именно этот аккаунт!', p, 255, 255, 255, true )
			outputChatBox ( '* [Server] : Идёт сохранение ...', p, 255, 255, 255, true )
			setTimer ( function ( )
				outputChatBox ( '* [Server] : Ваши данные успешно сохранены!', p, 255, 255, 255, true )
			end, 3500, 1 )	
		else
			outputChatBox ( '* [Server] : Нам не удалось сохранить ваши данные', p, 255, 255, 255, true )
			outputChatBox ( '* [Server] : Свяжитесь с администрацией сервера', p, 255, 255, 255, true )
		end
	end
end )

addEventHandler ( 'onPlayerLogout', root, function ( acc )
	outputChatBox ( '* [Server] : Вы вышли из вашего аккаунта', source, 255, 255, 255, true )
	setTimer ( function ( )
		local save = saveAccountData ( acc )
		if save then
			outputChatBox ( '* [Server] : Ваши данные успешно сохранены!', source, 255, 255, 255, true )
			outputChatBox ( '* [Server] : Примечание:ваши данные не будут сохранены пока вы не войдёте в свой аккаунт', source, 255, 255, 255, true )
		else
			outputChatBox ( '* [Server] : Нам не удалось сохранить ваши данные', source, 255, 255, 255, true )
			outputChatBox ( '* [Server] : Свяжитесь с администрацией сервера', source, 255, 255, 255, true )
		end
	end, 3500, 1 ) 
end )

addEventHandler ( 'onPlayerQuit', root, function ( )
	local acc = getPlayerAccount ( source )
	saveAccountData ( acc )
end )
