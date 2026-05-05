local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local originalGravity = Workspace.Gravity

RunService.Heartbeat:Connect(function()
    if exploit.Enabled.Gravity then
        Workspace.Gravity = exploit.Settings.Gravity
    else
        Workspace.Gravity = originalGravity
    end
end)

print("Gravity script loaded")
