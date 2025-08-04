--// Roblox ESP（名字、用户名、距离、血条、美观配色，支持好友标签）
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESPEnabled = true
local ToggleKey = Enum.KeyCode.RightShift

-- 判断好友
local function isFriend(player)
    local success, result = pcall(function()
        return LocalPlayer:IsFriendsWith(player.UserId)
    end)
    return success and result
end

-- 创建ESP界面
local function createESP(player)
    local hrp = player.Character:WaitForChild("HumanoidRootPart", 5)
    if not hrp then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_UI"
    billboard.Size = UDim2.new(0, 200, 0, 70)
    billboard.Adornee = hrp
    billboard.AlwaysOnTop = true
    billboard.StudsOffset = Vector3.new(0, 3, 0)

    -- 名字 + 好友
    local nameLabel = Instance.new("TextLabel", billboard)
    nameLabel.Size = UDim2.new(1, 0, 0.35, 0)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextScaled = true
    nameLabel.Name = "NameLabel"

    -- 用户名和距离
    local infoLabel = Instance.new("TextLabel", billboard)
    infoLabel.Size = UDim2.new(1, 0, 0.25, 0)
    infoLabel.Position = UDim2.new(0, 0, 0.35, 0)
    infoLabel.BackgroundTransparency = 1
    infoLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
    infoLabel.Font = Enum.Font.Gotham
    infoLabel.TextScaled = true
    infoLabel.Name = "InfoLabel"

    -- 血条背景
    local hpBack = Instance.new("Frame", billboard)
    hpBack.Size = UDim2.new(1, -10, 0.2, 0)
    hpBack.Position = UDim2.new(0, 5, 0.65, 0)
    hpBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    hpBack.BorderSizePixel = 0
    hpBack.Name = "HP_Back"

    -- 血条前景
    local hpBar = Instance.new("Frame", hpBack)
    hpBar.Size = UDim2.new(1, 0, 1, 0)
    hpBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
    hpBar.BorderSizePixel = 0
    hpBar.Name = "HP_Bar"

    billboard.Parent = player.Character
end

-- 更新ESP显示
local function updateESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local tag = player.Character:FindFirstChild("ESP_UI")
            if not tag then
                createESP(player)
                tag = player.Character:FindFirstChild("ESP_UI")
            end
            if not tag then continue end

            local nameLabel = tag:FindFirstChild("NameLabel")
            local infoLabel = tag:FindFirstChild("InfoLabel")
            local hpBack = tag:FindFirstChild("HP_Back")
            local hpBar = hpBack and hpBack:FindFirstChild("HP_Bar")

            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            local humanoid = player.Character:FindFirstChild("Humanoid")
            local health = humanoid and humanoid.Health or 0
            local maxHealth = humanoid and humanoid.MaxHealth or 100
            local percent = math.clamp(health / maxHealth, 0, 1)

            -- 设置文本
            nameLabel.Text = (isFriend(player) and "[好友] " or "") .. player.DisplayName
            infoLabel.Text = string.format("@%s | %.0f米", player.Name, dist)

            -- 设置血条宽度
            if hpBar then
                hpBar.Size = UDim2.new(percent, 0, 1, 0)
                if percent > 0.5 then
                    hpBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
                elseif percent > 0.2 then
                    hpBar.BackgroundColor3 = Color3.fromRGB(255, 180, 0)
                else
                    hpBar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                end
            end

            tag.Enabled = ESPEnabled
        end
    end
end

-- 玩家加入监听
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1)
        if player ~= LocalPlayer then
            createESP(player)
        end
    end)
end)

-- 初始已有玩家
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createESP(player)
    end
end

-- 每帧刷新
RunService.RenderStepped:Connect(updateESP)

-- 切换键绑定
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == ToggleKey then
        ESPEnabled = not ESPEnabled
        print("ESP 状态：" .. (ESPEnabled and "开启" or "关闭"))
    end
end)

print("✅ ESP 脚本已启动，按 RightShift 切换开关")
