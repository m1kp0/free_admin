-- 5% done
-- server
local plrs = game.Players:GetPlayers()
local plr = game.Players.LocalPlayer

-- toggle
local whitelist_me
local whitelist_friends
local loop_poop_all
local loop_explode_all
local loop_fly_all
local loop_unfly_all
local loop_noclip_all
local loop_clip_all
local loop_ff_all
local loop_unff_all
local loop_kill_all_free
local loop_kill_all_paid

-- functons


-- GUI
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua")))()
local Window = OrionLib:MakeWindow({Name = "m1kp | free admin", HidePremium = false, IntroEnabled = false, IntroText = "Loading..", SaveConfig = true, ConfigFolder = "OrionTest"})

-- tabs
local ChatTab = Window:MakeTab({Name = "character", Icon = "", PremiumOnly = false})
local ServerTab = Window:MakeTab({Name = "server", Icon = "", PremiumOnly = false})

--character tab
CharTab:AddSlider({
    Name = "walk speed",
    Min = 0,
    Max = 100,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 16,
    Callback = function(e)
        plr.Character.Humanoid.WalkSpeed = e
    end
})

CharTab:AddButton({
	Name = "reset walk speed",
	Callback = function()
      	plr.Character.Humanoid.WalkSpeed = 16
  	end    
})

CharTab:AddSlider({
    Name = "jump power",
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 50,
    Callback = function(e)
        plr.Character.Humanoid.JumpPower = e
    end
})

CharTab:AddButton({
	Name = "reset jump power",
	Callback = function()
      	plr.Character.Humanoid.JumpPower = 50
  	end    
})

CharTab:AddToggle({
	Name = "infinite jumps",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		if Value then
			infJump = true
			uis.JumpRequest:Connect(function()
				if infJump then
					plr.Character.Humanoid:ChangeState("Jumping")
				end
			end)
		else
			infJump = false
		end
	end
})

CharTab:AddSlider({
    Name = "gravity",
    Min = 0,
    Max = 1000,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 196,
    Callback = function(e)
        workspace.Gravity = e
    end
})

CharTab:AddButton({
	Name = "reset gravity",
	Callback = function()
      	workspace.Gravity = 196
  	end    
})

CharTab:AddSlider({
    Name = "field of view",
    Min = 1,
    Max = 120,
    Color = Color3.fromRGB(102, 0, 102),
    ValueName = "",
    Increment = 1,
    Default = 70,
    Callback = function(e)
        cam.FieldOfView = e
    end
})

CharTab:AddButton({
	Name = "reset field of view",
	Callback = function()
      	cam.FieldOfView = 70
  	end    
})

-- server tab
ServerTab:AddSection({Name = "whitelist"})

ServerTab:AddToggle({
	Name = "whitelist me",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		 whitelistFriends = Value
	end
})

ServerTab:AddToggle({
	Name = "whitelist friends",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(Value)
		 whitelistFriends = Value
	end
})
