local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

RunService.RenderStepped:Connect(function()
    if not exploit.Enabled.Triggerbot then return end
    
    local target = Mouse.Target
    if target and target.Parent then
        local character = target.Parent
        local player = Players:GetPlayerFromCharacter(character)
        if player and player ~= LocalPlayer then
            -- Simulate mouse click
            mouse1click()
        end
    end
end)

print("Triggerbot script loaded")
