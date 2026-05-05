local RunService = game:GetService("RunService")

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local originalJumpPower = 50

RunService.Heartbeat:Connect(function()
    if not exploit.Humanoid then return end
    
    if exploit.Enabled.Jump then
        exploit.Humanoid.JumpPower = exploit.Settings.JumpPower
    else
        exploit.Humanoid.JumpPower = originalJumpPower
    end
end)

print("Jump script loaded")
