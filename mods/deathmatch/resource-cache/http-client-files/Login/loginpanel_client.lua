
----------------------------------
-----------| Settings |-----------
----------------------------------

blackLoginScreen = false			-- Set to 'true' to display a black screen to the player untill they log in or choose to play as a guest.

enableKickPlayer = true			-- Set whether to kick the player after they fail to login specified amount of times.

disallowLogout = false			-- Set whether to show the userpanel to the players if they log out of their accounts.

removeBlackScreenTime = 4		-- The time it takes for the black screen to dissapear - If you choose to display the black screen. [IN SECONDS]

maxLoginAttempts = 5 			-- Set the maximum incorrect login attempts before the player gets kicked - If player kicking is enabled.

----------------------------------



-- Set the text you want displayed in the "rules" window here - use '\n' to go into the next line
infoText = "                Добро пожаловать на сервер [Street-Drift] \n\n*На нашем сервере вы весело можете провести время с друзьями!\n* Устраивать драг, спринт, дрифт, заезд на вермя и многое другое!\n*Просьба вам от администрации не спамить и не флудить в чат!\n\n*Уважаемые игроки сервера [Street-Drift]! Администрация рада видеть вас на нашем сервере! :)\n\n\n\n\n\                 Создатель и Гл. администратор сервера [Jumper].\n\n                 В данный момент сервер в стадии разработки!\n\n                                         Удачи ребята! :)"



-- Screen and GUI window sizes
screenWidth,screenHeight = guiGetScreenSize()
mainWidth,mainHeight = 749,620
regWidth,regHeight = 439,344


-- Generate the XML file name
function getServerName()
	triggerServerEvent("onClientLoginLoaded",getLocalPlayer())
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),getServerName)

function setXmlFileName(sName)
	xmlFileName = tostring("login_"..sName..".xml")
	loginPanel()
end
addEvent("onGetServerData",true)
addEventHandler("onGetServerData",getRootElement(),setXmlFileName)





----------------------------------

addEvent("onRequestIncreaseAttempts",true)
addEvent("onRequestDisplayPanel",true)

