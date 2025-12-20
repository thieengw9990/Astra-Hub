repeat task.wait() until game:IsLoaded()

local place = game.PlaceId
local universe = game.GameId
local supported = false


local gameConfigs = {
    [7449423635] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/Scripts/Bloxfruits",
    [2753915549] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/Scripts/Bloxfruits",
    [4442272183] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/Scripts/Bloxfruits",
    [122478697296975] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/Scripts/Bloxfruits",
    [994732206] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/Scripts/Bloxfruits",
}

local function loadScript(url)
    if not url or url == "" or url == "Soon" then
        warn("Script for this game is coming soon!")
        return
    end
    
    if url:match("^https?://") then
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        
        if not success then
            warn("Failed to load script: " .. tostring(err))
            game.Players.LocalPlayer:Kick("Failed to load script. Please try again.")
        end
    else
        warn("Script configuration needed for: " .. url)
    end
end

local scriptUrl = gameConfigs[place] or gameConfigs[universe]

if scriptUrl then
    supported = true
    loadScript(scriptUrl)
end

if not supported then
    local message = "Script does not support this game.\n\n"
    message = message .. "Game: " .. game:GetService("MarketplaceService"):GetProductInfo(place).Name .. "\n"
    message = message .. "Place ID: " .. place .. "\n"
    message = message .. "Universe ID: " .. universe
    
    warn(message)
    
    if syn and syn.protect_gui then
        local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/main/Library.lua"))()
        Notification.new("error", "Unsupported Game", "This game is not supported by the script."):Send()
        task.wait(3)
    end
    
    game.Players.LocalPlayer:Kick("Script does not support this game.")
end
