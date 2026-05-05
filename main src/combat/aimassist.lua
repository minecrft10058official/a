local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
local UserInputService = game:GetService("UserInputService")

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local mouseDown = false

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        mouseDown = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        mouseDown = false
    end
end)

local function GetClosestPlayer()
    local closestPlayer = nil
    local shortestDistance = exploit.Settings.AimbotFOV
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local screenPoint = Camera:WorldToScreenPoint(head.Position)
            local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
            
            if distance < shortestDistance then
                shortestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if not exploit.Enabled.AimAssist then return end
    if not mouseDown then return end
    
    local target = GetClosestPlayer()
    if target and target.Character and target.Character:FindFirstChild("Head") then
        local targetPos = target.Character.Head.Position
        local currentCFrame = Camera.CFrame
        local targetCFrame = CFrame.new(currentCFrame.Position, targetPos)
        
        Camera.CFrame = currentCFrame:Lerp(targetCFrame, exploit.Settings.AimbotSmoothness * 0.5)
    end
end)

print("AimAssist script loaded")
