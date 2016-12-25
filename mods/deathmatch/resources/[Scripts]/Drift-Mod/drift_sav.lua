--Script by Jumper
function playerLogin(thePreviousAccount, theCurrentAccount, autoLogin)
  if not isGuestAccount(getPlayerAccount(source)) then
    local drift_points = getAccountData(theCurrentAccount, "Drift's Rank")
    local drift_points2 = getAccountData(theCurrentAccount, "Record Drift")
    if drift_points then
      setElementData(source, "Drift's Rank", drift_points)
      setElementData(source, "Record Drift", drift_points2)
    else
      setElementData(source, "Drift's Rank", "\208\157\208\190\208\178\208\184\209\135\209\145\208\186")
      setElementData(source, "Record Drift", 0)
    end
  end
end
addEventHandler("onPlayerLogin", getRootElement(), playerLogin)
function onQuit(quitType, reason, responsibleElement)
  if not isGuestAccount(getPlayerAccount(source)) then
    local account = getPlayerAccount(source)
    if account then
      local save_drift_points = getElementData(source, "Drift's Rank")
      local save_drift_points2 = getElementData(source, "Record Drift")
      setAccountData(account, "Drift's Rank", save_drift_points)
      setAccountData(account, "Record Drift", save_drift_points2)
    end
  end
end
