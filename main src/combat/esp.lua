local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local highlights = {}

local function AddESP(player)
    if player == LocalPlayer then return end
    if highlights[player] then return end
    
    local character = player.Character or player.CharacterAdded:Wait()
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = character
    highlight.Adornee = character
    
    highlights[player] = highlight
end

local function RemoveESP(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
end

local function ClearAllESP()
    for player, highlight in pairs(highlights) do
        if highlight then
            highlight:Destroy()
        end
    end
    highlights = {}
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if exploit.Enabled.ESP then
            AddESP(player)
        end
    end)
end)

RunService.Heartbeat:Connect(function()
    if exploit.Enabled.ESP then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                if not highlights[player] then
                    AddESP(player)
                end
            end
        end
    else
        ClearAllESP()
    end
end)

print("ESP script loaded")
