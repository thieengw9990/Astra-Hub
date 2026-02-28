repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

local PlaceId = game.PlaceId
local HttpService = game:GetService("HttpService")

local GameScripts = {
    [2753915549] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/BloxFruits_v1.lua",
    [4442272183] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/BloxFruits_v1.lua",
    [7449423635] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/BloxFruits_v1.lua",
    
    [4520749081] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/KingLegacy_v1.lua",
    
    ["Universal"] = "https://raw.githubusercontent.com/thieengw9990/Astra-Hub/refs/heads/main/AstraXHubMain.lua"
}

local scriptUrl = GameScripts[PlaceId] or GameScripts["Universal"]

print("[ASTRA X HUB] Router active. Detected PlaceId: " .. tostring(PlaceId))
print("[ASTRA X HUB] Routing to branch...")

local success, err = pcall(function()
    loadstring(game:HttpGet(scriptUrl))()
end)

if not success then
    warn("[ASTRA X HUB] Failed to load game branch: " .. tostring(err))
    
    if scriptUrl ~= GameScripts["Universal"] then
        loadstring(game:HttpGet(GameScripts["Universal"]))()
    end
end
