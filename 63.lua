local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local whitelistUrl = "https://pastebin.com/raw/n2y94cnE"
local scriptUrl = "https://raw.githubusercontent.com/xiak27/637/refs/heads/main/small%20empty%20script.lua"

local success, response = pcall(function()
    return HttpService:GetAsync(whitelistUrl)
end)

if success then
    local usernames = {}
    for username in string.gmatch(response, "[^\r\n]+") do
        usernames[#usernames+1] = username
    end

    local inWhitelist = false
    for _, name in pairs(usernames) do
        if player.Name == name then
            inWhitelist = true
            break
        end
    end

    if inWhitelist then
        loadstring(game:HttpGet(scriptUrl))()
    else
        local ScreenGui = Instance.new("ScreenGui")
        ScreenGui.Name = "WhitelistCheckUI"
        ScreenGui.ResetOnSpawn = false
        ScreenGui.Parent = game.CoreGui

        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(0.4, 0, 0.2, 0)
        Frame.Position = UDim2.new(0.3, 0, 0.4, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        Frame.BackgroundTransparency = 0.2
        Frame.BorderSizePixel = 0
        Frame.Parent = ScreenGui

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 12)
        UICorner.Parent = Frame

        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = Color3.fromRGB(0, 255, 255)
        UIStroke.Thickness = 2
        UIStroke.Parent = Frame

        local TextLabel = Instance.new("TextLabel")
        TextLabel.Size = UDim2.new(1, -20, 1, -20)
        TextLabel.Position = UDim2.new(0, 10, 0, 10)
        TextLabel.BackgroundTransparency = 1
        TextLabel.Text = "⚠️ 您未列入到白名单 ⚠️"
        TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
        TextLabel.TextStrokeTransparency = 0.8
        TextLabel.TextScaled = true
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Parent = Frame
    end
else
    warn("无法获取白名单！")
end
