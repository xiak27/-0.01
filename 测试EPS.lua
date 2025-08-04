-- Roblox ESP 脚本（增强稳定性）
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local ESPEnabled = true
local ToggleKey = Enum.KeyCode.RightShift

-- 等待角色加载
if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
    LocalPlayer.CharacterAdded:Wait()
end

-- 检查是否为好友
local function isFriend(player)
    local success, result = pcall(function()
        return LocalPlayer:IsFriendsWith(player.UserId)
    end)
    return success and result
end

-- 创建 ESP 界面
local function createESP(player)
    local success, _ = pcall(function()
        local hrp = player.Character:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end

        if player.Character:FindFirstChild("ESP_UI") then return end

        local gui = Instance.new("BillboardGui")
        gui.Name = "ESP_UI"
        gui.Adornee = hrp
        gui.AlwaysOnTop = true
        gui.Size = UDim2.new(0, 250, 0, 100)
        gui.StudsOffset = Vector3.new(0, 3, 0)

        local bg = Instance.new("Frame", gui)
        bg.Name = "BG"
        bg.Size = UDim2.new(1, 0, 1, 0)
        bg.BackgroundColor3 = Color3.fromRGB(20, 40, 80)
        bg.BackgroundTransparency = 0.4
        bg.BorderSizePixel = 0

        Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 6)
        local stroke = Instance.new("UIStroke", bg)
        stroke.Thickness = 2
        stroke.Color = Color3.fromRGB(0, 170, 255)
        stroke.Transparency = 0.3

        local infoLabel = Instance.new("TextLabel", bg)
        infoLabel.Name = "InfoLabel"
        infoLabel.Size = UDim2.new(1, -10, 1, -10)
        infoLabel.Position = UDim2.new(0, 5, 0, 5)
        infoLabel.BackgroundTransparency = 1
        infoLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
        infoLabel.TextStrokeTransparency = 0.6
        infoLabel.Font = Enum.Font.GothamMono
        infoLabel.TextScaled = true
        infoLabel.TextXAlignment = Enum.TextXAlignment.Left
        infoLabel.TextYAlignment = Enum.TextYAlignment.Top
        infoLabel.TextWrapped = true

        local hpBG = Instance.new("Frame", gui)
        hpBG.Name = "HP_Back"
        hpBG.Size = UDim2.new(0, 8, 1, 0)
        hpBG.Position = UDim2.new(0, -12, 0, 0)
        hpBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        hpBG.BorderSizePixel = 0

        local hpBar = Instance.new("Frame", hpBG)
        hpBar.Name = "HP_Bar"
        hpBar.AnchorPoint = Vector2.new(0, 1)
        hpBar.Position = UDim2.new(0, 0, 1, 0)
        hpBar.Size = UDim2.new(1, 0, 1, 0)
        hpBar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        hpBar.BorderSizePixel = 0

        gui.Parent = player.Character
    end)
end

-- 更新 ESP 显示
local function updateESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local tag = player.Character:FindFirstChild("ESP_UI")
            if not tag then
                createESP(player)
                tag = player.Character:FindFirstChild("ESP_UI")
            end
            if not tag then continue end

            local humanoid = player.Character:FindFirstChild("Humanoid")
            local health = humanoid and humanoid.Health or 0
            local maxHealth = humanoid and humanoid.MaxHealth or 100
            local percent = math.clamp(health / maxHealth, 0, 1)
            local healthPercent = math.floor(percent * 100)
            local dist = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

            local info = tag.BG:FindFirstChild("InfoLabel")
            if info then
                info.Text = string.format(
                    "[角色:%s]\n[账号:%s]\n[距离:%.0f米]\n[生命:%d%%]",
                    player.DisplayName,
                    player.Name,
                    dist,
                    healthPercent
                )
            end

            local bar = tag:FindFirstChild("HP_Back") and tag.HP_Back:FindFirstChild("HP_Bar")
            if bar then
                bar.Size = UDim2.new(1, 0, percent, 0)
                if percent > 0.6 then
                    bar.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
                elseif percent > 0.3 then
                    bar.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
                else
                    bar.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                end
            end

            tag.Enabled = ESPEnabled
        end
    end
end

-- 初始化已有玩家
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer and player.Character then
        createESP(player)
    end
end

-- 玩家加入监听
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(1.5)
        createESP(player)
    end)
end)

-- 每帧刷新
RunService.RenderStepped:Connect(updateESP)

-- 切换按键
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == ToggleKey then
        ESPEnabled = not ESPEnabled
        print("📡 ESP 状态：" .. (ESPEnabled and "✅ 开启" or "❌ 关闭"))
    end
end)

print("✅ ESP 已启动！RightShift 开关")
