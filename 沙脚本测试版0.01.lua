loadstring(game:HttpGet("https://pastebin.com/raw/9fFu43FF"))()

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "纯缝合"; Text ="纯缝合"; Duration = 4; })

local CoreGui = game:GetService("StarterGui")

CoreGui:SetCore("SendNotification", {
    Title = "沙脚本测试版0.01",
    Text = "正在加载（反挂机已开启）",
    Duration = 5, 
})
print("反挂机开启")
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)
local OrionLib = loadstring(game:HttpGet('https://pastebin.com/raw/iXGNieAz'))()
local Window = OrionLib:MakeWindow({Name ="黄某脚本测试版0.01", HidePremium = false, SaveConfig = true,IntroText = "黄某脚本测试版0.01", ConfigFolder = "黄某脚本测试版0.01"})

local Tab = Window:MakeTab({
    Name = "无",
    Icon = "rbxassetid://7734068321",
    PremiumOnly = false
})

Tab:AddParagraph("沙测试版0.01")
Tab:AddParagraph("阿尔宙斯注入器可能用不了")
Tab:AddParagraph("作者roblox id:114514lzkill")
Tab:AddParagraph("作者QQ3957336350")
Tab:AddParagraph("Q群1026924908")

local Tab = Window:MakeTab({
	Name = "设置",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("用户名:"," "..game.Players.LocalPlayer.Name.."")
Tab:AddParagraph("注入器:"," "..identifyexecutor().."")
Tab:AddParagraph("服务器的ID"," "..game.GameId.."")

Tab:AddButton({
	Name = "开启玩家进出服务器提示",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
  	end
})

Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end
})

Tab:AddTextbox({
	Name = "移动速度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end
})

Tab:AddTextbox({
	Name = "自定义头部大小",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)		game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.Head.Transparency = 1
v.Character.Head.BrickColor = BrickColor.new("Red")
v.Character.Head.Material = "Neon"
v.Character.Head.CanCollide = false
v.Character.Head.Massless = true
end)
end
end
end
end)    
	end
})

Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
	end
})

Tab:AddTextbox({
	Name = "超广角设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		Workspace.CurrentCamera.FieldOfView = Value
	end
})

Tab:AddTextbox({
	Name = "最大视野设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		Workspace.CurrentCamera.FieldOfView = Value
	end
})

Tab:AddTextbox({
	Name = "最小视野设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView = v
	end
})

Tab:AddButton({
  Name = "重新加入服务器",
  Callback = function()
game:GetService("TeleportService"):TeleportToPlaceInstance(
            game.PlaceId,
            game.JobId,
            game:GetService("Players").LocalPlayer
        )
  end
})

Tab:AddButton({
  Name = "离开服务器",
  Callback = function()
     game:Shutdown()
  end
})

Tab:AddButton({
  Name = "帧率显示",
  Callback = function()
 -- Gui to Lua 
 -- Version: 3.2 
  
 -- Instances:
 local ScreenGui = Instance.new("ScreenGui") 
 local FpsLabel = Instance.new("TextLabel")
 
 --Properties:
 
 ScreenGui.Name = "FPSGui" 
 ScreenGui.ResetOnSpawn = false 
 ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 
 FpsLabel.Name = "FPSLabel" 
 FpsLabel.Size = UDim2.new(0, 100, 0, 50) 
 FpsLabel.Position = UDim2.new(0, 10, 0, 10) 
 FpsLabel.BackgroundTransparency = 1 
 FpsLabel.Font = Enum.Font.SourceSansBold 
 FpsLabel.Text = "帧率: 0" 
 FpsLabel.TextSize = 20 
 FpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 FpsLabel.Parent = ScreenGui 
  
 function updateFpsLabel() 
     local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) 
     FpsLabel.Text = "帧率: " .. fps 
 end 
  
  game:GetService("RunService").RenderStepped:Connect(updateFpsLabel) 
  
 ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


 animateCredits()
  end
})

Tab:AddButton({
  Name = "显示时间",
  Callback = function()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S")).."秒"
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
  end
})


Tab:AddButton({
  Name = "重开",
  Callback = function()

game.Players.LocalPlayer.Character.Head:Remove()

  end
})
	Name = "死铁轨",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddParagraph("债券区")

Tab:AddButton({
  Name = "红叶脚本",
  Callback = function()
  loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
  end
})

Tab:AddButton({
  Name = "刷债券(最好用)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Anoonymouss69/ScriptHUB/refs/heads/main/AutoBonds"))()
  end
})

Tab:AddButton({
  Name = "刷债券(中文)",
  Callback = function()
  loadstring(request({Url="https://raw.githubusercontent.com/ShenJiaoBen/Partial-Server-Ribbon/refs/heads/main/自动债券Linninew.lua"}).Body)()
  end
})

Tab:AddButton({
  Name = "刷债券(speed hub)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
  end
})

Tab:AddParagraph("功能区")

Tab:AddButton({
  Name = "无拉回飞行",
  Callback = function()
  loadstring(game:HttpGet("https://rawscripts.net/raw/Dead-Rails-Alpha-FLY-in-Dead-Rails-One-Click-Script-KEYLESS-by-Moondiety-39179"))()
  end
})

Tab:AddButton({
  Name = "近战武器攻速",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/DeadRails/refs/heads/main/V4SWING"))()
  end
})

Tab:AddButton({
  Name = "近战武器攻速(第二类)",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/Dusty/refs/heads/main/NOTV4TRUST"))()
  end
})

Tab:AddButton({
  Name = "传送任何建筑物",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/HeadHarse/Dusty/refs/heads/main/Protected_6376837736278867.txt"))()
  end
})

Tab:AddButton({
  Name = "无限制焊接",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/hbjrev/airweld.github.io/refs/heads/main/RINGTA.lua'))()
  end
})

Tab:AddButton({
  Name = "hub好用的",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Dead-rails/refs/heads/main/Full-GUI'))()
  end
})
Tab:AddParagraph("卡密:ringta")

Tab:AddParagraph("任务类")

Tab:AddButton({
  Name = "僵尸马",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/wehjf/Pestilenceringta.github.io/refs/heads/main/horseringta.lua"))()
  end
})

local Tab = Window:MakeTab({
	Name = "被遗弃",
	Icon = "rbxassetid://7734068321",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "情云",
  Callback = function()
  loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
  
  Tab:AddButton({
  Name = "某某脚本免费版",
  Callback = function()
  loadstring(game:HttpGet"https://raw.githubusercontent.com/OWOWOWWOW/HTT/main/HT.lua")()