--// Roblox ESP 脚本（支持名字、用户名、距离、生命值、好友标记）
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local ESPEnabled = true -- 初始是否开启
local ToggleKey = Enum.KeyCode.RightShift -- 按 RightShift 切换ESP

-- 获取好友
local function isFriend(player)
    local success, result = pcall(function()
        return LocalPlayer:IsFriendsWith(player.UserId)
    end)
    return success and result
end

-- UI 显示函数
local function createESPTag(player)
    local Billboard = Instance.new("BillboardGui")
    Billboard.Name = "ESPTag"
    Billboard.Size = UDim2.new(0, 200, 0, 50)
    Billboard.StudsOffset = Vector3.new(0, 3, 0)
    Billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
    Billboard.AlwaysOnTop = true

    local TextLabel = Instance.new("TextLabel", Billboard)
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.BackgroundTransparency = 1
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextStrokeTransparency = 0.5
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.TextScaled = true
    TextLabel.Name = "ESPText"

    Billboard.Parent = player.Character
end

-- 更新标签内容
local function updateESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local tag = player.Character:FindFirstChild("ESPTag")
            if not tag then
                createESPTag(player)
                tag = player.Character:FindFirstChild("ESPTag")
            end
            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            local health = player.Character:FindFirstChild("Humanoid") and math.floor(player.Character.Humanoid.Health) or "N/A"
            local friendTag = isFriend(player) and "[好友] " or ""
            local text = string.format("%s%s\n@%s\n%.0f 米 | HP: %s", friendTag, player.DisplayName, player.Name, distance, health)
            tag.ESPText.Text = ESPEnabled and text or ""
            tag.Enabled = ESPEnabled
        end
    end
end

-- 每帧刷新
RunService.RenderStepped:Connect(updateESP)

-- 玩家加入时添加
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        wait(1)
        if player ~= LocalPlayer then
            createESPTag(player)
        end
    end)
end)

-- 切换功能开关
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == ToggleKey then
        ESPEnabled = not ESPEnabled
        print("ESP 状态已切换为：" .. (ESPEnabled and "开启" or "关闭"))
    end
end)

-- 初始化已有玩家
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createESPTag(player)
    end
end

print("✅ ESP 启动完成，按 RightShift 可开关")
