--------------------------
-- Login panel by Jumper
--------------------------


-- Login handling
function loginPlayer(username,password,enableKickPlayer,attemptedLogins,maxLoginAttempts)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if ( account ~= false ) then
				logIn (source, account, password)
				outputChatBox ("#0000FF* #FFFFFFВы вошли под своим логином!",source,255,255,255,true)
				setTimer(outputChatBox,700,1,"#0000FF* #FFFFFFЧтобы включить авто-вход введите #ABCDEF/enableauto#FFFFFF!",source,255,255,255,true)
				triggerClientEvent (source,"hideLoginWindow",getRootElement())
			else
				if enableKickPlayer == true then
					if (attemptedLogins >= maxLoginAttempts-1) then
						outputChatBox ("#0000FF* #FFFFFFОшибка! Неправильный логин и/или пароль!",source,255,255,255,true)
						setTimer(outputChatBox,500,1,"#0000FF* #FFFFFFВнимание! Максимальное количество попыток входа исчерпано! [#008AFF"..attemptedLogins+1 .."/"..maxLoginAttempts.."#FFFFFF]",source,255,255,255,true)
						setTimer(outputChatBox,1000,1,"#0000FF* #FFFFFFВы будете кикнуты через #008AFF5 секунд#FFFFFF!",source,255,255,255,true)
						setTimer(kickPlayer,5000,1,source,"Не удалось войти")
					else
						outputChatBox ("#0000FF* #FFFFFFError! Wrong username and/or password!",source,255,255,255,true)
						setTimer(outputChatBox,500,1,"#0000FF* #FFFFFFLogin attempts: [#008AFF"..attemptedLogins+1 .."/"..maxLoginAttempts.."#FFFFFF]",source,255,255,255,true)
						triggerClientEvent(source,"onRequestIncreaseAttempts",source)
					end
				else
					outputChatBox ("#0000FF* #FFFFFFНеправильный логин и/или пароль!",source,255,255,255,true)
				end
			end
		else
			outputChatBox ("#0000FF* #FFFFFFОшибка! Пожалуйста введите свой пароль!",source,255,255,255,true)
		end
	else
		outputChatBox ("#0000FF* #FFFFFFОшибка! Пожалуйста введите свой логин!",source,255,255,255,true)
	end
end



-- Registration here
function registerPlayer(username,password,passwordConfirm)
	if not (username == "") then
		if not (password == "") then
			if not (passwordConfirm == "") then
				if password == passwordConfirm then
					local account = getAccount (username,password)
					if (account == false) then
						local accountAdded = addAccount(tostring(username),tostring(password))
						if (accountAdded) then
							triggerClientEvent(source,"hideRegisterWindow",getRootElement())
							outputChatBox ("#0000FF* #FFFFFFВы успешно зарегистрировалиcь! [Username: #ABCDEF" .. username .. " #FF0000| #FFFFFFPassword: #ABCDEF" .. password .. "#FFFFFF]",source,255,255,255,true )
							setTimer(outputChatBox,800,1,"#0000FF* #FFFFFFТеперь вы можете войти в систему с новой учетной записи.",source,255,255,255,true )
						else
							outputChatBox ("#0000FF* #FFFFFF Неизвестная ошибка! Пожалуйста выберете другой логин/пароль и попробуйте еще раз.",source,255,255,255,true )
						end
					else
						outputChatBox ("#0000FF* #FFFFFFОшибка! Такой аккаунт уже есть попробуйте другой логин!",source,255,255,255,true )
					end
				else
					outputChatBox ("#0000FF* #FFFFFFОшибка! Пароли не совпадают!",source,255,255,255,true)
				end
			else
				outputChatBox ("#0000FF* #FFFFFFОшибка! Пожалуйста, подтвердите свой пароль!",source,255,255,255,true)
			end
		else
			outputChatBox ("#0000FF* #FFFFFFОшибка! Пожалуйста, введите пароль!",source,255,255,255,true)
		end
	else
		outputChatBox ("#0000FF* #FFFFFFОшибка! Пожалуйста введите имя пользователя под которым хотите зарегистрироваться!",source,255,255,255,true)
	end
end



-- Auto-login handling
function autologinPlayer(username,password)
	if not (username == "") then
		if not (password == "") then
			local account = getAccount ( username, password )
			if not (account == false) then
				logIn (source, account, password)
				outputChatBox("#0000FF* #FFFFFFДобро пожаловать!",source,255,255,255,true)
				setTimer(outputChatBox,1000,1,"#0000FF* #FFFFFFВыключить авто-логин, use #ABCDEF/disableauto.",source,255,255,255,true)
				triggerClientEvent ( source, "hideLoginWindow", getRootElement())
			else
				outputChatBox ("#FF0000* #FFFFFFАвто-логин ошибка - Имя пользователя и/или пароль не совпадают",source,255,255,255,true)
			end
		else
			outputChatBox ("#FF0000* #FFFFFFАвто-логин ошибка - Не удалось получить пароль",source,255,255,255,true)
		end
	else
		outputChatBox ("#FF0000* #FFFFFFАвто-логин ошибка - Неправильный логин",source,255,255,255,true)
	end
end



-- When the player logs out, trigger the client event to check if the login panel will request them to login again
function logoutHandler()
	triggerClientEvent(source,"onRequestDisplayPanel",source)
end
addEventHandler("onPlayerLogout",getRootElement(),logoutHandler)




-- Get the server's name
function getData()
	local sName = string.gsub(getServerName()," ","")
	triggerClientEvent(source,"onGetServerData",getRootElement(),sName)
end




addEvent("onRequestLogin",true)
addEvent("onRequestRegister",true)
addEvent("onRequestAutologin",true)
addEvent("onClientLoginLoaded",true)
addEventHandler("onRequestLogin",getRootElement(),loginPlayer)
addEventHandler("onRequestRegister",getRootElement(),registerPlayer)
addEventHandler("onRequestAutologin",getRootElement(),autologinPlayer)
addEventHandler("onClientLoginLoaded",getRootElement(),getData)

