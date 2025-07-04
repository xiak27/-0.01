local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local function createFancyUI(message, success)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WhitelistStatusUI"
    screenGui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 150)
    frame.Position = UDim2.new(0.5, -200, 0.5, -75)
    frame.BackgroundColor3 = success and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 12)
    uiCorner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -20, 1, -20)
    label.Position = UDim2.new(0, 10, 0, 10)
    label.BackgroundTransparency = 1
    label.Text = message
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = frame
    
    screenGui.Parent = PlayerGui
    
    task.delay(5, function()
        screenGui:Destroy()
    end)
end

local success, whitelist = pcall(function()
    return HttpService:GetAsync("https://pastebin.com/raw/n2y94cnE")
end)

if success then
    local allowedUsers = {}
    for username in whitelist:gmatch("[^\r\n]+") do
        table.insert(allowedUsers, username)
    end

    local isWhitelisted = false
    for _, username in ipairs(allowedUsers) do
        if LocalPlayer.Name == username then
            isWhitelisted = true
            break
        end
    end

    if isWhitelisted then
        createFancyUI("✅ You are whitelisted! Running script...", true)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiak27/637/refs/heads/main/small%20empty%20script.lua"))()
    else
        createFancyUI("❌ You are not whitelisted!", false)
    end
else
    createFancyUI("⚠️ Failed to fetch whitelist!", false)
end
