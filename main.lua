-- Загружаем OrionLib
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

-- Создаём окно
local Window = OrionLib:MakeWindow({Name = "Poop AutoAlign", HidePremium = false, SaveConfig = false, IntroText = "Poop Balancer"})

-- Переменные
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Создаём вкладку и секцию
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local autoAlignEnabled = false
local connection

-- Кнопка включения/выключения
Tab:AddToggle({
	Name = "Авто-пуп (совпадение с красной зоной)",
	Default = false,
	Callback = function(Value)
		autoAlignEnabled = Value
		if autoAlignEnabled then
			local poopUI = playerGui:WaitForChild("PoopBalancingUI", 5)
			if not poopUI then
				warn("PoopBalancingUI не найден.")
				return
			end

			local success1, sweetSpot = pcall(function()
				return poopUI:WaitForChild("TargetZone"):WaitForChild("SweetSpot")
			end)
			local success2, movingBar = pcall(function()
				return poopUI:WaitForChild("BalancingContainer"):WaitForChild("MovingBar")
			end)

			if not (success1 and sweetSpot) or not (success2 and movingBar) then
				warn("UI элементы не найдены.")
				return
			end

			connection = RunService.RenderStepped:Connect(function()
				movingBar.Position = sweetSpot.Position
			end)
		else
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end
	end
})
