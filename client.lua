-- Include the configuration file
Config = {}
Config = LoadResourceFile(GetCurrentResourceName(), "config.lua")


local isTextVisible = false
local displayText = ""
local lastTextChangeTime = GetGameTimer()
local disappearDuration = 3000  -- 3 seconds

RegisterCommand("help", function(source, args, rawCommand)
    local text = table.concat(args, " ")

    if text and text ~= "" then
        displayText = text
        isTextVisible = true
        lastTextChangeTime = GetGameTimer()
    else
        displayText = ""
        isTextVisible = false
    end
end, false)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local currentTime = GetGameTimer()

        if isTextVisible then
            if currentTime >= lastTextChangeTime + disappearDuration then
                isTextVisible = false
                displayText = ""
            end
        end

        if isTextVisible then
            local rgb = Config.textColor

            SetTextColour(rgb.r, rgb.g, rgb.b, Config.alpha)

            SetTextFont(Config.font)
            SetTextScale(Config.scale, Config.scale)
            SetTextWrap(0.0, 1.0)
            SetTextCentre(true)

            SetTextEntry("STRING")
            AddTextComponentString(displayText)
            DrawText(Config.offset.x, Config.offset.y)
        end
    end
end)
