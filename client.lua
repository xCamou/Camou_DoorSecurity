ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('doorbreak:notifyPolice')
AddEventHandler('doorbreak:notifyPolice', function(coords, message)
    ESX.ShowNotification(message)

    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 161)
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Burglary")
    EndTextCommandSetBlipName(blip)
    
    Wait(120000)
    RemoveBlip(blip)
end)

RegisterNetEvent('doorbreak:notifyOwner')
AddEventHandler('doorbreak:notifyOwner', function(message)
    ESX.ShowNotification(message)
end)
