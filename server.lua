--[[ Remove after 60 seconds ]]
delay = 60
color = '~r~'

syncTable = {}
count = 0

AddEventHandler('playerDropped', function(reason)
    local args = {
        ['coords'] = GetEntityCoords(GetPlayerPed(source)),
        ['line1'] = color..'Player: ~w~'..source,
        ['line2'] = color..'Reason: ~w~'..reason,
        ['line3'] = color..'Date/Time: ~w~'..os.date('%a %b %d %X %Y')
    }
    count = count + 1
    syncTable[count] = args,
    TriggerClientEvent('DisconnectSync', -1, syncTable)
    Citizen.Wait(delay * 1000)
    syncTable[count] = nil
    TriggerClientEvent('DisconnectSync', -1, syncTable)
end)

AddEventHandler("playerJoining", function(source, oldID)
    TriggerClientEvent('DisconnectSync', -1, syncTable)
end)