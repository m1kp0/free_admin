-- 10% of the script is completed
-- script
print("[m1kp]: loading main")
local plrs = game.Players
local plr = plrs.LocalPlayer
local cam = workspace.Camera
local uis = game:GetService("UserInputService")

-- toggle
local whitelist_me
local whitelist_friends
local chat_command
local loop_poop_all
local loop_explode_all
local loop_fly_all
local loop_unfly_all
local loop_noclip_all
local loop_clip_all
local loop_ff_all
local loop_unff_all
local loop_kill_all

-- functions
local function cmd(cmd, chat)
    local getplrs = plrs:GetPlayers()
    if chat then game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(":poop all") end
    for i, p in pairs(getplrs) do
        if p.Name ~= plr.Name then plrs:Chat(""..cmd.." "..p.Name.."") task.wait(0.01) end
    end
end

print("[m1kp]: loaded main")
print("[m1kp]: loading gui")

-- GUI
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/m1kp0/libraries/refs/heads/main/m1kpe0_orion_lib.lua")))()
local Window = OrionLib:MakeWindow({Name = "m1kp | free admin", HidePremium = false, IntroEnabled = false, IntroText = "Loading..", SaveConfig = true, ConfigFolder = "OrionTest"})

print("[m1kp]: loaded gui")
print("[m1kp]: loading script")

-- tabs
local CharTab = Window:MakeTab({Name = "character", Icon = "", PremiumOnly = false})
local ServerTab = Window:MakeTab({Name = "server", Icon = "", PremiumOnly = false})

--character tab
CharTab:AddSlider({
    Name = "walk speed",
    Min = 0,
    Max = 100,
    Color = Color3.fromRGB(102, 0, 102),
    eName = "",
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
    eName = "",
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
	Callback = function(e)
		if e then
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
    eName = "",
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
    eName = "",
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
	Callback = function(e)
        whitelist_me = e
	end
})

ServerTab:AddToggle({
	Name = "whitelist friends",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        whitelist_friends = e
	end
})

ServerTab:AddToggle({
	Name = "chat",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        chat_command = e
	end
})

ServerTab:AddSection({Name = "poop"})

ServerTab:AddButton({
	Name = "poop all",
	Callback = function()
        cmd(":poop", chat_command)
    end    
})

ServerTab:AddToggle({
	Name = "loop poop all",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        loop_poop_all = e
        while loop_poop_all do cmd(":poop", chat_command) task.wait(13) end
	end
})

ServerTab:AddSection({Name = "explode"})

ServerTab:AddButton({
	Name = "explode all",
	Callback = function()
        cmd(":explode", chat_command)
    end    
})

ServerTab:AddToggle({
	Name = "loop explode all",
	Default = false,
	Color = Color3.fromRGB(102, 0, 102),
	Callback = function(e)
        loop_explode_all = e
        while loop_explode_all do cmd(":explode", chat_command) task.wait(5) end
	end
})

ServerTab:AddSection({Name = "force field"})
ServerTab:AddSection({Name = "fly"})
ServerTab:AddSection({Name = "noclip"})
ServerTab:AddSection({Name = "kill"})

print("[m1kp]: loaded script")
