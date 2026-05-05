local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

_G.RBXExploit = {
    Enabled = {},
    Settings = {
        FlySpeed = 50,
        WalkSpeed = 50,
        JumpPower = 100,
        Gravity = 196.2,
        AimbotFOV = 100,
        AimbotSmoothness = 0.5,
        ESPEnabled = false,
        TriggerbotEnabled = false,
        AimAssistEnabled = false
    },
    UI = nil,
    LocalPlayer = LocalPlayer,
    Character = nil,
    Humanoid = nil,
    HumanoidRootPart = nil
}

local function UpdateCharacter()
    _G.RBXExploit.Character = LocalPlayer.Character
    if _G.RBXExploit.Character then
        _G.RBXExploit.Humanoid = _G.RBXExploit.Character:WaitForChild("Humanoid")
        _G.RBXExploit.HumanoidRootPart = _G.RBXExploit.Character:WaitForChild("HumanoidRootPart")
    end
end

LocalPlayer.CharacterAdded:Connect(UpdateCharacter)
UpdateCharacter()

print("RBXExploit Loader initialized")
print("Load other scripts in this order:")
print("1. mainUI.lua")
print("2. movement/fly.lua")
print("3. movement/gravity.lua")
print("4. movement/speed.lua")
print("5. movement/jump.lua")
print("6. combat/aimbot.lua")
print("7. combat/esp.lua")
print("8. combat/triggerbot.lua")
print("9. combat/aimassist.lua")
