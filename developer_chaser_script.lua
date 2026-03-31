local Players = game:GetService('Players')
local RunService = game:GetService('RunService')

local DEVELOPER_SPEED = 25
local DETECTION_RANGE = 100

local function chasePlayers(developerNPC)
    local closestPlayer = nil
    local closestDistance = DETECTION_RANGE
    
    for _, player in pairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
            local distance = (player.Character.HumanoidRootPart.Position - developerNPC.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestPlayer = player
            end
        end
    end
    
    if closestPlayer and closestPlayer.Character then
        local targetPos = closestPlayer.Character.HumanoidRootPart.Position
        local direction = (targetPos - developerNPC.Position).Unit
        developerNPC.Velocity = direction * DEVELOPER_SPEED
    end
end

RunService.Heartbeat:Connect(function()
    local developers = workspace:FindFirstChild('Developers')
    if developers then
        for _, dev in pairs(developers:GetChildren()) do
            if dev:FindFirstChild('Humanoid') then
                chasePlayers(dev)
            end
        end
    end
end)

print('Developer Chaser Script Loaded')