function loginPanel()
		-- Check if autologin is enabled - If yes, then log the player in, else create and show the userpanel
		local xmlFile = xmlLoadFile(xmlFileName)
		if xmlFile then
			status = xmlNodeGetAttribute(xmlFile,"autologin")
			if (status == "true") then
				local username = tostring(xmlNodeGetAttribute(xmlFile,"username"))
				local password = tostring(xmlNodeGetAttribute(xmlFile,"password"))
				if not (username == "") and not (password == "") then
					triggerServerEvent("onRequestAutologin",getLocalPlayer(),username,password)
				end
			else
				if blackLoginScreen == true then
					fadeCamera(false,0,0,0,0)
				end
				mainWindow = guiCreateWindow(screenWidth/2-mainWidth/2,screenHeight/2-mainHeight/2,mainWidth,mainHeight,"Привет :)",false)
				guiWindowSetSizable(mainWindow,false)

				mInfo = guiCreateMemo(21,36,411,450,infoText,false,mainWindow)
				guiMemoSetReadOnly(mInfo,true)

				editUsername = guiCreateEdit(21,510,187,25,"",false,mainWindow)
				guiEditSetMaxLength(editUsername,30)

				editPassword = guiCreateEdit(21,560,187,25,"",false,mainWindow)
				guiEditSetMaxLength(editPassword,30)
				guiEditSetMasked(editPassword,true)

				lblUsername = guiCreateLabel(30,480,158,38,"Ваш ник:",false,mainWindow)
				guiLabelSetColor(lblUsername,0,85,255)
				guiLabelSetVerticalAlign(lblUsername,"center")
				guiLabelSetHorizontalAlign(lblUsername,"center",false)
				guiSetFont(lblUsername,"default-bold-small")

				lblPassword = guiCreateLabel(30,530,158,38,"Ваш пароль:",false,mainWindow)
				guiLabelSetColor(lblPassword,0,85,255)
				guiLabelSetVerticalAlign(lblPassword,"center")
				guiLabelSetHorizontalAlign(lblPassword,"center",false)
				guiSetFont(lblPassword,"default-bold-small")

				

				btnLogin = guiCreateButton(280,510,150,30,"Bxog",false,mainWindow)
				guiSetFont(btnLogin,"default-bold-small")

				btnToggleRegister = guiCreateButton(280,550,150,30,"Регистрация",false,mainWindow)
				guiSetFont(btnToggleRegister,"default-bold-small")

				registerWindow = guiCreateWindow(screenWidth/2-regWidth/2,screenHeight/2-regHeight/2,regWidth,regHeight,"Регистрация",false)
				guiWindowSetSizable(registerWindow,false)

				editRegistrationUsername = guiCreateEdit(98,138,242,25,"",false,registerWindow)

				editRegistrationPassword = guiCreateEdit(98,195,242,25,"",false,registerWindow)
				guiEditSetMasked(editRegistrationPassword,true)

				editRegistrationRepeatPassword = guiCreateEdit(99,252,242,25,"",false,registerWindow)
				guiEditSetMasked(editRegistrationRepeatPassword,true)

				lblRegister = guiCreateLabel(24,24,391,97,"Register",false,registerWindow)
				guiLabelSetColor(lblRegister,0,85,255)
				guiLabelSetVerticalAlign(lblRegister,"center")
				guiLabelSetHorizontalAlign(lblRegister,"center",false)
				guiSetFont(lblRegister,"sa-gothic")

				lblRUsername = guiCreateLabel(98,113,242,17,"Логин:",false,registerWindow)
				guiLabelSetColor(lblRUsername,0,85,255)
				guiLabelSetVerticalAlign(lblRUsername,"center")
				guiLabelSetHorizontalAlign(lblRUsername,"center",false)
				guiSetFont(lblRUsername,"default-bold-small")

				lblRPassword = guiCreateLabel(98,171,242,17,"Пароль:",false,registerWindow)
				guiLabelSetColor(lblRPassword,0,85,255)
				guiLabelSetVerticalAlign(lblRPassword,"center")
				guiLabelSetHorizontalAlign(lblRPassword,"center",false)
				guiSetFont(lblRPassword,"default-bold-small")

				lblRepeatPassword = guiCreateLabel(98,230,242,17,"Повторите пароль:",false,registerWindow)
				guiLabelSetColor(lblRepeatPassword,0,85,255)
				guiLabelSetVerticalAlign(lblRepeatPassword,"center")
				guiLabelSetHorizontalAlign(lblRepeatPassword,"center",false)
				guiSetFont(lblRepeatPassword,"default-bold-small")

				btnCancel = guiCreateButton(232,292,179,38,"Выход",false,registerWindow)
				guiSetFont(btnCancel,"default-bold-small")

				btnConfirmRegistration = guiCreateButton(29,292,179,38,"Зарегистрироваться",false,registerWindow)
				guiSetFont(btnConfirmRegistration,"default-bold-small")

				guiCreateStaticImage(440,23,300,600,"logo.png",false,mainWindow)

				guiSetVisible(mainWindow, true)
				guiSetVisible(registerWindow, false)
				guiSetInputEnabled(true)
				showCursor(true)
				addEventHandler("onClientGUIClick",btnLogin,onClickLogin)
				addEventHandler("onClientGUIClick",btnToggleRegister,onClickRegisterToggle)
				addEventHandler("onClientGUIClick",btnPlayAsGuest,onClickGuest)
				addEventHandler("onClientGUIClick",btnConfirmRegistration,onClickRegisterConfirm)
				addEventHandler("onClientGUIClick",btnCancel,onClickCancel)
				addEventHandler("onRequestIncreaseAttempts",getRootElement(),increaseAttempts)
				attemptedLogins = 0
			end
			xmlUnloadFile(xmlFile)
		else
			xmlFileHandler(true)
		end
		addEventHandler("onRequestDisplayPanel",getRootElement(),logoutHandler)
end
--addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),loginPanel)



-- Disable autologin
function removeAutoLogin()
    local xmlFile = xmlLoadFile(xmlFileName)
	if xmlFile then
		local status = xmlNodeGetAttribute(xmlFile,"autologin")
		if status == "true" then
			xmlNodeSetAttribute(xmlFile,"autologin","false")
			outputChatBox("#0000FF* #FFFFFFАвто-логин сейчас #FF0000ВЫКЛЮЧЕН#FFFFFF!",255,255,255,true)
			xmlSaveFile(xmlFile)
			xmlUnloadFile(xmlFile)
		else
			outputChatBox("#0000FF* #FFFFFFАвто-логин сейчас #FF0000ВЫКЛЮЧЕН#FFFFFF!",255,255,255,true)
			xmlUnloadFile(xmlFile)
		end
	end
end
addCommandHandler("disableauto", removeAutoLogin)



