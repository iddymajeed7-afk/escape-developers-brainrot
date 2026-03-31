local function createPuzzleObstacle(position, puzzleType, name)
    local obstacle = Instance.new('Part')
    obstacle.Name = name or 'Puzzle'
    obstacle.Shape = Enum.PartType.Block
    obstacle.Size = Vector3.new(10, 10, 10)
    obstacle.Position = position
    obstacle.CanCollide = true
    obstacle.Parent = workspace
    
    if puzzleType == 'moving' then
        obstacle.BrickColor = BrickColor.new('Bright orange')
        local direction = 1
        game:GetService('RunService').Heartbeat:Connect(function()
            obstacle.Position = obstacle.Position + Vector3.new(direction * 0.5, 0, 0)
            if obstacle.Position.X > position.X + 20 or obstacle.Position.X < position.X - 20 then
                direction = -direction
            end
        end)
    elseif puzzleType == 'deadly' then
        obstacle.BrickColor = BrickColor.new('Bright red')
        obstacle.Touched:Connect(function(hit)
            local humanoid = hit.Parent:FindFirstChild('Humanoid')
            if humanoid then
                humanoid:TakeDamage(10)
            end
        end)
    elseif puzzleType == 'platform' then
        obstacle.BrickColor = BrickColor.new('Cyan')
        local originalTransparency = obstacle.Transparency
        obstacle.Touched:Connect(function(hit)
            obstacle.CanCollide = false
            obstacle.Transparency = 0.5
            task.wait(2)
            obstacle.CanCollide = true
            obstacle.Transparency = originalTransparency
        end)
    end
    
    return obstacle
end

local puzzles = workspace:FindFirstChild('Puzzles') or Instance.new('Folder')
puzzles.Name = 'Puzzles'
puzzles.Parent = workspace

if #puzzles:GetChildren() == 0 then
    createPuzzleObstacle(Vector3.new(25, 10, 25), 'moving', 'MovingBox')
    createPuzzleObstacle(Vector3.new(75, 5, 75), 'deadly', 'DeadlySpikes')
    createPuzzleObstacle(Vector3.new(125, 10, 125), 'platform', 'DisappearingPlatform')
end

print('Puzzle System Script Loaded')
