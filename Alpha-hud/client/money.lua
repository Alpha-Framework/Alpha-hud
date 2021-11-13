local QBCore = exports['qb-core']:GetCoreObject()


local cashAmount = 0
local bankAmount = 0

RegisterNetEvent("hud:client:SetMoney")
AddEventHandler("hud:client:SetMoney", function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money['cash']
        bankAmount = PlayerData.money['bank']
    end)
    if QBHud.Money.ShowConstant then
        SendNUIMessage({
            action = "open",
            cash = cashAmount,
            bank = bankAmount,
        })
    end
end)

RegisterNetEvent("hud:client:ShowMoney")
AddEventHandler("hud:client:ShowMoney", function(type)
    TriggerEvent("hud:client:SetMoney")
    SendNUIMessage({
        action = "show",
        
        bank = bankAmount,
        type = type,
    })
end)



RegisterNetEvent("hud:client:DisplayBank")
AddEventHandler("hud:client:DisplayBank", function(type)
    local src = source
    QBCore.Functions.GetPlayerData(function(PlayerData)
        bankAmount = PlayerData.money["bank"]
    QBCore.Functions.Notify("Bank $ "..bankAmount.. "")
    end)
end)

RegisterNetEvent("hud:client:DisplayCash")
AddEventHandler("hud:client:DisplayCash", function(type)
    local src = source
    QBCore.Functions.GetPlayerData(function(PlayerData)
        bankAmount = PlayerData.money["cash"]
    QBCore.Functions.Notify("Cash $ "..bankAmount.. "")
    end)
end)

RegisterNetEvent("hud:client:OnMoneyChange")
AddEventHandler("hud:client:OnMoneyChange", function(type, amount, isMinus)
    QBCore.Functions.GetPlayerData(function(PlayerData)
        cashAmount = PlayerData.money["cash"]
        bankAmount = PlayerData.money["bank"]
    
    -- if QBHud.Money.ShowConstant then
    --     SendNUIMessage({
    --         action = "open",
    --         cash = cashAmount,
    --         bank = bankAmount,
    --     })
    -- else
        SendNUIMessage({
            action = "update",
            cash = cashAmount,
            bank = bankAmount,
            amount = amount,
            minus = isMinus,
            type = type,
        })
    end)

    -- end
end)

