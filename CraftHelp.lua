-- Add this line to set the maximum queue size
TriggerEvent("pNotify:SetQueueMax", "myQueueName", 10)

RegisterCommand('help', function()
    Citizen.Wait(1000)
    DisplayPNotifyNotification("[Discord] discord.gg/xyz", 'alert')
    
    Citizen.Wait(1000)
    DisplayPNotifyNotification("[Server] Server Name: Craft Roleplay", 'alert')
    
    Citizen.Wait(1000)
    DisplayPNotifyNotification("[Help] Open A Report Or Join Our Discord", 'alert')
end, false)

function DisplayPNotifyNotification(text, type)
    exports['pNotify']:SendNotification({
        text = text,
        type = type,
        layout = 'centerLeft',
        timeout = 3000,
        progressBar = false,
        animation = {
            open = 'gta_effects_fade_in',
            close = 'gta_effects_fade_out',
        },
        width = 300,
        left = 20,
    })
end
