ESX = nil

local PlayerData = {}

Citizen.CreateThread(function ()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()

    while PlayerData ~= nil do
        Wait(1000)
        Seton()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent("fn_hud:sendStatus")
AddEventHandler("fn_hud:sendStatus", function(cash, bank, dirty)
    
    
end)

function Seton()
    ESX.TriggerServerCallback('fn_hud:getStatus', function(data)
        SendNUIMessage({
            cash = data.money,
            bank = data.bank,
            dirty = data.black_money,
            
        })
    end)
end



local status = nil
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(100)
     local hud = true
     local ped = GetPlayerPed(-1)
     local health = GetEntityHealth(ped)
     local armor = GetPedArmour(ped)
     local water = IsPedSwimmingUnderWater(ped)
     local oxy = GetPlayerUnderwaterTimeRemaining(ped)
     local id = GetPlayerServerId(PlayerId(-1))
    
        SendNUIMessage({
            show = IsPauseMenuActive(),
            health = (GetEntityHealth(GetPlayerPed(-1))-100),
            armor = armor,
            oxygen = GetPlayerSprintTimeRemaining(PlayerId()) * 10,
            oxy = GetPlayerUnderwaterTimeRemaining(PlayerId()) * 10, 
            st = status,
            job = PlayerData.job.label,
            job_grade = PlayerData.job.grade_label,
            water = IsPedSwimmingUnderWater(GetPlayerPed(-1)),
            id = GetPlayerServerId(PlayerId(-1)),
           
            
        });
        
    end
end)



            








RegisterNetEvent('ESX_HealthBAR-UI:updateStatus')
AddEventHandler('ESX_HealthBAR-UI:updateStatus', function(Status)
    status = Status
    SendNUIMessage({
        action = "updateStatus",
        st = Status,
    })
end)





local toggleui = false
RegisterCommand('toggleui', function()
	if not toggleui then
		SendNUIMessage({ action = 'element', task = 'disable', value = 'job' })
		SendNUIMessage({ action = 'element', task = 'disable', value = 'cash' })
		
		
	else
		
			SendNUIMessage({ action = 'element', task = 'enable', value = 'job' })
			SendNUIMessage({ action = 'element', task = 'enable', value = 'cash' })
		
	end

	toggleui = not toggleui
end)




    