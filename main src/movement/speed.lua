local RunService = game:GetService("RunService")

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local originalSpeed = 16

RunService.Heartbeat:Connect(function()
    if not exploit.Humanoid then return end
    
    if exploit.Enabled.Speed then
        exploit.Humanoid.WalkSpeed = exploit.Settings.WalkSpeed
    else
        exploit.Humanoid.WalkSpeed = originalSpeed
    end
end)

print("Speed script loaded")
