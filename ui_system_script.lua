local Players = game:GetService('Players')

local function createPlayerUI(player)
    local playerGui = player:WaitForChild('PlayerGui')
    
    local screenGui = Instance.new('ScreenGui')
    screenGui.Name = 'GameUI'
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui
    
    local healthLabel = Instance.new('TextLabel')
    healthLabel.Name = 'HealthLabel'
    healthLabel.Size = UDim2.new(0, 200, 0, 50)
    healthLabel.Position = UDim2.new(0, 10, 0, 10)
    healthLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    healthLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    healthLabel.TextSize = 24
    healthLabel.Text = 'Health: 100'
    healthLabel.Parent = screenGui
    
    local timerLabel = Instance.new('TextLabel')
    timerLabel.Name = 'TimerLabel'
    timerLabel.Size = UDim2.new(0, 200, 0, 50)
    timerLabel.Position = UDim2.new(0.5, -100, 0, 10)
    timerLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    timerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    timerLabel.TextSize = 24
    timerLabel.Text = 'Time: 0s'
    timerLabel.Parent = screenGui
    
    local collectiblesLabel = Instance.new('TextLabel')
    collectiblesLabel.Name = 'CollectiblesLabel'
    collectiblesLabel.Size = UDim2.new(0, 200, 0, 50)
    collectiblesLabel.Position = UDim2.new(1, -210, 0, 10)
    collectiblesLabel.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    collectiblesLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    collectiblesLabel.TextSize = 24
    collectiblesLabel.Text = 'Brainrot: 0'
    collectiblesLabel.Parent = screenGui
end

for _, player in pairs(Players:GetPlayers()) do
    createPlayerUI(player)
end

Players.PlayerAdded:Connect(createPlayerUI)

print('UI System Script Loaded')
