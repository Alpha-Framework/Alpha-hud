QBCore = nil

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

 QBCore.Commands.Add("cash", "check your cash balance", {}, false, function(source, args)
	local src = source
	TriggerClientEvent('hud:client:DisplayCash', src)
end)

--QBCore.Commands.Add("cash", "Check your cash", {}, false, function(source, args)
--	local src = source
--	TriggerClientEvent('hud:client:DisplayCash', src)
--end)

QBCore.Commands.Add("bank", "Check your bank balance", {}, false, function(source, args)
	local src = source
	TriggerClientEvent('hud:client:DisplayBank', src)
end)