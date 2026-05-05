local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local exploit = _G.RBXExploit
while not exploit do
    task.wait(0.1)
    exploit = _G.RBXExploit
end

local function CreateGUI()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RBXExploitUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Enabled = true
    ScreenGui.Parent = PlayerGui
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 200, 0, 300)
    MainFrame.Position = UDim2.new(0, 10, 0, 10)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.Text = "RBXExploit"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Parent = MainFrame

    local function CreateToggle(name, yPos, category)
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -20, 0, 25)
        button.Position = UDim2.new(0, 10, 0, yPos)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.new(1, 1, 1)
        button.Text = name .. ": OFF"
        button.Parent = MainFrame
        
        local enabled = false
        button.MouseButton1Click:Connect(function()
            enabled = not enabled
            button.Text = name .. ": " .. (enabled and "ON" or "OFF")
            button.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(70, 70, 70)
            exploit.Enabled[category] = enabled
        end)
        
        return button
    end

    local yOffset = 40
    CreateToggle("Fly", yOffset, "Fly")
    yOffset = yOffset + 30
    CreateToggle("Speed", yOffset, "Speed")
    yOffset = yOffset + 30
    CreateToggle("Jump", yOffset, "Jump")
    yOffset = yOffset + 30
    CreateToggle("Gravity", yOffset, "Gravity")
    yOffset = yOffset + 30
    CreateToggle("Aimbot", yOffset, "Aimbot")
    yOffset = yOffset + 30
    CreateToggle("ESP", yOffset, "ESP")
    yOffset = yOffset + 30
    CreateToggle("Triggerbot", yOffset, "Triggerbot")
    yOffset = yOffset + 30
    CreateToggle("AimAssist", yOffset, "AimAssist")
    
    print("RBXExploit UI loaded")
end

if LocalPlayer.Character then
    task.wait(2)
    CreateGUI()
else
    LocalPlayer.CharacterAdded:Wait()
    task.wait(2)
    CreateGUI()
end
