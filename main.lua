local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Poop Script", HidePremium = false, SaveConfig = true, ConfigFolder = "PoopScriptCFG"})

local AutoTab = Window:MakeTab({
	Name = "Automatic",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false

function poop
      print(1)
    end

Tab:AddToggle({
	Name = "Auto Poop",
	Default = false,
	Callback = function(poop)
		print(1)
	end    
})
