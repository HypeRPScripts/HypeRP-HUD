ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("fn_hud:getStatus", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb({money = xPlayer.getMoney(), bank = xPlayer.getBank(), black_money = xPlayer.getAccount("black_money").money})
end)