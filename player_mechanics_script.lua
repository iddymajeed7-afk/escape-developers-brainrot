local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')

local BOOST_SPEED = 50
local NORMAL_SPEED = 16
local BOOST_COOLDOWN = 5

local function setupPlayerMechanics(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild('Humanoid')
        local rootPart = character:WaitForChild('HumanoidRootPart')
        humanoid.WalkSpeed = NORMAL_SPEED

        local lastBoostTime = 0
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if gameProcessed then return end
            if input.KeyCode == Enum.KeyCode.Space then
                local currentTime = tick()
                if currentTime - lastBoostTime >= BOOST_COOLDOWN then
                    humanoid.WalkSpeed = BOOST_SPEED
                    lastBoostTime = currentTime
                    task.wait(2)
                    humanoid.WalkSpeed = NORMAL_SPEED
                end
            end
        end)
    end)
end

for _, player in pairs(Players:GetPlayers()) do
    setupPlayerMechanics(player)
end

Players.PlayerAdded:Connect(setupPlayerMechanics)

print('Player Mechanics Script Loaded')