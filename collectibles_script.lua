local COLLECTIBLE_POINTS = 10
local MEME_NAMES = {
    'Sigma Grindset',
    'Skibidi',
    'Gyatt',
    'Ohio',
    'Fanum Tax',
    'No Cap',
    'Based',
    'Slay',
    'Periodt',
    'Bet'
}

local function createCollectible(position, memeType)
    local collectible = Instance.new('Part')
    collectible.Name = 'Collectible_' .. memeType
    collectible.Shape = Enum.PartType.Ball
    collectible.Size = Vector3.new(1, 1, 1)
    collectible.Position = position
    collectible.CanCollide = true
    collectible.BrickColor = BrickColor.new('Bright yellow')
    collectible.Material = Enum.Material.Neon
    collectible.Parent = workspace
    
    local billboardGui = Instance.new('BillboardGui')
    billboardGui.Size = UDim2.new(4, 0, 4, 0)
    billboardGui.MaxDistance = 50
    billboardGui.Parent = collectible
    
    local textLabel = Instance.new('TextLabel')
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = memeType
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    textLabel.TextSize = 16
    textLabel.Parent = billboardGui
    
    collectible.Touched:Connect(function(hit)
        local humanoid = hit.Parent:FindFirstChild('Humanoid')
        if humanoid then
            print(hit.Parent.Name .. ' collected: ' .. memeType .. ' (+' .. COLLECTIBLE_POINTS .. ' points)')
            collectible:Destroy()
        end
    end)
    
    return collectible
end

local collectiblesFolder = workspace:FindFirstChild('Collectibles') or Instance.new('Folder')
collectiblesFolder.Name = 'Collectibles'
collectiblesFolder.Parent = workspace

if #collectiblesFolder:GetChildren() == 0 then
    for i = 1, 10 do
        local randomX = math.random(-100, 200)
        local randomZ = math.random(-100, 200)
        local randomMeme = MEME_NAMES[math.random(1, #MEME_NAMES)]
        createCollectible(Vector3.new(randomX, 5, randomZ), randomMeme)
    end
end

print('Collectibles Script Loaded')
