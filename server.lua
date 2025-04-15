ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('doorbreak:alertPolice')
AddEventHandler('doorbreak:alertPolice', function(doorId, coords)
    local door = Config.AlertDoors[doorId]
    if not door then return end

    local alreadyNotified = {}

    if door.alerPolice and math.random(1, 100) <= (door.alertChance or 100) then
        for _, jobName in ipairs(door.policeJobs or {}) do
            local xPlayers = ESX.GetExtendedPlayers('job', jobName)
            for _, xPlayer in pairs(xPlayers) do
                if not alreadyNotified[xPlayer.source] then
                    TriggerClientEvent('doorbreak:notifyPolice', xPlayer.source, coords, door.policeMessage or "Burglary reported.")
                    alreadyNotified[xPlayer.source] = true
                end
            end
        end
    end

    if door.alertOwner then
        for _, jobName in ipairs(door.ownerJobs or {}) do
            local xPlayers = ESX.GetExtendedPlayers('job', jobName)
            for _, xPlayer in pairs(xPlayers) do
                if not alreadyNotified[xPlayer.source] then
                    TriggerClientEvent('doorbreak:notifyOwner', xPlayer.source, door.ownerMessage or "Burglary at your place!")
                    alreadyNotified[xPlayer.source] = true
                end
            end
        end
    end
end)
