local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local exploit = _G.RBXExploit
while not exploit do
    task.wait()
    exploit = _G.RBXExploit
end

local flying = false
local flyConnection = nil
local bodyVelocity = nil
local bodyGyro = nil

local function StartFly()
    if flying then return end
    flying = true
    
    local character = exploit.Character
    local rootPart = exploit.HumanoidRootPart
    if not rootPart then return end
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = rootPart
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
    bodyGyro.CFrame = rootPart.CFrame
    bodyGyro.Parent = rootPart
    
    flyConnection = RunService.Heartbeat:Connect(function()
        if not exploit.Enabled.Fly then
            StopFly()
            return
        end
        
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end
        
        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit * exploit.Settings.FlySpeed
        end
        
        bodyVelocity.Velocity = moveDirection
        bodyGyro.CFrame = camera.CFrame
    end)
end

local function StopFly()
    flying = false
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end
    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end
    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end
end

RunService.Heartbeat:Connect(function()
    if exploit.Enabled.Fly and not flying then
        StartFly()
    elseif not exploit.Enabled.Fly and flying then
        StopFly()
    end
end)

print("Fly script loaded")
