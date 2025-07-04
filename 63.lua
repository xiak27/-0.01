local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local success, response = pcall(function()
    return HttpService:GetAsync("https://pastebin.com/raw/n2y94cnE")
end)

if success then
    local whitelist = {}
    for name in string.gmatch(response, "[^\r\n]+") do
        table.insert(whitelist, name)
    end

    local isWhitelisted = false
    for _, name in ipairs(whitelist) do
        if name == player.Name then
            isWhitelisted = true
            break
        end
    end

    if isWhitelisted then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiak27/637/refs/heads/main/small%20empty%20script.lua"))()
    else
        local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
        local Frame = Instance.new("Frame", ScreenGui)
        Frame.Size = UDim2.new(0, 300, 0, 150)
        Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

        local TextLabel = Instance.new("TextLabel", Frame)
        TextLabel.Size = UDim2.new(1, 0, 1, 0)
        TextLabel.Text = "你不在白名单中，无法执行脚本！"
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextScaled = true
        TextLabel.BackgroundTransparency = 1
    end
end
