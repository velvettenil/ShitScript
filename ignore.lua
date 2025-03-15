-- Settings
local webhookUrl = "https://discord.com/api/webhooks/1350295669146910952/Bi22NrX24OybIYcq5LX-plJhs-T4_1joL1JEyBGye8MY09baAoe8cdeUWWo2RYesv49X"

-- Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

-- Function to get player data
local function getPlayerData(player)
    return {
        Username = player.Username,
        UserID = player.UserId,
    }
end

-- Function to send data to Discord webhook
local function sendToDiscord(data)
    local httpRequest = syn.request{
        Url = webhookUrl,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode(data)
    }
end

-- Connect function to player joined event
Players.PlayerAdded:Connect(function(player)
    local playerData = getPlayerData(player)
    sendToDiscord(playerData)
end)