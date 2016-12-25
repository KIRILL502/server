--Script by Jumper
local root = getRootElement()
local thisResourceRoot = getResourceRootElement(getThisResource())
addEventHandler("onResourceStart", thisResourceRoot, function()
  call(getResourceFromName("scoreboard"), "addScoreboardColumn", "Record Drift")
  exports.scoreboard:scoreboardAddColumn("Drift's Rank", getRootElement(), 100)
end)
addEventHandler("onResourceStop", thisResourceRoot, function()
  call(getResourceFromName("scoreboard"), "removeScoreboardColumn", "Record Drift")
  exports.scoreboard:removeScoreboardColumn("Drift's Rank", getRootElement(), 100)
end)

addEvent("giveMoneyDrift", true)
function giveMoneyDrift(amount)
  if isPedInVehicle(source) then
    givePlayerMoney(source, amount)
  end
end
addEventHandler("giveMoneyDrift", root, giveMoneyDrift)