-- Enable autologin
function addAutoLogin()
    local xmlFile = xmlLoadFile(xmlFileName)
	if xmlFile then
		local status  = xmlNodeGetAttribute(xmlFile,"autologin")
		if status == "false" then
			xmlNodeSetAttribute(xmlFile,"autologin","true")
			outputChatBox("#0000FF* #FFFFFFАвто-вход #00FF00ВКЛЮЧЕН#FFFFFF! Вы будете автоматически авторизованы каждый раз, когда вы присоединитесь к серверу.",255,255,255,true)
			setTimer(outputChatBox,1000,1,"#0000FF* #FFFFFFЧтобы #FF0000ВЫКЛЮЧИТЬ#FFFFFF авто-лоигн, использовать #ABCDEF/disableauto#FFFFFF!",255,255,255,true)
			xmlSaveFile(xmlFile)
			xmlUnloadFile(xmlFile)
		else
			outputChatBox("#0000FF* #FFFFFFАвто-вход уже #00FF00ВКЛЮЧЕН#FFFFFF!",255,255,255,true)
			xmlUnloadFile(xmlFile)
		end
	end
end
addCommandHandler("enableauto", addAutoLogin)



-- LOGIN PLAYER
function onClickLogin(button,state)
	if(button == "left" and state == "up") then
		if (source == btnLogin) then
			username = guiGetText(editUsername)
			password = guiGetText(editPassword)
			triggerServerEvent("onRequestLogin",getLocalPlayer(),username,password,enableKickPlayer,attemptedLogins,maxLoginAttempts)
			xmlFileHandler()
		end
	end
end



-- REGISTER PLAYER
function onClickRegisterConfirm(button,state)
	if(button == "left" and state == "up") then
		if (source == btnConfirmRegistration) then
			username = guiGetText(editRegistrationUsername)
			password = guiGetText(editRegistrationPassword)
			passwordConfirm = guiGetText(editRegistrationRepeatPassword)
			triggerServerEvent("onRequestRegister",getLocalPlayer(),username,password,passwordConfirm)
		end
	end
end



-- Open registration window
function onClickRegisterToggle(button,state)
	if(button == "left" and state == "up") then
		if (source == btnToggleRegister) then
			guiSetVisible(registerWindow, true)
			guiBringToFront(registerWindow)
			guiSetInputEnabled(true)
			showCursor(true)
		end
	end
end



-- Cancel registration
function onClickCancel(button,state)
	if(button == "left" and state == "up") then
		if (source == btnCancel) then
			guiSetVisible(mainWindow, true)
			guiSetVisible(registerWindow, false)
			guiSetInputEnabled(true)
			showCursor(true)
		end
	end
end







-- Show login window
function showLoginWindow()
	guiSetVisible(mainWindow, true)
	guiSetVisible(registerWindow, false)
	guiSetInputEnabled(true)
	showCursor(true)
end
addEvent("showLoginWindow", true)
addEventHandler("showLoginWindow",getRootElement(),showLoginWindow)



-- Hide login window
function hideLoginWindow()
	guiSetInputEnabled(false)
	guiSetVisible(mainWindow, false)
	guiSetVisible(registerWindow, false)
	showCursor(false)
	if blackLoginScreen == true then
		fadeCamera(true,removeBlackScreenTime)
	end
end
addEvent("hideLoginWindow", true)
addEventHandler("hideLoginWindow", getRootElement(), hideLoginWindow)



-- Hide register window
function hideRegisterWindow()
	guiSetInputEnabled(true)
	guiSetVisible(mainWindow, true)
	guiSetVisible(registerWindow, false)
	showCursor(true)
end
addEvent("hideRegisterWindow", true)
addEventHandler("hideRegisterWindow", getRootElement(), hideRegisterWindow)


-- Show login panel when a player logs out if 'dissalowLogout' is set to TRUE
function logoutHandler()
	if (disallowLogout == true) then
		loginPanel()
		setTimer(outputChatBox,600,1,"#0000FF* #FFFFFFВнимание! Вы вышли с аккаунта. Пожалуйста войдите снова.",255,255,255,true)
	end
end

-----------------------------------------------------------------------------------------------|

-- XML File Handler
function xmlFileHandler(gReturn)
	local xmlFile = xmlLoadFile(xmlFileName)
	if not xmlFile then
		xmlFile = xmlCreateFile(xmlFileName,"settings")
		xmlNodeSetAttribute(xmlFile,"autologin","false")
	end
	xmlNodeSetAttribute(xmlFile,"username",tostring(guiGetText(editUsername)))
	xmlNodeSetAttribute(xmlFile,"password",tostring(guiGetText(editPassword)))
	xmlSaveFile(xmlFile)
	xmlUnloadFile(xmlFile)
	if (gReturn) then
		if (gReturn == true) then
			loginPanel()
		else
			return
		end
	end
end


-- Increase Login Attepts
function increaseAttempts()
	attemptedLogins = attemptedLogins+1
end
