--[[ please do not edit this or copy this, thanks! ]]--

local SECRETEDITION = false

local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

local currentEntity = "None"

local libraryFigureSpawned = false
local escapeFigureSpawned = false

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local correctKey = loadstring(game:HttpGet("https://raw.githubusercontent.com/coolusername17563245/coolrepo2/main/coolscript"))()

local keyInputTable = {
	InputtedKey = ""
}

local keyWindow = OrionLib:MakeWindow({Name = "Lunar AI // DOORS // Key System ", HidePremium = true, IntroEnabled = true, IntroText = "Lunar AI // DOORS // Key System"})

local keyTab = keyWindow:MakeTab({
	Name = "Key System",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local keyFileName = "LunarAIKey.txt"

local function loadKeyInput()
	print("Lunar AI // Loading key input...")
	
	local HttpService = game:GetService("HttpService")
	
	if (readfile and isfile) then
		if isfile(keyFileName) then
			keyInputTable = HttpService:JSONDecode(readfile(keyFileName))
		
			print("Lunar AI // Key System // Loaded key: " .. keyInputTable.InputtedKey)
			
			if keyInputTable.InputtedKey == correctKey then
				OrionLib:MakeNotification({
					Name = "Lunar AI // Key System",
					Content = "Correct key!",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			else
				OrionLib:MakeNotification({
					Name = "Lunar AI // Key System",
					Content = "Invalid key!",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			end
		end
	else
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Your key could not be loaded due to your executor not having the readfile()/isfile() function. Please use another executor if you would like your key to be loaded.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
end

local function saveKeyInput()
	print("Lunar AI // Saving key input...")
	local json
	local HttpService = game:GetService("HttpService")
	
	if (writefile) then
		json = HttpService:JSONEncode(keyInputTable)
		writefile(keyFileName, json)
	else
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Your key could not be saved due to your executor not having the writefile() function. Please use another executor if you would like your key to be saved.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
end

keyTab:AddButton({
	Name = "Get Key (DISCORD SERVER)",
	Callback = function()
		setclipboard("https://discord.gg/shcdVcSsQx")
			
		OrionLib:MakeNotification({
			Name = "Lunar AI // Key System",
			Content = "Copied discord invite!",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
	end
})

keyTab:AddTextbox({
	Name = "Input Key",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		keyInputTable.InputtedKey = Value
	end	  
})

keyTab:AddButton({
	Name = "Submit Key",
	Callback = function()
		if keyInputTable.InputtedKey == correctKey then
			saveKeyInput()
			
			OrionLib:MakeNotification({
				Name = "Lunar AI // Key System",
				Content = "Correct key!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		else
			OrionLib:MakeNotification({
				Name = "Lunar AI // Key System",
				Content = "Invalid key!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		end	
	end
})

loadKeyInput()

while wait() do
	if keyInputTable.InputtedKey == correctKey then
		wait(0.5)
		OrionLib:Destroy()
		break
	end
end

--[[

	Lunar AI 0.3.8 Beta // Made by probablYnicK

]]--

local aiVersion = "0.3.8 "

local function getPlayerID()
    return game.Players.LocalPlayer.UserId
end

local playerID = getPlayerID()

local earlyAccess = {
    3648276896, --UndefinedVoid_0
    243999341, --IndyKien
    269521613, --BestDanTDM_FAN1
    1472117103, --Urbanwarrior667
    1511262630, --Maus773
    3974907880, --calamitydclelek [ Maus773 ALT ]
}

local lighting = game:GetService("Lighting")

local normalLightingSettings = {
	Brightness = lighting.Brightness,
	ClockTime = lighting.ClockTime,
	FogEnd = lighting.FogEnd,
	GlobalShadows = lighting.GlobalShadows,
	Ambient = lighting.Ambient
}

local preAlphaTester = 2200660682

if playerID == 1038671897 then
    aiVersion = aiVersion .. "Developer Edition"
elseif table.find(earlyAccess, playerID) then
    aiVersion = aiVersion .. "Early Access"
elseif playerID == preAlphaTester then
    aiVersion = aiVersion .. "Pre-Alpha Tester Edition"
else
    aiVersion = aiVersion .. "Public Beta"
end

local lunarFolder = Instance.new("Folder", game.ReplicatedStorage)
lunarFolder.Name = "LunarValues"

local fullAI = Instance.new("BoolValue", lunarFolder)
fullAI.Name = "FullAI"
fullAI.Value = false

local HeadlightEnabledLunar = Instance.new("BoolValue", lunarFolder)
HeadlightEnabledLunar.Name = "HeadlightEnabled"
HeadlightEnabledLunar.Value = true

local HeadlightBrightnessLunar = Instance.new("NumberValue", lunarFolder)
HeadlightEnabledLunar.Name = "HeadlightBrightness"
HeadlightEnabledLunar.Value = 0.25

local key = Instance.new("StringValue", lunarFolder)
key.Name = "SprintKeybind"
key.Value = "Q"

local skipKey = Instance.new("StringValue", lunarFolder)
skipKey.Name = "SkipKeybind"
skipKey.Value = "R"

local tpKeyKey = Instance.new("StringValue", lunarFolder)
tpKeyKey.Name = "TPKeyKeybind"
tpKeyKey.Value = "T"

local fullAIKey = Instance.new("StringValue", lunarFolder)
fullAIKey.Name = "FullAIKeybind"
fullAIKey.Value = "G"

local hideKey = Instance.new("StringValue", lunarFolder)
hideKey.Name = "HideKeybind"
hideKey.Value = "H"

local completeLibraryKey = Instance.new("StringValue", lunarFolder)
completeLibraryKey.Name = "CompleteLibraryKeybind"
completeLibraryKey.Value = "B"

local healthKey = Instance.new("StringValue", lunarFolder)
healthKey.Name = "CheckHealthKeybind"
healthKey.Value = "V"

local fbKey = Instance.new("StringValue", lunarFolder)
fbKey.Name = "FullbrightKeybind"
fbKey.Value = "F"

local tipsEnabled = true

--[[ Entity Info GUI ]]--

local LunarUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local EntityInfo = Instance.new("Frame")
local EntityImage = Instance.new("ImageLabel")
local EntityName = Instance.new("TextLabel")
--[TEMPORARILY REMOVED] local EntityDistance = Instance.new("TextLabel")
local NextChase = Instance.new("TextLabel")
local RoomNumber = Instance.new("TextLabel")
local MusicInfo = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SongName = Instance.new("TextLabel")
local song = Instance.new("Sound")

LunarUI.Name = "LunarUI"
LunarUI.Parent = game.CoreGui
LunarUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = LunarUI
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 1.000
MainFrame.Size = UDim2.new(1, 0, 1, 0)

EntityInfo.Name = "EntityInfo"
EntityInfo.Parent = MainFrame
EntityInfo.AnchorPoint = Vector2.new(1, 1)
EntityInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityInfo.BackgroundTransparency = 1.000
EntityInfo.Position = UDim2.new(1, 0, 1, 0)
EntityInfo.Size = UDim2.new(0, 200, 0, 150)

EntityImage.Name = "EntityImage"
EntityImage.Parent = EntityInfo
EntityImage.AnchorPoint = Vector2.new(1, 1)
EntityImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityImage.BackgroundTransparency = 1.000
EntityImage.Position = UDim2.new(1, 0, 1, 0)
EntityImage.Size = UDim2.new(0, 100, 0, 100)
EntityImage.Image = "rbxassetid://403653614"
EntityImage.ScaleType = Enum.ScaleType.Fit

EntityName.Name = "EntityName"
EntityName.Parent = EntityInfo
EntityName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EntityName.BackgroundTransparency = 1.000
EntityName.Position = UDim2.new(0.5, 0, 0.166666672, 0)
EntityName.Size = UDim2.new(0.5, 0, -0.166666672, 50)
EntityName.Font = Enum.Font.Oswald
EntityName.Text = "N/A"
EntityName.TextColor3 = Color3.fromRGB(235, 218, 148)
EntityName.TextSize = 30.000

--[[
    TEMPORARILY REMOVED

    EntityDistance.Name = "EntityDistance"
    EntityDistance.Parent = EntityInfo
    EntityDistance.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    EntityDistance.BackgroundTransparency = 1.000
    EntityDistance.Position = UDim2.new(0.5, 0, 0.0733333305, 0)
    EntityDistance.Size = UDim2.new(0.5, 0, -0.239999995, 50)
    EntityDistance.Font = Enum.Font.Oswald
    EntityDistance.Text = "N/A studs away"
    EntityDistance.TextColor3 = Color3.fromRGB(235, 218, 148)
    EntityDistance.TextSize = 15.000
    EntityDistance.TextWrapped = true
]]--

NextChase.Name = "NextChase"
NextChase.Parent = EntityInfo
NextChase.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NextChase.BackgroundTransparency = 1.000
NextChase.Position = UDim2.new(0, 0, 0.673333347, 0)
NextChase.Size = UDim2.new(0.5, 0, -0.25999999, 50)
NextChase.Font = Enum.Font.Oswald
NextChase.Text = "Next Chase:"
NextChase.TextColor3 = Color3.fromRGB(235, 218, 148)
NextChase.TextSize = 20.000

RoomNumber.Name = "RoomNumber"
RoomNumber.Parent = EntityInfo
RoomNumber.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RoomNumber.BackgroundTransparency = 1.000
RoomNumber.Position = UDim2.new(0, 0, 0.746666729, 0)
RoomNumber.Size = UDim2.new(0.5, 0, -0.166666672, 50)
RoomNumber.Font = Enum.Font.Oswald
RoomNumber.Text = game:GetService("ReplicatedStorage"):WaitForChild("GameData"):WaitForChild("ChaseStart").Value
RoomNumber.TextColor3 = Color3.fromRGB(235, 218, 148)
RoomNumber.TextSize = 30.000

MusicInfo.Name = "MusicInfo"
MusicInfo.Parent = LunarUI
MusicInfo.AnchorPoint = Vector2.new(1, 1)
MusicInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MusicInfo.BackgroundTransparency = 1.000
MusicInfo.Position = UDim2.new(1, 0, 0.74727273, 0)
MusicInfo.Size = UDim2.new(0, 200, 0, 66)

Title.Name = "Title"
Title.Parent = MusicInfo
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 200, 0, 35)
Title.Font = Enum.Font.Oswald
Title.Text = "Currently Playing: "
Title.TextColor3 = Color3.fromRGB(235, 218, 148)
Title.TextSize = 25.000

SongName.Name = "SongName"
SongName.Parent = MusicInfo
SongName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SongName.BackgroundTransparency = 1.000
SongName.Position = UDim2.new(0, 0, 0, 25)
SongName.Size = UDim2.new(0, 200, 0, 41)
SongName.Font = Enum.Font.Oswald
SongName.Text = "None"
SongName.TextColor3 = Color3.fromRGB(235, 218, 148)
SongName.TextSize = 20.000
SongName.TextWrapped = true

song.Parent = MusicInfo
song.Name = "LunarSong"
song.SoundId = 0
song.Looped = false
song.Volume = 1


local notificationSoundLunar = Instance.new("Sound", game.CoreGui)
notificationSoundLunar.Name = "LunarNotificationSound"
notificationSoundLunar.SoundId = "rbxassetid://5568992074"
notificationSoundLunar.Volume = 1

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- [[ End ]] --

local function FindFirstDescendant(name, ancestor)
    for i, obj in pairs(ancestor:GetDescendants()) do
        if obj.Name == name  then
            if obj:IsA("MeshPart") or obj:IsA("BasePart") or obj:IsA("Part") or obj:IsA("Model") then
                if obj:IsA("Model") then
                    try = obj:FindFirstChildWhichIsA("Part")

                    if try then return try end

                    try = obj:FindFirstChildWhichIsA("MeshPart")

                    if try then return try end

                    try = obj:FindFirstChildWhichIsA("BasePart")

                    if try then return try end
                end
                return obj
            end
        end
    end

    return nil
end

local function getEntity(name)
	local try = FindFirstDescendant(name .. "Ragdoll", game.Workspace)

	if try then return try end
	
	try = FindFirstDescendant(name, game.Workspace)

	if try then return try end

	try = FindFirstDescendant(name .. "Moving", game.Workspace)

	if try then return try end

	if name == "Halt" then
		try = FindFirstDescendant("Shade", game.Workspace)
    elseif name == "Eyes" then
        try = game:GetService("Workspace"):FindFirstChild("Lookman")
	end

	if try then return try end

	return nil
end

local function getEntityAction(entityName)
	if entityName == "Rush" then
		return "Hide"
	elseif entityName == "Ambush" then
		return "Hide"
	elseif entityName == "Seek" then
		return "Run"
	elseif entityName == "Figure" then
		return "Quiet"
	elseif entityName == "Halt" then
		return "Run"
	elseif entityName == "Eyes" then
		return "Look away"
	elseif entityName == "Screech" then
		return "Stare him down"
	end

	return "Hide"
end

local function returnDefinedMessage(msg, entityName, prediction)
	local returnMsg = string.gsub(msg, "{action}", getEntityAction(entityName))

	if entityName then
        returnMsg = string.gsub(returnMsg, "{entity}", entityName)
    end

	if ChaseStart.Value > 99 then
        returnMsg = string.gsub(returnMsg, "{roomsUntilEntity}", "100")
    else
        returnMsg = string.gsub(returnMsg, "{roomsUntilEntity}", tostring(ChaseStart.Value - LatestRoom.Value))
    end

	returnMsg = string.gsub(returnMsg, "{nextEntityRoom}", tostring(ChaseStart.Value))

	if prediction then
        returnMsg = string.gsub(returnMsg, "{prediction}", prediction)
    end

	return returnMsg
end

local incomingEntityMsg = "Careful! An entity will spawn in {roomsUntilEntity} rooms! (Room {nextEntityRoom})"
local entityIncomingInNextRoomMsg = "Careful! An entity will spawn in the next room! (Room {nextEntityRoom})"

local nextCommandMsg = "The next entity will spawn in Room {nextEntityRoom}."
local predictCommandMsg = "Predicted Entity: {prediction}"

local libraryMsg = "Shh! Figure spawned! Good luck, you're halfway there!"
local facilityMsg = "Shh! Figure spawned! Good luck, you're in the final room!"

local entitySpawnedMsg = "{action}! {entity} has spawned!"

local fbEnabled = false

local function notifyUser(title, text, overriddenTime, playSound)
    local notificationTitle = "Notification"
    local notificationText = "Notification Text"
    local notificationTime = 5
    local notificationSound = false

    if title then
        notificationTitle = title
    end

    if text then
        notificationText = text
    end

    if overriddenTime then
        notificationTime = overriddenTime
    end

    if playSound then
        notificationSound = playSound
    end

	if playSound then
        notificationSoundLunar:Play()
        OrionLib:MakeNotification({
            Name = notificationTitle,
            Content = notificationText,
            Image = "rbxassetid://4483345998",
            Time = notificationTime
        })
    else
        OrionLib:MakeNotification({
            Name = notificationTitle,
            Content = notificationText,
            Image = "rbxassetid://4483345998",
            Time = notificationTime
        })
    end
end

notifyUser("Loading GUI...", "Loading GUI!")

local mainWindow = OrionLib:MakeWindow({Name = "Lunar AI // DOORS // Version " .. aiVersion, HidePremium = true, SaveConfig = true, ConfigFolder = "LunarAIConfigs", IntroEnabled = true, IntroText = "Lunar AI // DOORS // Version " .. aiVersion})

local lunarTab = mainWindow:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local messagesTab = mainWindow:MakeTab({
	Name = "Messages",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local keybindsTab = mainWindow:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local summonTab = mainWindow:MakeTab({
	Name = "Summon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local miscTab = mainWindow:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

lunarTab:AddToggle({
    Name = "Headlight",
    Default = true,
    Save = true,
    Flag = "HeadlightEnabled",
    Callback = function(value)
        HeadlightEnabledLunar.Value = value
    end
})

lunarTab:AddSlider({
	Name = "Headlight Brightness",
	Min = 0,
	Max = 10,
	Default = 0.1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "HeadlightBrightness",
    Save = true,
	Callback = function(Value)
		HeadlightBrightnessLunar.Value = Value
	end
})

lunarTab:AddSlider({
	Name = "FullBright Intensity",
	Min = 0.1,
	Max = 10,
	Default = 5,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "FullbrightIntensity",
    Save = true,
	Callback = function(Value)
		
	end
})

lunarTab:AddToggle({
	Name = "Tips",
	Default = true,
	Flag = "LunarTipsEnabled",
    Save = true,
    Callback = function(value)
        tipsEnabled = value
    end
})

lunarTab:AddSlider({
	Name = "Sprint Speed",
	Min = 0,
	Max = 100,
	Default = 50,
	Color = Color3.fromRGB(170,221,255),
	Increment = 1,
	ValueName = "studs/second",
    Flag = "SprintSpeedLunar",
    Save = true,
	Callback = function(Value)
		print("Sprint Speed set to " .. Value)
	end
})

lunarTab:AddSlider({
	Name = "Avoid Rush/Ambush Height",
	Min = 20,
	Max = 150,
	Default = 60,
	Color = Color3.fromRGB(170,221,255),
	Increment = 1,
	ValueName = "studs high",
    Flag = "AvoidHeightLunar",
    Save = true,
	Callback = function(Value)
		print("Avoid Height set to " .. Value)
	end
})

lunarTab:AddToggle({
	Name = "Skip Seek Chases",
	Default = false,
	Flag = "SkipSeekLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Remove Seek Obstructions",
	Default = false,
	Flag = "RemoveObstructionsLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Avoid Rush/Ambush",
	Default = false,
	Flag = "AutoHideLunar",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Secret Edition",
	Default = false,
	Flag = "SecretEditionLunar",
    Save = true,
    Callback = function(value)
        SECRETEDITION = value
        
        wait(0.01)

        if SECRETEDITION == false then
            notifyUser("Lunar AI", "Secret Edition was disabled!")
        elseif SECRETEDITION == true then
            notifyUser("Lunar AI", "Secret Edition was enabled!")
        end
    end
})

lunarTab:AddToggle({
	Name = "Remove Useless Assets",
	Default = false,
	Flag = "RemoveAssets",
    Save = true,
    Callback = function(value)
        
    end
})

lunarTab:AddToggle({
	Name = "Auto-Open Drawers",
	Default = false,
	Flag = "AutoDrawersLunar",
    Save = true,
    Callback = function(value)
        
    end
})

game:GetService("ProximityPromptService").PromptShown:Connect(function(prompt)
	if OrionLib.Flags["AutoDrawersLunar"].Value == true and prompt.Name == "ActivateEventPrompt" and prompt.Parent.Name == "Knobs" then
		fireproximityprompt(prompt, 0)
	end
end)

lunarTab:AddButton({
	Name = "Complete Elevator Breaker Box Minigame",
	Callback = function()
        game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
  	end    
})

lunarTab:AddButton({
	Name = "Remove Jumpscares",
	Callback = function()
        pcall(function()
            game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
            
            notifyUser("Success!", "Successfully removed jumpscares!")
        end)
  	end    
})

-- [[ KEYBINDS ]] --

keybindsTab:AddBind({
	Name = "Skip Room",
	Default = Enum.KeyCode.R,
	Hold = false,
    Flag = "SkipRoomKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        skipKey.Value = OrionLib.Flags["SkipRoomKeybind"].Value
        print("Skip Keybind is now: " .. tostring(skipKey.Value))
	end,
})

keybindsTab:AddBind({
	Name = "Teleport to Key",
	Default = Enum.KeyCode.T,
	Hold = false,
    Flag = "TpKeyKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        tpKeyKey.Value = OrionLib.Flags["TpKeyKeybind"].Value
        print("Teleport To Key Keybind is now: " .. tostring(tpKeyKey.Value))
	end,
})

keybindsTab:AddBind({
	Name = "Full AI",
	Default = Enum.KeyCode.G,
	Hold = false,
    Flag = "FullAIKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        fullAIKey.Value = OrionLib.Flags["FullAIKeybind"].Value
        print("Full AI Keybind is now: " .. tostring(fullAIKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Sprint",
	Default = Enum.KeyCode.Q,
	Hold = false,
    Flag = "SprintKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        key.Value = OrionLib.Flags["SprintKeybind"].Value
        print("Sprint Keybind is now: " .. tostring(key.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Hide",
	Default = Enum.KeyCode.H,
	Hold = false,
    Flag = "HideKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        hideKey.Value = OrionLib.Flags["HideKeybind"].Value
        print("Hide Keybind is now: " .. tostring(hideKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Complete Library",
	Default = Enum.KeyCode.B,
	Hold = false,
    Flag = "LibraryKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        completeLibraryKey.Value = OrionLib.Flags["LibraryKeybind"].Value
        print("Complete Library Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Check Health",
	Default = Enum.KeyCode.V,
	Hold = false,
    Flag = "HealthKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        healthKey.Value = OrionLib.Flags["HealthKeybind"].Value
        print("Check Health Keybind is now: " .. tostring(healthKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "FullBright",
	Default = Enum.KeyCode.F,
	Hold = false,
    Flag = "FullbrightKeybind",
    Save = true,
	Callback = function()
        fbKey.Value = OrionLib.Flags["FullbrightKeybind"].Value
        print("FullBright Keybind is now: " .. tostring(fbKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Pause Music",
	Default = Enum.KeyCode.K,
	Hold = false,
    Flag = "PauseKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Pause Music Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Stop Music",
	Default = Enum.KeyCode.P,
	Hold = false,
    Flag = "StopKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Stop Music Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

keybindsTab:AddBind({
	Name = "Play Selected Song",
	Default = Enum.KeyCode.O,
	Hold = false,
    Flag = "PlayKeybind",
    Save = true,
	Callback = function()
        wait(0.5)
        print("Play Selected Song Keybind is now: " .. tostring(completeLibraryKey.Value))
	end,    
})

messagesTab:AddParagraph("Messages", "Use variables {action}, {entity}, {roomsUntilEntity}, {nextEntityRoom}, and {prediction} for easier reference.")

messagesTab:AddTextbox({
	Name = "Entity Soon Message",
	Default = incomingEntityMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		incomingEntityMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Entity In Next Room Message",
	Default = entityIncomingInNextRoomMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		entityIncomingInNextRoomMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Entity Spawned Message",
	Default = entitySpawnedMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		entitySpawnedMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "/next Message",
	Default = nextCommandMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		nextCommandMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "/predict Message",
	Default = predictCommandMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		predictCommandMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Library Message",
	Default = libraryMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		libraryMsg = Value
	end	  
})

messagesTab:AddTextbox({
	Name = "Facility Message",
	Default = facilityMsg,
	TextDisappear = false,
    Save = true,
	Callback = function(Value)
		facilityMsg = Value
	end	  
})

local function playSong(songToPlayID)
    if songToPlayID == "STOP" then
        song:Stop()
        song.Playing = false
        song.SoundId = ""
    end

    song.SoundId = songToPlayID

    song:Play()
end

local function playMusic(songValue)
    if songValue == "None" then
        playSong("STOP")
    end

    if songValue == "Elevator Jam" then
        playSong("rbxassetid://7249833877")
    end

    if songValue == "Dawn of The Doors" then
        playSong("rbxassetid://7767530145")
    end

    if songValue == "Here I Come" then
        playSong("rbxassetid://9932603531")
    end

    if songValue == "Unhinged" then
        playSong("rbxassetid://10470707502")
    end

    if songValue == "Guiding Light" then
        playSong("rbxassetid://10460221938")
    end

    if songValue == "Rock Bottom" then
        playSong("rbxassetid://8474472363")
    end
end

local musicSongDropdown = miscTab:AddDropdown({
	Name = "Song",
	Default = "None",
	Options = {"None", "Elevator Jam", "Dawn of The Doors", "Guiding Light", "Here I Come", "Unhinged", "Rock Bottom"},
    Flag = "CurrentSongLunar",
	Callback = function(songValue)
		SongName.Text = songValue

        playMusic(songValue)
        
        notifyUser("Now Playing", songValue)
	end,    
})

miscTab:AddSlider({
	Name = "Music Volume",
	Min = 0,
	Max = 10,
	Default = 1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.1,
	ValueName = "",
    Flag = "MusicVolumeLunar",
    Save = true,
	Callback = function(Value)
		song.Volume = Value
	end
})

miscTab:AddSlider({
	Name = "Music Playback Speed",
	Min = 0.1,
	Max = 2,
	Default = 1,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.01,
	ValueName = "playback speed",
    Flag = "PlaybackSpeedLunar",
    Save = true,
	Callback = function(Value)
		song.PlaybackSpeed = Value
	end
})

miscTab:AddToggle({
	Name = "Music Looped",
	Default = false,
	Flag = "LunarMusicLooped",
    Save = true,
    Callback = function(value)
        song.Looped = value

        notifyUser("Music", "Toggled looping!")
    end
})

miscTab:AddButton({
	Name = "Reset/Spectate",
	Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
  	end    
})

--[[ SUMMON ENTITIES ]]--

local initiator = game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game

local summonSection = summonTab:AddSection({
	Name = "Summon"
})

summonSection:AddParagraph("Notice!", "These entities are spawned only on the client, meaning other players will not have the ability to see or hear these entities. These entities will also not damage you or other players.")

summonSection:AddButton({
	Name = "Summon Screech",
	Callback = function()
		require(game.StarterGui.MainUI.Initiator.Main_Game.RemoteListener.Modules.Screech)(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end,
})

summonSection:AddButton({
	Name = "Summon Halt",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Shade).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end,
})

summonSection:AddButton({
	Name = "Summon Glitch",
	Callback = function()
		require(game.ReplicatedStorage.ClientModules.EntityModules.Glitch).stuff(require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game),
workspace.CurrentRooms[game.Players.LocalPlayer:GetAttribute("CurrentRoom")])
	end,
})

--[[

local function autoScreech(v)
	while wait() do
		if v == true then
			require(initiator.RemoteListener.Modules.Screech)(require(initiator))
			wait(OrionLib.Flags["AutoScreechRate"].Value)
		else
			break
		end
	end
end

local autoSection = summonTab:AddSection({
	Name = "Auto-Summon"
})

autoSection:AddSlider({
	Name = "Auto-Summon Screech Rate",
	Min = 0.01,
	Max = 60,
	Default = 0.5,
	Color = Color3.fromRGB(170,221,255),
	Increment = 0.01,
	ValueName = "second delay",
    Flag = "AutoScreechRate",
    Save = true,
	Callback = function(Value)
		
	end
})

autoSection:AddToggle({
	Name = "Auto-Summon Screech",
	Default = false,
	Flag = "AutoScreech",
    Save = true,
    Callback = function(value)
        autoScreech(Value)
    end
})

]]--

OrionLib:MakeNotification({
	Name = "Loaded GUI!",
	Content = "Loaded Lunar GUI!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

setclipboard("https://discord.gg/shcdVcSsQx")
notifyUser("LunarCrocs", "Join the discord! Copied invite to your clipboard.", 10)

local tipRooms = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100}

local player = game.Players.LocalPlayer

local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom

local function ApplyKeyChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Adornee = inst
    Cham.Enabled = true
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyDoorChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,0,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,0,255)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyLeverChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyFigureChams(inst)
	wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,0,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(255,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyCharChams(char)
    wait()
    
    if char:FindFirstChild("Highlight") then
        char:WaitForChild("Highlight"):Destroy()
    end

    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,255)
    Cham.Parent = char
    Cham.Enabled = true
    Cham.Adornee = char
    Cham.RobloxLocked = true
    return Cham
end

local function ApplySeekChams(inst)
	wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(100,100,100)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,0,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyRushChams(inst)
    local RushCham = Instance.new("BillboardGui")
    local Rush = Instance.new("ImageLabel")

    RushCham.Name = "RushCham"
    RushCham.Parent = inst
    RushCham.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    RushCham.Active = true
    RushCham.AlwaysOnTop = true
    RushCham.LightInfluence = 1.000
    RushCham.Size = UDim2.new(6.5079999, 0, 6.5079999, 0)
    RushCham.StudsOffset = Vector3.new(0, 1.25, 0)

    Rush.Name = "Rush"
    Rush.Parent = RushCham
    Rush.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Rush.BackgroundTransparency = 1.000
    Rush.BorderSizePixel = 0
    Rush.Size = UDim2.new(1, 0, 1, 0)
    Rush.Image = "http://www.roblox.com/asset/?id=10642754311"
    Rush.ImageColor3 = Color3.fromRGB(2524, 255, 255)
end

local function ApplyAmbushChams(inst)
    local AmbushCham = Instance.new("BillboardGui")
    local Ambush = Instance.new("ImageLabel")

    AmbushCham.Name = "AmbushCham"
    AmbushCham.Parent = inst
    AmbushCham.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    AmbushCham.Active = true
    AmbushCham.AlwaysOnTop = true
    AmbushCham.LightInfluence = 1.000
    AmbushCham.Size = UDim2.new(6.5079999, 0, 6.5079999, 0)
    AmbushCham.StudsOffset = Vector3.new(0, 1.25, 0)

    Ambush.Name = "Ambush"
    Ambush.Parent = AmbushCham
    Ambush.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Ambush.BackgroundTransparency = 1.000
    Ambush.BorderSizePixel = 0
    Ambush.Size = UDim2.new(1, 0, 1, 0)
    Ambush.Image = "http://www.roblox.com/asset/?id=10722835155"
    Ambush.ImageColor3 = Color3.fromRGB(2524, 255, 255)
end

game.Workspace.CurrentRooms.DescendantAdded:Connect(function(inst)
    if inst.Name == "KeyObtain" then
        ApplyKeyChams(inst)
	elseif inst.Name == "LeverForGate" then
		ApplyLeverChams(inst)
    end
end)

local function ApplyBookChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyItemChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function ApplyHidingChams(inst)
    wait()
    local Cham = Instance.new("Highlight")
    Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Cham.FillColor = Color3.fromRGB(0,100,0)
    Cham.FillTransparency = 0.5
    Cham.OutlineColor = Color3.fromRGB(0,255,0)
    Cham.Parent = inst
    Cham.Enabled = true
    Cham.Adornee = inst
    Cham.RobloxLocked = true
    return Cham
end

local function searchForBooks()
    for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
        if v.Name == "LiveHintBook" then
            ApplyBookChams(v)
        end
    end
end



local function chat(msg, alert)
    if SECRETEDITION == false then
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
    
    if alert then
        notifyUser("Chat", msg, nil, true)
    else
        notifyUser("Chat", msg)
    end
end

local function notice(msg)
    chat(msg)
end

local function alert(msg)
    chat(msg)
end

local function warn2(msg)
    chat(msg)
end

local function randomTip()
	local randomNum = math.random(1,3)

	local tips = {"Want to know when the next entity spawns? Use '/next' and it will give you the room the entity will spawn in!", "Wondering what entity could spawn next? Use '/predict' and it will predict what entity will spawn!", "'Lunar AI - professionally programmed by nicK'"}

	if tipsEnabled == false then return "Tips Disabled" end

	return tips[randomNum]
end

LatestRoom.Changed:Connect(function()
    ApplyDoorChams(game.Workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value)).Door.Door)
    
    if LatestRoom.Value == 50 then
        searchForBooks()
		chat(returnDefinedMessage(libraryMsg))
        currentEntity = "Figure"
		warn("Entered library!")
    elseif LatestRoom.Value == 100 then
		chat(returnDefinedMessage(facilityMsg))
        currentEntity = "Figure"
		warn("Entered the facility!")
	end
end)

chat("Welcome to DOORS! Loading Lunar AI...")
wait(0.5)
chat("Loaded Lunar AI!")
chat("Lunar AI // Version " .. aiVersion .. " // Made by probablYnicK")
print("Loaded Lunar AI // DOORS // Version " .. aiVersion .. " // Made by probablYnicK")

LatestRoom.Changed:Connect(function()
    local n = ChaseStart.Value - LatestRoom.Value
	
	if table.find(tipRooms, LatestRoom.Value) then
		local generatedTip = randomTip()

		if generatedTip ~= "Tips Disabled" then
			chat(generatedTip)
		end
	end
	
    warn("The next entity will spawn in " .. n .. " room(s). (Room " .. ChaseStart.Value .. ")")
    if n < 4 and n > 0 then
        if n == 1 then
            chat(returnDefinedMessage(entityIncomingInNextRoomMsg))
        else
            chat(returnDefinedMessage(incomingEntityMsg))
        end
    end
end)

local sprintingFunction

game.Workspace.DescendantAdded:Connect(function(inst)
    if inst.Name == "RushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Rush"), true)
		ApplyRushChams(inst)
        currentEntity = "Rush"
        warn("Rush spawned!")
    elseif inst.Name == "AmbushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Ambush"), true)
		ApplyAmbushChams(inst)
        currentEntity = "Ambush"
        warn("Ambush spawned!")
    elseif inst.Name == "SeekMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Seek"), true)
        ApplySeekChams(inst)
        currentEntity = "Seek"
        warn("Seek chase has started! (Room " .. LatestRoom.Value .. ")")
    elseif inst.Name == "FigureRagdoll" then
		ApplyFigureChams(inst)
	elseif (inst.Name == "Shade" or inst.Name == "Halt" or inst.Name == "HaltMoving") and LatestRoom.Value ~= 99 then
		chat(returnDefinedMessage(entitySpawnedMsg, "Halt"), true)
        currentEntity = "Halt"
		warn("Halt spawned! (Room " .. LatestRoom.Value .. ")")
    elseif inst.Name == "Screech" then
        notifyUser("Psst!", "Screech spawned! Quickly look for him!", nil, true)
        warn("Psst! (Screech spawned!)")
    elseif inst.Name == "Lookman" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Eyes"), true)
        currentEntity = "Eyes"
        warn("Eyes spawned!")
    end

    if inst.Name == "Lighter" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Lockpick" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Vitamins" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Flashlight" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end
    
    if inst.Name == "GoldPile" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end

    if inst.Name == "Battery" and inst.Parent == "DrawerContainer" and inst:IsA("Model") then
        ApplyItemChams(d)
    end
end)

game.Workspace.ChildAdded:Connect(function(inst)
    if (inst.Name == "RushMoving" or inst.Name == "AmbushMoving") and OrionLib.Flags["AutoHideLunar"].Value == true then
        if inst.Name == "RushMoving" then
            notifyUser("Avoiding!", "Avoiding Rush!", nil, true)
        elseif inst.Name == "AmbushMoving" then
            notifyUser("Avoiding!", "Avoiding Ambush!", nil, true)
        end

        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local hideFunction = game:GetService("RunService").Heartbeat:Connect(function()
            game.Players.LocalPlayer.Character:MoveTo(oldPos + Vector3.new(0, OrionLib.Flags["AvoidHeightLunar"].Value, 0))
        end)
        
        inst.Destroying:Wait()
        hideFunction:Disconnect()

        game.Players.LocalPlayer.Character:MoveTo(oldPos)
    end
end)

local importantAssets = {
	"Wardrobe",
	"Bed",
	"Paintings",
	"LightStand",
	"Window",
	"KeyObtain",
	"LeverForGate",
	"Light_Fixtures",
}

LatestRoom.Changed:Connect(function()
	if OrionLib.Flags["RemoveAssets"].Value == false then return end

	local room = game.Workspace.CurrentRooms:FindFirstChild(tostring(LatestRoom.Value))

	if LatestRoom.Value == 50 or LatestRoom.Value == 100 then return end

	if room then
		local assets = room:FindFirstChild("Assets")
		
		if assets then
			for i, obj in pairs(assets:GetChildren()) do
				if table.find(importantAssets, obj.Name) then
					warn("Lunar AI // Asset " .. obj.Name .. " is important!")
				else
					for i, important in pairs(importantAssets) do
						if FindFirstDescendant(important, obj) then
							warn("Lunar AI // Asset " .. obj.Name .. " is important!")
						else
							obj:Destroy()
						end
					end
				end
			end
		end
		
		
	end
end)

local function predict()
	local room = ChaseStart.Value

	if room >= 30 and room <= 40 then
		return "Seek - Chase 1"
	end

	if room >= 51 and room <= 79 then
		return "Ambush"
	end

	if room >= 80 and room <= 90 then
		return "Seek - Chase 2"
	end

	if room >= 91 and room <= 99 then
		return "Ambush"
	end

	if room < 10 then
		return "Halt"
	end

	return "Rush"
end

for i, plr in pairs(game.Players:GetPlayers()) do
	plr.Chatted:Connect(function(msg)
		if string.lower(msg) == "/next" then
			wait(0.1)
			chat(returnDefinedMessage(nextCommandMsg), true)
		end

		if string.lower(msg) == "/predict" then
			local prediction = predict()
			wait(0.1)
			chat(returnDefinedMessage(predictCommandMsg, nil, prediction), true)
		end

        if string.lower(msg) == "/aiversion" then
			wait(0.1)
            chat("Current Version: Lunar AI // Version " .. aiVersion, true)
		end
	end)
end

for i, plr in pairs(game.Players:GetPlayers()) do
    if plr.Character then
        ApplyCharChams(plr.Character)
    end
    
    plr.CharacterAdded:Connect(function(char)
		ApplyCharChams(char)
    end)
end

--Other Functions--

local function getEmptyCloset(roomAssets)
	for i, obj in pairs(roomAssets:GetDescendants()) do
		if obj.Name == "Wardrobe" or obj.Name == "Bed" then
			if obj:WaitForChild("HiddenPlayer").Value == nil then
				return obj:WaitForChild("Main")
			end
		end
	end

	return nil
end

local function toClosetInRoom()
	local room = game:GetService("Workspace"):WaitForChild("CurrentRooms"):FindFirstChild(LatestRoom.Value)

	if room then
		local assets = room:FindFirstChild("Assets")

		if assets then
			local closet = getEmptyCloset(assets)

			if closet then
				local char = game.Players.LocalPlayer.Character

				if char then
                    closet.CanCollide = false

					local destination = CFrame.new(closet.CFrame.X, closet.CFrame.Y, closet.CFrame.Z)

					char:SetPrimaryPartCFrame(destination)

                    char:WaitForChild("Head").CFrame = CFrame.lookAt(char.Head.Position, closet.Position)

					wait()

					fireproximityprompt(closet.Parent:WaitForChild("HidePrompt"))

					notifyUser("Success!", "Successfully hid!")
				else
					notifyUser("No Character", "Your character was not found!")
				end
			else
				notifyUser("No Closets", "There are no empty closets in your current room!")
			end
		else
			warn("Error! Could not find Assets!")
		end
	else
		warn("Error! Could not find room!")
	end
end

local function getBooks()
	local books = {}

	for i, book in pairs(game:GetService("Workspace"):GetDescendants()) do
		if book.Name == "LiveHintBook" then
			table.insert(books, book)
		end
	end

	return books
end

local function getPaper()
    local paper = game.Workspace.CurrentRooms[LatestRoom.Value]:FindFirstChild("PickupItem")
    
    if paper then
        return paper:WaitForChild("Handle")
    else
        return nil
    end
end

local function completeLibrary()
    local bookFunction
	local char = game.Players.LocalPlayer.Character

	if char then
		print("Got character for autocompletion!")
        char.HumanoidRootPart.Anchored = true
	else
		notifyUser("Failed", "No character was found!")
		return
	end

	if LatestRoom.Value == 50 then
		for i, book in pairs(getBooks()) do
			
            local destination = CFrame.new(book.Base.Position)
         
            char:PivotTo(destination)
            
            wait(0.3)

            fireproximityprompt(book:WaitForChild("ActivateEventPrompt"))

            wait()
		end

        local paper = getPaper()
        local destination = CFrame.new(paper.Position)

        if paper and char:FindFirstChild("LibraryHintPaper") == nil then
            char:PivotTo(destination)
            
            wait(0.3)

            fireproximityprompt(paper.Parent:WaitForChild("ModulePrompt"))
            

            local room = game.Workspace.CurrentRooms["50"]
            local doorDestination = CFrame.new(room.Door.Door.Position)

            wait(0.3)

            char:PivotTo(doorDestination)
        else
            notifyUser("Failed", "Could not find Paper!")
            char.HumanoidRootPart.Anchored = false
            return
        end

        char.HumanoidRootPart.Anchored = false
	else
        char.HumanoidRootPart.Anchored = false
		notifyUser("Unavailable", "You must be in the Library (Room 50) to autocomplete!")
		return
	end
end

--Keybinds + Actions --

local UIS = game:GetService("UserInputService")

local sprinting = false

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed == true then return end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SprintKeybind"].Value] then
        sprintingFunction = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                    game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * OrionLib.Flags["SprintSpeedLunar"].Value/50)
                end
            end)
        end)
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["HealthKeybind"].Value] then
        for i, player in pairs(game.Players:GetPlayers()) do
            local char = player.Character
            local humanoid = nil

            if char then
                humanoid = char.Humanoid
            end
            

            if humanoid then
                if humanoid.Health == 0 then
                    notifyUser(player.DisplayName, "[ DEAD ]")
                else
                    notifyUser(player.DisplayName, humanoid.Health .. " HP")
                end
            end
            wait()
        end
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PlayKeybind"].Value] then
        playMusic(OrionLib.Flags["CurrentSongLunar"].Value)
    end
    
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["FullbrightKeybind"].Value] then
        fbEnabled = not fbEnabled
        
        wait()
        
        if fbEnabled == true then
        	lighting.Brightness = OrionLib.Flags["FullbrightIntensity"].Value
			lighting.GlobalShadows = false
			lighting.ClockTime = 12
			lighting.FogEnd = 786543
			lighting.Ambient = Color3.fromRGB(178, 178, 178)
        else
        	lighting.Brightness = normalLightingSettings.Brightness
			lighting.GlobalShadows = normalLightingSettings.GlobalShadows
			lighting.ClockTime = normalLightingSettings.ClockTime
			lighting.FogEnd = normalLightingSettings.FogEnd
			lighting.Ambient = normalLightingSettings.Ambient
        end
    end
    
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PauseKeybind"].Value] then
        song.Playing = not song.Playing

        if song.Playing == true then
            notifyUser("Music", "Unpaused music!")
        elseif song.Playing == false then
            notifyUser("Music", "Paused music!")
        end
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["StopKeybind"].Value] then
        musicSongDropdown:Set("None", true)

        notifyUser("Music", "Stopped Music!")
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["HideKeybind"].Value] then
		toClosetInRoom()
	end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["LibraryKeybind"].Value] then
        completeLibrary()
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["FullAIKeybind"].Value] then
        fullAI.Value = not fullAI.Value
        
        if fullAI.Value == true then
            OrionLib:MakeNotification({
                Name = "Full AI",
                Content = "Turned Full AI on!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        elseif fullAI.Value == false then
            OrionLib:MakeNotification({
                Name = "Full AI",
                Content = "Turned Full AI off!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
        
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SkipRoomKeybind"].Value] then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]

		local destination = CFrame.new(room.Door.Door.CFrame.X, room.Door.Door.CFrame.Y, room.Door.Door.CFrame.Z)

		local char = game.Players.LocalPlayer.Character
		
		local roomKey = nil

		if game.Players.LocalPlayer.Character:FindFirstChild("Key") then
			char:SetPrimaryPartCFrame(destination)

       		OrionLib:MakeNotification({
            	Name = "Skipped Room",
				Content = "Successfully skipped Room " .. LatestRoom.Value,
				Image = "rbxassetid://4483345998",
				Time = 5
			})
		
			return
		end
		
		for i, obj in pairs(room:GetDescendants()) do
			if obj.Name == "KeyObtain" then
				roomKey = obj
			end
			
			if obj.Name == "LeverForGate" then
				roomKey = obj
			end
		end

		if roomKey then
			if roomKey.Name == "KeyObtain" then
				notifyUser("Skipping Room", "Getting key...")
				char:PivotTo(CFrame.new(roomKey.Hitbox.Position))
				wait(0.3)
				fireproximityprompt(roomKey.ModulePrompt, 0)
				char:PivotTo(CFrame.new(room.Door.Door.Position))
				wait(0.3)
				fireproximityprompt(room.Door.Lock.UnlockPrompt, 0)
				notifyUser("Skipped Room!", "Successfully skipped Room " .. tostring(LatestRoom.Value - 1) .. "!")
			elseif roomKey.Name == "LeverForGate" then
				notifyUser("Skipping Room", "Opening gate...")
				char:PivotTo(CFrame.new(roomKey.Main.Position))
				wait(0.3)
				fireproximityprompt(roomKey.ActivateEventPrompt, 0)
				char:PivotTo(CFrame.new(room.Door.Door.Position))
				notifyUser("Skipped Room!", "Successfully skipped Room " .. tostring(LatestRoom.Value - 1) .. "!")
			end
		else
			char:SetPrimaryPartCFrame(destination)
		end
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["TpKeyKeybind"].Value] then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
		
		local roomKey = nil

		local char = game.Players.LocalPlayer.Character

		for i, obj in pairs(room:GetDescendants()) do
			if obj.Name == "KeyObtain" then
				roomKey = obj
			end
			
			if obj.Name == "LeverForGate" then
				roomKey = obj
			end
		end

		if roomKey then
			if roomKey.Name == "KeyObtain" then
				char:PivotTo(CFrame.new(roomKey.Hitbox.Position))
			
				wait(0.3)
				
				fireproximityprompt(roomKey.ModulePrompt, 0)
				
				OrionLib:MakeNotification({
		            Name = "Collected Key",
					Content = "Press 'R' to teleport to the door.",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			elseif roomKey.Name == "LeverForGate" then
				char:PivotTo(CFrame.new(roomKey.Main.Position))
				
				wait(0.3)
				
				fireproximityprompt(roomKey.ActivateEventPrompt, 0)
				
				OrionLib:MakeNotification({
		            Name = "Opened Gate",
					Content = "Press 'R' to teleport to the door.",
					Image = "rbxassetid://4483345998",
					Time = 5
				})
			end
		else
			OrionLib:MakeNotification({
            	Name = "No Key",
				Content = "A key was not found!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed == true then return end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SprintKeybind"].Value] then
		sprintingFunction:Disconnect()
	end
end)

lighting.Changed:Connect(function()
	if fbEnabled == true then
		lighting.Brightness = OrionLib.Flags["FullbrightIntensity"].Value
		lighting.GlobalShadows = false
		lighting.ClockTime = 12
		lighting.FogEnd = 786543
		lighting.Ambient = Color3.fromRGB(178, 178, 178)
	end
end)

--Headlight--

local headlight = Instance.new("SpotLight")
headlight.Brightness = HeadlightBrightnessLunar.Value
headlight.Face = Enum.NormalId.Front
headlight.Range = 90
headlight.Parent = game.Players.LocalPlayer.Character.Head
headlight.Enabled = HeadlightEnabledLunar.Value

HeadlightEnabledLunar:GetPropertyChangedSignal("Value"):Connect(function()
    headlight.Enabled = HeadlightEnabledLunar.Value
end)

HeadlightBrightnessLunar:GetPropertyChangedSignal("Value"):Connect(function()
    headlight.Brightness = HeadlightBrightnessLunar.Value
end)

--Instant ProximityPrompt--

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
    fireproximityprompt(prompt)
end)

--Full AI--

local pathfindingService = game:GetService("PathfindingService")

LatestRoom.Changed:Connect(function()
    if fullAI.Value == true then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]
        
        if game.ReplicatedStorage.GameData.LatestRoom.Value == 50 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then
            fullAI.Value = false

            OrionLib:MakeNotification({
            	Name = "Full AI",
				Content = "Full AI was disabled due the room being 50 or 100.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
            return
        end

        OrionLib:MakeNotification({
            Name = "Full AI",
			Content = "Pathfinding to the door of Room " .. LatestRoom.Value,
			Image = "rbxassetid://4483345998",
			Time = 5
		})

        wait(1)

        print("Full AI // Lunar AI // Pathfinding to door...")

		local char = game.Players.LocalPlayer.Character
		
		--[[
		if char then
			local path = pathfindingService:CreatePath()
		
			path:ComputeAsync(char.HumanoidRootPart.Position, room.Door.Door.Position)
			
			local waypoints = path:GetWaypoints()
			
			for i, waypoint in pairs(waypoints) do
				char.Humanoid:MoveTo(waypoint.Position)
				char.Humanoid.MoveToFinished:Wait()
				
				print("Moving to waypoint...")
			end
		else
			return		
		end
		
		]]--
        
        local nodes = room:WaitForChild("Nodes")
        
        if game.ReplicatedStorage.GameData.LatestRoom.Value == 50 or game.ReplicatedStorage.GameData.LatestRoom.Value == 100 then
            fullAI.Value = false

            OrionLib:MakeNotification({
            	Name = "Full AI",
				Content = "Full AI was disabled due the room being 50 or 100.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
            return
        end

        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

        for i, node in pairs(nodes:GetDescendants()) do
			if node.Name == tostring(i) then
                humanoid:MoveTo(node.Position)
                humanoid.MoveToFinished:Wait()
            end
		end
    end
end)

--[[ Lunar AI // Code Parser ]]--

local hintTable = {}

game.Players.LocalPlayer.Character.ChildAdded:Connect(function(tool)
	if tool.Name == "LibraryHintPaper" then
		local parsed = {}
		local paperUI = tool:WaitForChild("UI")
		
		for i = 1,5,1 do
			local hint = paperUI:FindFirstChild(tostring(i))
			
			if hint then
				local hintNum = hintTable[hint.ImageRectOffset.X/50]
				
				print(hint.ImageRectOffset.X/50)
				
				if hintNum ~= nil then
					parsed[i] = hintNum
				end
			end
		end
		
		local fullParsed = ""
		
		for i = 1,5 do
			local inTable = parsed[i]
			
			fullParsed = fullParsed .. (inTable or "_")
		end
		
		notifyUser("Lunar AI // Code Parser", "Parsed Code: " .. fullParsed, 10, true)
	end
end)

game.ReplicatedStorage.Bricks.PadlockHint.OnClientEvent:Connect(function(tableNum, num, _)
	if tableNum and num then
		hintTable[tableNum] = tostring(num)
	else
		hintTable = {}
	end
end)

--Freecam--

------------------------------------------------------------------------
-- Freecam
-- Cinematic free camera for spectating and video production.
------------------------------------------------------------------------

local pi    = math.pi
local abs   = math.abs
local clamp = math.clamp
local exp   = math.exp
local rad   = math.rad
local sign  = math.sign
local sqrt  = math.sqrt
local tan   = math.tan

local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end

local Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	local newCamera = Workspace.CurrentCamera
	if newCamera then
		Camera = newCamera
	end
end)

------------------------------------------------------------------------

local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}

local NAV_GAIN = Vector3.new(1, 1, 1)*64
local PAN_GAIN = Vector2.new(0.75, 1)*8
local FOV_GAIN = 300

local PITCH_LIMIT = rad(90)

local VEL_STIFFNESS = 1.5
local PAN_STIFFNESS = 1.0
local FOV_STIFFNESS = 4.0

------------------------------------------------------------------------

local Spring = {} do
	Spring.__index = Spring

	function Spring.new(freq, pos)
		local self = setmetatable({}, Spring)
		self.f = freq
		self.p = pos
		self.v = pos*0
		return self
	end

	function Spring:Update(dt, goal)
		local f = self.f*2*pi
		local p0 = self.p
		local v0 = self.v

		local offset = goal - p0
		local decay = exp(-f*dt)

		local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
		local v1 = (f*dt*(offset*f - v0) + v0)*decay

		self.p = p1
		self.v = v1

		return p1
	end

	function Spring:Reset(pos)
		self.p = pos
		self.v = pos*0
	end
end

------------------------------------------------------------------------

local cameraPos = Vector3.new()
local cameraRot = Vector2.new()
local cameraFov = 0

local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
local fovSpring = Spring.new(FOV_STIFFNESS, 0)

------------------------------------------------------------------------

local Input = {} do
	local thumbstickCurve do
		local K_CURVATURE = 2.0
		local K_DEADZONE = 0.15

		local function fCurve(x)
			return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
		end

		local function fDeadzone(x)
			return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
		end

		function thumbstickCurve(x)
			return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
		end
	end

	local gamepad = {
		ButtonX = 0,
		ButtonY = 0,
		DPadDown = 0,
		DPadUp = 0,
		ButtonL2 = 0,
		ButtonR2 = 0,
		Thumbstick1 = Vector2.new(),
		Thumbstick2 = Vector2.new(),
	}

	local keyboard = {
		W = 0,
		A = 0,
		S = 0,
		D = 0,
		E = 0,
		Q = 0,
		U = 0,
		H = 0,
		J = 0,
		K = 0,
		I = 0,
		Y = 0,
		Up = 0,
		Down = 0,
		LeftShift = 0,
		RightShift = 0,
	}

	local mouse = {
		Delta = Vector2.new(),
		MouseWheel = 0,
	}

	local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
	local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
	local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
	local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
	local FOV_WHEEL_SPEED    = 1.0
	local FOV_GAMEPAD_SPEED  = 0.25
	local NAV_ADJ_SPEED      = 0.75
	local NAV_SHIFT_MUL      = 0.25

	local navSpeed = 1

	function Input.Vel(dt)
		navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)

		local kGamepad = Vector3.new(
			thumbstickCurve(gamepad.Thumbstick1.x),
			thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
			thumbstickCurve(-gamepad.Thumbstick1.y)
		)*NAV_GAMEPAD_SPEED

		local kKeyboard = Vector3.new(
			keyboard.D - keyboard.A + keyboard.K - keyboard.H,
			keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
			keyboard.S - keyboard.W + keyboard.J - keyboard.U
		)*NAV_KEYBOARD_SPEED

		local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)

		return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
	end

	function Input.Pan(dt)
		local kGamepad = Vector2.new(
			thumbstickCurve(gamepad.Thumbstick2.y),
			thumbstickCurve(-gamepad.Thumbstick2.x)
		)*PAN_GAMEPAD_SPEED
		local kMouse = mouse.Delta*PAN_MOUSE_SPEED
		mouse.Delta = Vector2.new()
		return kGamepad + kMouse
	end

	function Input.Fov(dt)
		local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
		local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
		mouse.MouseWheel = 0
		return kGamepad + kMouse
	end

	do
		local function Keypress(action, state, input)
			keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function GpButton(action, state, input)
			gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
			return Enum.ContextActionResult.Sink
		end

		local function MousePan(action, state, input)
			local delta = input.Delta
			mouse.Delta = Vector2.new(-delta.y, -delta.x)
			return Enum.ContextActionResult.Sink
		end

		local function Thumb(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position
			return Enum.ContextActionResult.Sink
		end

		local function Trigger(action, state, input)
			gamepad[input.KeyCode.Name] = input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function MouseWheel(action, state, input)
			mouse[input.UserInputType.Name] = -input.Position.z
			return Enum.ContextActionResult.Sink
		end

		local function Zero(t)
			for k, v in pairs(t) do
				t[k] = v*0
			end
		end

		function Input.StartCapture()
			ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
				Enum.KeyCode.W, Enum.KeyCode.U,
				Enum.KeyCode.A, Enum.KeyCode.H,
				Enum.KeyCode.S, Enum.KeyCode.J,
				Enum.KeyCode.D, Enum.KeyCode.K,
				Enum.KeyCode.E, Enum.KeyCode.I,
				Enum.KeyCode.Q, Enum.KeyCode.Y,
				Enum.KeyCode.Up, Enum.KeyCode.Down
			)
			ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
			ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
			ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
			ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
			ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
		end

		function Input.StopCapture()
			navSpeed = 1
			Zero(gamepad)
			Zero(keyboard)
			Zero(mouse)
			ContextActionService:UnbindAction("FreecamKeyboard")
			ContextActionService:UnbindAction("FreecamMousePan")
			ContextActionService:UnbindAction("FreecamMouseWheel")
			ContextActionService:UnbindAction("FreecamGamepadButton")
			ContextActionService:UnbindAction("FreecamGamepadTrigger")
			ContextActionService:UnbindAction("FreecamGamepadThumbstick")
		end
	end
end

local function GetFocusDistance(cameraFrame)
	local znear = 0.1
	local viewport = Camera.ViewportSize
	local projy = 2*tan(cameraFov/2)
	local projx = viewport.x/viewport.y*projy
	local fx = cameraFrame.rightVector
	local fy = cameraFrame.upVector
	local fz = cameraFrame.lookVector

	local minVect = Vector3.new()
	local minDist = 512

	for x = 0, 1, 0.5 do
		for y = 0, 1, 0.5 do
			local cx = (x - 0.5)*projx
			local cy = (y - 0.5)*projy
			local offset = fx*cx - fy*cy + fz
			local origin = cameraFrame.p + offset*znear
			local _, hit = Workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
			local dist = (hit - origin).magnitude
			if minDist > dist then
				minDist = dist
				minVect = offset.unit
			end
		end
	end

	return fz:Dot(minVect)*minDist
end

------------------------------------------------------------------------

local function StepFreecam(dt)
	local vel = velSpring:Update(dt, Input.Vel(dt))
	local pan = panSpring:Update(dt, Input.Pan(dt))
	local fov = fovSpring:Update(dt, Input.Fov(dt))

	local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))

	cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
	cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
	cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))

	local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
	cameraPos = cameraCFrame.p

	Camera.CFrame = cameraCFrame
	Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
	Camera.FieldOfView = cameraFov
end

------------------------------------------------------------------------

local PlayerState = {} do
	local mouseBehavior
	local mouseIconEnabled
	local cameraType
	local cameraFocus
	local cameraCFrame
	local cameraFieldOfView
	local screenGuis = {}
	local coreGuis = {
		Backpack = true,
		Chat = true,
		Health = true,
		PlayerList = true,
	}
	local setCores = {
		BadgesNotificationsActive = true,
		PointsNotificationsActive = true,
	}

	-- Save state and set up for freecam
	function PlayerState.Push()
		for name in pairs(coreGuis) do
			coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
		end
		for name in pairs(setCores) do
			setCores[name] = StarterGui:GetCore(name)
			StarterGui:SetCore(name, false)
		end
		local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if playergui then
			for _, gui in pairs(playergui:GetChildren()) do
				if gui:IsA("ScreenGui") and gui.Enabled then
					screenGuis[#screenGuis + 1] = gui
					gui.Enabled = false
				end
			end
		end

		cameraFieldOfView = Camera.FieldOfView
		Camera.FieldOfView = 70

		cameraType = Camera.CameraType
		Camera.CameraType = Enum.CameraType.Custom

		cameraCFrame = Camera.CFrame
		cameraFocus = Camera.Focus

		mouseIconEnabled = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false

		mouseBehavior = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end

	-- Restore state
	function PlayerState.Pop()
		for name, isEnabled in pairs(coreGuis) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
		end
		for name, isEnabled in pairs(setCores) do
			StarterGui:SetCore(name, isEnabled)
		end
		for _, gui in pairs(screenGuis) do
			if gui.Parent then
				gui.Enabled = true
			end
		end

		Camera.FieldOfView = cameraFieldOfView
		cameraFieldOfView = nil

		Camera.CameraType = cameraType
		cameraType = nil

		Camera.CFrame = cameraCFrame
		cameraCFrame = nil

		Camera.Focus = cameraFocus
		cameraFocus = nil

		UserInputService.MouseIconEnabled = mouseIconEnabled
		mouseIconEnabled = nil

		UserInputService.MouseBehavior = mouseBehavior
		mouseBehavior = nil
	end
end

local function StartFreecam()
	local cameraCFrame = Camera.CFrame
	cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
	cameraPos = cameraCFrame.p
	cameraFov = Camera.FieldOfView

	velSpring:Reset(Vector3.new())
	panSpring:Reset(Vector2.new())
	fovSpring:Reset(0)

	PlayerState.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	Input.StartCapture()
end

local function StopFreecam()
	Input.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	PlayerState.Pop()
end

------------------------------------------------------------------------

do
	local enabled = false

	local function ToggleFreecam()
		if enabled then
			StopFreecam()
		else
			StartFreecam()
		end
		enabled = not enabled
	end

	local function CheckMacro(macro)
		for i = 1, #macro - 1 do
			if not UserInputService:IsKeyDown(macro[i]) then
				return
			end
		end
		ToggleFreecam()
	end

	local function HandleActivationInput(action, state, input)
		if state == Enum.UserInputState.Begin then
			if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
				CheckMacro(FREECAM_MACRO_KB)
			end
		end
		return Enum.ContextActionResult.Pass
	end

	ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
end

--ENTITY INFO--

local images = {
	Rush = "rbxassetid://10642754311",
	Ambush = "rbxassetid://10722835155",
	Seek = "rbxassetid://10715669534",
	Figure = "rbxassetid://10745200497",
	Halt = "rbxassetid://10824865061",
    Eyes = "rbxassetid://10865377911",
	None = "rbxassetid://403653614",
}

game.Workspace.DescendantAdded:Connect(function(t)
	wait(0.05)

	if currentEntity == "Rush" then
		EntityImage.Image = images.Rush
	end
	if currentEntity == "Ambush" then
		EntityImage.Image = images.Ambush
	end
	if currentEntity == "Seek" then
		EntityImage.Image = images.Seek
	end
	if currentEntity == "Figure" and t.Name == "Figure" then
		EntityImage.Image = images.Figure
		ApplyFigureChams(t)
	end
	if currentEntity == "Halt" then
		EntityImage.Image = images.Halt
	end
    if currentEntity == "Eyes" then
		EntityImage.Image = images.Eyes
	end
	if currentEntity == "None" then
		EntityImage.Image = images.None
	end

    if t.Name == "TriggerEventCollision" and OrionLib.Flags["SkipSeekLunar"].Value == true then
        t:Destroy()

		wait(0.5)
	
		if game.Workspace:FindFirstChild("SeekMoving") then
		    game.Workspace:WaitForChild("SeekMoving"):Destroy()
		end
    end

    if (t.Name == "Seek_Arm" or t.Name == "ChandelierObstruction") and OrionLib.Flags["RemoveObstructionsLunar"].Value == true then
        t:Destroy()
    end

    if (t.Name == "RushMoving" or t.Name == "AmbushMoving" or t.Name == "ShadeMoving" or t.Name == "Shade" or t.Name == "FigureRagdoll" or t.Name == "HaltMoving" or t.Name == "SeekMoving") and currentEntity ~= "None" then
        local entity = getEntity(currentEntity)

        if entity then
            game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityName.Text = currentEntity
            game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityImage.Image = images[currentEntity]
        else
            warn("Could not find entity for name: " .. currentEntity .. "!")
        end
    end
end)

game.Workspace.CurrentRooms.ChildAdded:Connect(function(c)
    if c:FindFirstChild("WeirdCeilngThing") and OrionLib.Flags["RemoveObstructionsLunar"].Value == true then
        for i, asset in pairs(c:WaitForChild("Assets"):GetChildren()) do
            if asset:IsA("Model") then
                asset:Destroy()
            end
        end
    end
end)

game.Workspace.DescendantRemoving:Connect(function(t)
	if t.Name == "RushMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "AmbushMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if  t.Name == "SeekMoving" or t.Name == "Seek" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "Figure" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
	if t.Name == "Shade" or t.Name == "Halt" or t.Name == "HaltMoving" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
    if t.Name == "Lookman" then
		EntityImage.Image = images.None
		currentEntity = "None"
	end
end)

ChaseStart.Changed:Connect(function()
	RoomNumber.Text = "Room " .. ChaseStart.Value
end)

OrionLib:Init()㒠㒗㒜㒘㒚㒥㒡㒘㒥㒣㒠㒣㒣㒡㒢㒠㒣㒤㒚㒞㒥㒝㒦㒝㒚㒜㒘㒛㒙㒛㒜㒙㒛㒘㒜㒛㒤㒦㒞㒥㒥㒤㒢㒣㒡㒢㒢㒣㒣㒥㒦㒟㒦㒣㒝㒞㒗㒡㒟㒜㒙㒘㒞㒚㒛㒚㒞㒟㒞㒗㒞㒛㒗㒥㒠㒢㒟㒣㒤㒢㒣㒡㒤㒢㒗㒟㒦㒟㒗㒢㒡㒝㒙㒡㒝㒛㒜㒚㒜㒙㒝㒙㒠㒗㒟㒦㒠㒚㒛㒤㒢㒘㒙㒢㒥㒡㒥㒠㒦㒠㒗㒟㒘㒞㒙㒡㒡㒜㒛㒟㒦㒚㒝㒙㒠㒘㒟㒗㒠㒦㒡㒥㒢㒙㒘㒣㒤㒗㒛㒡㒦㒥㒞㒠㒘㒠㒛㒞㒚㒝㒛㒠㒢㒛㒝㒠㒦㒙㒠㒘㒠㒗㒡㒗㒤㒥㒣㒤㒤㒘㒜㒢㒦㒟㒠㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒜㒝㒟㒣㒚㒟㒝㒦㒘㒡㒜㒙㒦㒣㒦㒦㒤㒥㒣㒦㒗㒝㒢㒘㒘㒝㒠㒚㒟㒛㒞㒜㒞㒟㒜㒞㒛㒟㒟㒗㒙㒡㒠㒜㒗㒤㒦㒤㒥㒥㒦㒘㒗㒢㒣㒘㒦㒡㒡㒚㒙㒥㒟㒜㒞㒝㒝㒞㒝㒡㒟㒛㒚㒡㒞㒛㒘㒣㒠㒣㒗㒗㒥㒦㒥㒗㒥㒚㒦㒤㒢㒚㒥㒥㒠㒜㒝㒝㒞㒠㒝㒟㒜㒠㒛㒡㒗㒢㒙㒣㒝㒛㒗㒥㒛㒠㒦㒗㒥㒚㒤㒙㒣㒚㒦㒞㒡㒝㒤㒢㒟㒞㒢㒥㒝㒠㒡㒘㒛㒢㒛㒥㒝㒟㒘㒥㒜㒜㒗㒗㒘㒝㒥㒚㒤㒚㒣㒛㒣㒞㒣㒥㒠㒞㒣㒦㒞㒠㒥㒛㒜㒣㒛㒣㒚㒤㒛㒗㒘㒦㒘㒗㒛㒠㒦㒙㒘㒣㒤㒜㒣㒜㒢㒝㒢㒠㒠㒟㒟㒠㒣㒚㒝㒢㒝㒦㒛㒤㒚㒥㒙㒦㒚㒙㒘㒘㒗㒙㒚㒤㒥㒛㒝㒢㒣㒞㒢㒞㒡㒟㒠㒠㒟㒡㒞㒢㒢㒚㒜㒤㒠㒟㒚㒦㒚㒙㒙㒘㒘㒙㒗㒚㒦㒛㒙㒡㒤㒝㒗㒤㒢㒟㒦㒗㒠㒡㒠㒤㒞㒣㒝㒤㒡㒛㒛㒦㒣㒗㒚㒙㒙㒙㒘㒚㒗㒛㒦㒜㒥㒝㒘㒥㒣㒟㒢㒡㒡㒡㒠㒢㒟㒣㒞㒤㒝㒥㒜㒦㒠㒜㒛㒘㒞㒟㒙㒚㒜㒢㒗㒜㒦㒟㒚㒡㒤㒟㒗㒦㒢㒡㒘㒛㒠㒣㒟㒤㒞㒥㒞㒦㒜㒣㒜㒘㒟㒞㒚㒚㒗㒥㒘㒝㒛㒣㒦㒞㒥㒟㒤㒠㒣㒡㒦㒥㒡㒣㒥㒙㒟㒥㒟㒗㒞㒗㒞㒚㒜㒙㒛㒚㒞㒠㒙㒜㒛㒚㒗㒠㒦㒟㒥㒠㒤㒡㒣㒢㒢㒣㒦㒗㒠㒥㒣㒤㒟㒗㒢㒝㒝㒙㒜㒚㒛㒛㒚㒜㒝㒢㒘㒞㒗㒟㒦㒠㒥㒦㒤㒢㒤㒥㒢㒤㒡㒥㒥㒜㒠㒗㒦㒢㒞㒚㒝㒚㒜㒛㒜㒞㒚㒝㒙㒞㒜㒦㒗㒠㒡㒜㒥㒣㒤㒣㒣㒤㒤㒗㒡㒦㒡㒗㒤㒠㒟㒙㒤㒥㒝㒝㒜㒜㒛㒝㒛㒠㒙㒟㒘㒠㒜㒚㒦㒢㒦㒜㒤㒤㒣㒥㒢㒦㒢㒗㒡㒘㒠㒙㒣㒠㒞㒛㒡㒥㒜㒝㒛㒠㒚㒟㒚㒠㒘㒤㒗㒣㒛㒘㒥㒤㒘㒙㒤㒗㒗㒝㒢㒘㒡㒙㒢㒠㒟㒜㒢㒢㒝㒝㒜㒞㒛㒟㒚㒠㒙㒡㒙㒢㒗㒣㒦㒤㒚㒚㒤㒦㒥㒤㒣㒛㒦㒟㒡㒚㒡㒝㒟㒜㒞㒝㒡㒤㒜㒟㒝㒥㒚㒢㒙㒢㒘㒣㒘㒦㒦㒥㒥㒦㒙㒞㒤㒘㒚㒣㒢㒛㒡㒛㒠㒜㒠㒟㒞㒞㒝㒟㒡㒘㒛㒡㒚㒜㒙㒥㒘㒤㒗㒥㒘㒘㒦㒗㒥㒘㒘㒢㒣㒚㒥㒟㒡㒜㒠㒝㒟㒞㒟㒡㒝㒠㒜㒡㒠㒜㒚㒣㒗㒢㒘㒥㒗㒦㒗㒗㒦㒘㒥㒙㒤㒚㒗㒢㒢㒜㒦㒗㒠㒞㒟㒡㒞㒠㒝㒡㒜㒢㒛㒣㒟㒙㒙㒥㒝㒜㒘㒗㒛㒟㒦㒙㒦㒜㒤㒛㒣㒜㒦㒣㒡㒞㒘㒟㒟㒡㒞㒡㒝㒢㒜㒣㒠㒠㒚㒥㒞㒝㒙㒗㒘㒙㒗㒙㒦㒚㒥㒛㒤㒜㒗㒠㒢㒟㒥㒤㒠㒠㒤㒗㒞㒢㒢㒚㒜㒤㒜㒗㒠㒙㒚㒗㒝㒞㒘㒙㒘㒛㒦㒛㒥㒜㒤㒝㒤㒞㒢㒛㒡㒠㒤㒦㒟㒢㒝㒝㒝㒥㒡㒛㒛㒦㒛㒗㒚㒘㒙㒙㒜㒝㒗㒛㒚㒡㒥㒝㒤㒟㒣㒟㒣㒢㒡㒡㒠㒢㒤㒘㒞㒤㒠㒢㒝㒘㒜㒗㒛㒘㒚㒙㒙㒚㒘㒛㒛㒟㒦㒝㒙㒜㒤㒟㒗㒥㒢㒡㒡㒢㒠㒣㒟㒤㒣㒚㒝㒦㒝㒗㒜㒘㒛㒞㒚㒚㒚㒝㒘㒜㒗㒝㒚㒤㒥㒟㒜㒚㒣㒢㒢㒢㒡㒣㒡㒦㒟㒥㒞㒦㒢㒞㒝㒘㒙㒥㒛㒚㒚㒛㒙㒜㒙㒟㒗㒞㒦㒟㒚㒘㒤㒡㒟㒝㒢㒣㒡㒤㒠㒥㒡㒘㒟㒗㒞㒘㒡㒢㒜㒚㒤㒤㒚㒝㒙㒝㒘㒞㒗㒟㒦㒠㒥㒡㒙㒘㒣㒣㒗㒝㒡㒥㒡㒘㒠㒗㒠㒘㒞㒜㒝㒛㒠㒠㒛㒜㒝㒡㒙㒟㒜㒥㒗㒠㒦㒡㒘㒘㒤㒤㒘㒚㒢㒥㒡㒦㒡㒗㒠㒘㒟㒙㒟㒚㒝㒛㒜㒜㒟㒢㒚㒞㒛㒜㒘㒣㒜㒗㒦㒢㒦㒥㒤㒤㒣㒥㒗㒜㒢㒗㒣㒝㒠㒚㒟㒚㒞㒛㒞㒞㒜㒝㒛㒞㒞㒦㒙㒠㒠㒛㒗㒣㒦㒣㒥㒤㒦㒗㒣㒦㒣㒗㒦㒠㒡㒙㒝㒦㒟㒝㒞㒜㒝㒝㒝㒠㒛㒟㒚㒠㒞㒚㒘㒢㒣㒥㒦㒥㒥㒥㒤㒦㒥㒙㒣㒘㒢㒙㒥㒤㒠㒛㒝㒗㒞㒞㒝㒞㒜㒟㒛㒠㒚㒡㒙㒢㒝㒚㒗㒤㒛㒟㒥㒦㒥㒙㒤㒘㒣㒙㒢㒚㒡㒛㒤㒡㒟㒝㒢㒤㒝㒟㒡㒗㒛㒡㒛㒤㒙㒣㒘㒤㒜㒛㒦㒦㒞㒗㒥㒙㒤㒙㒣㒚㒢㒛㒦㒘㒠㒝㒣㒥㒞㒟㒝㒡㒜㒡㒛㒢㒚㒣㒙㒤㒝㒘㒘㒗㒛㒜㒦㒘㒙㒟㒤㒚㒗㒢㒢㒜㒡㒟㒥㒡㒟㒟㒢㒦㒝㒡㒤㒗㒛㒣㒚㒤㒙㒥㒙㒦㒗㒣㒗㒘㒚㒞㒥㒚㒢㒥㒣㒝㒦㒣㒡㒞㒠㒟㒟㒠㒞㒡㒡㒥㒜㒣㒠㒙㒚㒥㒚㒗㒙㒗㒙㒚㒗㒙㒦㒚㒙㒠㒤㒜㒦㒚㒢㒠㒡㒟㒠㒠㒟㒡㒞㒢㒝㒣㒡㒗㒛㒥㒞㒤㒚㒗㒝㒝㒘㒙㒗㒚㒦㒛㒥㒜㒘㒢㒣㒞㒢㒟㒡㒠㒠㒦㒟㒢㒟㒥㒝㒤㒜㒥㒠㒜㒛㒗㒡㒢㒙㒚㒘㒚㒗㒛㒗㒞㒥㒝㒤㒞㒗㒦㒢㒠㒣㒢㒠㒥㒟㒣㒞㒤㒟㒗㒜㒦㒜㒗㒟㒠㒚㒙㒙㒘㒘㒜㒗㒜㒦㒝㒦㒠㒤㒟㒣㒠㒗㒚㒡㒢㒢㒚㒟㒤㒞㒥㒝㒦㒝㒗㒜㒘㒛㒙㒞㒠㒙㒛㒜㒥㒗㒝㒦㒠㒥㒟㒥㒠㒣㒤㒢㒣㒦㒘㒠㒤㒣㒙㒟㒗㒢㒝㒝㒘㒜㒙㒝㒠㒚㒜㒝㒢㒘㒝㒗㒞㒦㒟㒥㒠㒤㒡㒤㒢㒢㒣㒡㒤㒥㒚㒟㒦㒠㒤㒞㒛㒡㒟㒜㒚㒜㒝㒚㒜㒙㒝㒜㒤㒗㒟㒘㒥㒥㒢㒤㒢㒣㒣㒣㒦㒡㒥㒠㒦㒤㒞㒟㒘㒥㒣㒝㒛㒜㒛㒛㒜㒛㒟㒙㒞㒘㒟㒜㒘㒦㒡㒟㒛㒤㒣㒣㒤㒢㒥㒣㒘㒡㒗㒠㒘㒣㒢㒞㒚㒘㒡㒜㒝㒛㒝㒚㒞㒚㒡㒘㒠㒗㒡㒛㒜㒥㒣㒘㒣㒣㒥㒢㒦㒢㒗㒡㒘㒠㒙㒟㒚㒢㒢㒝㒜㒡㒗㒛㒞㒚㒡㒙㒠㒘㒡㒗㒢㒦㒣㒚㒙㒤㒥㒘㒜㒣㒗㒦㒟㒡㒙㒡㒜㒟㒛㒞㒜㒡㒣㒜㒞㒣㒟㒚㒡㒙㒡㒘㒢㒗㒣㒛㒠㒥㒥㒙㒝㒤㒗㒣㒙㒢㒙㒡㒚㒠㒛㒟㒜㒢㒠㒝㒟㒠㒤㒛㒠㒟㒗㒙㒢㒝㒚㒗㒤㒗㒗㒛㒙㒥㒗㒘㒞㒣㒙㒗㒚㒡㒛㒠㒜㒟㒝㒟㒞㒝㒛㒜㒠㒟㒦㒚㒢㒘㒝㒘㒥㒜㒛㒦㒦㒦㒗㒥㒘㒤㒙㒗㒝㒢㒛㒥㒡㒠㒝㒟㒟㒞㒟㒞㒢㒜㒡㒛㒢㒟㒘㒙㒤㒛㒢㒘㒘㒗㒗㒦㒘㒥㒙㒤㒚㒣㒛㒦㒟㒡㒝㒤㒜㒟㒟㒢㒥㒝㒡㒜㒢㒛㒣㒚㒤㒞㒚㒘㒦㒘㒗㒗㒘㒦㒞㒥㒚㒥㒝㒣㒜㒢㒝㒥㒤㒠㒟㒗㒚㒞㒢㒝㒢㒜㒣㒜㒦㒚㒥㒙㒦㒝㒞㒘㒘㒘㒡㒦㒛㒥㒛㒤㒜㒤㒟㒢㒞㒡㒟㒥㒘㒟㒡㒙㒥㒝㒥㒜㒤㒛㒥㒜㒘㒚㒗㒙㒘㒜㒢㒗㒚㒞㒛㒥㒜㒤㒝㒣㒞㒢㒟㒡㒠㒠㒡㒤㒘㒞㒣㒢㒝㒜㒥㒜㒘㒛㒗㒛㒘㒙㒜㒘㒛㒛㒠㒦㒜㒘㒡㒤㒟㒗㒥㒢㒠㒡㒡㒣㒘㒟㒤㒣㒚㒝㒥㒜㒦㒜㒗㒛㒘㒚㒙㒚㒚㒘㒛㒗㒜㒚㒢㒥㒞㒦㒜㒣㒣㒗㒗㒡㒢㒡㒥㒟㒤㒞㒥㒢㒜㒝㒗㒞㒝㒛㒚㒚㒚㒙㒛㒙㒞㒗㒝㒦㒞㒙㒦㒤㒠㒛㒛㒢㒣㒡㒣㒠㒤㒡㒗㒞㒦㒞㒗㒡㒠㒜㒙㒜㒗㒚㒛㒙㒜㒘㒝㒘㒠㒦㒟㒥㒠㒙㒚㒣㒢㒢㒛㒡㒤㒠㒥㒟㒦㒠㒙㒞㒘㒝㒙㒠㒤㒛㒛㒢㒘㒙㒞㒘㒞㒗㒟㒦㒠㒥㒡㒤㒢㒘㒚㒢㒤㒦㒟㒠㒦㒠㒙㒟㒘㒞㒙㒝㒚㒜㒛㒟㒡㒚㒝㒝㒤㒘㒟㒜㒗㒦㒡㒦㒤㒤㒣㒣㒤㒗㒛㒡㒦㒙㒗㒠㒙㒟㒙㒞㒚㒝㒛㒡㒘㒛㒝㒞㒥㒙㒟㒘㒡㒗㒡㒦㒢㒥㒣㒤㒤㒘㒘㒣㒗㒦㒜㒡㒘㒤㒟㒟㒚㒢㒢㒝㒜㒜㒣㒗㒜㒚㒟㒝㒦㒘㒡㒟㒜㒦㒣㒥㒥㒤㒥㒤㒘㒣㒗㒢㒘㒦㒛㒠㒚㒟㒛㒞㒜㒝㒞㒜㒞㒛㒟㒚㒠㒙㒡㒝㒤㒗㒣㒦㒤㒥㒥㒘㒢㒤㒗㒣㒘㒢㒙㒢㒚㒠㒗㒟㒜㒢㒢㒝㒞㒛㒙㒛㒡㒟㒗㒙㒢㒘㒣㒗㒤㒦㒥㒚㒙㒥㒗㒘㒝㒣㒙㒢㒛㒡㒛㒡㒞㒟㒝㒞㒞㒡㒤㒜㒠㒞㒞㒚㒤㒙㒣㒘㒤㒗㒥㒦㒦㒦㒗㒙㒛㒤㒙㒗㒘㒢㒛㒥㒡㒠㒝㒟㒞㒞㒟㒝㒠㒠㒦㒛㒢㒚㒣㒙㒤㒙㒚㒗㒦㒘㒙㒦㒘㒥㒙㒘㒠㒣㒛㒙㒦㒡㒞㒠㒞㒟㒟㒟㒢㒝㒡㒜㒢㒠㒚㒚㒤㒣㒜㒙㒗㒘㒗㒗㒘㒗㒛㒥㒚㒤㒛㒗㒤㒢㒝㒣㒗㒠㒡㒟㒠㒞㒡㒞㒤㒜㒣㒛㒤㒟㒞㒙㒦㒙㒞㒘㒘㒗㒙㒦㒚㒥㒛㒤㒜㒣㒝㒦㒤㒡㒟㒥㒙㒟㒡㒞㒤㒝㒣㒝㒤㒜㒘㒛㒗㒞㒜㒙㒘㒛㒝㒗㒛㒚㒡㒥㒜㒤㒝㒥㒤㒢㒠㒥㒦㒠㒡㒟㒢㒞㒣㒝㒤㒜㒥㒜㒦㒛㒗㒚㒘㒝㒞㒘㒚㒙㒘㒦㒟㒙㒣㒤㒞㒤㒡㒢㒠㒡㒡㒥㒘㒟㒣㒡㒙㒝㒦㒜㒦㒜㒗㒜㒚㒚㒙㒙㒚㒜㒢㒗㒜㒞㒗㒥㒟㒤㒟㒣㒠㒣㒣㒡㒢㒠㒣㒤㒜㒞㒥㒘㒜㒝㒗㒜㒘㒛㒙㒛㒜㒙㒛㒘㒜㒛㒦㒦㒞㒞㒟㒤㒡㒣㒡㒢㒢㒢㒥㒠㒤㒟㒥㒣㒠㒞㒗㒤㒤㒜㒚㒛㒚㒚㒛㒙㒜㒘㒝㒗㒞㒚㒦㒥㒠㒙㒛㒣㒢㒢㒥㒡㒤㒠㒥㒟㒦㒟㒗㒢㒝㒝㒙㒠㒠㒛㒛㒞㒣㒙㒝㒙㒠㒗㒟㒦㒠㒚㒗㒤㒢㒛㒣㒢㒥㒡㒥㒠㒦㒠㒗㒣㒤㒞㒙㒡㒡㒜㒛㒛㒝㒚㒝㒙㒞㒘㒟㒗㒠㒚㒤㒥㒣㒙㒘㒣㒤㒗㒛㒡㒦㒥㒞㒠㒘㒟㒛㒣㒝㒝㒛㒠㒢㒛㒝㒞㒝㒙㒟㒘㒠㒗㒡㒗㒢㒥㒟㒤㒤㒘㒚㒢㒦㒠㒡㒡㒙㒤㒟㒟㒚㒞㒛㒝㒜㒜㒝㒟㒡㒚㒟㒝㒥㒘㒡㒗㒣㒦㒣㒦㒦㒤㒥㒣㒦㒗㒜㒢㒘㒣㒦㒠㒜㒟㒛㒞㒜㒝㒝㒜㒞㒛㒟㒞㒣㒙㒡㒜㒠㒗㒣㒛㒙㒥㒥㒤㒦㒤㒗㒣㒘㒦㒞㒡㒚㒠㒛㒟㒜㒞㒢㒝㒞㒝㒡㒛㒠㒚㒡㒞㒘㒘㒣㒟㒞㒦㒦㒥㒦㒥㒗㒥㒚㒣㒙㒢㒚㒥㒢㒠㒜㒥㒠㒞㒟㒝㒟㒜㒠㒜㒣㒚㒢㒙㒣㒝㒜㒗㒥㒞㒥㒦㒙㒥㒘㒤㒙㒤㒜㒢㒛㒡㒜㒤㒦㒟㒞㒙㒦㒝㒢㒜㒡㒛㒢㒚㒣㒙㒤㒘㒥㒜㒜㒗㒗㒚㒡㒥㒙㒤㒜㒣㒛㒣㒜㒡㒠㒠㒟㒣㒤㒞㒠㒠㒥㒜㒣㒠㒙㒚㒤㒙㒥㒛㒜㒘㒘㒛㒞㒦㒙㒥㒚㒤㒛㒣㒜㒢㒝㒢㒞㒠㒟㒟㒠㒢㒦㒝㒢㒞㒠㒜㒗㒟㒛㒙㒦㒚㒙㒘㒘㒗㒙㒚㒠㒥㒛㒦㒡㒣㒞㒢㒞㒡㒟㒡㒢㒟㒡㒞㒢㒢㒚㒜㒤㒣㒟㒛㒗㒚㒗㒙㒘㒙㒛㒗㒚㒦㒛㒙㒤㒤㒝㒘㒙㒢㒠㒡㒠㒠㒡㒠㒤㒞㒣㒝㒤㒡㒞㒛㒦㒢㒢㒚㒘㒙㒙㒘㒚㒘㒝㒦㒜㒥㒝㒙㒘㒣㒟㒛㒦㒡㒢㒠㒢㒟㒣㒞㒤㒝㒥㒜㒦㒠㒞㒛㒘㒞㒣㒙㒚㒘㒝㒗㒜㒦㒝㒥㒞㒤㒟㒗㒥㒢㒡㒦㒘㒠㒣㒤㒛㒞㒥㒟㒘㒝㒗㒜㒘㒟㒟㒚㒚㒡㒛㒘㒝㒗㒝㒦㒞㒥㒟㒙㒜㒣㒡㒗㒙㒡㒣㒠㒥㒟㒥㒞㒦㒞㒗㒝㒘㒠㒜㒛㒛㒞㒠㒙㒜㒜㒣㒗㒞㒚㒦㒥㒠㒤㒣㒘㒥㒢㒣㒦㒚㒠㒥㒥㒝㒟㒗㒞㒘㒝㒙㒝㒚㒛㒞㒚㒝㒝㒢㒘㒞㒦㒙㒦㒡㒚㒗㒤㒢㒣㒣㒟㒢㒡㒥㒥㒙㒠㒗㒣㒝㒞㒙㒝㒛㒜㒛㒜㒞㒚㒝㒙㒞㒜㒢㒗㒠㒥㒠㒥㒢㒤㒣㒣㒤㒤㒥㒡㒦㒡㒗㒤㒛㒟㒙㒢㒝㒝㒛㒘㒙㒛㒝㒛㒠㒙㒟㒘㒠㒛㒦㒦㒢㒝㒝㒤㒥㒣㒥㒢㒦㒣㒙㒡㒘㒠㒙㒣㒠㒞㒛㒞㒠㒜㒝㒛㒞㒚㒟㒚㒢㒘㒡㒗㒢㒛㒚㒥㒤㒛㒚㒤㒘㒣㒗㒢㒘㒢㒛㒠㒚㒟㒛㒢㒤㒝㒝㒚㒤㒛㒡㒚㒠㒙㒡㒘㒢㒗㒣㒦㒤㒚㒚㒤㒦㒘㒟㒣㒘㒢㒛㒡㒚㒠㒛㒟㒜㒞㒝㒡㒡㒜㒟㒟㒥㒚㒡㒙㒤㒘㒣㒘㒦㒦㒥㒥㒦㒙㒛㒤㒘㒥㒤㒢㒜㒡㒛㒠㒜㒟㒝㒠㒗㒝㒟㒠㒣㒛㒡㒞㒥㒙㒣㒝㒘㒗㒥㒘㒘㒙㒢㒥㒘㒘㒞㒣㒚㒠㒙㒡㒝㒠㒝㒟㒞㒞㒟㒣㒦㒜㒡㒟㒥㒚㒣㒞㒗㒘㒥㒜㒛㒗㒗㒦㒞㒡㒗㒤㒚㒗㒠㒢㒜㒘㒘㒠㒞㒟㒠㒞㒠㒝㒢㒜㒢㒛㒣㒟㒦㒙㒥㒘㒦㒘㒗㒚㒗㒦㒙㒥㒚㒤㒛㒣㒜㒗㒚㒡㒟㒤㒢㒟㒠㒢㒦㒝㒢㒜㒤㒛㒤㒜㒥㒚㒝㒙㒗㒜㒛㒗㒙㒚㒘㒥㒛㒚㒣㒣㒞㒢㒞㒡㒟㒠㒠㒣㒦㒞㒢㒝㒣㒜㒤㒜㒗㒚㒦㒛㒙㒙㒘㒘㒙㒛㒠㒦㒛㒜㒦㒤㒞㒣㒞㒢㒟㒢㒢㒠㒡㒟㒢㒣㒚㒝㒤㒢㒛㒜㒘㒛㒗㒚㒘㒚㒛㒘㒚㒗㒛㒚㒤㒥㒝㒤㒦㒣㒠㒢㒠㒡㒡㒡㒤㒟㒣㒞㒤㒢㒞㒜㒦㒚㒗㒛㒚㒚㒙㒙㒚㒘㒛㒗㒜㒦㒝㒙㒤㒤㒟㒘㒙㒢㒡㒡㒤㒠㒣㒠㒤㒞㒥㒝㒦㒡㒜㒜㒘㒞㒝㒚㒛㒝㒡㒘㒜㒗㒟㒛㒡㒥㒟㒘㒦㒣㒡㒤㒙㒡㒣㒠㒤㒟㒥㒟㒦㒞㒡㒝㒘㒠㒞㒛㒚㒘㒥㒙㒝㒜㒣㒗㒞㒦㒟㒥㒠㒤㒡㒗㒥㒢㒣㒦㒙㒠㒥㒠㒗㒟㒗㒠㒘㒝㒙㒜㒚㒟㒞㒚㒜㒝㒛㒘㒞㒝㒦㒦㒡㒥㒡㒤㒢㒣㒣㒗㒙㒡㒥㒠㒦㒠㒗㒟㒚㒞㒙㒞㒜㒜㒛㒛㒜㒞㒣㒙㒞㒠㒙㒗㒡㒦㒡㒥㒢㒥㒥㒣㒤㒢㒥㒦㒝㒡㒗㒤㒚㒟㒙㒞㒚㒝㒛㒝㒞㒛㒝㒚㒞㒞㒗㒘㒠㒢㒛㒦㒣㒥㒣㒤㒤㒥㒗㒢㒦㒢㒗㒥㒡㒠㒙㒟㒠㒞㒛㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒝㒗㒗㒢㒛㒜㒥㒤㒥㒗㒣㒦㒤㒗㒢㒘㒡㒙㒤㒟㒟㒛㒡㒠㒝㒞㒠㒤㒛㒟㒚㒦㒥㒟㒘㒢㒜㒙㒦㒤㒛㒙㒤㒦㒤㒘㒣㒘㒢㒚㒡㒚㒠㒛㒤㒞㒞㒝㒝㒞㒜㒟㒟㒜㒚㒡㒙㒢㒘㒣㒘㒤㒦㒡㒥㒦㒙㒜㒤㒘㒡㒣㒢㒛㒥㒡㒠㒜㒟㒝㒞㒞㒝㒟㒠㒣㒛㒡㒟㒗㒙㒣㒘㒥㒗㒥㒘㒘㒦㒗㒥㒘㒘㒞㒣㒚㒘㒚㒡㒜㒠㒝㒟㒞㒞㒟㒝㒠㒜㒡㒟㒥㒚㒣㒝㒤㒘㒥㒜㒛㒗㒗㒦㒘㒥㒙㒤㒚㒗㒠㒢㒜㒡㒝㒠㒞㒟㒥㒞㒠㒞㒣㒜㒢㒛㒣㒟㒚㒙㒥㒠㒠㒘㒘㒗㒘㒦㒙㒦㒜㒤㒛㒣㒜㒦㒤㒡㒞㒙㒠㒟㒢㒞㒡㒝㒢㒝㒥㒛㒤㒚㒥㒞㒞㒙㒗㒢㒝㒗㒛㒦㒚㒥㒛㒥㒞㒣㒝㒢㒞㒦㒘㒠㒠㒝㒡㒞㒤㒝㒣㒜㒤㒛㒥㒚㒦㒚㒗㒝㒞㒘㒙㒛㒣㒦㒛㒥㒞㒤㒝㒤㒞㒢㒢㒡㒡㒤㒦㒟㒢㒢㒗㒝㒥㒡㒛㒛㒦㒜㒙㒟㒙㒙㒙㒜㒠㒗㒛㒞㒗㒥㒞㒤㒞㒣㒟㒣㒢㒡㒡㒠㒢㒤㒚㒞㒤㒙㒠㒝㒗㒜㒗㒛㒘㒚㒙㒙㒚㒘㒛㒛㒢㒦㒝㒙㒤㒤㒟㒘㒗㒢㒡㒣㒢㒠㒣㒟㒤㒣㒛㒝㒦㒡㒝㒜㒘㒛㒚㒚㒛㒚㒛㒘㒜㒗㒝㒚㒣㒥㒟㒦㒝㒣㒤㒗㒘㒡㒣㒡㒦㒟㒥㒞㒦㒢㒝㒝㒘㒤㒛㒛㒚㒚㒛㒙㒜㒘㒝㒗㒞㒦㒟㒚㒗㒤㒡㒣㒢㒢㒣㒡㒤㒠㒥㒟㒦㒟㒗㒞㒘㒡㒞㒜㒚㒟㒡㒚㒜㒝㒤㒘㒞㒘㒡㒦㒠㒥㒡㒙㒘㒣㒣㒥㒙㒡㒦㒠㒦㒠㒗㒠㒚㒞㒙㒝㒚㒠㒢㒛㒜㒢㒗㒙㒟㒘㒟㒗㒠㒗㒣㒙㒙㒤㒣㒘㒜㒢㒥㒚㒦㒡㒙㒠㒘㒟㒙㒟㒜㒝㒛㒜㒜㒟㒦㒚㒞㒝㒤㒘㒢㒗㒡㒦㒢㒦㒥㒤㒤㒣㒥㒗㒠㒢㒗㒡㒢㒠㒚㒟㒚㒞㒛㒝㒜㒜㒝㒛㒞㒞㒦㒙㒠㒝㒛㒗㒢㒦㒥㒥㒤㒤㒥㒣㒦㒣㒗㒦㒝㒡㒙㒤㒠㒟㒛㒢㒣㒝㒝㒝㒠㒛㒟㒚㒠㒞㒗㒘㒢㒟㒣㒦㒥㒥㒥㒤㒦㒤㒗㒣㒘㒢㒙㒥㒡㒠㒛㒟㒝㒞㒝㒝㒞㒜㒟㒛㒠㒚㒡㒙㒢㒝㒘㒗㒤㒛㒛㒥㒦㒙㒞㒤㒘㒣㒟㒞㒘㒡㒛㒤㒢㒟㒝㒠㒛㒝㒟㒜㒡㒛㒡㒚㒤㒙㒣㒘㒤㒝㒗㒦㒦㒦㒗㒥㒘㒥㒤㒣㒚㒢㒛㒡㒜㒠㒝㒤㒠㒞㒟㒝㒠㒜㒡㒞㒡㒚㒣㒙㒤㒘㒥㒘㒦㒦㒣㒦㒘㒙㒞㒤㒚㒡㒥㒢㒝㒥㒣㒠㒞㒟㒟㒞㒠㒝㒡㒠㒥㒛㒣㒟㒙㒙㒥㒙㒗㒘㒗㒘㒚㒦㒙㒥㒚㒘㒠㒣㒜㒘㒜㒡㒞㒠㒟㒟㒠㒞㒡㒝㒢㒜㒣㒠㒗㒚㒥㒝㒦㒙㒗㒜㒝㒗㒙㒦㒚㒥㒛㒤㒜㒗㒢㒢㒞㒡㒟㒠㒠㒠㒗㒞㒢㒞㒥㒜㒤㒛㒥㒟㒜㒚㒗㒠㒢㒘㒚㒗㒚㒦㒛㒦㒞㒤㒝㒣㒞㒦㒦㒡㒠㒞㒙㒟㒤㒞㒣㒝㒤㒞㒗㒛㒦㒛㒗㒞㒠㒙㒙㒤㒗㒗㒝㒦㒜㒥㒝㒥㒠㒣㒟㒢㒠㒦㒚㒠㒢㒜㒞㒞㒥㒝㒥㒜㒦㒜㒗㒛㒘㒚㒙㒝㒠㒘㒛㒛㒥㒦㒝㒥㒠㒤㒟㒤㒠㒢㒤㒡㒣㒥㒘㒟㒤㒢㒙㒞㒗㒡㒝㒜㒘㒜㒛㒟㒛㒙㒛㒜㒢㒗㒝㒞㒙㒥㒠㒤㒠㒣㒡㒣㒤㒡㒣㒠㒤㒤㒜㒞㒦㒙㒢㒝㒙㒜㒙㒛㒚㒚㒛㒙㒜㒘㒝㒛㒤㒦㒟㒙㒦㒤㒡㒘㒙㒢㒣㒣㒤㒠㒥㒟㒦㒣㒝㒞㒘㒡㒟㒜㒚㒚㒞㒚㒝㒚㒝㒘㒞㒗㒟㒚㒥㒥㒡㒦㒟㒣㒦㒗㒚㒡㒥㒢㒘㒠㒗㒟㒘㒢㒟㒝㒚㒤㒝㒛㒜㒚㒝㒙㒞㒘㒟㒗㒠㒦㒡㒚㒙㒤㒣㒣㒤㒢㒥㒡㒦㒡㒗㒠㒘㒟㒙㒞㒚㒡㒠㒜㒜㒟㒣㒚㒞㒝㒦㒘㒠㒘㒣㒦㒢㒥㒣㒙㒚㒣㒥㒥㒛㒢㒘㒡㒘㒠㒙㒠㒜㒞㒛㒝㒜㒠㒤㒛㒞㒢㒙㒙㒡㒘㒡㒗㒢㒗㒥㒙㒛㒤㒥㒘㒞㒣㒗㒣㒚㒡㒙㒠㒚㒟㒛㒟㒞㒝㒝㒜㒞㒠㒘㒚㒠㒦㒛㒘㒢㒗㒣㒦㒤㒗㒗㒤㒦㒤㒗㒗㒢㒢㒙㒣㒘㒠㒛㒟㒜㒞㒝㒝㒞㒜㒟㒛㒠㒟㒘㒙㒢㒝㒝㒗㒤㒗㒗㒥㒦㒥㒗㒤㒘㒣㒙㒦㒟㒡㒛㒤㒢㒟㒝㒢㒥㒝㒟㒝㒢㒛㒡㒚㒢㒞㒙㒘㒤㒟㒥㒗㒗㒦㒗㒥㒘㒤㒙㒣㒚㒢㒛㒥㒣㒠㒝㒟㒟㒞㒟㒝㒠㒜㒡㒛㒢㒚㒣㒙㒤㒝㒚㒗㒦㒛㒝㒦㒘㒙㒠㒤㒚㒣㒡㒞㒚㒡㒝㒤㒤㒟㒟㒟㒞㒝㒡㒜㒣㒛㒣㒚㒦㒙㒥㒘㒦㒝㒙㒗㒘㒦㒙㒥㒚㒦㒗㒣㒜㒢㒝㒡㒞㒠㒟㒤㒢㒞㒡㒝㒢㒜㒣㒞㒣㒚㒥㒙㒦㒙㒗㒙㒘㒦㒥㒦㒚㒙㒠㒤㒜㒢㒗㒢㒟㒥㒥㒠㒠㒟㒡㒞㒢㒝㒣㒡㒗㒛㒥㒟㒛㒚㒗㒙㒙㒘㒙㒘㒜㒦㒛㒥㒜㒘㒢㒣㒞㒘㒞㒡㒠㒠㒡㒟㒢㒞㒣㒝㒤㒜㒥㒠㒙㒛㒗㒞㒘㒙㒙㒜㒟㒗㒛㒦㒜㒥㒝㒤㒞㒗㒤㒢㒠㒡㒡㒠㒢㒠㒙㒞㒤㒟㒗㒜㒦㒜㒗㒟㒞㒚㒙㒠㒤㒘㒜㒗㒜㒦㒝㒦㒠㒤㒟㒣㒠㒗㒘㒡㒢㒜㒚㒟㒤㒞㒥㒝㒦㒞㒙㒜㒘㒛㒙㒞㒢㒙㒛㒛㒜㒗㒞㒦㒞㒥㒟㒥㒢㒣㒡㒢㒢㒦㒜㒠㒤㒤㒜㒟㒗㒞㒗㒝㒘㒜㒙㒛㒚㒚㒛㒝㒢㒘㒝㒜㒗㒦㒟㒥㒢㒤㒡㒤㒢㒢㒦㒡㒥㒥㒚㒟㒦㒢㒛㒞㒙㒡㒟㒜㒚㒜㒝㒟㒝㒙㒝㒜㒤㒗㒟㒞㒛㒥㒢㒤㒢㒣㒣㒣㒦㒡㒥㒠㒦㒤㒞㒟㒘㒙㒤㒝㒛㒜㒛㒛㒜㒚㒝㒙㒞㒘㒟㒛㒦㒦㒡㒚㒘㒤㒣㒘㒛㒢㒥㒣㒦㒡㒗㒠㒘㒣㒟㒞㒚㒡㒡㒜㒜㒗㒜㒚㒟㒚㒟㒘㒠㒗㒡㒛㒗㒥㒣㒦㒡㒤㒘㒗㒜㒢㒗㒢㒚㒠㒙㒟㒚㒢㒡㒝㒜㒤㒟㒛㒞㒚㒟㒙㒠㒘㒡㒗㒢㒦㒣㒚㒛㒤㒥㒣㒦㒣㒗㒢㒘㒡㒙㒠㒚㒟㒛㒞㒜㒡㒢㒜㒞㒟㒥㒚㒠㒞㒘㒘㒢㒘㒥㒦㒤㒥㒥㒙㒜㒤㒗㒥㒝㒢㒚㒡㒚㒠㒛㒠㒞㒞㒝㒝㒞㒠㒦㒛㒠㒢㒛㒙㒣㒘㒣㒗㒤㒘㒗㒙㒝㒥㒗㒘㒠㒣㒙㒣㒚㒡㒝㒠㒜㒟㒝㒟㒠㒝㒟㒜㒠㒠㒚㒚㒢㒗㒣㒘㒥㒗㒥㒦㒦㒗㒙㒥㒘㒤㒙㒗㒤㒢㒛㒘㒙㒠㒝㒟㒞㒞㒟㒝㒠㒜㒡㒛㒢㒟㒚㒙㒤㒝㒟㒗㒦㒗㒙㒦㒘㒥㒙㒤㒚㒣㒛㒦㒡㒡㒝㒤㒤㒟㒟㒣㒗㒝㒡㒝㒤㒛㒣㒚㒤㒞㒛㒘㒦㒠㒗㒗㒙㒦㒙㒥㒚㒤㒛㒣㒜㒢㒝㒥㒥㒠㒟㒟㒡㒞㒡㒝㒢㒜㒣㒛㒤㒚㒥㒙㒦㒝㒜㒘㒘㒛㒟㒦㒚㒙㒢㒤㒜㒣㒣㒞㒜㒡㒟㒤㒦㒟㒡㒦㒛㒝㒣㒜㒥㒛㒥㒛㒘㒚㒗㒙㒘㒝㒛㒗㒚㒦㒛㒥㒜㒦㒚㒣㒞㒢㒟㒡㒠㒠㒡㒤㒤㒞㒣㒝㒤㒜㒥㒞㒥㒛㒗㒚㒘㒙㒙㒙㒚㒗㒗㒦㒜㒙㒢㒤㒞㒢㒙㒢㒡㒦㒗㒠㒢㒟㒣㒞㒤㒝㒥㒡㒙㒜㒗㒟㒝㒚㒙㒙㒛㒘㒛㒘㒞㒦㒝㒥㒞㒘㒤㒣㒠㒘㒠㒡㒢㒠㒣㒟㒤㒞㒥㒝㒦㒝㒗㒠㒛㒛㒙㒞㒚㒙㒛㒜㒡㒗㒝㒦㒞㒥㒟㒤㒠㒗㒦㒢㒢㒡㒣㒠㒤㒠㒛㒞㒦㒟㒙㒝㒘㒜㒙㒟㒠㒚㒛㒠㒦㒘㒞㒗㒞㒦㒟㒦㒢㒤㒡㒣㒢㒗㒚㒡㒤㒦㒛㒟㒦㒟㒗㒞㒘㒞㒛㒜㒚㒛㒛㒞㒤㒙㒝㒟㒙㒗㒟㒦㒠㒥㒡㒥㒤㒣㒣㒢㒤㒦㒞㒠㒦㒗㒣㒟㒙㒞㒙㒝㒚㒜㒛㒛㒜㒚㒝㒝㒤㒘㒟㒜㒙㒦㒡㒥㒤㒤㒣㒤㒤㒣㒘㒢㒗㒥㒜㒠㒘㒢㒝㒞㒛㒡㒡㒜㒜㒜㒟㒟㒟㒙㒟㒜㒦㒗㒡㒞㒝㒥㒤㒤㒤㒣㒥㒤㒘㒢㒗㒡㒘㒤㒠㒟㒚㒙㒦㒝㒝㒜㒝㒛㒞㒚㒟㒙㒠㒘㒡㒜㒘㒦㒣㒚㒚㒤㒥㒘㒝㒣㒗㒤㒘㒡㒙㒠㒚㒣㒡㒞㒜㒡㒣㒜㒞㒤㒘㒚㒢㒚㒡㒘㒢㒗㒣㒛㒙㒥㒥㒦㒣㒤㒚㒗㒞㒢㒙㒢㒜㒠㒛㒟㒜㒢㒣㒝㒞㒤㒡㒛㒠㒚㒡㒙㒢㒘㒣㒗㒤㒦㒥㒚㒝㒥㒗㒤㒘㒣㒙㒢㒚㒡㒛㒠㒜㒟㒝㒞㒞㒡㒤㒜㒠㒠㒗㒚㒢㒞㒚㒘㒤㒙㒗㒦㒦㒦㒗㒙㒞㒤㒙㒥㒟㒢㒜㒡㒜㒠㒝㒠㒠㒞㒟㒝㒠㒡㒘㒛㒢㒢㒝㒙㒥㒘㒥㒗㒦㒘㒙㒙㒟㒥㒙㒘㒢㒣㒛㒤㒚㒡㒟㒠㒞㒟㒟㒟㒢㒝㒡㒜㒢㒠㒜㒚㒤㒜㒟㒙㒘㒘㒗㒗㒘㒗㒛㒥㒚㒤㒛㒗㒦㒢㒝㒢㒥㒠㒟㒟㒠㒞㒡㒝㒢㒜㒣㒛㒤㒟㒜㒙㒦㒝㒡㒘㒘㒗㒛㒦㒚㒥㒛㒤㒜㒣㒝㒦㒣㒡㒟㒤㒦㒟㒡㒣㒙㒝㒣㒝㒦㒛㒥㒚㒦㒞㒝㒙㒘㒠㒙㒗㒛㒦㒛㒥㒜㒤㒝㒣㒞㒢㒟㒦㒗㒠㒡㒟㒣㒞㒣㒝㒤㒜㒥㒛㒦㒛㒗㒚㒘㒝㒞㒘㒚㒛㒡㒦㒜㒙㒤㒤㒞㒣㒥㒞㒞㒡㒡㒥㒘㒟㒣㒡㒚㒝㒥㒝㒗㒜㒗㒛㒚㒚㒙㒙㒚㒝㒝㒗㒜㒦㒝㒥㒞㒦㒙㒣㒠㒢㒡㒡㒢㒠㒣㒤㒦㒞㒥㒝㒦㒝㒗㒟㒗㒛㒙㒚㒚㒙㒛㒙㒜㒗㒙㒦㒞㒙㒤㒤㒠㒢㒛㒢㒣㒦㒙㒠㒤㒟㒥㒞㒦㒞㒗㒡㒛㒜㒙㒟㒟㒚㒛㒙㒝㒘㒝㒘㒠㒦㒟㒥㒠㒘㒦㒣㒢㒘㒢㒡㒤㒠㒥㒟㒦㒟㒗㒞㒘㒝㒙㒠㒝㒛㒛㒞㒜㒙㒝㒜㒣㒗㒟㒦㒠㒥㒡㒤㒢㒘㒘㒢㒤㒡㒥㒠㒦㒠㒝㒟㒘㒟㒛㒝㒚㒜㒛㒟㒢㒚㒝㒡㒘㒘㒠㒗㒠㒦㒡㒦㒤㒤㒣㒣㒤㒗㒜㒡㒦㒣㒜㒠㒚㒟㒙㒞㒚㒞㒝㒜㒜㒛㒝㒞㒦㒙㒟㒞㒗㒗㒣㒦㒢㒥㒣㒥㒦㒣㒥㒢㒦㒦㒠㒡㒘㒚㒟㒟㒜㒞㒛㒝㒜㒜㒝㒛㒞㒚㒟㒝㒦㒘㒡㒜㒛㒦㒣㒥㒦㒤㒥㒤㒦㒣㒚㒢㒙㒥㒞㒠㒚㒢㒟㒞㒝㒡㒣㒜㒞㒜㒡㒟㒡㒙㒡㒝㒘㒗㒣㒞㒟㒥㒦㒤㒦㒤㒗㒤㒚㒢㒙㒡㒚㒤㒢㒟㒜㒚㒘㒝㒟㒜㒟㒛㒠㒚㒡㒙㒢㒘㒣㒜㒚㒦㒥㒚㒜㒥㒗㒘㒟㒣㒙㒤㒚㒡㒛㒠㒜㒣㒣㒞㒞㒡㒥㒜㒠㒟㒘㒚㒢㒚㒣㒘㒤㒗㒥㒛㒛㒦㒗㒦㒥㒤㒜㒗㒠㒢㒛㒢㒞㒠㒝㒟㒞㒢㒥㒝㒠㒤㒣㒛㒢㒚㒣㒙㒤㒘㒥㒗㒦㒗㒗㒚㒟㒥㒙㒤㒚㒣㒛㒢㒜㒡㒝㒠㒞㒟㒟㒞㒠㒡㒦㒜㒢㒠㒙㒚㒤㒞㒜㒘㒦㒙㒙㒗㒘㒦㒙㒙㒠㒤㒛㒥㒡㒢㒞㒡㒞㒠㒟㒠㒢㒞㒡㒝㒢㒡㒚㒛㒤㒢㒟㒚㒗㒙㒗㒘㒘㒘㒛㒙㒡㒥㒛㒘㒤㒣㒝㒘㒘㒡㒟㒠㒠㒟㒡㒟㒤㒝㒣㒜㒤㒠㒞㒚㒦㒟㒚㒙㒚㒘㒙㒗㒚㒗㒝㒥㒜㒤㒝㒘㒘㒢㒟㒟㒛㒠㒢㒟㒢㒞㒣㒝㒤㒜㒥㒛㒦㒟㒞㒚㒘㒝㒣㒘㒚㒗㒝㒦㒜㒥㒝㒤㒞㒣㒟㒦㒥㒡㒡㒥㒘㒟㒣㒣㒛㒝㒥㒞㒘㒜㒗㒛㒘㒞㒟㒙㒚㒠㒛㒗㒝㒦㒝㒥㒞㒤㒟㒣㒠㒢㒡㒦㒙㒠㒣㒟㒥㒞㒥㒝㒦㒝㒗㒜㒘㒛㒙㒚㒚㒝㒠㒘㒜㒛㒣㒦㒞㒙㒦㒤㒠㒤㒗㒞㒠㒡㒣㒥㒚㒟㒥㒡㒞㒞㒗㒝㒙㒜㒙㒛㒜㒚㒛㒙㒜㒝㒟㒗㒞㒦㒟㒥㒠㒦㒟㒣㒢㒢㒣㒡㒤㒠㒥㒥㒘㒟㒗㒞㒘㒝㒙㒟㒙㒛㒛㒚㒜㒙㒝㒙㒞㒗㒛㒦㒠㒙㒦㒤㒢㒢㒝㒢㒥㒦㒛㒠㒦㒠㒗㒟㒘㒞㒙㒡㒝㒜㒛㒟㒡㒚㒝㒙㒟㒘㒟㒘㒢㒦㒡㒥㒢㒙㒘㒣㒤㒘㒤㒡㒦㒡㒗㒠㒘㒟㒙㒞㒚㒝㒛㒠㒟㒛㒝㒞㒞㒙㒟㒜㒥㒗㒡㒦㒢㒥㒣㒤㒤㒘㒚㒢㒦㒢㒗㒡㒘㒠㒟㒟㒚㒟㒝㒝㒜㒜㒝㒟㒤㒚㒟㒡㒚㒘㒢㒗㒢㒦㒣㒦㒦㒤㒥㒣㒦㒗㒞㒢㒘㒟㒜㒠㒛㒟㒛㒞㒜㒞㒟㒜㒞㒛㒟㒟㒘㒙㒡㒚㒞㒗㒤㒦㒤㒥㒥㒦㒘㒤㒗㒣㒘㒦㒢㒡㒚㒢㒦㒟㒝㒞㒝㒝㒞㒜㒟㒛㒠㒚㒡㒞㒘㒘㒣㒜㒝㒦㒥㒦㒘㒥㒗㒥㒘㒣㒜㒢㒛㒥㒠㒠㒜㒢㒡㒞㒟㒡㒥㒜㒠㒜㒣㒟㒣㒙㒣㒝㒚㒗㒥㒞㒡㒦㒘㒥㒘㒤㒙㒤㒜㒢㒛㒡㒜㒤㒤㒟㒞㒚㒚㒝㒡㒜㒡㒛㒢㒚㒣㒙㒤㒘㒥㒜㒜㒗㒗㒚㒞㒥㒙㒘㒡㒣㒛㒤㒜㒡㒝㒠㒞㒣㒥㒞㒠㒢㒗㒜㒢㒤㒚㒚㒤㒚㒥㒘㒦㒘㒗㒛㒝㒦㒙㒗㒗㒤㒞㒗㒢㒢㒝㒢㒠㒠㒟㒟㒠㒣㒗㒝㒢㒤㒥㒛㒤㒚㒥㒙㒦㒙㒗㒘㒘㒗㒙㒚㒡㒥㒛㒤㒜㒣㒝㒢㒞㒡㒟㒠㒠㒟㒡㒞㒢㒢㒘㒜㒤㒠㒛㒚㒦㒞㒞㒙㒘㒙㒛㒗㒚㒦㒛㒙㒢㒤㒝㒥㒣㒢㒠㒡㒠㒠㒡㒠㒤㒞㒣㒝㒤㒡㒜㒛㒦㒢㒡㒚㒙㒙㒙㒘㒚㒘㒝㒙㒣㒥㒝㒘㒦㒣㒟㒡㒘㒡㒢㒠㒢㒟㒣㒟㒦㒝㒥㒜㒦㒠㒠㒛㒘㒟㒥㒙㒚㒘㒛㒗㒜㒗㒟㒥㒞㒤㒟㒘㒚㒢㒡㒢㒜㒠㒤㒟㒤㒞㒥㒝㒦㒝㒗㒜㒘㒟㒠㒚㒚㒝㒥㒘㒜㒗㒟㒦㒞㒥㒟㒤㒠㒣㒡㒗㒗㒡㒣㒥㒚㒟㒥㒣㒝㒞㒗㒞㒚㒜㒙㒛㒚㒞㒡㒙㒜㒠㒝㒗㒟㒦㒟㒥㒠㒤㒡㒣㒢㒢㒣㒦㒛㒠㒥㒠㒗㒟㒗㒞㒘㒝㒙㒜㒚㒛㒛㒚㒜㒝㒢㒘㒞㒛㒥㒦㒠㒚㒘㒤㒢㒤㒙㒞㒢㒡㒥㒥㒜㒠㒗㒤㒢㒞㒙㒝㒛㒜㒛㒛㒞㒚㒝㒙㒞㒝㒡㒗㒠㒦㒡㒥㒢㒦㒢㒣㒤㒢㒥㒡㒦㒡㒗㒥㒚㒟㒙㒞㒚㒝㒛㒟㒛㒛㒝㒚㒞㒙㒟㒙㒠㒗㒝㒦㒢㒚㒘㒤㒤㒢㒟㒣㒗㒦㒝㒡㒘㒠㒙㒟㒚㒞㒛㒡㒟㒜㒝㒟㒣㒚㒟㒙㒡㒘㒡㒘㒤㒦㒣㒥㒤㒙㒚㒣㒦㒘㒦㒢㒘㒡㒙㒠㒚㒟㒛㒞㒜㒝㒝㒠㒡㒛㒟㒞㒠㒙㒡㒝㒗㒗㒣㒦㒤㒥㒥㒤㒦㒘㒜㒣㒘㒢㒙㒡㒚㒠㒡㒟㒜㒟㒟㒝㒞㒜㒟㒟㒦㒚㒡㒡㒜㒘㒤㒗㒤㒦㒥㒗㒘㒥㒗㒤㒘㒗㒠㒢㒚㒘㒛㒠㒞㒟㒝㒞㒞㒞㒡㒜㒠㒛㒡㒟㒚㒙㒣㒡㒢㒗㒦㒦㒦㒦㒗㒦㒚㒤㒙㒣㒚㒦㒤㒡㒜㒟㒤㒟㒟㒞㒟㒝㒠㒜㒡㒛㒢㒚㒣㒞㒚㒘㒥㒜㒟㒗㒗㒦㒚㒥㒙㒥㒚㒣㒞㒢㒝㒥㒢㒠㒞㒢㒣㒞㒡㒢㒗㒜㒢㒜㒥㒟㒥㒙㒥㒝㒜㒘㒗㒞㒣㒦㒚㒥㒚㒤㒛㒤㒞㒢㒝㒡㒞㒤㒦㒟㒠㒚㒜㒝㒣㒜㒣㒛㒤㒚㒥㒙㒦㒙㒗㒜㒞㒗㒙㒚㒠㒥㒛㒘㒣㒣㒝㒤㒞㒡㒟㒠㒠㒤㒗㒞㒢㒢㒙㒜㒤㒦㒟㒚㒦㒛㒗㒙㒘㒘㒙㒛㒟㒦㒛㒗㒙㒤㒠㒗㒤㒢㒟㒢㒢㒠㒡㒟㒢㒣㒙㒝㒤㒥㒗㒛㒦㒛㒗㒚㒘㒙㒙㒘㒚㒗㒛㒚㒣㒥㒝㒤㒞㒣㒟㒢㒠㒡㒡㒠㒢㒟㒣㒞㒤㒢㒚㒜㒦㒠㒝㒛㒘㒞㒠㒙㒚㒙㒝㒗㒜㒦㒝㒙㒤㒤㒟㒥㒥㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒡㒞㒜㒘㒢㒣㒚㒛㒙㒛㒘㒜㒘㒟㒙㒥㒥㒟㒙㒘㒣㒡㒣㒚㒡㒦㒠㒤㒟㒥㒠㒘㒞㒗㒝㒘㒠㒢㒛㒚㒗㒛㒙㒜㒘㒝㒗㒞㒗㒡㒥㒠㒤㒡㒘㒜㒢㒣㒗㒙㒠㒦㒟㒦㒟㒗㒞㒘㒝㒙㒜㒚㒟㒢㒚㒜㒞㒗㒘㒞㒗㒡㒦㒠㒥㒡㒤㒢㒣㒣㒗㒙㒡㒥㒥㒜㒠㒗㒣㒟㒞㒙㒞㒜㒜㒛㒛㒜㒞㒣㒙㒞㒠㒟㒗㒡㒦㒡㒥㒢㒤㒣㒣㒤㒢㒥㒦㒝㒡㒗㒠㒙㒟㒙㒞㒚㒝㒛㒜㒜㒛㒝㒚㒞㒝㒤㒘㒠㒜㒗㒦㒢㒚㒚㒤㒤㒤㒛㒞㒤㒢㒗㒥㒞㒠㒙㒢㒥㒞㒛㒝㒝㒜㒝㒛㒠㒚㒟㒙㒠㒝㒣㒗㒢㒦㒣㒥㒤㒦㒥㒣㒦㒣㒗㒢㒘㒡㒙㒥㒜㒟㒛㒞㒜㒝㒝㒟㒝㒛㒟㒚㒠㒙㒡㒙㒢㒗㒟㒦㒤㒚㒚㒤㒦㒢㒡㒣㒙㒦㒟㒡㒚㒠㒛㒟㒜㒞㒝㒡㒡㒜㒟㒟㒥㒚㒡㒙㒣㒘㒣㒘㒦㒦㒥㒥㒦㒙㒜㒤㒘㒙㒘㒢㒚㒡㒛㒠㒜㒟㒝㒞㒞㒝㒟㒠㒣㒛㒡㒞㒢㒙㒣㒝㒙㒗㒥㒦㒦㒦㒗㒥㒘㒘㒞㒣㒚㒢㒛㒡㒜㒠㒣㒟㒞㒟㒡㒝㒠㒜㒡㒠㒘㒚㒣㒡㒞㒘㒦㒗㒦㒗㒗㒗㒚㒥㒙㒤㒚㒗㒢㒢㒜㒢㒚㒠㒟㒟㒟㒞㒠㒞㒣㒜㒢㒛㒣㒟㒜㒙㒥㒣㒢㒘㒗㒗㒘㒦㒙㒦㒜㒤㒛㒣㒜㒦㒦㒡㒞㒜㒝㒟㒢㒞㒡㒝㒢㒜㒣㒛㒤㒚㒥㒞㒜㒙㒗㒜㒡㒗㒙㒦㒜㒥㒛㒥㒜㒣㒠㒢㒟㒥㒤㒠㒠㒢㒥㒞㒣㒢㒙㒜㒤㒝㒗㒠㒗㒚㒗㒝㒞㒘㒙㒞㒥㒦㒜㒥㒜㒤㒝㒤㒠㒢㒟㒡㒠㒥㒘㒟㒢㒚㒞㒝㒥㒜㒥㒛㒦㒛㒗㒚㒘㒙㒙㒜㒠㒗㒛㒚㒢㒥㒝㒘㒥㒣㒟㒤㒠㒡㒡㒠㒢㒤㒙㒞㒤㒢㒛㒜㒦㒦㒜㒛㒘㒛㒙㒙㒚㒘㒛㒛㒡㒦㒝㒗㒛㒤㒢㒗㒦㒢㒡㒢㒤㒠㒣㒟㒤㒣㒛㒝㒦㒥㒙㒜㒘㒛㒙㒚㒚㒙㒛㒘㒜㒗㒝㒚㒥㒥㒟㒤㒠㒣㒡㒢㒢㒡㒣㒠㒤㒟㒥㒞㒦㒢㒜㒝㒘㒠㒟㒛㒚㒞㒢㒙㒜㒙㒟㒗㒞㒦㒟㒙㒦㒤㒡㒦㒗㒢㒤㒡㒤㒠㒥㒡㒘㒟㒗㒞㒘㒡㒠㒜㒚㒢㒥㒚㒝㒙㒝㒘㒞㒘㒡㒚㒗㒥㒡㒙㒚㒣㒣㒞㒤㒡㒦㒠㒦㒠㒗㒠㒚㒞㒙㒝㒚㒠㒤㒛㒜㒝㒤㒙㒟㒘㒟㒗㒠㒗㒣㒥㒢㒤㒣㒘㒞㒢㒥㒟㒦㒡㒙㒠㒘㒟㒙㒞㒚㒝㒛㒜㒜㒟㒤㒚㒞㒞㒙㒘㒠㒗㒣㒦㒢㒥㒣㒤㒤㒣㒥㒗㒛㒢㒗㒥㒞㒠㒙㒣㒡㒞㒛㒞㒞㒜㒝㒛㒞㒞㒥㒙㒠㒠㒡㒗㒣㒦㒣㒥㒤㒤㒥㒣㒦㒣㒗㒦㒟㒡㒙㒠㒛㒟㒛㒞㒜㒝㒝㒜㒞㒛㒟㒚㒠㒝㒦㒘㒢㒜㒙㒦㒤㒚㒜㒤㒦㒤㒝㒞㒦㒢㒙㒥㒠㒠㒛㒦㒛㒞㒝㒝㒟㒜㒟㒛㒢㒚㒡㒙㒢㒝㒥㒗㒤㒦㒥㒥㒦㒗㒘㒤㒘㒣㒙㒢㒚㒡㒛㒥㒞㒟㒝㒞㒞㒝㒟㒟㒟㒛㒡㒚㒢㒙㒣㒙㒤㒗㒡㒦㒦㒚㒜㒥㒘㒢㒣㒣㒛㒦㒡㒡㒜㒠㒝㒟㒞㒞㒟㒡㒣㒜㒡㒠㒗㒚㒣㒙㒥㒘㒥㒙㒘㒗㒗㒦㒘㒙㒞㒤㒚㒙㒚㒢㒜㒡㒝㒠㒞㒟㒟㒞㒠㒝㒡㒠㒥㒛㒣㒞㒤㒙㒥㒝㒛㒘㒗㒗㒘㒦㒙㒥㒚㒘㒠㒣㒜㒢㒝㒡㒞㒠㒥㒟㒠㒟㒣㒝㒢㒜㒣㒠㒚㒚㒥㒡㒠㒙㒘㒘㒘㒗㒙㒗㒜㒥㒛㒤㒜㒗㒤㒢㒞㒛㒢㒠㒢㒟㒡㒞㒢㒞㒥㒜㒤㒛㒥㒟㒞㒚㒗㒝㒝㒘㒙㒗㒚㒦㒛㒦㒞㒤㒝㒣㒞㒗㒘㒡㒠㒞㒡㒟㒤㒞㒣㒝㒤㒜㒥㒛㒦㒛㒗㒞㒞㒙㒙㒜㒣㒗㒛㒦㒞㒥㒝㒥㒞㒣㒢㒢㒡㒥㒦㒠㒢㒣㒗㒞㒥㒢㒛㒜㒦㒝㒙㒛㒘㒚㒚㒝㒠㒘㒛㒟㒗㒦㒞㒥㒞㒤㒟㒤㒢㒦㒜㒡㒢㒥㒚㒟㒤㒚㒠㒞㒗㒝㒗㒜㒘㒛㒙㒛㒣㒙㒛㒜㒢㒗㒝㒚㒤㒥㒟㒙㒗㒣㒡㒣㒤㒥㒞㒠㒤㒤㒜㒞㒦㒡㒤㒝㒚㒜㒙㒛㒚㒚㒛㒚㒥㒘㒝㒛㒤㒦㒟㒙㒦㒤㒡㒘㒙㒢㒣㒢㒤㒡㒘㒠㒗㒣㒜㒞㒘㒞㒦㒜㒝㒟㒡㒚㒜㒚㒟㒜㒙㒗㒟㒚㒦㒥㒡㒜㒤㒣㒣㒢㒤㒡㒥㒠㒦㒤㒣㒟㒘㒢㒠㒝㒚㒜㒛㒛㒜㒚㒝㒙㒞㒘㒟㒛㒣㒦㒢㒚㒗㒤㒣㒘㒚㒢㒥㒦㒝㒡㒗㒡㒚㒢㒤㒞㒚㒡㒡㒜㒜㒝㒢㒚㒟㒙㒟㒘㒠㒘㒣㒙㒚㒥㒣㒙㒛㒣㒥㒚㒠㒢㒘㒡㒘㒠㒙㒠㒜㒞㒛㒝㒜㒠㒥㒛㒞㒜㒗㒙㒣㒘㒡㒗㒢㒗㒥㒥㒤㒤㒥㒘㒟㒣㒗㒤㒛㒡㒛㒠㒚㒟㒛㒟㒞㒝㒝㒜㒞㒠㒙㒚㒠㒘㒗㒘㒤㒗㒣㒦㒤㒥㒥㒤㒦㒤㒗㒗㒟㒢㒙㒥㒤㒠㒛㒟㒞㒞㒝㒝㒞㒜㒟㒛㒠㒞㒦㒙㒢㒝㒙㒗㒤㒛㒜㒥㒦㒦㒙㒤㒘㒣㒙㒦㒠㒡㒛㒘㒜㒟㒞㒞㒞㒝㒟㒜㒠㒛㒡㒚㒢㒞㒚㒘㒤㒗㒦㒦㒦㒦㒗㒥㒘㒤㒙㒣㒚㒢㒛㒥㒡㒠㒝㒣㒤㒞㒟㒢㒗㒜㒡㒜㒘㒦㒡㒙㒤㒝㒛㒗㒦㒙㒣㒦㒘㒥㒚㒤㒚㒣㒜㒢㒜㒡㒝㒥㒠㒟㒟㒞㒠㒝㒡㒞㒡㒛㒣㒚㒤㒙㒥㒙㒦㒗㒣㒗㒘㒚㒞㒥㒚㒢㒥㒣㒝㒦㒣㒡㒞㒠㒟㒟㒠㒞㒡㒡㒥㒜㒣㒠㒙㒚㒥㒚㒗㒙㒗㒙㒚㒗㒙㒦㒚㒙㒠㒤㒜㒙㒜㒢㒞㒡㒟㒠㒠㒟㒡㒞㒢㒝㒣㒡㒗㒛㒥㒞㒦㒚㒗㒝㒝㒘㒙㒗㒚㒦㒛㒥㒜㒘㒢㒣㒞㒢㒟㒡㒠㒡㒗㒟㒢㒟㒥㒝㒤㒜㒥㒠㒜㒛㒗㒡㒢㒙㒚㒘㒚㒗㒛㒗㒞㒥㒝㒤㒞㒗㒦㒢㒠㒠㒙㒠㒤㒟㒣㒞㒤㒟㒗㒜㒦㒜㒗㒟㒠㒚㒙㒥㒞㒘㒝㒗㒜㒦㒝㒦㒠㒤㒟㒣㒠㒗㒚㒡㒢㒦㒝㒟㒥㒞㒥㒝㒦㒝㒗㒜㒘㒛㒙㒞㒠㒙㒛㒜㒥㒗㒝㒦㒠㒥㒟㒥㒠㒣㒤㒢㒣㒦㒘㒠㒤㒣㒙㒟㒗㒢㒝㒝㒘㒝㒛㒛㒚㒚㒜㒝㒢㒘㒝㒟㒙㒦㒠㒥㒠㒤㒡㒤㒤㒦㒞㒡㒤㒥㒜㒟㒦㒚㒢㒞㒙㒝㒙㒜㒚㒛㒛㒛㒥㒙㒝㒜㒤㒗㒟㒚㒦㒥㒡㒙㒙㒣㒣㒣㒦㒥㒠㒠㒦㒤㒞㒟㒘㒜㒝㒝㒛㒜㒛㒛㒜㒚㒝㒛㒗㒘㒟㒛㒦㒦㒡㒚㒘㒤㒣㒘㒛㒢㒥㒢㒦㒡㒚㒠㒙㒣㒞㒞㒚㒟㒘㒜㒟㒟㒣㒚㒞㒚㒡㒜㒛㒗㒡㒛㒘㒥㒣㒜㒦㒣㒥㒢㒦㒢㒗㒡㒘㒤㒥㒟㒚㒢㒢㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒘㒡㒛㒥㒦㒤㒚㒙㒤㒥㒘㒜㒣㒗㒦㒟㒡㒙㒡㒜㒢㒦㒞㒜㒡㒣㒜㒞㒝㒤㒚㒡㒙㒡㒘㒢㒘㒥㒙㒜㒥㒥㒙㒝㒤㒗㒚㒢㒢㒚㒡㒚㒠㒛㒠㒞㒞㒝㒝㒞㒡㒗㒛㒠㒙㒦㒙㒣㒘㒣㒗㒤㒘㒗㒥㒦㒥㒗㒘㒡㒣㒙㒤㒝㒡㒜㒠㒜㒟㒝㒟㒠㒝㒟㒜㒠㒠㒛㒚㒢㒝㒢㒘㒤㒗㒥㒦㒦㒦㒗㒥㒘㒤㒙㒗㒡㒢㒛㒥㒦㒠㒝㒟㒠㒞㒟㒝㒠㒜㒡㒛㒢㒟㒘㒙㒤㒝㒛㒗㒦㒛㒞㒦㒘㒦㒛㒤㒚㒣㒛㒦㒢㒡㒝㒘㒞㒟㒠㒞㒠㒝㒡㒜㒢㒛㒣㒚㒤㒞㒜㒘㒦㒘㒘㒗㒘㒦㒙㒥㒚㒤㒛㒣㒜㒢㒝㒥㒣㒠㒟㒣㒦㒞㒡㒢㒙㒜㒣㒜㒚㒦㒣㒙㒦㒝㒝㒘㒘㒘㒝㒦㒚㒥㒜㒤㒜㒣㒞㒢㒞㒡㒟㒥㒢㒟㒡㒞㒢㒝㒣㒞㒣㒛㒥㒚㒦㒚㒗㒚㒘㒗㒥㒗㒚㒚㒠㒥㒜㒣㒗㒣㒟㒦㒥㒡㒠㒠㒡㒟㒢㒞㒣㒢㒗㒜㒥㒠㒛㒛㒗㒚㒙㒙㒙㒙㒜㒗㒛㒦㒜㒙㒢㒤㒞㒙㒞㒢㒠㒡㒡㒠㒢㒟㒣㒞㒤㒝㒥㒡㒙㒜㒗㒟㒘㒚㒙㒝㒟㒘㒛㒗㒜㒦㒝㒥㒞㒘㒤㒣㒠㒢㒡㒡㒢㒡㒙㒟㒤㒠㒗㒝㒦㒝㒗㒠㒞㒛㒙㒡㒤㒙㒜㒘㒜㒗㒝㒗㒠㒥㒟㒤㒠㒘㒘㒢㒢㒠㒝㒠㒤㒟㒥㒞㒦㒟㒙㒝㒘㒜㒙㒟㒢㒚㒛㒜㒜㒘㒝㒗㒞㒦㒟㒦㒢㒤㒡㒣㒢㒗㒜㒡㒤㒞㒠㒠㒗㒟㒗㒞㒘㒝㒙㒜㒚㒛㒛㒞㒢㒙㒝㒝㒗㒗㒟㒦㒢㒥㒡㒥㒢㒣㒦㒢㒥㒦㒚㒠㒦㒣㒛㒟㒙㒢㒟㒝㒚㒝㒝㒛㒜㒚㒞㒝㒤㒘㒟㒟㒛㒦㒢㒥㒢㒤㒣㒤㒦㒦㒠㒡㒦㒥㒞㒠㒘㒚㒤㒞㒛㒝㒛㒜㒜㒛㒝㒜㒗㒙㒟㒜㒦㒗㒡㒛㒘㒥㒣㒙㒛㒣㒥㒤㒘㒥㒢㒡㒘㒤㒠㒟㒚㒤㒘㒝㒝㒜㒝㒛㒞㒚㒟㒛㒙㒘㒡㒜㒘㒦㒣㒚㒚㒤㒥㒘㒝㒣㒗㒣㒘㒡㒜㒠㒛㒣㒠㒞㒜㒟㒚㒜㒡㒟㒥㒚㒠㒚㒣㒜㒝㒗㒣㒛㒚㒥㒥㒝㒘㒤㒗㒣㒘㒢㒙㒡㒚㒥㒗㒟㒜㒢㒤㒝㒞㒜㒟㒛㒠㒚㒡㒙㒢㒘㒣㒜㒗㒦㒦㒚㒛㒥㒗㒘㒞㒣㒙㒦㒡㒡㒛㒡㒞㒣㒘㒞㒞㒡㒥㒜㒠㒝㒦㒚㒣㒙㒣㒘㒤㒙㒗㒙㒞㒦㒗㒙㒟㒤㒙㒚㒤㒢㒜㒡㒜㒠㒝㒠㒠㒞㒟㒝㒠㒡㒙㒛㒢㒝㒟㒙㒥㒘㒥㒗㒦㒘㒙㒦㒘㒥㒙㒘㒣㒣㒛㒙㒤㒡㒟㒠㒞㒟㒟㒟㒢㒝㒡㒜㒢㒠㒝㒚㒤㒗㒢㒙㒗㒘㒗㒗㒘㒦㒙㒥㒚㒤㒛㒗㒣㒢㒝㒦㒘㒠㒟㒟㒢㒞㒡㒝㒢㒜㒣㒛㒤㒟㒚㒙㒦㒝㒝㒘㒘㒛㒠㒦㒚㒦㒝㒤㒜㒣㒝㒦㒤㒡㒟㒘㒠㒟㒢㒞㒢㒝㒣㒜㒤㒛㒥㒚㒦㒞㒞㒙㒘㒘㒚㒗㒚㒦㒛㒥㒜㒤㒝㒣㒞㒢㒟㒥㒥㒠㒡㒤㒘㒞㒣㒢㒛㒜㒥㒜㒜㒦㒥㒚㒘㒝㒟㒘㒚㒛㒢㒦㒜㒥㒞㒤㒞㒣㒠㒢㒠㒡㒡㒥㒤㒟㒣㒞㒤㒝㒥㒞㒥㒜㒗㒛㒘㒚㒙㒚㒚㒘㒞㒗㒝㒚㒢㒥㒞㒣㒙㒣㒡㒗㒗㒡㒢㒠㒣㒤㒡㒞㒦㒢㒙㒝㒗㒠㒝㒛㒙㒚㒛㒙㒛㒙㒞㒛㒘㒦㒞㒙㒤㒤㒠㒘㒣㒢㒢㒡㒣㒠㒤㒟㒥㒥㒜㒞㒗㒡㒛㒜㒙㒟㒙㒚㒛㒝㒡㒘㒝㒘㒠㒦㒜㒥㒠㒘㒦㒣㒢㒚㒝㒡㒥㒠㒥㒟㒦㒠㒙㒞㒘㒝㒙㒠㒠㒛㒛㒣㒣㒙㒝㒘㒞㒗㒟㒗㒢㒥㒡㒤㒢㒘㒚㒢㒤㒢㒠㒡㒗㒠㒗㒟㒘㒟㒛㒝㒚㒜㒛㒟㒤㒚㒝㒞㒣㒘㒟㒗㒠㒦㒡㒥㒢㒤㒣㒣㒤㒗㒚㒡㒦㒥㒟㒠㒘㒟㒛㒞㒚㒞㒝㒜㒜㒛㒝㒞㒤㒙㒟㒠㒚㒗㒢㒦㒢㒥㒣㒥㒦㒣㒥㒢㒦㒦㒞㒡㒘㒡㒟㒟㒚㒞㒛㒝㒜㒝㒟㒛㒞㒚㒟㒞㒘㒘㒡㒠㒝㒦㒣㒥㒤㒤㒥㒥㒘㒣㒗㒢㒘㒥㒢㒠㒚㒛㒞㒞㒜㒝㒝㒜㒞㒛㒟㒚㒠㒙㒡㒝㒘㒗㒣㒛㒝㒥㒥㒥㒘㒤㒗㒣㒘㒦㒦㒡㒛㒤㒞㒟㒜㒢㒣㒝㒞㒜㒠㒛㒠㒜㒡㒚㒙㒘㒣㒜㒗㒦㒥㒙㒥㒥㒗㒜㒚㒣㒚㒢㒚㒡㒛㒠㒜㒣㒢㒞㒞㒝㒟㒜㒠㒛㒦㒚㒢㒚㒥㒘㒤㒗㒥㒛㒜㒦㒗㒜㒢㒤㒚㒣㒚㒢㒛㒢㒞㒠㒝㒟㒞㒢㒦㒝㒠㒠㒘㒛㒤㒚㒣㒙㒤㒚㒗㒗㒦㒗㒗㒚㒠㒥㒙㒤㒙㒣㒜㒢㒜㒡㒝㒡㒠㒟㒟㒞㒠㒢㒚㒜㒢㒙㒢㒚㒤㒙㒥㒘㒦㒘㒗㒗㒘㒦㒙㒙㒠㒤㒛㒗㒥㒢㒝㒡㒠㒠㒟㒠㒠㒞㒡㒝㒢㒡㒘㒛㒤㒞㒙㒚㒗㒝㒝㒘㒘㒘㒙㒦㒝㒥㒜㒘㒡㒣㒝㒤㒛㒡㒢㒣㒤㒟㒡㒞㒢㒗㒣㒜㒤㒠㒛㒚㒦㒚㒗㒙㒘㒘㒙㒗㒚㒗㒛㒥㒜㒤㒝㒗㒣㒢㒟㒚㒞㒠㒡㒤㒘㒞㒣㒞㒦㒜㒥㒛㒦㒟㒝㒚㒘㒡㒙㒘㒛㒗㒛㒦㒜㒥㒝㒤㒞㒣㒟㒗㒗㒡㒡㒠㒣㒟㒣㒞㒤㒝㒥㒜㒦㒜㒗㒛㒘㒞㒞㒙㒚㒜㒡㒗㒜㒚㒤㒥㒞㒤㒥㒟㒞㒢㒡㒦㒘㒠㒣㒥㒗㒞㒥㒞㒗㒝㒗㒜㒙㒛㒙㒚㒚㒞㒝㒘㒜㒗㒝㒦㒞㒘㒣㒤㒠㒣㒡㒢㒢㒢㒣㒡㒞㒟㒥㒣㒛㒞㒗㒛㒢㒜㒚㒟㒠㒚㒛㒙㒜㒘㒝㒗㒞㒚㒢㒥㒠㒘㒦㒣㒢㒢㒤㒡㒤㒢㒥㒟㒦㒟㒗㒢㒛㒝㒙㒠㒙㒛㒛㒢㒞㒙㒞㒘㒞㒗㒟㒦㒠㒙㒦㒤㒢㒣㒣㒢㒤㒢㒚㒠㒦㒡㒙㒟㒘㒞㒙㒡㒠㒜㒛㒢㒦㒚㒞㒙㒞㒘㒟㒘㒢㒦㒡㒥㒢㒙㒚㒣㒤㒜㒙㒡㒦㒡㒗㒠㒘㒠㒛㒞㒚㒝㒛㒠㒤㒛㒝㒗㒢㒙㒡㒘㒠㒗㒡㒗㒤㒥㒣㒤㒤㒘㒞㒢㒦㒟㒦㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒜㒝㒟㒤㒚㒟㒞㒙㒘㒡㒗㒤㒦㒣㒦㒤㒤㒥㒣㒦㒗㒜㒢㒘㒤㒝㒠㒛㒣㒡㒞㒜㒞㒝㒜㒡㒛㒠㒞㒥㒙㒡㒚㒟㒗㒦㒚㒙㒥㒥㒤㒦㒞㒗㒣㒘㒦㒟㒡㒚㒠㒛㒟㒜㒞㒝㒝㒞㒝㒟㒛㒠㒚㒡㒞㒗㒘㒣㒠㒢㒦㒥㒚㒜㒥㒗㒥㒚㒣㒙㒢㒚㒥㒡㒠㒜㒗㒝㒞㒟㒝㒟㒜㒠㒛㒡㒚㒢㒙㒣㒝㒛㒗㒥㒗㒗㒦㒗㒥㒘㒤㒙㒣㒚㒢㒛㒡㒜㒤㒢㒟㒞㒢㒥㒝㒠㒡㒘㒛㒢㒛㒙㒥㒢㒘㒥㒜㒜㒗㒗㒙㒞㒥㒙㒤㒛㒣㒛㒢㒝㒡㒝㒠㒞㒤㒡㒞㒠㒝㒡㒜㒢㒟㒘㒚㒤㒙㒥㒘㒦㒙㒗㒗㒢㒦㒙㒙㒟㒤㒛㒡㒦㒢㒞㒥㒤㒠㒟㒟㒠㒞㒡㒝㒢㒠㒦㒛㒤㒟㒚㒙㒦㒙㒘㒘㒘㒙㒙㒦㒚㒥㒛㒘㒟㒣㒝㒦㒝㒡㒟㒘㒢㒟㒢㒞㒢㒝㒣㒜㒤㒠㒚㒚㒦㒚㒗㒙㒘㒘㒞㒗㒚㒗㒝㒥㒜㒤㒝㒗㒤㒢㒟㒙㒚㒠㒢㒟㒢㒞㒣㒞㒦㒜㒥㒛㒦㒟㒞㒚㒘㒠㒛㒘㒛㒗㒛㒦㒜㒦㒟㒤㒞㒣㒟㒗㒘㒡㒡㒢㒦㒟㒤㒞㒤㒝㒥㒞㒘㒜㒗㒛㒘㒞㒢㒙㒚㒛㒦㒗㒞㒦㒝㒥㒞㒤㒟㒣㒠㒢㒡㒦㒘㒠㒣㒤㒝㒞㒥㒞㒘㒝㒗㒝㒘㒛㒙㒚㒚㒝㒠㒘㒜㒚㒡㒦㒟㒙㒥㒤㒠㒤㒡㒢㒥㒡㒤㒥㒙㒟㒥㒠㒣㒞㒚㒠㒢㒜㒙㒛㒚㒤㒛㒙㒜㒜㒣㒗㒞㒦㒟㒥㒠㒤㒡㒣㒢㒣㒣㒡㒤㒠㒥㒤㒛㒟㒗㒦㒦㒝㒙㒠㒠㒛㒛㒛㒞㒙㒝㒘㒞㒛㒥㒦㒠㒝㒡㒤㒣㒣㒣㒢㒤㒡㒥㒠㒦㒠㒗㒣㒟㒞㒙㒝㒛㒜㒛㒛㒜㒚㒝㒙㒞㒘㒟㒗㒠㒚㒦㒥㒢㒙㒙㒣㒤㒗㒜㒡㒦㒡㒝㒛㒦㒟㒙㒢㒠㒝㒛㒟㒥㒛㒝㒚㒟㒙㒟㒘㒡㒗㒡㒦㒢㒚㒥㒤㒤㒣㒥㒢㒦㒥㒡㒡㒘㒠㒙㒟㒚㒟㒛㒝㒦㒜㒝㒟㒣㒚㒟㒘㒚㒘㒢㒜㒘㒦㒣㒥㒤㒤㒥㒣㒦㒗㒚㒢㒘㒥㒞㒠㒚㒟㒜㒞㒜㒟㒝㒜㒞㒛㒟㒞㒣㒙㒡㒜㒡㒗㒣㒞㒦㒥㒦㒤㒦㒤㒗㒣㒘㒦㒞㒡㒚㒠㒛㒟㒜㒞㒢㒝㒞㒝㒡㒛㒠㒚㒡㒞㒘㒘㒣㒟㒞㒦㒦㒥㒦㒥㒗㒥㒚㒣㒙㒢㒚㒥㒢㒠㒜㒟㒤㒞㒟㒝㒟㒜㒠㒜㒣㒚㒢㒙㒣㒝㒜㒗㒥㒡㒝㒦㒗㒥㒘㒤㒙㒤㒜㒢㒛㒡㒜㒤㒦㒟㒞㒦㒦㒝㒡㒜㒡㒛㒢㒚㒣㒙㒤㒘㒥㒜㒜㒗㒗㒚㒡㒥㒙㒤㒜㒣㒛㒣㒜㒡㒝㒠㒞㒣㒤㒞㒠㒠㒥㒜㒣㒠㒙㒚㒤㒚㒥㒙㒙㒘㒘㒛㒝㒦㒙㒗㒗㒤㒞㒦㒢㒢㒝㒡㒞㒚㒟㒟㒠㒣㒗㒝㒢㒜㒣㒛㒤㒚㒥㒙㒦㒚㒗㒘㒘㒗㒙㒚㒟㒥㒛㒝㒚㒣㒝㒦㒤㒡㒟㒡㒢㒟㒡㒞㒢㒢㒙㒜㒤㒣㒥㒛㒗㒚㒗㒙㒘㒘㒙㒗㒚㒦㒛㒙㒣㒤㒝㒣㒟㒢㒟㒡㒠㒠㒡㒟㒢㒞㒣㒝㒤㒡㒚㒛㒦㒟㒝㒚㒘㒝㒠㒘㒚㒗㒡㒢㒚㒥㒝㒘㒤㒣㒟㒥㒝㒡㒡㒠㒣㒟㒣㒞㒥㒝㒥㒜㒦㒡㒙㒛㒘㒚㒙㒙㒚㒛㒡㒗㒜㒦㒝㒥㒞㒥㒟㒤㒚㒢㒡㒦㒗㒠㒣㒞㒞㒞㒦㒢㒜㒝㒗㒜㒘㒛㒙㒚㒚㒝㒞㒘㒜㒛㒢㒦㒞㒥㒠㒤㒠㒥㒡㒢㒢㒡㒣㒥㒗㒟㒥㒢㒥㒞㒗㒥㒚㒜㒚㒛㒚㒚㒛㒙㒜㒜㒢㒗㒞㒦㒟㒥㒠㒤㒦㒣㒢㒣㒥㒡㒤㒠㒥㒤㒜㒟㒗㒥㒢㒝㒚㒜㒚㒛㒛㒛㒞㒙㒝㒘㒞㒛㒦㒦㒠㒘㒟㒤㒥㒣㒣㒢㒤㒣㒗㒠㒦㒠㒗㒣㒠㒞㒙㒚㒢㒜㒜㒛㒜㒚㒝㒚㒠㒘㒟㒗㒠㒛㒚㒥㒢㒚㒣㒣㒤㒢㒥㒡㒦㒡㒗㒠㒘㒟㒙㒢㒠㒝㒛㒠㒥㒛㒝㒚㒠㒙㒟㒙㒠㒗㒡㒦㒢㒚㒘㒤㒤㒗㒙㒣㒗㒦㒝㒡㒘㒡㒙㒟㒝㒞㒜㒡㒡㒜㒝㒝㒛㒚㒢㒝㒗㒘㒡㒗㒢㒠㒣㒥㒤㒙㒛㒣㒦㒣㒗㒢㒘㒡㒙㒠㒚㒠㒛㒞㒜㒝㒝㒠㒣㒛㒟㒣㒞㒙㒡㒝㒘㒗㒣㒗㒦㒥㒥㒤㒦㒘㒝㒣㒘㒚㒙㒡㒛㒠㒛㒟㒜㒞㒝㒝㒞㒜㒟㒠㒗㒚㒡㒙㒣㒘㒣㒗㒤㒦㒥㒥㒦㒥㒗㒤㒘㒗㒞㒢㒚㒥㒡㒠㒜㒣㒤㒞㒞㒝㒥㒘㒞㒛㒡㒟㒘㒙㒣㒛㒦㒗㒥㒗㒗㒦㒗㒥㒙㒤㒙㒣㒚㒗㒝㒡㒜㒠㒝㒟㒞㒡㒦㒝㒠㒜㒡㒛㒢㒛㒣㒚㒞㒘㒥㒜㒛㒗㒗㒤㒢㒥㒚㒘㒠㒣㒛㒢㒜㒡㒝㒠㒞㒣㒢㒞㒠㒡㒦㒜㒢㒛㒤㒚㒤㒛㒥㒘㒦㒘㒗㒛㒛㒦㒙㒙㒙㒤㒛㒛㒞㒢㒞㒡㒞㒠㒟㒟㒠㒢㒦㒝㒢㒜㒣㒛㒤㒛㒚㒙㒦㒚㒙㒘㒘㒗㒙㒚㒠㒥㒛㒛㒦㒣㒞㒢㒞㒡㒟㒡㒢㒟㒡㒞㒢㒢㒚㒜㒤㒜㒦㒚㒦㒚㒗㒙㒘㒙㒛㒗㒚㒦㒛㒙㒤㒤㒝㒝㒛㒢㒡㒡㒠㒠㒡㒠㒤㒞㒣㒝㒤㒡㒞㒛㒦㒦㒣㒚㒘㒙㒙㒘㒚㒗㒛㒦㒜㒥㒝㒘㒤㒣㒟㒗㒙㒡㒡㒠㒤㒟㒣㒟㒤㒝㒥㒜㒦㒠㒜㒛㒘㒝㒝㒙㒛㒜㒡㒗㒜㒗㒝㒥㒡㒤㒠㒗㒥㒢㒡㒣㒟㒠㒦㒣㒜㒞㒥㒝㒦㒗㒗㒜㒘㒟㒟㒚㒚㒙㒛㒘㒜㒗㒝㒦㒞㒦㒟㒤㒠㒣㒡㒗㒗㒡㒣㒙㒢㒟㒥㒣㒜㒞㒗㒞㒚㒜㒙㒛㒚㒞㒡㒙㒜㒠㒝㒗㒟㒦㒟㒥㒠㒤㒡㒣㒢㒢㒣㒦㒛㒠㒥㒠㒗㒟㒗㒞㒘㒝㒙㒜㒚㒛㒛㒚㒜㒝㒢㒘㒞㒛㒥㒦㒠㒚㒘㒤㒢㒤㒙㒞㒢㒡㒥㒥㒜㒠㒗㒟㒝㒞㒙㒝㒛㒜㒛㒛㒝㒚㒝㒙㒞㒝㒡㒗㒠㒦㒡㒥㒢㒘㒛㒣㒤㒢㒥㒡㒦㒢㒗㒠㒢㒟㒙㒢㒟㒝㒛㒚㒦㒛㒞㒞㒤㒙㒟㒘㒠㒗㒡㒦㒢㒙㒦㒤㒤㒘㒚㒢㒦㒢㒘㒡㒘㒢㒙㒟㒚㒞㒛㒡㒟㒜㒝㒟㒝㒚㒟㒡㒢㒘㒢㒗㒢㒦㒣㒥㒤㒙㒚㒣㒦㒣㒗㒢㒘㒡㒞㒠㒚㒠㒝㒞㒜㒝㒝㒠㒤㒛㒟㒢㒚㒙㒢㒘㒢㒗㒣㒗㒦㒥㒥㒤㒦㒘㒞㒣㒘㒝㒝㒡㒚㒠㒛㒟㒜㒟㒟㒝㒞㒜㒟㒠㒘㒚㒡㒝㒦㒘㒣㒗㒤㒦㒥㒗㒘㒥㒗㒤㒘㒗㒢㒢㒚㒦㒝㒠㒞㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒟㒘㒙㒣㒝㒝㒗㒥㒗㒘㒦㒗㒦㒘㒤㒙㒣㒚㒦㒠㒡㒜㒣㒡㒟㒟㒢㒥㒝㒠㒝㒡㒛㒥㒚㒤㒞㒙㒘㒥㒙㒣㒗㒚㒙㒡㒥㒙㒤㒚㒝㒛㒢㒜㒥㒣㒠㒞㒟㒟㒞㒠㒝㒡㒜㒢㒜㒣㒚㒤㒙㒥㒝㒛㒘㒗㒟㒦㒦㒙㒙㒠㒤㒛㒤㒞㒢㒝㒡㒞㒤㒥㒟㒠㒦㒡㒝㒣㒜㒣㒛㒤㒚㒥㒙㒦㒙㒗㒜㒟㒗㒙㒦㒛㒥㒛㒤㒜㒣㒝㒢㒞㒡㒟㒠㒠㒣㒦㒞㒢㒢㒙㒜㒤㒠㒜㒚㒦㒚㒝㒤㒦㒘㒙㒛㒠㒦㒛㒛㒡㒤㒝㒣㒟㒢㒟㒡㒡㒠㒡㒟㒢㒣㒥㒝㒤㒜㒥㒛㒦㒞㒠㒚㒘㒙㒙㒘㒚㒘㒛㒦㒟㒥㒞㒘㒣㒣㒟㒡㒚㒡㒢㒥㒘㒟㒣㒞㒤㒢㒢㒝㒗㒠㒚㒛㒘㒞㒞㒙㒚㒘㒜㒗㒜㒦㒣㒡㒜㒤㒟㒗㒣㒢㒡㒣㒜㒠㒣㒟㒥㒞㒥㒞㒗㒝㒗㒜㒘㒠㒛㒚㒚㒙㒛㒘㒜㒚㒚㒦㒞㒥㒟㒤㒠㒤㒗㒞㒠㒡㒣㒥㒘㒟㒥㒠㒘㒞㒗㒝㒙㒜㒙㒛㒛㒚㒛㒙㒜㒝㒟㒗㒞㒦㒟㒥㒠㒘㒤㒣㒢㒢㒣㒡㒤㒢㒗㒣㒡㒟㒗㒢㒟㒝㒙㒥㒢㒛㒛㒚㒜㒙㒝㒘㒞㒝㒥㒦㒠㒙㒦㒤㒢㒗㒥㒢㒤㒦㒜㒠㒦㒠㒗㒠㒘㒞㒙㒡㒡㒜㒛㒛㒜㒚㒝㒙㒣㒘㒟㒘㒢㒦㒡㒥㒣㒙㒛㒣㒤㒚㒟㒢㒗㒡㒗㒠㒘㒠㒛㒡㒥㒝㒛㒠㒥㒛㒝㒚㒡㒙㒟㒘㒠㒗㒡㒗㒤㒡㒝㒤㒤㒘㒟㒢㒦㒚㒣㒡㒙㒠㒙㒟㒚㒟㒝㒝㒜㒜㒝㒠㒙㒚㒟㒝㒦㒘㒡㒗㒢㒦㒣㒥㒤㒤㒥㒣㒦㒗㒟㒢㒘㒥㒤㒠㒚㒟㒝㒞㒜㒞㒝㒜㒞㒛㒟㒟㒗㒙㒡㒛㒦㒗㒤㒛㒜㒥㒥㒦㒘㒤㒗㒣㒘㒦㒡㒡㒚㒗㒥㒟㒝㒞㒝㒝㒞㒝㒡㒛㒠㒚㒡㒞㒛㒘㒣㒗㒙㒗㒗㒥㒦㒥㒗㒥㒚㒣㒙㒢㒚㒥㒥㒠㒜㒠㒘㒞㒠㒝㒟㒜㒠㒜㒣㒚㒢㒙㒣㒝㒟㒗㒥㒡㒜㒦㒙㒥㒘㒤㒙㒣㒚㒢㒛㒡㒜㒤㒥㒟㒞㒣㒚㒝㒠㒜㒣㒛㒢㒛㒣㒙㒤㒘㒥㒜㒝㒗㒗㒗㒥㒥㒜㒘㒢㒣㒛㒣㒞㒥㒘㒠㒞㒤㒗㒞㒠㒚㒤㒜㒣㒛㒣㒚㒤㒙㒥㒙㒦㒘㒗㒛㒡㒦㒙㒥㒡㒤㒛㒣㒜㒢㒝㒢㒠㒠㒜㒟㒠㒣㒛㒝㒢㒤㒝㒛㒥㒚㒥㒙㒦㒚㒙㒘㒘㒗㒙㒚㒥㒥㒛㒚㒞㒣㒞㒢㒞㒡㒟㒡㒢㒟㒡㒞㒢㒢㒟㒜㒤㒠㒞㒛㒗㒚㒗㒙㒘㒙㒛㒗㒚㒦㒛㒚㒙㒤㒝㒠㒠㒢㒟㒡㒠㒠㒡㒟㒢㒞㒣㒝㒤㒡㒟㒛㒦㒟㒤㒚㒘㒙㒛㒘㒚㒘㒝㒦㒜㒥㒝㒙㒙㒣㒟㒚㒚㒡㒢㒠㒢㒟㒣㒟㒦㒝㒥㒜㒦㒠㒣㒛㒘㒚㒙㒙㒛㒘㒛㒗㒜㒗㒟㒥㒞㒤㒟㒘㒝㒢㒡㒙㒚㒠㒣㒟㒤㒞㒥㒟㒘㒝㒗㒜㒘㒠㒗㒚㒚㒥㒡㒘㒜㒗㒝㒦㒞㒥㒟㒤㒠㒣㒡㒗㒝㒡㒣㒥㒢㒟㒥㒟㒘㒞㒗㒞㒚㒛㒦㒛㒚㒟㒗㒙㒜㒠㒗㒗㒟㒦㒟㒥㒠㒥㒣㒣㒢㒢㒣㒦㒡㒠㒥㒘㒦㒟㒗㒞㒘㒝㒙㒝㒜㒛㒛㒚㒜㒞㒛㒘㒞㒛㒙㒦㒢㒥㒡㒤㒢㒤㒥㒢㒤㒡㒥㒥㒥㒠㒗㒙㒙㒞㒙㒝㒚㒜㒛㒛㒜㒚㒝㒙㒞㒝㒛㒗㒠㒛㒠㒥㒢㒤㒥㒣㒤㒤㒗㒡㒦㒡㒗㒤㒥㒟㒙㒥㒤㒝㒜㒜㒜㒛㒝㒛㒠㒙㒟㒘㒠㒜㒟㒦㒢㒦㒘㒤㒥㒣㒥㒢㒦㒣㒙㒡㒘㒠㒙㒤㒙㒞㒛㒟㒥㒜㒟㒛㒞㒚㒟㒚㒢㒘㒡㒗㒢㒛㒣㒥㒤㒙㒤㒤㒗㒣㒗㒢㒘㒡㒙㒠㒚㒟㒛㒣㒙㒝㒝㒡㒞㒛㒟㒚㒢㒙㒡㒙㒤㒗㒠㒦㒤㒚㒣㒤㒦㒛㒡㒣㒙㒢㒙㒡㒚㒡㒝㒟㒜㒞㒝㒢㒝㒜㒟㒚㒗㒚㒣㒙㒢㒘㒣㒘㒦㒦㒥㒥㒦㒚㒗㒤㒘㒤㒚㒢㒝㒡㒛㒠㒜㒠㒟㒞㒞㒝㒟㒡㒡㒛㒡㒟㒜㒙㒤㒘㒤㒗㒥㒦㒦㒦㒗㒥㒘㒙㒗㒣㒚㒗㒜㒡㒜㒠㒟㒟㒞㒟㒡㒝㒠㒜㒡㒠㒡㒚㒣㒡㒞㒘㒦㒗㒦㒗㒗㒗㒚㒥㒙㒤㒚㒘㒛㒢㒜㒡㒢㒠㒡㒟㒟㒞㒠㒞㒣㒜㒢㒛㒣㒟㒥㒙㒥㒦㒢㒘㒘㒗㒘㒦㒙㒦㒜㒤㒛㒣㒜㒗㒟㒡㒞㒦㒟㒟㒠㒞㒡㒝㒢㒜㒣㒛㒤㒚㒥㒞㒥㒙㒗㒝㒚㒗㒙㒦㒜㒥㒛㒥㒞㒥㒦㒢㒟㒦㒟㒠㒠㒗㒛㒞㒣㒝㒣㒜㒤㒝㒗㒚㒦㒚㒗㒞㒙㒘㒙㒟㒦㒦㒝㒥㒜㒤㒝㒤㒠㒢㒟㒡㒠㒥㒣㒟㒢㒣㒡㒝㒥㒜㒥㒛㒦㒜㒙㒚㒘㒙㒙㒝㒝㒗㒛㒞㒥㒥㒝㒤㒞㒣㒟㒢㒠㒡㒡㒠㒢㒤㒣㒞㒤㒣㒘㒜㒦㒜㒙㒛㒘㒚㒙㒙㒚㒘㒛㒛㒥㒦㒝㒚㒞㒤㒟㒣㒡㒢㒡㒡㒢㒤㒦㒟㒥㒣㒜㒝㒦㒡㒟㒜㒘㒟㒢㒚㒚㒚㒝㒜㒗㒗㒝㒚㒦㒥㒟㒦㒥㒣㒢㒢㒢㒡㒣㒡㒦㒟㒥㒟㒗㒢㒠㒝㒘㒣㒣㒛㒛㒚㒛㒙㒜㒙㒟㒛㒙㒦㒟㒚㒚㒤㒡㒜㒜㒢㒥㒡㒤㒠㒥㒡㒘㒢㒢㒞㒘㒡㒤㒜㒚㒤㒠㒚㒜㒙㒝㒘㒞㒘㒡㒚㒛㒥㒡㒙㒞㒣㒣㒥㒟㒡㒦㒠㒦㒠㒗㒟㒘㒛㒙㒝㒚㒠㒤㒛㒜㒟㒙㒙㒞㒘㒡㒗㒠㒦㒡㒙㒥㒤㒤㒘㒛㒢㒥㒦㒞㒡㒗㒤㒡㒟㒙㒞㒠㒙㒙㒜㒜㒟㒥㒚㒞㒛㒠㒘㒠㒗㒢㒦㒢㒥㒦㒤㒤㒣㒥㒘㒘㒢㒗㒡㒘㒠㒙㒡㒦㒞㒛㒝㒜㒜㒝㒛㒞㒟㒡㒙㒠㒘㒡㒗㒢㒛㒗㒥㒤㒤㒥㒣㒦㒣㒗㒗㒚㒡㒙㒠㒚㒟㒛㒢㒘㒝㒝㒜㒞㒛㒟㒛㒠㒙㒤㒘㒣㒜㒚㒦㒤㒤㒟㒥㒗㒘㒟㒣㒘㒢㒙㒞㒚㒠㒛㒣㒡㒞㒝㒡㒥㒜㒟㒛㒢㒚㒡㒚㒤㒜㒞㒗㒤㒛㒝㒥㒦㒣㒚㒤㒘㒣㒙㒢㒚㒡㒛㒦㒢㒟㒝㒢㒤㒝㒟㒠㒢㒛㒡㒟㒚㒙㒣㒘㒤㒘㒥㒦㒦㒚㒟㒥㒘㒤㒙㒣㒚㒢㒥㒡㒜㒡㒟㒟㒞㒞㒠㒢㒙㒜㒡㒣㒜㒚㒤㒙㒤㒘㒥㒙㒘㒚㒢㒦㒘㒙㒣㒤㒚㒡㒦㒢㒞㒡㒝㒠㒞㒠㒡㒢㒛㒝㒡㒡㒝㒛㒣㒙㒛㒙㒦㒘㒦㒘㒗㒘㒚㒙㒤㒥㒚㒙㒗㒣㒜㒞㒛㒡㒞㒠㒟㒟㒠㒞㒡㒚㒢㒜㒣㒠㒝㒚㒥㒞㒢㒙㒗㒘㒚㒗㒙㒗㒚㒥㒞㒤㒝㒗㒥㒢㒞㒤㒣㒠㒡㒤㒚㒞㒢㒞㒥㒚㒠㒛㒥㒟㒟㒚㒗㒗㒠㒘㒙㒗㒚㒦㒛㒦㒞㒤㒝㒣㒞㒗㒙㒡㒠㒜㒦㒟㒣㒞㒣㒝㒤㒜㒥㒛㒦㒛㒗㒞㒠㒙㒙㒜㒣㒗㒛㒚㒦㒥㒝㒥㒠㒣㒟㒢㒠㒦㒚㒠㒢㒥㒝㒞㒦㒝㒥㒜㒦㒝㒙㒛㒘㒚㒙㒝㒤㒘㒛㒡㒝㒦㒝㒥㒞㒤㒟㒣㒠㒢㒡㒡㒢㒥㒛㒟㒤㒣㒞㒝㒦㒡㒡㒜㒘㒜㒛㒚㒚㒙㒛㒜㒥㒗㒝㒤㒗㒥㒟㒤㒠㒣㒡㒣㒢㒡㒣㒠㒤㒤㒝㒞㒦㒟㒤㒝㒛㒠㒢㒛㒚㒛㒝㒙㒜㒘㒝㒜㒗㒦㒟㒥㒠㒤㒤㒣㒢㒢㒣㒢㒦㒠㒥㒟㒦㒣㒡㒞㒘㒝㒟㒜㒜㒛㒛㒚㒜㒛㒝㒝㒠㒗㒠㒛㒚㒥㒡㒙㒜㒣㒣㒠㒘㒡㒥㒢㒘㒝㒠㒟㒘㒢㒤㒝㒚㒚㒙㒛㒞㒚㒝㒙㒞㒙㒡㒗㒠㒦㒡㒚㒞㒤㒣㒙㒗㒢㒦㒡㒦㒡㒗㒡㒚㒟㒙㒞㒚㒢㒘㒜㒜㒟㒣㒚㒟㒙㒟㒘㒠㒗㒡㒦㒢㒥㒣㒙㒞㒣㒥㒗㒣㒢㒗㒡㒚㒠㒙㒟㒚㒞㒛㒝㒜㒠㒥㒛㒞㒟㒘㒙㒠㒝㒛㒗㒢㒗㒥㒥㒤㒤㒥㒘㒟㒣㒗㒘㒠㒡㒚㒠㒚㒟㒛㒟㒞㒝㒝㒜㒞㒠㒙㒚㒠㒞㒛㒘㒢㒗㒣㒦㒤㒥㒥㒤㒦㒤㒗㒗㒠㒢㒙㒥㒣㒠㒛㒣㒦㒞㒝㒞㒠㒜㒟㒛㒠㒟㒚㒙㒢㒠㒗㒗㒤㒦㒥㒥㒦㒗㒗㒤㒘㒣㒙㒦㒢㒡㒛㒤㒥㒟㒝㒜㒟㒝㒟㒝㒢㒟㒜㒚㒢㒞㒜㒘㒤㒚㒚㒗㒗㒦㒗㒥㒘㒥㒛㒥㒢㒢㒛㒥㒦㒠㒝㒗㒘㒞㒠㒝㒠㒜㒡㒜㒤㒚㒣㒙㒤㒝㒠㒗㒦㒚㒛㒦㒚㒥㒙㒤㒚㒤㒝㒢㒜㒡㒝㒥㒚㒟㒟㒠㒜㒝㒡㒜㒢㒛㒣㒛㒦㒙㒥㒘㒦㒜㒤㒗㒘㒢㒞㒥㒜㒤㒛㒣㒜㒢㒝㒡㒞㒠㒟㒤㒚㒞㒡㒢㒟㒜㒣㒛㒦㒚㒥㒙㒦㒙㒗㒘㒘㒛㒡㒦㒚㒙㒤㒤㒜㒘㒗㒢㒞㒢㒡㒠㒠㒟㒡㒣㒛㒝㒣㒤㒤㒛㒦㒚㒦㒚㒗㒙㒘㒘㒙㒗㒚㒚㒥㒥㒜㒤㒞㒣㒞㒢㒟㒡㒠㒠㒡㒟㒢㒞㒣㒢㒜㒜㒥㒠㒟㒛㒗㒞㒢㒙㒙㒘㒠㒣㒙㒦㒜㒙㒦㒤㒞㒚㒣㒢㒠㒡㒢㒠㒢㒟㒤㒞㒤㒝㒥㒢㒘㒜㒗㒛㒘㒚㒙㒜㒗㒘㒛㒗㒜㒦㒝㒦㒞㒤㒛㒣㒠㒗㒙㒡㒢㒟㒝㒟㒥㒣㒞㒝㒦㒝㒗㒜㒘㒛㒙㒞㒠㒙㒛㒜㒤㒗㒝㒦㒟㒥㒟㒥㒢㒣㒡㒢㒢㒦㒛㒠㒤㒞㒘㒞㒦㒞㒗㒝㒘㒜㒙㒛㒚㒚㒛㒝㒢㒘㒝㒛㒠㒦㒟㒚㒘㒤㒡㒣㒢㒢㒣㒡㒤㒥㒝㒟㒦㒟㒗㒞㒘㒝㒣㒜㒚㒜㒝㒚㒜㒙㒝㒝㒗㒗㒟㒞㒚㒥㒢㒤㒢㒣㒣㒣㒦㒡㒥㒠㒦㒤㒡㒟㒘㒥㒡㒝㒛㒜㒛㒛㒜㒛㒟㒙㒞㒘㒟㒜㒛㒦㒡㒦㒡㒤㒣㒣㒤㒢㒥㒣㒘㒡㒗㒠㒘㒣㒥㒞㒚㒣㒡㒜㒞㒛㒝㒚㒞㒙㒟㒘㒠㒗㒡㒛㒛㒥㒣㒙㒠㒣㒥㒣㒘㒢㒗㒢㒘㒠㒜㒟㒛㒢㒣㒝㒜㒟㒡㒛㒟㒟㒘㒙㒠㒙㒣㒥㒞㒦㒣㒚㒝㒤㒥㒢㒞㒣㒗㒢㒘㒡㒙㒡㒜㒟㒛㒞㒜㒢㒗㒜㒞㒠㒙㒚㒠㒙㒡㒘㒢㒗㒣㒦㒤㒥㒥㒙㒞㒤㒗㒗㒡㒢㒙㒥㒤㒠㒛㒠㒞㒞㒝㒝㒞㒡㒘㒛㒠㒠㒛㒙㒤㒘㒣㒗㒤㒘㒗㒥㒦㒥㒗㒘㒢㒣㒙㒗㒡㒡㒛㒠㒜㒟㒝㒞㒞㒝㒟㒜㒠㒠㒙㒚㒢㒞㒜㒘㒤㒜㒟㒦㒦㒗㒙㒥㒘㒤㒙㒗㒣㒢㒛㒞㒥㒠㒝㒟㒞㒞㒟㒞㒠㒜㒡㒛㒢㒟㒛㒙㒤㒚㒢㒘㒙㒛㒠㒦㒘㒦㒛㒤㒚㒣㒛㒦㒥㒡㒝㒠㒞㒟㒢㒞㒠㒝㒡㒝㒤㒛㒣㒚㒤㒞㒟㒘㒦㒘㒝㒗㒚㒦㒙㒥㒚㒦㒛㒘㒞㒢㒞㒦㒘㒠㒟㒤㒚㒞㒡㒚㒦㒜㒣㒜㒦㒡㒦㒙㒦㒝㒢㒘㒘㒥㒗㒦㒜㒥㒛㒤㒜㒤㒟㒢㒞㒡㒟㒥㒜㒟㒡㒣㒥㒝㒤㒜㒤㒛㒥㒜㒘㒚㒗㒙㒘㒜㒦㒗㒚㒚㒡㒥㒝㒤㒝㒣㒞㒢㒟㒡㒠㒠㒡㒤㒜㒞㒣㒢㒡㒜㒥㒜㒘㒛㒗㒚㒘㒙㒙㒘㒚㒛㒣㒦㒜㒙㒦㒤㒞㒘㒙㒢㒠㒢㒣㒠㒢㒟㒣㒣㒝㒝㒥㒣㒞㒜㒘㒛㒘㒚㒙㒚㒜㒘㒛㒗㒜㒛㒗㒥㒞㒛㒦㒣㒢㒢㒡㒡㒢㒠㒣㒟㒤㒞㒥㒢㒞㒝㒗㒠㒡㒛㒙㒞㒤㒙㒛㒙㒞㒗㒝㒦㒞㒚㒘㒤㒠㒚㒥㒢㒢㒡㒣㒠㒤㒡㒗㒞㒦㒞㒗㒡㒢㒜㒙㒢㒤㒚㒜㒙㒜㒘㒝㒘㒠㒚㒚㒥㒠㒙㒜㒣㒢㒢㒡㒡㒤㒠㒥㒟㒦㒠㒙㒡㒣㒝㒙㒠㒦㒛㒛㒥㒠㒙㒟㒘㒞㒗㒟㒗㒢㒙㒜㒤㒢㒘㒠㒢㒤㒢㒜㒠㒦㒠㒗㒟㒘㒞㒙㒚㒚㒜㒛㒟㒦㒚㒝㒞㒛㒘㒟㒗㒢㒦㒡㒥㒢㒘㒦㒣㒥㒗㒝㒡㒦㒥㒠㒠㒘㒣㒣㒞㒚㒞㒝㒠㒗㒛㒝㒟㒗㒙㒟㒚㒥㒗㒢㒦㒢㒥㒣㒥㒦㒦㒝㒢㒦㒦㒡㒡㒘㒗㒣㒟㒛㒞㒛㒝㒜㒝㒟㒛㒞㒚㒟㒞㒛㒘㒡㒞㒠㒦㒤㒥㒤㒤㒥㒥㒘㒣㒗㒢㒘㒥㒥㒠㒚㒜㒤㒞㒞㒝㒝㒜㒞㒜㒡㒚㒠㒙㒡㒝㒟㒗㒣㒥㒠㒥㒥㒤㒦㒤㒗㒣㒘㒢㒙㒡㒚㒤㒥㒟㒜㒣㒚㒝㒞㒜㒡㒛㒠㒚㒡㒙㒢㒘㒣㒜㒜㒦㒥㒚㒟㒥㒗㒘㒢㒣㒙㒣㒜㒡㒛㒠㒜㒣㒦㒞㒞㒥㒟㒜㒡㒛㒡㒚㒢㒙㒣㒘㒤㒗㒥㒛㒠㒦㒗㒥㒙㒤㒙㒣㒚㒢㒛㒡㒜㒠㒝㒟㒞㒣㒗㒝㒠㒡㒚㒛㒢㒟㒝㒙㒤㒙㒛㒣㒤㒗㒗㒚㒡㒥㒙㒚㒛㒣㒛㒢㒝㒡㒝㒠㒟㒟㒟㒞㒠㒢㒣㒜㒢㒛㒣㒚㒤㒜㒢㒘㒦㒘㒗㒗㒘㒗㒙㒤㒦㒤㒛㒗㒤㒢㒝㒠㒘㒠㒠㒤㒙㒞㒡㒝㒢㒜㒣㒛㒤㒟㒛㒙㒦㒝㒟㒘㒘㒗㒚㒦㒚㒦㒝㒤㒜㒣㒝㒦㒦㒡㒟㒣㒝㒟㒣㒞㒢㒝㒣㒜㒤㒛㒥㒚㒦㒞㒝㒙㒘㒜㒛㒗㒚㒚㒣㒥㒜㒤㒝㒣㒞㒢㒟㒦㒘㒠㒡㒟㒢㒞㒣㒞㒙㒜㒥㒝㒘㒛㒗㒚㒘㒝㒢㒘㒚㒞㒥㒦㒝㒥㒝㒤㒞㒤㒡㒢㒠㒡㒡㒥㒜㒟㒣㒥㒙㒝㒦㒜㒦㒜㒗㒜㒚㒚㒙㒙㒚㒜㒦㒗㒜㒚㒡㒥㒠㒤㒟㒣㒠㒣㒣㒡㒢㒠㒣㒤㒠㒞㒥㒠㒚㒝㒗㒜㒘㒛㒙㒚㒚㒙㒛㒘㒜㒛㒦㒦㒞㒚㒛㒤㒠㒣㒣㒢㒢㒢㒣㒡㒗㒟㒦㒣㒞㒞㒗㒠㒜㒜㒚㒟㒣㒚㒛㒙㒜㒚㒣㒗㒟㒛㒘㒥㒠㒤㒡㒣㒢㒢㒣㒡㒤㒡㒥㒟㒦㒟㒗㒢㒠㒝㒙㒞㒗㒛㒞㒞㒥㒙㒝㒙㒠㒗㒟㒦㒠㒚㒚㒤㒢㒦㒘㒢㒥㒡㒥㒠㒦㒡㒙㒟㒘㒞㒙㒡㒤㒜㒛㒢㒦㒚㒞㒙㒞㒘㒟㒘㒢㒦㒡㒥㒢㒙㒞㒣㒤㒠㒠㒡㒦㒡㒗㒠㒘㒠㒛㒞㒚㒝㒛㒡㒘㒛㒝㒡㒗㒙㒟㒘㒠㒗㒡㒗㒤㒥㒣㒤㒤㒘㒢㒢㒦㒝㒟㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒜㒝㒠㒘㒚㒟㒞㒝㒘㒡㒗㒤㒦㒣㒥㒤㒤㒥㒣㒦㒗㒟㒢㒘㒥㒢㒠㒚㒣㒥㒞㒜㒞㒟㒜㒞㒛㒟㒟㒙㒙㒡㒠㒢㒗㒤㒦㒤㒥㒥㒤㒦㒘㒣㒣㒘㒦㒣㒡㒚㒠㒜㒟㒜㒞㒝㒝㒞㒜㒟㒟㒣㒚㒢㒞㒚㒘㒣㒜㒝㒦㒥㒚㒠㒥㒗㒤㒞㒟㒗㒢㒚㒥㒤㒠㒜㒗㒚㒞㒞㒝㒠㒜㒠㒛㒣㒚㒢㒙㒣㒝㒦㒗㒥㒦㒦㒦㒗㒗㒥㒤㒙㒣㒚㒢㒛㒡㒜㒥㒟㒟㒞㒞㒟㒝㒠㒠㒝㒛㒢㒚㒣㒙㒤㒙㒥㒘㒠㒗㒗㒚㒠㒥㒙㒢㒤㒣㒜㒦㒥㒡㒝㒠㒞㒟㒟㒞㒠㒢㒗㒜㒢㒠㒛㒚㒤㒙㒦㒘㒦㒚㒗㒗㒘㒦㒙㒙㒠㒤㒛㒗㒞㒢㒝㒗㒥㒠㒠㒟㒠㒞㒡㒝㒢㒡㒛㒛㒤㒚㒥㒙㒦㒙㒙㒘㒘㒘㒛㒦㒚㒥㒛㒘㒥㒣㒝㒚㒘㒡㒠㒠㒠㒟㒡㒟㒤㒝㒣㒜㒤㒠㒟㒚㒦㒤㒗㒙㒚㒘㒙㒗㒚㒗㒝㒥㒜㒤㒝㒘㒙㒢㒟㒣㒝㒠㒢㒟㒢㒞㒣㒞㒦㒜㒥㒛㒦㒟㒣㒚㒘㒡㒡㒘㒛㒗㒛㒦㒜㒥㒝㒤㒞㒣㒟㒗㒙㒡㒡㒥㒞㒟㒣㒞㒦㒝㒥㒝㒦㒜㒗㒛㒘㒞㒡㒙㒚㒛㒟㒗㒝㒚㒦㒥㒞㒤㒡㒘㒣㒢㒡㒦㒛㒠㒣㒡㒗㒞㒥㒝㒦㒝㒗㒝㒘㒝㒝㒚㒛㒝㒣㒘㒜㒦㒗㒦㒟㒚㒘㒤㒠㒣㒡㒢㒢㒡㒣㒥㒚㒟㒥㒣㒞㒞㒗㒝㒙㒜㒙㒜㒜㒚㒛㒙㒜㒜㒣㒗㒞㒥㒞㒥㒠㒤㒡㒣㒢㒣㒥㒡㒤㒠㒥㒤㒝㒟㒗㒚㒙㒝㒛㒜㒚㒛㒛㒚㒜㒙㒝㒘㒞㒛㒥㒦㒠㒚㒗㒤㒢㒘㒚㒢㒤㒣㒗㒠㒦㒠㒗㒣㒟㒞㒙㒚㒟㒜㒛㒛㒜㒚㒝㒙㒞㒘㒟㒗㒠㒛㒗㒥㒢㒙㒙㒣㒤㒗㒜㒡㒦㒢㒙㒠㒘㒟㒙㒢㒡㒝㒛㒥㒢㒛㒝㒚㒞㒙㒟㒘㒠㒗㒡㒦㒢㒚㒙㒤㒤㒘㒛㒢㒦㒦㒞㒡㒘㒡㒛㒟㒚㒞㒛㒡㒣㒜㒝㒝㒤㒚㒢㒙㒠㒘㒡㒗㒢㒘㒜㒥㒤㒙㒛㒣㒦㒗㒝㒢㒘㒥㒠㒠㒚㒠㒝㒢㒗㒝㒝㒠㒥㒛㒟㒜㒥㒙㒤㒘㒢㒗㒣㒦㒤㒗㒞㒤㒦㒘㒝㒣㒘㒦㒟㒡㒚㒤㒢㒟㒜㒟㒟㒡㒙㒜㒟㒠㒗㒚㒡㒣㒣㒘㒤㒗㒤㒦㒥㒥㒦㒦㒠㒤㒘㒗㒟㒢㒚㒥㒡㒠㒜㒣㒤㒞㒞㒞㒡㒠㒛㒛㒡㒟㒛㒙㒣㒥㒝㒘㒗㒦㒦㒦㒗㒥㒘㒚㒟㒣㒚㒦㒢㒡㒜㒤㒞㒟㒞㒣㒘㒝㒠㒜㒡㒜㒢㒚㒣㒞㒝㒘㒥㒗㒦㒗㒗㒦㒙㒥㒙㒥㒜㒣㒛㒢㒝㒦㒗㒠㒞㒗㒙㒞㒡㒝㒡㒜㒢㒜㒥㒞㒟㒙㒥㒝㒡㒘㒗㒤㒝㒦㒚㒥㒚㒤㒛㒤㒞㒦㒘㒡㒞㒥㒛㒟㒠㒟㒤㒝㒤㒜㒣㒛㒤㒜㒗㒝㒡㒙㒗㒜㒥㒗㒙㒝㒝㒥㒝㒤㒜㒣㒝㒢㒞㒞㒟㒠㒠㒤㒛㒞㒢㒢㒠㒜㒤㒜㒗㒚㒦㒛㒗㒙㒛㒘㒚㒛㒣㒦㒛㒘㒠㒤㒞㒘㒘㒢㒟㒡㒠㒝㒡㒟㒢㒣㒚㒝㒤㒡㒞㒛㒦㒛㒙㒚㒘㒚㒛㒛㒥㒗㒛㒚㒦㒥㒝㒙㒠㒣㒟㒢㒠㒡㒡㒠㒢㒦㒙㒞㒤㒢㒝㒜㒦㒠㒞㒛㒘㒞㒣㒙㒚㒙㒝㒗㒙㒦㒝㒚㒘㒤㒟㒛㒚㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒡㒢㒜㒘㒚㒟㒚㒜㒙㒛㒘㒜㒘㒟㒦㒞㒥㒟㒙㒜㒣㒡㒚㒦㒡㒥㒠㒤㒟㒥㒠㒘㒞㒗㒝㒘㒠㒦㒛㒚㒘㒡㒙㒞㒘㒝㒗㒞㒦㒟㒥㒠㒤㒡㒘㒜㒢㒣㒦㒡㒠㒥㒠㒘㒟㒗㒟㒚㒝㒙㒜㒚㒟㒦㒚㒜㒡㒗㒘㒟㒗㒟㒦㒠㒦㒣㒤㒢㒣㒣㒗㒠㒡㒥㒚㒢㒠㒗㒟㒘㒞㒙㒞㒜㒜㒛㒛㒜㒟㒚㒙㒞㒟㒜㒗㒢㒦㒡㒥㒢㒥㒥㒣㒤㒢㒥㒦㒤㒡㒗㒥㒥㒟㒛㒞㒚㒝㒛㒜㒜㒛㒝㒚㒞㒞㒚㒘㒠㒜㒟㒦㒢㒥㒥㒤㒤㒣㒥㒗㒣㒢㒘㒥㒠㒠㒙㒣㒥㒞㒛㒝㒝㒜㒝㒝㒞㒚㒦㒙㒠㒝㒙㒗㒢㒛㒚㒥㒤㒛㒜㒤㒗㒣㒗㒢㒘㒡㒙㒤㒤㒟㒛㒞㒜㒝㒝㒜㒠㒛㒟㒛㒢㒙㒡㒘㒢㒜㒞㒦㒤㒝㒟㒥㒗㒤㒗㒣㒘㒣㒛㒡㒚㒠㒛㒤㒘㒞㒝㒟㒠㒜㒢㒛㒠㒚㒡㒚㒤㒘㒣㒗㒤㒛㒢㒥㒦㒢㒚㒤㒚㒣㒙㒢㒚㒢㒝㒠㒜㒟㒝㒣㒜㒝㒟㒢㒚㒛㒢㒚㒢㒙㒣㒘㒤㒗㒥㒦㒦㒚㒢㒥㒘㒙㒗㒣㒚㒢㒝㒡㒜㒡㒝㒟㒞㒞㒟㒢㒚㒜㒡㒞㒦㒚㒤㒞㒟㒘㒥㒘㒘㒜㒚㒦㒘㒙㒤㒤㒚㒚㒦㒢㒜㒡㒝㒠㒞㒠㒟㒟㒚㒝㒡㒡㒜㒛㒣㒙㒞㒙㒦㒝㒡㒘㒗㒗㒘㒦㒙㒥㒚㒘㒣㒣㒜㒗㒗㒡㒞㒠㒠㒟㒠㒠㒡㒝㒢㒜㒣㒠㒜㒚㒥㒞㒝㒙㒗㒞㒟㒗㒚㒦㒚㒥㒛㒤㒜㒘㒗㒢㒞㒡㒟㒠㒠㒟㒣㒞㒢㒞㒥㒜㒤㒛㒥㒟㒡㒚㒗㒠㒢㒘㒚㒗㒚㒦㒛㒦㒞㒤㒝㒣㒞㒗㒛㒡㒠㒙㒠㒟㒣㒞㒣㒝㒤㒞㒗㒛㒦㒛㒗㒞㒥㒙㒙㒘㒥㒗㒛㒦㒜㒥㒝㒥㒠㒣㒟㒢㒠㒦㒟㒠㒢㒝㒙㒞㒥㒝㒥㒜㒦㒜㒗㒛㒘㒚㒙㒝㒥㒘㒛㒜㒚㒦㒝㒥㒠㒤㒟㒤㒠㒢㒡㒡㒢㒥㒝㒟㒤㒢㒙㒞㒗㒡㒢㒜㒘㒛㒛㒟㒝㒙㒛㒝㒗㒗㒝㒝㒞㒥㒟㒤㒠㒣㒡㒣㒢㒢㒝㒠㒤㒤㒟㒞㒦㒜㒡㒝㒙㒠㒤㒛㒚㒚㒛㒙㒜㒘㒝㒛㒦㒦㒟㒚㒚㒤㒡㒣㒣㒢㒣㒣㒤㒠㒥㒟㒦㒣㒟㒞㒘㒡㒠㒜㒚㒡㒢㒚㒝㒙㒝㒘㒞㒗㒟㒛㒚㒥㒡㒤㒢㒣㒣㒢㒦㒡㒥㒢㒘㒠㒗㒟㒘㒢㒤㒝㒚㒣㒥㒛㒝㒚㒝㒙㒞㒙㒡㒗㒠㒦㒡㒚㒞㒤㒣㒘㒡㒣㒗㒡㒦㒡㒗㒡㒚㒟㒙㒞㒚㒢㒘㒜㒜㒡㒦㒚㒟㒙㒟㒘㒠㒘㒣㒦㒢㒥㒣㒙㒢㒣㒥㒠㒡㒢㒘㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒡㒘㒛㒞㒟㒝㒙㒠㒘㒣㒗㒢㒗㒣㒥㒤㒤㒥㒘㒠㒣㒗㒥㒜㒡㒚㒤㒥㒟㒛㒞㒞㒢㒠㒜㒞㒠㒚㒚㒠㒝㒡㒘㒢㒗㒣㒦㒤㒦㒥㒤㒢㒤㒗㒗㒢㒢㒙㒟㒤㒠㒜㒤㒗㒞㒝㒝㒞㒜㒟㒛㒠㒟㒙㒙㒢㒝㒝㒗㒤㒦㒦㒥㒦㒦㒙㒤㒘㒣㒙㒦㒤㒡㒛㒞㒡㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒚㒢㒞㒛㒘㒤㒚㒤㒦㒦㒚㒡㒥㒘㒤㒙㒣㒚㒢㒛㒥㒦㒠㒝㒟㒞㒞㒟㒝㒤㒜㒡㒜㒤㒚㒣㒙㒤㒝㒠㒗㒦㒞㒡㒦㒙㒥㒙㒤㒚㒤㒝㒢㒜㒡㒝㒥㒚㒟㒟㒙㒘㒝㒡㒜㒢㒛㒣㒛㒦㒙㒥㒘㒦㒜㒤㒗㒘㒟㒦㒥㒚㒤㒛㒣㒜㒣㒟㒡㒞㒠㒟㒤㒞㒞㒡㒦㒙㒜㒤㒛㒤㒚㒥㒙㒦㒙㒗㒘㒘㒛㒤㒦㒚㒚㒙㒤㒜㒣㒟㒢㒞㒢㒟㒠㒣㒟㒢㒣㒜㒝㒣㒠㒘㒛㒦㒟㒡㒚㒗㒚㒚㒛㒤㒗㒚㒚㒦㒥㒜㒚㒛㒣㒠㒢㒟㒡㒠㒡㒣㒟㒢㒞㒤㒢㒠㒜㒥㒣㒠㒛㒘㒚㒘㒙㒙㒙㒜㒚㒦㒦㒜㒚㒚㒤㒞㒠㒗㒢㒡㒡㒡㒠㒢㒠㒥㒢㒟㒝㒥㒡㒤㒜㒗㒥㒣㒚㒛㒙㒚㒘㒛㒘㒞㒚㒘㒥㒞㒙㒞㒣㒠㒢㒙㒡㒣㒠㒣㒟㒤㒞㒥㒚㒦㒝㒗㒠㒤㒛㒙㒟㒙㒙㒛㒘㒞㒗㒝㒦㒞㒙㒢㒤㒡㒘㒛㒢㒢㒦㒞㒠㒤㒤㒡㒞㒦㒟㒙㒝㒘㒜㒚㒟㒥㒚㒛㒠㒦㒘㒞㒗㒞㒦㒟㒦㒢㒘㒜㒣㒢㒗㒟㒡㒤㒝㒢㒠㒗㒟㒗㒞㒘㒞㒛㒟㒥㒛㒛㒟㒙㒙㒝㒟㒝㒗㒡㒦㒠㒥㒡㒥㒤㒗㒞㒢㒤㒦㒣㒠㒦㒢㒤㒟㒙㒞㒙㒝㒚㒜㒛㒘㒜㒚㒝㒞㒙㒘㒟㒜㒞㒦㒡㒥㒤㒤㒣㒤㒤㒣㒘㒢㒗㒥㒡㒠㒘㒞㒢㒞㒚㒡㒦㒜㒜㒜㒟㒞㒙㒙㒟㒝㒛㒗㒡㒦㒜㒥㒤㒤㒤㒣㒥㒤㒘㒥㒢㒡㒘㒤㒥㒟㒚㒜㒡㒝㒞㒜㒝㒛㒞㒚㒟㒝㒣㒘㒢㒜㒜㒦㒣㒚㒟㒤㒥㒘㒢㒣㒗㒢㒘㒥㒦㒠㒛㒣㒣㒞㒜㒢㒗㒜㒞㒛㒠㒚㒠㒚㒣㒘㒢㒗㒤㒛㒜㒥㒥㒗㒟㒤㒘㒣㒘㒢㒙㒢㒜㒙㒣㒟㒜㒢㒦㒝㒞㒤㒙㒛㒡㒚㒡㒙㒢㒙㒥㒗㒤㒦㒥㒚㒠㒥㒗㒜㒟㒣㒛㒢㒚㒡㒛㒡㒞㒟㒝㒞㒞㒢㒚㒜㒠㒠㒦㒚㒤㒙㒣㒘㒤㒙㒗㒦㒦㒦㒗㒙㒤㒤㒙㒠㒥㒢㒜㒡㒜㒠㒝㒟㒞㒞㒟㒝㒠㒡㒚㒛㒢㒟㒟㒙㒤㒙㒗㒗㒦㒗㒗㒦㒘㒥㒙㒘㒢㒣㒛㒢㒞㒡㒝㒠㒟㒟㒟㒞㒠㒢㒣㒜㒢㒠㒛㒚㒤㒝㒡㒘㒦㒘㒗㒗㒘㒗㒛㒥㒗㒤㒛㒗㒥㒢㒝㒙㒘㒠㒠㒟㒠㒞㒡㒞㒤㒜㒣㒛㒤㒟㒟㒙㒦㒙㒛㒘㒙㒗㒙㒦㒚㒦㒝㒤㒜㒣㒝㒗㒙㒡㒟㒠㒙㒟㒣㒞㒢㒝㒣㒝㒦㒛㒥㒚㒦㒞㒣㒙㒘㒟㒘㒗㒚㒦㒛㒥㒜㒤㒝㒣㒞㒢㒟㒦㒙㒠㒡㒤㒞㒞㒣㒝㒦㒜㒥㒝㒘㒛㒗㒚㒘㒝㒣㒘㒚㒞㒥㒦㒝㒥㒝㒤㒞㒤㒡㒢㒠㒡㒡㒥㒝㒟㒣㒚㒠㒞㒗㒜㒦㒜㒗㒜㒚㒚㒙㒙㒚㒝㒗㒗㒜㒦㒠㒥㒠㒤㒟㒣㒠㒣㒣㒡㒢㒠㒣㒤㒡㒞㒥㒛㒦㒝㒙㒜㒘㒛㒙㒚㒚㒙㒛㒘㒜㒜㒗㒦㒞㒚㒜㒤㒠㒣㒣㒢㒢㒢㒥㒤㒟㒟㒥㒣㒡㒞㒗㒗㒙㒜㒙㒛㒚㒚㒛㒙㒜㒝㒚㒗㒟㒛㒗㒥㒠㒙㒜㒣㒢㒢㒤㒡㒤㒠㒥㒠㒦㒟㒗㒢㒠㒝㒙㒜㒤㒛㒛㒚㒜㒙㒝㒙㒠㒛㒚㒦㒠㒚㒚㒤㒢㒝㒤㒢㒤㒡㒥㒠㒦㒡㒙㒢㒣㒞㒙㒡㒤㒜㒛㒜㒝㒚㒞㒙㒞㒘㒟㒘㒢㒚㒜㒥㒢㒙㒞㒣㒤㒘㒗㒢㒘㒡㒗㒠㒘㒠㒛㒡㒥㒝㒛㒡㒘㒛㒝㒜㒢㒙㒟㒘㒠㒗㒡㒗㒤㒙㒞㒤㒤㒘㒢㒢㒦㒝㒟㒡㒘㒠㒙㒟㒚㒟㒝㒡㒗㒜㒝㒠㒜㒚㒟㒘㒚㒘㒣㒗㒢㒦㒣㒦㒦㒘㒠㒣㒦㒗㒦㒢㒘㒥㒣㒠㒛㒟㒛㒞㒜㒞㒟㒠㒙㒛㒟㒟㒠㒙㒡㒠㒣㒗㒤㒦㒤㒥㒥㒦㒘㒗㒢㒣㒘㒗㒚㒡㒚㒤㒙㒟㒞㒞㒝㒝㒞㒝㒡㒟㒛㒚㒡㒞㒤㒘㒣㒠㒟㒗㒗㒥㒦㒥㒗㒤㒘㒙㒚㒢㒛㒥㒣㒠㒜㒤㒟㒞㒞㒝㒠㒜㒠㒜㒣㒚㒢㒙㒤㒝㒝㒗㒥㒥㒥㒦㒗㒥㒘㒤㒙㒤㒜㒥㒦㒡㒜㒥㒗㒟㒞㒚㒠㒝㒢㒜㒡㒛㒢㒚㒣㒛㒝㒘㒥㒜㒟㒗㒗㒚㒡㒥㒙㒘㒤㒣㒛㒣㒞㒥㒘㒠㒞㒤㒙㒞㒠㒚㒦㒜㒢㒛㒣㒚㒤㒙㒥㒚㒟㒘㒗㒛㒡㒦㒙㒙㒣㒤㒛㒗㒦㒢㒝㒢㒠㒠㒟㒟㒡㒣㒛㒝㒢㒛㒢㒛㒤㒚㒥㒙㒦㒛㒗㒗㒟㒗㒙㒚㒤㒥㒛㒘㒦㒣㒝㒞㒛㒡㒟㒡㒢㒣㒜㒞㒢㒢㒟㒜㒤㒡㒗㒛㒗㒚㒗㒙㒘㒘㒙㒤㒚㒦㒛㒙㒦㒤㒝㒘㒚㒢㒟㒡㒢㒠㒡㒡㒢㒣㒥㒝㒥㒡㒟㒛㒦㒟㒡㒚㒘㒥㒗㒘㒛㒙㒛㒛㒞㒥㒞㒙㒘㒣㒟㒗㒚㒡㒡㒥㒚㒟㒥㒞㒦㒣㒘㒜㒦㒠㒢㒛㒘㒠㒟㒙㒚㒘㒛㒗㒜㒦㒟㒚㒡㒤㒟㒘㒜㒢㒡㒙㒙㒠㒣㒟㒤㒞㒥㒞㒘㒢㒚㒜㒘㒟㒦㒚㒚㒙㒡㒘㒜㒗㒝㒦㒞㒥㒡㒙㒣㒣㒡㒗㒠㒡㒣㒥㒟㒟㒥㒞㒦㒞㒗㒝㒚㒡㒜㒛㒚㒟㒚㒙㒜㒜㒡㒗㒞㒦㒟㒥㒠㒤㒣㒘㒥㒢㒣㒦㒤㒠㒥㒦㒤㒟㒗㒞㒘㒝㒙㒜㒜㒠㒞㒚㒜㒞㒞㒘㒞㒘㒤㒦㒠㒥㒡㒤㒢㒣㒥㒘㒗㒡㒥㒦㒘㒠㒗㒡㒗㒞㒙㒝㒚㒜㒛㒜㒞㒡㒥㒙㒟㒝㒢㒗㒠㒥㒠㒥㒢㒤㒣㒣㒤㒤㒗㒡㒦㒡㒗㒥㒜㒟㒙㒥㒠㒝㒛㒜㒜㒛㒝㒚㒞㒙㒟㒘㒠㒜㒤㒦㒢㒚㒦㒤㒤㒙㒙㒢㒦㒣㒙㒡㒘㒠㒙㒤㒞㒞㒛㒟㒝㒜㒝㒛㒞㒚㒟㒙㒠㒘㒡㒗㒢㒛㒦㒥㒤㒚㒘㒣㒦㒘㒛㒢㒘㒢㒛㒠㒚㒟㒛㒣㒠㒝㒝㒙㒟㒛㒟㒚㒠㒙㒡㒘㒢㒗㒣㒦㒤㒛㒘㒤㒦㒙㒚㒣㒘㒗㒝㒡㒚㒡㒝㒟㒜㒞㒝㒢㒣㒜㒟㒙㒞㒚㒢㒙㒢㒘㒣㒗㒤㒦㒥㒥㒦㒚㒚㒤㒘㒘㒜㒢㒚㒦㒠㒠㒜㒟㒣㒚㒜㒝㒟㒡㒥㒛㒡㒝㒥㒙㒣㒘㒥㒗㒥㒗㒘㒦㒗㒥㒘㒙㒛㒣㒚㒢㒛㒡㒜㒥㒘㒟㒞㒞㒟㒝㒠㒜㒡㒠㒤㒚㒣㒙㒤㒘㒥㒜㒣㒗㒗㒦㒘㒥㒙㒤㒚㒘㒘㒢㒝㒦㒠㒠㒞㒤㒤㒞㒠㒝㒢㒜㒢㒛㒥㒠㒗㒙㒥㒞㒙㒘㒗㒜㒦㒦㒙㒥㒚㒤㒛㒣㒞㒗㒠㒡㒞㒥㒣㒟㒠㒠㒜㒝㒢㒜㒣㒛㒤㒛㒗㒟㒙㒙㒗㒝㒝㒗㒙㒝㒜㒥㒛㒤㒜㒣㒝㒢㒤㒝㒝㒠㒠㒥㒗㒞㒢㒟㒣㒜㒤㒛㒦㒚㒦㒚㒘㒙㒘㒘㒙㒜㒜㒦㒛㒥㒜㒤㒝㒘㒡㒢㒟㒡㒠㒠㒡㒠㒘㒚㒡㒝㒤㒢㒜㒛㒦㒢㒘㒚㒘㒙㒚㒘㒚㒗㒝㒦㒜㒥㒝㒙㒠㒣㒟㒢㒠㒡㒡㒠㒣㒟㒣㒞㒤㒝㒥㒜㒦㒡㒙㒛㒘㒚㒙㒙㒚㒜㒗㒗㒜㒦㒝㒥㒞㒤㒥㒟㒞㒢㒡㒗㒚㒠㒣㒗㒗㒞㒥㒞㒗㒝㒗㒜㒙㒛㒙㒚㒚㒞㒝㒘㒜㒗㒝㒦㒞㒚㒦㒤㒠㒣㒡㒢㒢㒢㒙㒜㒢㒟㒥㒤㒟㒞㒗㒢㒣㒜㒙㒛㒛㒚㒛㒙㒝㒘㒝㒗㒞㒛㒡㒥㒠㒤㒡㒣㒢㒘㒚㒡㒤㒠㒥㒟㒦㒟㒝㒙㒦㒝㒙㒡㒤㒛㒛㒚㒤㒙㒝㒘㒟㒗㒟㒦㒡㒥㒡㒤㒢㒘㒥㒢㒤㒡㒥㒠㒦㒥㒞㒟㒘㒞㒙㒝㒚㒜㒡㒗㒚㒚㒝㒟㒙㒘㒟㒛㒞㒦㒡㒥㒣㒤㒣㒣㒥㒢㒥㒡㒦㒦㒙㒠㒘㒟㒙㒞㒚㒟㒝㒜㒜㒛㒝㒚㒞㒚㒡㒜㒛㒗㒡㒜㒞㒥㒣㒗㒗㒤㒘㒢㒦㒢㒗㒡㒘㒡㒢㒟㒚㒤㒗㒝㒜㒡㒗㒛㒞㒠㒛㒙㒠㒙㒣㒛㒝㒦㒣㒛㒢㒤㒥㒡㒤㒣㒘㒢㒘㒡㒙㒠㒚㒥㒡㒞㒜㒣㒙㒜㒞㒡㒛㒚㒠㒟㒟㒘㒢㒘㒙㒢㒢㒥㒥㒚㒤㒤㒗㒗㒚㒢㒙㒡㒛㒠㒛㒟㒤㒞㒝㒝㒞㒡㒡㒛㒠㒚㒡㒙㒢㒝㒟㒗㒤㒦㒥㒥㒦㒥㒗㒙㒚㒣㒙㒢㒚㒡㒛㒤㒦㒟㒝㒞㒞㒝㒟㒜㒠㒠㒣㒚㒢㒙㒣㒘㒤㒝㒛㒦㒦㒦㒗㒥㒘㒤㒙㒘㒜㒢㒛㒡㒜㒠㒝㒤㒥㒞㒟㒝㒠㒜㒡㒛㒢㒟㒥㒙㒤㒘㒥㒗㒦㒚㒚㒦㒘㒥㒙㒤㒚㒣㒛㒗㒞㒡㒝㒠㒞㒟㒟㒢㒘㒝㒡㒜㒢㒛㒣㒚㒤㒟㒗㒘㒦㒘㒗㒗㒘㒦㒝㒥㒚㒤㒛㒣㒜㒢㒝㒦㒠㒠㒟㒟㒠㒞㒡㒡㒛㒜㒣㒛㒤㒚㒥㒙㒦㒝㒤㒘㒙㒜㒥㒦㒚㒛㒙㒤㒜㒣㒞㒢㒞㒡㒟㒥㒢㒟㒡㒤㒞㒝㒣㒢㒛㒛㒥㒚㒦㒚㒗㒚㒚㒡㒡㒗㒚㒜㒘㒥㒜㒜㒗㒣㒟㒢㒟㒡㒠㒡㒣㒟㒢㒞㒣㒣㒢㒜㒥㒢㒣㒛㒘㒚㒘㒙㒙㒙㒜㒗㒛㒦㒜㒛㒜㒤㒞㒣㒡㒢㒠㒡㒡㒠㒢㒠㒥㒞㒤㒝㒥㒢㒦㒜㒗㒦㒟㒚㒛㒙㒚㒘㒛㒗㒜㒦㒝㒥㒞㒚㒜㒣㒠㒘㒡㒡㒢㒠㒥㒟㒤㒞㒥㒝㒦㒝㒗㒡㒤㒛㒙㒚㒜㒙㒛㒘㒝㒗㒝㒗㒠㒥㒟㒤㒡㒙㒝㒢㒢㒚㒘㒠㒦㒟㒥㒞㒦㒟㒙㒠㒣㒜㒙㒡㒗㒚㒛㒜㒦㒘㒝㒗㒞㒦㒟㒥㒠㒗㒝㒣㒢㒘㒟㒡㒤㒡㒗㒟㒦㒟㒘㒞㒘㒝㒙㒡㒜㒛㒛㒠㒘㒙㒝㒝㒥㒗㒟㒦㒠㒥㒡㒥㒤㒝㒛㒢㒤㒗㒢㒠㒦㒗㒡㒟㒙㒞㒙㒝㒚㒝㒝㒛㒜㒚㒝㒟㒜㒘㒟㒚㒦㒦㒡㒥㒢㒤㒣㒤㒦㒢㒥㒡㒦㒦㒦㒠㒘㒦㒛㒞㒚㒝㒛㒜㒜㒜㒟㒚㒞㒙㒟㒞㒠㒗㒡㒛㒡㒥㒤㒤㒤㒣㒥㒢㒦㒢㒗㒡㒘㒥㒦㒟㒚㒤㒛㒝㒜㒜㒟㒛㒞㒚㒟㒙㒠㒘㒡㒝㒞㒦㒣㒥㒦㒤㒥㒤㒗㒣㒗㒢㒘㒗㒥㒠㒚㒥㒗㒞㒜㒢㒤㒜㒞㒛㒟㒚㒠㒚㒣㒘㒢㒗㒣㒜㒡㒥㒥㒜㒠㒤㒘㒣㒘㒢㒙㒢㒜㒠㒛㒟㒜㒤㒛㒝㒞㒚㒠㒛㒢㒚㒡㒙㒢㒙㒥㒗㒤㒦㒥㒛㒥㒥㒗㒣㒞㒣㒚㒢㒚㒡㒛㒡㒞㒟㒝㒞㒞㒣㒟㒜㒠㒠㒘㒚㒣㒙㒣㒘㒤㒗㒥㒦㒦㒦㒗㒚㒥㒤㒙㒙㒚㒢㒛㒡㒞㒠㒝㒟㒞㒞㒟㒝㒠㒢㒟㒛㒢㒛㒢㒙㒤㒘㒥㒗㒦㒘㒙㒦㒘㒥㒙㒚㒙㒣㒛㒙㒦㒡㒞㒠㒞㒟㒟㒟㒢㒝㒡㒜㒢㒡㒣㒚㒤㒘㒣㒙㒗㒘㒗㒗㒘㒗㒛㒥㒚㒤㒛㒙㒝㒢㒝㒟㒠㒠㒡㒟㒠㒞㒡㒞㒤㒠㒞㒛㒤㒡㒗㒙㒦㒙㒠㒘㒙㒗㒙㒦㒚㒥㒛㒜㒜㒣㒞㒘㒝㒡㒟㒦㒢㒟㒡㒞㒤㒝㒣㒜㒤㒛㒥㒚㒦㒟㒤㒙㒘㒝㒦㒗㒚㒜㒚㒥㒜㒤㒝㒣㒞㒢㒟㒗㒜㒠㒡㒟㒤㒞㒣㒝㒥㒜㒥㒝㒘㒛㒗㒚㒘㒞㒥㒘㒚㒞㒤㒦㒝㒥㒝㒤㒞㒤㒡㒢㒠㒡㒡㒦㒟㒟㒣㒦㒞㒝㒦㒜㒦㒜㒗㒜㒚㒚㒙㒙㒚㒞㒙㒗㒜㒚㒞㒥㒠㒤㒟㒣㒠㒣㒣㒡㒢㒠㒣㒥㒣㒞㒥㒙㒗㒝㒙㒜㒘㒛㒙㒛㒜㒙㒛㒘㒜㒝㒝㒦㒞㒞㒥㒤㒡㒣㒡㒢㒢㒡㒣㒠㒤㒟㒥㒤㒣㒞㒗㒣㒘㒜㒙㒛㒜㒚㒛㒙㒜㒘㒝㒗㒞㒜㒝㒥㒠㒥㒠㒣㒢㒢㒣㒡㒤㒢㒗㒟㒠㒟㒗㒤㒗㒝㒙㒣㒤㒛㒜㒚㒜㒙㒝㒙㒠㒗㒟㒦㒠㒛㒡㒤㒢㒥㒤㒢㒦㒡㒥㒠㒦㒡㒙㒟㒘㒞㒙㒣㒛㒜㒛㒡㒜㒚㒟㒙㒞㒘㒟㒘㒢㒦㒡㒥㒢㒚㒥㒣㒤㒢㒜㒢㒗㒡㒗㒠㒘㒟㒙㒞㒚㒝㒛㒢㒛㒛㒝㒠㒠㒙㒟㒘㒢㒗㒡㒦㒢㒥㒣㒤㒤㒙㒢㒢㒦㒗㒤㒡㒘㒦㒘㒟㒚㒞㒛㒠㒘㒜㒝㒡㒚㒚㒟㒙㒢㒘㒡㒗㒣㒦㒣㒦㒦㒘㒠㒣㒦㒘㒣㒢㒘㒣㒜㒠㒝㒟㒛㒞㒜㒝㒝㒞㒗㒛㒟㒠㒜㒙㒡㒝㒜㒗㒣㒜㒠㒥㒥㒦㒘㒗㒢㒣㒘㒘㒗㒡㒚㒞㒙㒟㒝㒞㒝㒝㒞㒜㒟㒡㒦㒚㒡㒟㒞㒘㒣㒝㒠㒦㒥㒛㒤㒥㒗㒤㒞㒟㒗㒢㒚㒗㒙㒠㒜㒟㒡㒞㒞㒝㒠㒜㒠㒜㒙㒚㒢㒙㒣㒝㒦㒗㒥㒦㒦㒦㒗㒥㒛㒤㒙㒣㒚㒢㒛㒡㒜㒥㒟㒟㒞㒞㒟㒝㒠㒡㒛㒛㒢㒚㒣㒙㒤㒘㒥㒝㒘㒗㒗㒦㒘㒥㒙㒘㒢㒣㒛㒢㒜㒡㒝㒠㒞㒤㒡㒞㒠㒝㒡㒜㒢㒡㒞㒚㒤㒙㒥㒘㒦㒘㒗㒜㒚㒦㒙㒥㒚㒤㒛㒘㒣㒢㒝㒡㒞㒠㒟㒟㒠㒣㒣㒝㒢㒜㒣㒛㒤㒞㒘㒙㒦㒙㒗㒘㒘㒗㒙㒛㒜㒥㒛㒤㒜㒣㒝㒥㒣㒡㒟㒠㒠㒟㒡㒞㒢㒢㒥㒜㒤㒛㒥㒚㒦㒝㒛㒙㒘㒘㒙㒗㒚㒦㒛㒚㒙㒤㒞㒙㒚㒢㒟㒗㒞㒠㒡㒟㒣㒞㒣㒝㒤㒙㒜㒛㒦㒠㒣㒚㒘㒞㒥㒘㒚㒗㒛㒦㒜㒦㒟㒤㒞㒣㒠㒘㒝㒡㒡㒟㒡㒟㒣㒞㒤㒝㒥㒞㒘㒟㒢㒛㒘㒠㒗㒙㒚㒟㒡㒗㒜㒦㒝㒥㒞㒤㒟㒥㒙㒢㒡㒗㒟㒠㒣㒥㒡㒞㒥㒣㒤㒝㒗㒝㒚㒞㒤㒚㒚㒟㒙㒘㒜㒤㒞㒦㒞㒥㒟㒤㒠㒣㒡㒤㒛㒡㒣㒦㒡㒟㒥㒤㒣㒞㒗㒢㒦㒜㒙㒜㒜㒝㒦㒙㒜㒞㒜㒗㒞㒤㒝㒥㒡㒤㒡㒣㒢㒢㒣㒘㒚㒠㒥㒥㒣㒟㒗㒣㒥㒝㒙㒢㒙㒛㒛㒚㒢㒥㒛㒘㒞㒝㒞㒦㒠㒚㒛㒤㒢㒣㒤㒢㒤㒢㒠㒠㒦㒠㒗㒤㒚㒞㒙㒝㒚㒜㒛㒠㒣㒚㒝㒙㒞㒘㒟㒗㒠㒛㒣㒥㒢㒤㒣㒣㒤㒦㒘㒡㒦㒡㒗㒠㒘㒟㒙㒣㒜㒝㒛㒜㒜㒛㒝㒞㒘㒙㒟㒘㒠㒗㒡㒦㒢㒚㒥㒤㒤㒣㒥㒢㒦㒗㒘㒡㒘㒠㒙㒟㒚㒞㒛㒢㒞㒜㒝㒛㒞㒚㒟㒙㒤㒘㒡㒗㒢㒦㒣㒥㒤㒚㒗㒣㒦㒣㒗㒢㒘㒦㒛㒠㒚㒟㒛㒞㒜㒝㒝㒡㒠㒛㒟㒚㒠㒙㒡㒝㒢㒗㒣㒦㒤㒥㒥㒤㒦㒙㒙㒣㒘㒢㒙㒡㒚㒤㒥㒟㒜㒞㒝㒝㒞㒜㒟㒠㒢㒚㒡㒙㒢㒘㒣㒜㒢㒦㒥㒥㒦㒥㒗㒤㒘㒘㒛㒢㒚㒡㒛㒠㒜㒣㒙㒞㒞㒝㒟㒜㒠㒛㒡㒟㒤㒙㒣㒘㒤㒗㒥㒜㒚㒦㒗㒥㒘㒤㒙㒣㒚㒗㒘㒡㒝㒦㒚㒟㒞㒤㒞㒝㒠㒜㒢㒛㒢㒛㒥㒙㒤㒘㒦㒝㒣㒗㒗㒥㒗㒥㒙㒤㒚㒣㒛㒣㒞㒥㒘㒠㒞㒥㒝㒞㒠㒥㒗㒜㒢㒛㒣㒚㒤㒙㒥㒚㒟㒘㒗㒜㒥㒦㒙㒛㒗㒤㒛㒙㒚㒢㒝㒢㒠㒤㒚㒟㒠㒤㒟㒝㒢㒗㒦㒛㒤㒚㒥㒙㒦㒙㒗㒙㒡㒗㒙㒜㒗㒥㒛㒚㒙㒣㒝㒘㒜㒡㒟㒡㒢㒣㒜㒞㒢㒣㒢㒜㒤㒙㒣㒛㒗㒚㒗㒙㒘㒘㒙㒝㒠㒦㒛㒛㒙㒤㒝㒙㒛㒢㒟㒗㒟㒠㒡㒠㒘㒚㒡㒝㒤㒢㒤㒛㒦㒜㒠㒚㒘㒙㒚㒘㒚㒗㒝㒦㒜㒥㒝㒙㒠㒣㒟㒢㒠㒡㒡㒣㒡㒟㒣㒞㒤㒝㒥㒜㒦㒡㒙㒛㒘㒚㒙㒙㒚㒜㒗㒗㒜㒦㒝㒥㒞㒤㒟㒘㒝㒢㒢㒗㒟㒠㒣㒥㒣㒞㒥㒞㒗㒝㒗㒜㒘㒜㒙㒚㒚㒟㒘㒘㒜㒗㒥㒦㒞㒥㒟㒤㒠㒤㒣㒢㒢㒡㒤㒦㒢㒟㒥㒦㒠㒞㒘㒝㒘㒜㒙㒜㒜㒝㒦㒙㒜㒞㒜㒗㒞㒤㒣㒥㒠㒤㒡㒣㒢㒣㒥㒥㒟㒠㒥㒥㒦㒟㒗㒠㒙㒝㒚㒜㒚㒛㒛㒛㒞㒝㒘㒘㒞㒝㒠㒦㒠㒗㒟㒤㒢㒣㒣㒢㒤㒡㒥㒝㒦㒠㒗㒤㒦㒞㒙㒣㒛㒜㒛㒛㒞㒚㒝㒚㒠㒜㒚㒗㒠㒜㒠㒥㒢㒤㒥㒤㒗㒢㒥㒡㒦㒢㒙㒟㒥㒟㒙㒤㒚㒝㒛㒣㒦㒛㒞㒚㒞㒙㒟㒙㒢㒗㒡㒦㒢㒛㒤㒤㒤㒘㒘㒢㒦㒢㒗㒡㒘㒡㒛㒟㒚㒞㒛㒣㒞㒜㒝㒚㒜㒚㒡㒙㒠㒘㒡㒘㒤㒦㒣㒥㒤㒛㒘㒣㒦㒤㒦㒢㒚㒡㒙㒠㒚㒟㒛㒞㒜㒝㒝㒢㒞㒛㒟㒠㒣㒙㒡㒘㒤㒗㒣㒗㒦㒥㒥㒤㒦㒚㒘㒣㒘㒙㒣㒡㒛㒠㒛㒟㒜㒟㒟㒝㒞㒜㒟㒡㒢㒚㒡㒗㒜㒘㒥㒗㒤㒦㒥㒗㒘㒥㒗㒤㒘㒙㒜㒢㒚㒙㒚㒠㒜㒟㒝㒞㒞㒞㒡㒜㒠㒛㒡㒠㒦㒙㒣㒝㒣㒗㒦㒦㒦㒦㒗㒥㒘㒤㒙㒣㒚㒘㒜㒡㒜㒦㒡㒟㒞㒞㒡㒝㒠㒝㒣㒛㒟㒚㒣㒟㒦㒘㒥㒟㒠㒗㒘㒦㒘㒥㒙㒥㒜㒣㒛㒢㒜㒗㒠㒠㒞㒦㒤㒞㒡㒝㒡㒜㒢㒜㒥㒚㒤㒙㒥㒟㒚㒘㒗㒙㒠㒦㒚㒥㒚㒤㒛㒤㒞㒢㒝㒡㒞㒦㒤㒟㒠㒣㒗㒝㒢㒜㒣㒛㒤㒚㒥㒙㒦㒙㒗㒞㒚㒗㒙㒜㒟㒥㒛㒤㒞㒣㒝㒣㒠㒡㒟㒠㒠㒥㒤㒞㒢㒥㒝㒜㒥㒛㒥㒚㒦㒛㒙㒙㒘㒘㒙㒝㒞㒦㒛㒝㒞㒤㒟㒣㒞㒢㒟㒢㒢㒠㒡㒟㒢㒥㒘㒝㒤㒗㒞㒛㒦㒛㒗㒚㒘㒚㒛㒘㒚㒗㒛㒜㒢㒥㒝㒢㒛㒣㒠㒢㒠㒡㒡㒠㒢㒟㒣㒞㒤㒤㒘㒜㒦㒢㒝㒛㒘㒚㒛㒙㒚㒙㒝㒗㒙㒦㒝㒛㒢㒤㒟㒛㒚㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒣㒜㒜㒘㒢㒗㒚㒜㒙㒛㒘㒜㒘㒟㒦㒞㒥㒟㒚㒦㒣㒡㒤㒦㒡㒦㒠㒤㒟㒥㒠㒘㒞㒗㒝㒘㒢㒠㒛㒚㒦㒞㒙㒝㒘㒝㒗㒞㒦㒟㒥㒠㒤㒡㒙㒦㒢㒣㒘㒛㒠㒥㒠㒘㒟㒗㒟㒚㒝㒙㒜㒚㒡㒠㒚㒜㒡㒗㒘㒟㒗㒟㒦㒠㒦㒣㒤㒢㒣㒣㒙㒚㒡㒥㒥㒢㒠㒘㒟㒘㒞㒙㒞㒜㒜㒛㒛㒜㒠㒤㒙㒞㒢㒚㒗㒢㒦㒡㒥㒢㒥㒥㒣㒤㒢㒥㒘㒞㒡㒗㒚㒞㒟㒚㒞㒚㒝㒛㒜㒜㒛㒝㒚㒞㒟㒤㒘㒠㒞㒙㒦㒢㒥㒥㒤㒤㒣㒥㒙㒗㒢㒘㒦㒥㒠㒙㒥㒟㒞㒛㒝㒝㒜㒝㒜㒠㒞㒚㒙㒠㒞㒟㒗㒢㒘㒦㒦㒗㒤㒥㒣㒦㒣㒗㒣㒡㒡㒙㒦㒘㒟㒛㒢㒦㒝㒝㒢㒜㒛㒟㒛㒢㒝㒜㒘㒢㒝㒣㒦㒤㒣㒣㒥㒗㒤㒗㒣㒘㒢㒙㒗㒠㒠㒛㒥㒚㒞㒝㒣㒜㒜㒟㒡㒠㒚㒡㒚㒘㒤㒡㒗㒤㒜㒥㒥㒦㒙㒘㒤㒘㒣㒚㒢㒚㒡㒟㒠㒜㒟㒝㒣㒠㒝㒟㒜㒠㒛㒡㒝㒡㒙㒣㒘㒤㒗㒥㒦㒦㒛㒙㒥㒘㒤㒙㒣㒚㒦㒥㒡㒜㒠㒝㒟㒞㒞㒟㒢㒢㒜㒡㒛㒢㒚㒣㒟㒡㒘㒥㒗㒦㒗㒗㒦㒘㒚㒛㒤㒚㒣㒛㒢㒜㒤㒝㒠㒞㒟㒟㒞㒠㒝㒡㒡㒟㒛㒤㒠㒢㒙㒥㒞㒦㒘㒗㒗㒙㒦㒙㒥㒠㒠㒙㒣㒜㒘㒛㒡㒞㒡㒞㒟㒠㒞㒢㒝㒢㒜㒤㒛㒤㒚㒥㒟㒘㒙㒗㒘㒘㒗㒙㒦㒝㒥㒛㒤㒜㒣㒝㒣㒠㒡㒟㒠㒡㒥㒠㒞㒢㒝㒦㒝㒗㒛㒥㒚㒦㒛㒙㒙㒘㒘㒚㒝㒚㒦㒛㒤㒛㒤㒝㒣㒞㒢㒟㒢㒢㒤㒜㒟㒢㒤㒤㒝㒤㒘㒦㒜㒘㒛㒗㒚㒘㒙㒙㒙㒣㒗㒛㒜㒜㒥㒝㒚㒞㒣㒟㒘㒡㒡㒡㒡㒤㒣㒞㒞㒤㒤㒗㒜㒦㒥㒡㒛㒙㒚㒙㒙㒚㒘㒛㒝㒢㒦㒝㒛㒞㒤㒟㒙㒠㒢㒡㒗㒤㒠㒣㒟㒤㒥㒗㒞㒗㒣㒗㒜㒘㒡㒚㒚㒚㒙㒛㒘㒜㒗㒝㒝㒗㒥㒠㒚㒟㒣㒡㒢㒢㒡㒣㒦㒥㒟㒥㒟㒚㒙㒟㒝㒘㒜㒙㒛㒚㒛㒜㒙㒦㒘㒞㒗㒞㒗㒡㒙㒛㒤㒡㒙㒦㒢㒣㒘㒘㒡㒗㒟㒦㒟㒗㒞㒘㒞㒢㒜㒚㒡㒟㒚㒜㒟㒠㒘㒞㒝㒣㒦㒠㒦㒣㒘㒝㒣㒣㒙㒚㒡㒥㒞㒤㒠㒘㒟㒘㒞㒙㒝㒚㒢㒡㒛㒜㒠㒡㒙㒞㒞㒣㒗㒠㒝㒗㒥㒢㒥㒙㒟㒢㒢㒥㒘㒜㒡㒗㒣㒙㒟㒙㒞㒛㒝㒛㒜㒢㒛㒝㒚㒞㒞㒡㒘㒠㒗㒡㒦㒢㒛㒚㒤㒤㒣㒥㒢㒦㒢㒗㒦㒚㒠㒙㒟㒚㒞㒛㒠㒟㒜㒝㒛㒞㒚㒟㒙㒠㒝㒣㒗㒢㒦㒣㒥㒤㒘㒛㒣㒦㒣㒗㒢㒘㒡㒙㒥㒜㒟㒛㒞㒜㒝㒝㒢㒜㒛㒟㒚㒠㒙㒡㒘㒢㒜㒥㒦㒤㒥㒥㒤㒦㒗㒞㒣㒘㒢㒙㒡㒚㒠㒛㒤㒞㒞㒝㒝㒞㒜㒟㒜㒟㒚㒡㒙㒢㒘㒣㒗㒤㒛㒢㒦㒗㒛㒛㒤㒘㒙㒟㒢㒚㒡㒜㒠㒜㒟㒣㒟㒢㒝㒟㒢㒟㒛㒡㒛㒗㒚㒝㒘㒥㒗㒥㒗㒘㒦㒗㒥㒜㒟㒡㒣㒚㒢㒛㒡㒜㒠㒢㒠㒘㒞㒠㒝㒠㒝㒣㒛㒢㒚㒤㒟㒣㒘㒥㒘㒙㒗㒚㒦㒘㒥㒙㒥㒜㒣㒛㒢㒝㒗㒝㒠㒞㒞㒞㒞㒠㒝㒡㒜㒢㒜㒥㒞㒟㒙㒥㒟㒗㒘㒗㒣㒙㒦㒛㒥㒚㒤㒛㒣㒜㒣㒦㒡㒞㒦㒟㒟㒠㒤㒡㒝㒢㒢㒤㒛㒤㒜㒗㒝㒡㒙㒗㒞㒚㒗㒙㒟㒤㒥㒜㒤㒜㒣㒝㒢㒞㒗㒥㒠㒠㒥㒡㒞㒢㒣㒣㒜㒤㒢㒗㒚㒦㒚㒗㒟㒚㒘㒚㒝㒚㒦㒛㒛㒝㒤㒝㒣㒞㒢㒟㒡㒠㒗㒚㒟㒣㒤㒢㒝㒤㒜㒥㒛㒦㒡㒘㒚㒘㒙㒝㒣㒢㒗㒛㒦㒜㒥㒝㒗㒚㒤㒙㒢㒡㒡㒡㒡㒤㒣㒞㒞㒤㒤㒙㒜㒦㒞㒞㒛㒙㒚㒙㒙㒚㒘㒛㒘㒥㒦㒝㒛㒢㒤㒟㒙㒣㒢㒡㒗㒦㒠㒣㒠㒚㒘㒛㒝㒦㒣㒛㒜㒘㒝㒚㒚㒤㒙㒜㒘㒜㒗㒞㒦㒞㒥㒣㒠㒘㒣㒡㒢㒢㒡㒣㒢㒥㒠㒟㒟㒗㒞㒗㒝㒜㒗㒡㒛㒚㒚㒛㒙㒜㒚㒢㒘㒘㒦㒠㒥㒠㒤㒡㒘㒤㒢㒣㒘㒘㒠㒥㒤㒥㒟㒗㒞㒘㒝㒙㒝㒜㒞㒦㒚㒜㒟㒢㒘㒞㒙㒦㒦㒡㒥㒡㒤㒢㒣㒣㒤㒝㒡㒥㒗㒛㒠㒗㒥㒛㒞㒙㒣㒟㒜㒛㒛㒜㒝㒙㒙㒞㒞㒣㒗㒠㒦㒣㒥㒢㒤㒤㒣㒤㒤㒗㒥㒡㒡㒗㒦㒜㒟㒙㒚㒞㒝㒛㒜㒜㒛㒝㒚㒞㒛㒘㒘㒠㒝㒥㒦㒢㒛㒦㒤㒤㒚㒙㒢㒦㒣㒙㒤㒣㒠㒙㒥㒠㒞㒛㒛㒚㒜㒞㒛㒞㒚㒟㒙㒠㒟㒗㒗㒢㒝㒗㒥㒤㒛㒙㒣㒦㒙㒝㒢㒘㒡㒟㒜㒘㒟㒛㒤㒢㒝㒝㒡㒚㒛㒟㒚㒡㒙㒡㒘㒣㒗㒣㒦㒤㒛㒗㒤㒦㒤㒗㒣㒘㒗㒘㒡㒚㒠㒛㒟㒜㒞㒝㒢㒛㒜㒠㒡㒤㒚㒡㒠㒘㒘㒣㒗㒥㒦㒥㒦㒜㒦㒛㒤㒘㒙㒘㒢㒚㒣㒗㒠㒦㒟㒞㒞㒞㒝㒡㒜㒠㒛㒥㒦㒚㒙㒣㒘㒤㒗㒥㒘㒢㒦㒡㒥㒙㒤㒙㒣㒜㒗㒞㒡㒜㒦㒜㒟㒞㒡㒝㒝㒠㒜㒡㒛㒢㒛㒙㒥㒢㒘㒥㒝㒦㒗㒗㒚㒥㒥㒙㒤㒛㒣㒛㒢㒟㒡㒝㒠㒞㒤㒡㒞㒠㒝㒡㒜㒢㒠㒝㒚㒤㒙㒥㒘㒦㒘㒗㒜㒚㒦㒙㒥㒚㒤㒛㒙㒛㒢㒝㒡㒞㒠㒟㒟㒠㒣㒣㒝㒢㒜㒣㒛㒤㒞㒡㒙㒦㒙㒗㒘㒘㒗㒛㒛㒝㒥㒛㒚㒝㒣㒝㒥㒥㒡㒟㒠㒠㒟㒡㒟㒘㒙㒡㒜㒤㒢㒗㒚㒦㒠㒞㒙㒘㒘㒚㒗㒚㒦㒜㒥㒜㒤㒝㒘㒠㒢㒟㒡㒠㒠㒡㒤㒜㒞㒣㒝㒤㒜㒥㒜㒜㒦㒥㒚㒘㒟㒜㒘㒚㒝㒞㒦㒜㒥㒞㒤㒞㒣㒣㒢㒠㒡㒡㒥㒤㒟㒣㒞㒤㒝㒥㒠㒢㒜㒗㒛㒘㒚㒙㒙㒚㒝㒝㒗㒜㒦㒝㒥㒞㒙㒙㒣㒠㒢㒡㒡㒢㒠㒣㒤㒦㒞㒥㒝㒦㒝㒗㒢㒙㒛㒙㒚㒚㒙㒛㒘㒜㒜㒟㒦㒞㒥㒟㒤㒠㒙㒣㒢㒢㒡㒣㒠㒤㒡㒗㒞㒦㒞㒘㒣㒜㒜㒙㒚㒙㒚㒛㒙㒜㒘㒝㒙㒞㒥㒦㒥㒠㒚㒥㒣㒢㒙㒗㒡㒤㒜㒢㒟㒦㒠㒙㒞㒘㒝㒚㒢㒠㒛㒛㒡㒦㒙㒞㒘㒞㒗㒟㒗㒢㒙㒜㒤㒢㒚㒚㒢㒤㒚㒢㒡㒗㒠㒗㒟㒘㒟㒛㒠㒥㒜㒛㒡㒤㒚㒝㒙㒟㒘㒢㒗㒠㒦㒡㒦㒤㒘㒞㒣㒤㒙㒞㒡㒦㒣㒤㒠㒙㒟㒙㒞㒚㒝㒛㒙㒜㒛㒝㒠㒤㒙㒟㒟㒙㒗㒡㒦㒤㒥㒣㒤㒤㒠㒥㒢㒦㒘㒛㒡㒘㒦㒟㒟㒚㒞㒝㒝㒜㒜㒝㒠㒚㒚㒟㒟㒥㒘㒡㒗㒢㒦㒣㒥㒤㒤㒥㒥㒘㒦㒢㒢㒘㒗㒟㒠㒚㒘㒜㒞㒝㒝㒝㒜㒞㒛㒟㒜㒙㒙㒡㒟㒘㒗㒣㒝㒘㒥㒥㒛㒜㒤㒗㒤㒚㒥㒤㒡㒚㒦㒣㒟㒜㒜㒛㒝㒟㒜㒟㒛㒠㒚㒡㒠㒘㒘㒣㒞㒚㒦㒥㒜㒜㒥㒗㒚㒠㒣㒙㒢㒠㒝㒙㒠㒜㒥㒥㒞㒞㒢㒤㒜㒠㒛㒢㒚㒢㒚㒠㒘㒤㒗㒥㒜㒘㒦㒗㒥㒘㒤㒙㒦㒙㒢㒛㒡㒜㒠㒝㒟㒞㒣㒡㒝㒠㒜㒡㒛㒢㒠㒟㒙㒤㒘㒥㒗㒦㒗㒗㒛㒚㒥㒙㒤㒚㒣㒛㒦㒘㒡㒝㒠㒞㒟㒟㒞㒠㒢㒣㒜㒢㒛㒣㒚㒤㒞㒙㒘㒦㒘㒗㒗㒘㒦㒙㒚㒜㒤㒛㒣㒜㒢㒝㒥㒙㒠㒟㒟㒠㒞㒡㒝㒢㒡㒥㒛㒤㒚㒥㒙㒦㒚㒚㒘㒘㒗㒙㒦㒚㒥㒛㒙㒞㒣㒝㒢㒞㒡㒟㒡㒤㒟㒡㒞㒢㒝㒣㒜㒤㒡㒗㒚㒦㒚㒗㒙㒘㒚㒦㒗㒚㒦㒛㒥㒜㒤㒝㒘㒠㒢㒟㒡㒠㒠㒡㒤㒗㒞㒣㒝㒤㒜㒥㒛㒦㒠㒙㒚㒘㒙㒙㒘㒚㒝㒛㒦㒜㒥㒝㒤㒞㒣㒟㒗㒢㒡㒡㒠㒢㒟㒣㒥㒗㒝㒥㒜㒦㒜㒗㒛㒘㒟㒛㒙㒚㒘㒛㒗㒜㒗㒤㒥㒞㒤㒟㒣㒠㒢㒡㒦㒤㒠㒣㒟㒤㒞㒥㒢㒠㒝㒗㒜㒘㒛㒙㒚㒚㒠㒞㒘㒜㒝㒣㒦㒞㒜㒗㒤㒠㒣㒢㒢㒢㒢㒥㒠㒤㒟㒥㒥㒜㒞㒗㒣㒢㒜㒛㒛㒚㒚㒛㒙㒜㒘㒝㒗㒞㒜㒥㒥㒠㒚㒥㒣㒢㒙㒙㒡㒤㒢㒗㒟㒦㒟㒗㒤㒠㒝㒙㒚㒘㒛㒜㒚㒜㒙㒝㒘㒞㒗㒟㒦㒠㒜㒗㒤㒢㒚㒙㒢㒤㒘㒝㒠㒦㒠㒝㒚㒦㒞㒙㒣㒢㒜㒛㒢㒙㒚㒝㒙㒟㒘㒟㒗㒢㒦㒡㒥㒢㒙㒥㒣㒤㒢㒥㒡㒦㒣㒦㒠㒘㒟㒙㒞㒚㒝㒛㒡㒞㒛㒝㒚㒞㒙㒟㒞㒜㒗㒡㒦㒢㒥㒣㒤㒤㒛㒘㒢㒦㒘㒝㒡㒘㒦㒡㒟㒚㒞㒜㒝㒜㒝㒟㒛㒞㒚㒟㒟㒦㒘㒡㒙㒥㒦㒦㒥㒤㒤㒥㒣㒦㒣㒗㒢㒘㒗㒟㒠㒚㒠㒞㒞㒜㒣㒣㒜㒞㒜㒡㒚㒠㒙㒡㒟㒚㒗㒣㒤㒢㒥㒦㒤㒦㒤㒗㒣㒘㒢㒙㒡㒚㒦㒡㒟㒜㒤㒣㒝㒞㒣㒗㒛㒠㒛㒗㒥㒠㒘㒣㒞㒜㒦㒥㒝㒤㒥㒗㒤㒙㒣㒙㒢㒝㒡㒛㒠㒜㒤㒟㒞㒞㒝㒟㒜㒠㒟㒜㒚㒢㒙㒣㒘㒤㒗㒥㒜㒘㒦㒗㒥㒘㒤㒙㒤㒝㒢㒛㒡㒜㒠㒝㒟㒞㒣㒡㒝㒠㒜㒡㒛㒢㒝㒢㒙㒤㒘㒥㒗㒦㒗㒗㒚㒥㒥㒚㒚㒠㒣㒛㒘㒤㒡㒝㒠㒟㒟㒟㒟㒢㒝㒡㒜㒣㒢㒙㒚㒤㒣㒤㒘㒦㒘㒗㒗㒘㒘㒙㒚㒜㒤㒜㒙㒢㒢㒝㒗㒤㒠㒟㒙㒞㒞㒢㒞㒤㒜㒣㒛㒥㒡㒜㒙㒦㒠㒡㒘㒙㒗㒙㒦㒚㒦㒝㒘㒗㒣㒝㒘㒦㒡㒟㒛㒢㒟㒡㒞㒢㒝㒣㒝㒦㒟㒠㒚㒦㒠㒠㒙㒘㒙㒢㒗㒝㒦㒛㒥㒜㒥㒟㒗㒙㒢㒟㒘㒚㒠㒡㒙㒘㒞㒤㒝㒤㒜㒥㒛㒦㒘㒗㒚㒘㒟㒠㒘㒚㒝㒥㒦㒜㒥㒟㒤㒞㒣㒟㒥㒡㒡㒢㒗㒘㒟㒣㒞㒦㒝㒥㒝㒘㒜㒗㒝㒘㒟㒛㒙㒛㒞㒢㒗㒜㒗㒦㒥㒞㒤㒚㒣㒢㒣㒡㒡㒥㒠㒤㒦㒚㒞㒥㒦㒚㒝㒗㒢㒟㒛㒙㒛㒜㒜㒦㒘㒜㒝㒤㒦㒞㒤㒦㒤㒢㒣㒡㒢㒢㒢㒥㒠㒤㒟㒦㒥㒞㒞㒗㒤㒣㒜㒚㒛㒚㒚㒛㒚㒞㒜㒘㒗㒞㒝㒘㒥㒠㒣㒢㒣㒢㒢㒣㒡㒤㒠㒥㒡㒟㒟㒗㒤㒠㒝㒙㒢㒢㒛㒛㒠㒥㒙㒝㒙㒠㒛㒚㒦㒠㒜㒚㒤㒢㒢㒙㒢㒥㒡㒥㒠㒦㒠㒗㒠㒡㒞㒙㒣㒢㒜㒛㒡㒤㒚㒝㒠㒗㒘㒟㒗㒠㒚㒤㒥㒣㒛㒙㒣㒤㒙㒜㒡㒦㒗㒟㒠㒘㒠㒛㒡㒥㒝㒛㒢㒣㒛㒝㒠㒙㒙㒠㒘㒠㒗㒡㒗㒤㒙㒞㒤㒤㒚㒝㒢㒦㒥㒥㒡㒚㒠㒙㒟㒚㒞㒛㒡㒟㒜㒞㒡㒤㒚㒟㒠㒗㒘㒡㒞㒚㒦㒣㒦㒦㒤㒥㒤㒗㒙㒞㒢㒘㒠㒘㒠㒚㒟㒛㒞㒜㒞㒟㒠㒙㒛㒟㒡㒘㒙㒡㒤㒣㒗㒥㒦㒤㒥㒥㒤㒦㒥㒠㒣㒘㒘㒠㒡㒚㒦㒢㒟㒜㒤㒥㒝㒞㒝㒡㒟㒛㒚㒡㒠㒚㒘㒣㒥㒙㒦㒥㒥㒦㒥㒗㒤㒘㒤㒢㒢㒚㒗㒢㒠㒜㒥㒤㒞㒞㒤㒗㒜㒠㒜㒣㒞㒝㒙㒣㒟㒜㒗㒥㒙㒝㒦㒘㒥㒘㒤㒙㒣㒚㒣㒤㒡㒜㒦㒤㒟㒞㒤㒦㒝㒠㒣㒙㒛㒢㒛㒥㒝㒟㒘㒥㒞㒞㒗㒗㒗㒢㒥㒛㒤㒚㒣㒛㒢㒜㒢㒦㒠㒞㒥㒦㒞㒠㒤㒘㒜㒢㒢㒛㒚㒤㒚㒥㒙㒙㒘㒘㒝㒞㒦㒙㒟㒙㒤㒜㒙㒣㒢㒝㒢㒠㒤㒚㒟㒠㒥㒘㒝㒢㒠㒟㒛㒥㒚㒥㒙㒦㒛㒗㒝㒚㒗㒚㒜㒢㒥㒛㒥㒤㒣㒝㒢㒙㒡㒡㒠㒠㒣㒤㒞㒣㒤㒙㒜㒤㒢㒜㒚㒦㒠㒟㒙㒘㒙㒛㒚㒥㒦㒛㒛㒥㒤㒝㒞㒢㒢㒠㒡㒠㒠㒡㒟㒢㒥㒙㒝㒤㒣㒜㒛㒦㒜㒟㒚㒘㒟㒢㒘㒚㒘㒝㒦㒜㒥㒞㒛㒗㒣㒟㒚㒚㒡㒢㒠㒢㒟㒣㒟㒦㒡㒠㒜㒦㒢㒡㒛㒘㒞㒤㒙㒜㒘㒛㒗㒜㒗㒟㒙㒙㒤㒟㒚㒛㒢㒡㒞㒢㒠㒤㒟㒤㒞㒥㒟㒘㒠㒢㒜㒘㒡㒥㒚㒚㒞㒥㒘㒝㒗㒝㒦㒞㒥㒟㒡㒠㒣㒡㒙㒛㒡㒣㒗㒠㒟㒥㒟㒘㒞㒗㒝㒘㒙㒙㒛㒚㒠㒢㒙㒜㒞㒦㒗㒞㒦㒡㒥㒠㒥㒣㒗㒝㒢㒣㒘㒝㒠㒥㒝㒤㒟㒘㒞㒘㒝㒙㒜㒚㒡㒡㒚㒜㒟㒤㒘㒞㒝㒦㒦㒠㒜㒚㒤㒢㒤㒙㒞㒢㒡㒥㒗㒟㒠㒗㒠㒘㒞㒙㒝㒛㒜㒛㒛㒞㒚㒝㒙㒞㒝㒡㒗㒠㒦㒡㒥㒢㒛㒙㒣㒤㒢㒥㒡㒦㒡㒗㒥㒚㒟㒙㒞㒚㒝㒛㒝㒤㒛㒝㒚㒞㒙㒟㒘㒠㒞㒦㒦㒢㒜㒚㒤㒤㒚㒞㒢㒦㒢㒘㒡㒘㒡㒛㒟㒚㒞㒛㒣㒥㒜㒝㒦㒢㒚㒠㒙㒠㒘㒡㒗㒢㒦㒣㒥㒤㒛㒜㒣㒦㒤㒠㒢㒘㒗㒢㒠㒚㒠㒝㒞㒜㒝㒝㒣㒗㒛㒟㒢㒚㒙㒢㒘㒢㒗㒣㒗㒦㒥㒥㒤㒦㒚㒡㒣㒘㒡㒥㒡㒛㒠㒛㒟㒜㒟㒟㒝㒞㒜㒟㒢㒛㒚㒡㒟㒠㒘㒤㒗㒤㒦㒥㒗㒘㒥㒗㒤㒘㒙㒥㒢㒚㒝㒞㒠㒜㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒡㒛㒙㒣㒟㒠㒗㒥㒗㒘㒦㒗㒥㒘㒤㒙㒣㒚㒘㒢㒡㒜㒦㒦㒟㒞㒞㒡㒝㒠㒝㒣㒛㒢㒚㒣㒠㒝㒘㒥㒥㒤㒗㒘㒦㒘㒥㒙㒤㒚㒙㒡㒢㒜㒗㒤㒠㒞㒥㒦㒞㒠㒤㒚㒜㒢㒜㒙㒦㒢㒙㒥㒟㒟㒘㒗㒗㒥㒦㒙㒥㒛㒤㒛㒣㒞㒢㒝㒡㒞㒥㒡㒟㒠㒞㒡㒝㒢㒣㒙㒛㒤㒚㒥㒙㒦㒙㒗㒝㒚㒗㒙㒦㒚㒥㒛㒥㒥㒣㒝㒢㒞㒡㒟㒠㒠㒜㒟㒞㒢㒤㒚㒜㒤㒢㒞㒚㒦㒚㒘㒙㒘㒙㒛㒗㒚㒦㒛㒛㒣㒤㒝㒢㒝㒢㒟㒡㒠㒠㒡㒡㒢㒞㒣㒝㒤㒣㒜㒛㒦㒡㒞㒚㒘㒤㒦㒘㒚㒘㒝㒦㒜㒥㒝㒛㒗㒣㒟㒚㒚㒡㒢㒠㒢㒟㒣㒟㒦㒝㒥㒜㒦㒢㒡㒛㒘㒟㒚㒙㒜㒘㒛㒗㒜㒗㒟㒥㒞㒤㒟㒚㒛㒢㒡㒤㒡㒠㒥㒟㒤㒞㒥㒟㒘㒝㒗㒜㒘㒡㒥㒚㒚㒙㒗㒘㒞㒗㒝㒦㒞㒥㒟㒤㒠㒣㒡㒙㒛㒡㒣㒗㒠㒟㒥㒟㒘㒞㒗㒝㒘㒜㒙㒛㒚㒠㒢㒙㒜㒞㒦㒗㒞㒦㒡㒥㒠㒥㒣㒣㒢㒢㒣㒘㒜㒠㒥㒤㒗㒟㒗㒞㒘㒝㒙㒜㒚㒜㒤㒚㒜㒟㒤㒘㒞㒝㒦㒦㒠㒜㒙㒤㒢㒤㒥㒦㒟㒡㒥㒗㒟㒠㒗㒜㒦㒞㒚㒝㒚㒜㒛㒛㒜㒠㒣㒙㒞㒞㒦㒗㒠㒝㒘㒥㒢㒛㒜㒣㒤㒣㒗㒗㒙㒡㒗㒦㒡㒟㒙㒞㒝㒝㒛㒜㒜㒛㒝㒚㒞㒦㒝㒘㒠㒞㒘㒦㒢㒜㒜㒤㒤㒣㒦㒢㒦㒣㒙㒡㒘㒠㒙㒥㒡㒞㒛㒜㒛㒜㒝㒛㒞㒚㒟㒛㒠㒘㒡㒗㒢㒝㒚㒥㒤㒛㒜㒣㒦㒞㒤㒢㒘㒢㒛㒠㒚㒟㒛㒤㒥㒝㒝㒤㒘㒛㒠㒚㒠㒙㒡㒙㒤㒗㒣㒦㒤㒜㒟㒤㒦㒠㒦㒣㒙㒢㒙㒡㒚㒡㒝㒟㒜㒞㒝㒤㒙㒜㒟㒚㒜㒚㒣㒙㒢㒘㒣㒘㒦㒦㒥㒥㒦㒛㒣㒤㒘㒥㒘㒢㒝㒡㒛㒠㒜㒟㒝㒞㒞㒝㒟㒣㒙㒛㒡㒡㒞㒙㒣㒘㒦㒗㒥㒦㒦㒦㒗㒥㒘㒚㒠㒣㒚㒘㒤㒡㒜㒠㒟㒟㒞㒟㒡㒝㒠㒜㒡㒢㒚㒚㒣㒜㒗㒙㒘㒗㒦㒗㒗㒦㒘㒦㒢㒤㒚㒙㒣㒢㒜㒦㒗㒠㒞㒦㒗㒞㒠㒞㒣㒠㒝㒛㒣㒡㒞㒙㒥㒦㒤㒘㒘㒗㒘㒦㒙㒥㒚㒚㒡㒣㒜㒘㒥㒡㒞㒗㒗㒟㒠㒥㒛㒝㒢㒝㒙㒗㒢㒚㒥㒠㒠㒙㒗㒘㒢㒗㒙㒦㒛㒥㒛㒤㒟㒣㒝㒢㒞㒦㒡㒠㒠㒟㒡㒞㒢㒟㒚㒜㒤㒛㒥㒚㒦㒚㒗㒞㒚㒘㒙㒗㒚㒦㒛㒘㒛㒤㒝㒣㒞㒢㒟㒡㒠㒥㒣㒟㒢㒞㒣㒝㒤㒡㒟㒛㒦㒛㒗㒚㒘㒙㒙㒝㒗㒗㒜㒜㒤㒥㒝㒛㒘㒣㒟㒢㒡㒡㒡㒠㒢㒠㒣㒞㒤㒤㒝㒜㒦㒜㒗㒛㒘㒚㒙㒙㒚㒙㒝㒗㒜㒦㒞㒜㒗㒤㒟㒢㒟㒢㒡㒡㒢㒠㒣㒠㒦㒢㒠㒝㒦㒣㒡㒜㒘㒗㒚㒚㒜㒙㒛㒘㒜㒗㒝㒘㒗㒥㒟㒛㒙㒣㒡㒙㒛㒡㒣㒗㒞㒟㒥㒠㒘㒡㒢㒝㒘㒢㒣㒛㒚㒗㒠㒙㒜㒘㒝㒗㒞㒦㒟㒗㒙㒤㒡㒚㒛㒢㒣㒘㒝㒠㒥㒦㒠㒟㒗㒟㒚㒠㒤㒜㒚㒡㒥㒚㒜㒛㒤㒘㒟㒗㒟㒦㒠㒥㒡㒦㒛㒣㒣㒙㒝㒡㒥㒗㒟㒠㒗㒥㒢㒞㒙㒞㒜㒟㒦㒛㒜㒡㒗㒙㒞㒣㒢㒗㒠㒦㒡㒥㒢㒤㒣㒥㒝㒢㒥㒘㒟㒡㒗㒦㒡㒟㒙㒤㒤㒝㒛㒝㒞㒟㒘㒚㒞㒠㒚㒘㒠㒥㒟㒦㒣㒥㒣㒤㒤㒣㒥㒙㒜㒢㒗㒗㒡㒠㒙㒥㒣㒞㒛㒤㒗㒜㒝㒛㒤㒦㒝㒙㒠㒟㒜㒗㒢㒙㒞㒥㒤㒤㒦㒣㒦㒣㒙㒢㒘㒡㒙㒥㒜㒟㒛㒞㒜㒝㒝㒢㒦㒛㒟㒚㒠㒙㒡㒘㒢㒜㒥㒦㒤㒥㒥㒤㒦㒗㒣㒣㒘㒢㒙㒡㒚㒠㒛㒤㒙㒞㒞㒤㒗㒜㒟㒢㒛㒚㒡㒙㒣㒘㒣㒘㒦㒦㒥㒦㒗㒛㒠㒤㒘㒢㒘㒢㒚㒡㒛㒠㒜㒡㒝㒣㒠㒝㒠㒣㒙㒛㒡㒡㒛㒙㒣㒝㒦㒗㒦㒘㒘㒙㒢㒥㒘㒚㒣㒣㒚㒤㒚㒡㒜㒠㒝㒟㒞㒞㒟㒟㒙㒜㒡㒢㒛㒚㒣㒠㒝㒘㒥㒞㒠㒗㒗㒗㒚㒘㒤㒤㒚㒙㒥㒢㒜㒚㒙㒠㒞㒟㒟㒞㒠㒝㒡㒞㒛㒛㒣㒡㒝㒙㒥㒟㒟㒘㒗㒝㒢㒦㒙㒦㒜㒗㒦㒣㒜㒙㒗㒡㒞㒠㒝㒟㒢㒞㒡㒝㒢㒜㒣㒝㒝㒚㒥㒠㒟㒙㒗㒞㒡㒗㒙㒜㒤㒥㒛㒥㒞㒗㒘㒢㒞㒘㒚㒠㒠㒝㒟㒞㒣㒝㒣㒜㒤㒛㒥㒡㒜㒚㒗㒟㒡㒘㒙㒝㒣㒦㒛㒜㒗㒤㒝㒣㒤㒞㒝㒡㒠㒗㒜㒟㒢㒥㒛㒝㒤㒜㒦㒛㒦㒛㒘㒚㒘㒙㒙㒝㒜㒗㒛㒦㒜㒥㒝㒚㒦㒣㒟㒢㒠㒡㒡㒠㒢㒚㒠㒞㒤㒤㒞㒜㒦㒢㒢㒛㒘㒚㒚㒙㒚㒙㒝㒗㒜㒦㒝㒜㒗㒤㒟㒟㒘㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒣㒡㒜㒘㒤㒛㒚㒚㒙㒛㒘㒜㒗㒝㒦㒞㒥㒟㒛㒙㒣㒡㒙㒛㒡㒣㒗㒞㒟㒥㒠㒘㒞㒗㒝㒘㒢㒣㒛㒚㒥㒣㒙㒝㒘㒝㒗㒞㒗㒡㒥㒠㒤㒡㒚㒝㒢㒣㒤㒠㒡㒗㒟㒦㒟㒗㒞㒘㒝㒙㒜㒚㒡㒥㒚㒜㒠㒗㒘㒞㒞㒚㒦㒠㒦㒣㒤㒢㒣㒣㒙㒟㒡㒥㒜㒞㒠㒘㒟㒘㒞㒙㒞㒜㒜㒛㒛㒜㒡㒙㒙㒞㒡㒝㒗㒢㒦㒡㒥㒢㒤㒣㒣㒤㒢㒥㒘㒡㒡㒗㒦㒣㒟㒙㒤㒦㒝㒛㒝㒞㒛㒝㒚㒞㒠㒛㒘㒠㒣㒙㒦㒣㒥㒣㒤㒤㒥㒗㒢㒦㒢㒗㒗㒥㒠㒙㒥㒙㒞㒝㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒟㒝㒗㒢㒝㒟㒥㒤㒛㒢㒣㒦㒤㒙㒢㒘㒡㒙㒗㒗㒟㒛㒙㒤㒝㒞㒜㒞㒛㒟㒛㒢㒙㒡㒘㒢㒞㒡㒦㒤㒟㒡㒥㒗㒤㒗㒣㒘㒢㒙㒡㒚㒠㒛㒦㒙㒞㒝㒤㒛㒜㒟㒢㒞㒚㒡㒚㒤㒘㒣㒗㒤㒝㒣㒥㒦㒠㒟㒤㒙㒣㒙㒢㒚㒢㒝㒠㒜㒟㒝㒥㒝㒝㒟㒙㒗㒛㒣㒚㒢㒙㒣㒘㒤㒗㒥㒦㒦㒜㒥㒥㒘㒛㒗㒣㒚㒙㒚㒡㒜㒡㒟㒟㒞㒞㒟㒤㒟㒜㒡㒗㒚㒚㒤㒙㒤㒘㒥㒙㒘㒗㒗㒦㒘㒜㒙㒤㒚㒤㒛㒢㒝㒡㒝㒠㒞㒟㒟㒞㒠㒝㒡㒣㒡㒛㒣㒡㒣㒙㒥㒟㒦㒘㒗㒘㒚㒦㒙㒥㒚㒛㒛㒣㒜㒝㒥㒡㒟㒠㒟㒟㒠㒟㒣㒝㒢㒜㒣㒢㒥㒚㒥㒠㒚㒙㒘㒘㒘㒗㒙㒦㒚㒥㒛㒤㒜㒚㒝㒢㒞㒘㒟㒠㒠㒦㒢㒞㒢㒞㒥㒜㒤㒛㒥㒢㒗㒚㒗㒘㒗㒘㒙㒗㒚㒦㒛㒗㒜㒤㒝㒣㒞㒙㒠㒡㒠㒗㒢㒟㒢㒚㒠㒝㒤㒞㒗㒛㒦㒛㒗㒡㒛㒙㒙㒟㒤㒗㒜㒦㒜㒥㒝㒥㒠㒣㒟㒢㒠㒘㒥㒠㒢㒣㒣㒞㒥㒝㒥㒜㒦㒝㒙㒛㒘㒚㒙㒠㒟㒘㒛㒦㒞㒦㒞㒥㒞㒤㒟㒤㒢㒢㒡㒡㒢㒘㒙㒟㒤㒠㒣㒝㒦㒝㒗㒜㒘㒛㒙㒚㒚㒙㒛㒟㒟㒗㒝㒝㒤㒥㒟㒤㒢㒣㒡㒢㒢㒡㒣㒠㒤㒦㒦㒞㒦㒥㒚㒝㒘㒜㒛㒛㒚㒛㒝㒙㒜㒘㒝㒞㒠㒦㒟㒤㒟㒤㒡㒣㒢㒢㒣㒣㒤㒠㒥㒟㒦㒦㒙㒞㒘㒤㒛㒜㒚㒗㒘㒚㒜㒚㒟㒘㒞㒗㒟㒝㒤㒥㒡㒠㒣㒣㒥㒢㒤㒡㒥㒠㒦㒠㒗㒟㒘㒥㒛㒝㒚㒣㒟㒛㒜㒚㒟㒙㒞㒙㒡㒗㒠㒦㒡㒜㒥㒤㒣㒢㒣㒢㒥㒡㒦㒡㒗㒢㒘㒟㒙㒞㒚㒤㒞㒜㒜㒢㒠㒚㒞㒥㒜㒘㒠㒘㒣㒦㒢㒥㒣㒜㒙㒣㒥㒚㒠㒢㒘㒡㒘㒠㒙㒠㒜㒞㒛㒝㒜㒣㒣㒛㒞㒣㒚㒙㒡㒘㒡㒗㒢㒗㒥㒥㒤㒤㒥㒛㒝㒣㒗㒘㒜㒡㒙㒠㒚㒟㒛㒟㒞㒝㒝㒜㒞㒣㒗㒚㒠㒣㒗㒘㒣㒗㒣㒦㒤㒥㒥㒤㒦㒤㒗㒚㒝㒢㒙㒘㒢㒠㒛㒟㒞㒞㒝㒝㒞㒜㒟㒛㒠㒡㒤㒙㒢㒠㒘㒗㒤㒗㒗㒥㒦㒦㒙㒤㒘㒣㒙㒙㒞㒡㒛㒟㒛㒟㒝㒞㒞㒝㒟㒞㒠㒛㒡㒚㒢㒡㒗㒘㒤㒟㒙㒦㒦㒡㒤㒥㒘㒥㒛㒣㒚㒢㒛㒘㒢㒠㒝㒗㒘㒞㒠㒝㒠㒜㒡㒜㒤㒚㒣㒙㒤㒠㒜㒗㒦㒚㒜㒦㒙㒥㒙㒤㒚㒤㒝㒢㒜㒡㒝㒗㒦㒟㒟㒚㒟㒝㒣㒜㒢㒛㒣㒛㒦㒙㒥㒘㒦㒟㒠㒗㒘㒞㒜㒥㒜㒤㒛㒣㒜㒢㒝㒡㒞㒠㒟㒦㒦㒞㒡㒥㒛㒜㒣㒛㒦㒚㒥㒙㒦㒙㒗㒘㒘㒞㒝㒦㒚㒜㒡㒤㒜㒣㒟㒢㒞㒢㒡㒠㒠㒟㒡㒦㒗㒝㒣㒛㒣㒛㒥㒚㒦㒚㒗㒛㒘㒘㒙㒗㒚㒝㒠㒥㒜㒛㒢㒣㒞㒞㒜㒡㒠㒡㒣㒟㒢㒞㒣㒥㒛㒜㒥㒣㒠㒛㒘㒚㒘㒙㒙㒙㒜㒗㒛㒦㒜㒜㒥㒤㒞㒜㒡㒢㒢㒡㒡㒠㒢㒠㒥㒞㒤㒝㒥㒤㒟㒜㒗㒦㒡㒚㒙㒙㒚㒘㒛㒘㒞㒦㒝㒥㒞㒜㒙㒣㒠㒜㒚㒡㒣㒠㒣㒟㒤㒞㒥㒝㒦㒝㒗㒣㒟㒛㒙㒡㒤㒙㒛㒘㒞㒗㒝㒦㒞㒥㒟㒤㒠㒚㒦㒢㒢㒙㒚㒠㒤㒠㒗㒞㒦㒟㒙㒝㒘㒜㒙㒢㒠㒚㒛㒘㒛㒘㒝㒗㒞㒦㒟㒗㒠㒤㒡㒣㒢㒚㒙㒡㒤㒘㒛㒟㒦㒚㒤㒞㒘㒞㒛㒜㒚㒛㒛㒡㒤㒙㒝㒟㒤㒗㒟㒦㒠㒥㒡㒤㒢㒣㒣㒢㒤㒙㒛㒠㒦㒗㒟㒟㒘㒞㒛㒝㒚㒝㒝㒛㒜㒚㒝㒠㒥㒘㒟㒤㒥㒦㒡㒥㒢㒤㒣㒣㒤㒢㒥㒡㒦㒘㒞㒠㒘㒦㒛㒞㒚㒤㒢㒜㒜㒛㒣㒚㒞㒙㒟㒠㒗㒗㒡㒙㒤㒦㒞㒤㒥㒣㒥㒣㒗㒢㒗㒡㒜㒛㒡㒟㒚㒞㒛㒝㒜㒟㒟㒜㒙㒚㒠㒙㒠㒙㒣㒛㒝㒦㒣㒝㒞㒤㒥㒟㒚㒣㒘㒢㒘㒡㒙㒠㒚㒞㒡㒞㒜㒤㒥㒜㒞㒢㒡㒚㒠㒡㒛㒘㒢㒘㒥㒦㒤㒥㒥㒜㒠㒤㒗㒚㒢㒢㒚㒡㒚㒠㒛㒠㒞㒞㒝㒝㒞㒤㒚㒛㒠㒚㒜㒙㒢㒘㒣㒗㒤㒘㒗㒥㒦㒥㒗㒛㒤㒣㒙㒚㒣㒡㒜㒠㒜㒟㒝㒟㒠㒝㒟㒜㒠㒣㒞㒚㒢㒝㒢㒘㒤㒗㒥㒦㒦㒦㒗㒥㒘㒤㒙㒚㒤㒢㒛㒙㒙㒠㒝㒟㒠㒞㒟㒝㒠㒜㒡㒛㒢㒢㒛㒙㒤㒠㒟㒗㒦㒗㒙㒦㒘㒦㒛㒤㒚㒣㒛㒙㒦㒡㒝㒛㒚㒟㒡㒞㒠㒝㒡㒜㒢㒛㒣㒚㒤㒡㒝㒘㒦㒟㒟㒗㒘㒝㒣㒥㒚㒤㒛㒣㒜㒢㒝㒘㒦㒠㒟㒟㒢㒞㒡㒝㒣㒜㒣㒜㒦㒞㒠㒙㒦㒠㒟㒘㒘㒤㒞㒦㒚㒥㒛㒤㒜㒣㒝㒤㒗㒡㒟㒘㒗㒟㒡㒥㒤㒝㒣㒤㒜㒛㒥㒜㒘㒝㒢㒙㒘㒟㒡㒗㒚㒙㒝㒥㒝㒤㒝㒣㒞㒢㒟㒣㒙㒠㒡㒗㒚㒞㒣㒥㒚㒜㒥㒣㒞㒛㒗㒛㒚㒜㒤㒘㒚㒞㒦㒦㒜㒠㒡㒤㒟㒣㒟㒢㒠㒡㒡㒗㒘㒟㒣㒦㒝㒝㒥㒤㒜㒜㒗㒢㒣㒚㒙㒚㒜㒘㒛㒗㒝㒞㒘㒥㒞㒜㒙㒣㒡㒢㒡㒡㒢㒡㒥㒣㒟㒞㒥㒥㒢㒝㒗㒘㒣㒛㒙㒚㒚㒙㒛㒙㒞㒛㒘㒦㒞㒝㒜㒤㒠㒥㒚㒢㒣㒡㒣㒠㒤㒡㒗㒢㒡㒞㒗㒤㒦㒜㒙㒗㒜㒚㒛㒙㒜㒘㒝㒗㒞㒣㒟㒥㒠㒜㒜㒣㒢㒚㒡㒡㒤㒡㒗㒟㒦㒟㒗㒛㒘㒝㒙㒣㒣㒛㒛㒢㒗㒙㒝㒘㒠㒗㒟㒗㒢㒙㒜㒤㒢㒛㒞㒢㒤㒟㒣㒡㒗㒠㒗㒟㒘㒞㒙㒣㒠㒜㒛㒢㒥㒚㒝㒡㒗㒘㒟㒟㒛㒦㒡㒦㒘㒠㒡㒣㒤㒚㒠㒡㒦㒣㒠㒠㒘㒟㒚㒞㒚㒝㒝㒜㒜㒛㒝㒟㒠㒙㒟㒘㒠㒗㒡㒞㒘㒥㒣㒤㒤㒣㒥㒢㒦㒗㒙㒡㒘㒠㒙㒟㒚㒥㒣㒝㒜㒜㒝㒛㒞㒚㒟㒞㒝㒘㒢㒟㒛㒦㒣㒝㒟㒤㒥㒤㒗㒣㒗㒣㒚㒡㒙㒠㒛㒦㒤㒞㒜㒥㒘㒜㒟㒛㒟㒚㒠㒚㒣㒜㒝㒗㒣㒞㒞㒥㒥㒛㒝㒤㒗㒣㒘㒢㒙㒡㒚㒡㒤㒟㒜㒥㒦㒝㒞㒤㒘㒛㒠㒢㒛㒙㒢㒙㒥㒛㒟㒦㒥㒝㒠㒥㒗㒛㒛㒣㒙㒢㒚㒡㒛㒠㒜㒠㒦㒞㒞㒥㒘㒜㒠㒣㒚㒚㒢㒡㒝㒘㒤㒙㒥㒜㒘㒦㒘㒜㒡㒤㒙㒚㒣㒢㒛㒡㒗㒠㒟㒠㒠㒞㒟㒝㒡㒤㒛㒛㒢㒢㒞㒙㒥㒘㒥㒗㒦㒘㒙㒙㒣㒥㒙㒛㒥㒣㒛㒘㒣㒡㒝㒠㒞㒟㒟㒞㒠㒟㒚㒜㒢㒣㒝㒚㒤㒡㒟㒘㒦㒟㒢㒗㒘㒗㒛㒘㒥㒤㒛㒛㒗㒢㒝㒡㒗㒠㒠㒟㒠㒞㒡㒝㒢㒞㒜㒛㒤㒢㒟㒙㒦㒠㒡㒘㒘㒞㒤㒦㒚㒗㒛㒙㒞㒣㒞㒚㒘㒡㒟㒘㒚㒟㒡㒞㒝㒝㒥㒜㒤㒜㒥㒚㒦㒡㒢㒙㒘㒘㒛㒗㒚㒦㒛㒥㒜㒥㒟㒣㒞㒢㒠㒙㒜㒠㒡㒗㒝㒞㒤㒝㒤㒜㒥㒝㒘㒞㒢㒚㒘㒠㒦㒘㒚㒢㒦㒦㒝㒥㒝㒤㒞㒣㒟㒤㒙㒡㒡㒘㒞㒟㒣㒦㒠㒝㒥㒤㒣㒜㒗㒜㒚㒝㒤㒙㒚㒠㒘㒗㒜㒜㒛㒥㒞㒤㒟㒣㒠㒢㒡㒣㒛㒠㒣㒗㒠㒞㒥㒥㒢㒝㒗㒣㒥㒛㒙㒛㒜㒙㒛㒘㒝㒟㒚㒦㒞㒝㒚㒤㒡㒣㒡㒢㒢㒢㒥㒤㒟㒟㒥㒦㒤㒞㒗㒘㒣㒜㒚㒛㒚㒚㒛㒙㒜㒙㒦㒗㒞㒞㒜㒥㒠㒜㒞㒣㒢㒚㒡㒡㒤㒢㒗㒣㒡㒟㒗㒥㒦㒝㒙㒚㒞㒛㒜㒚㒜㒙㒝㒘㒞㒙㒘㒦㒠㒝㒞㒤㒢㒛㒠㒢㒤㒙㒣㒠㒦㒠㒗㒥㒙㒞㒚㒤㒥㒜㒛㒣㒙㒚㒝㒙㒟㒘㒟㒘㒢㒦㒡㒥㒣㒜㒟㒣㒤㒘㒙㒢㒘㒡㒗㒠㒘㒡㒙㒣㒜㒝㒜㒤㒘㒛㒝㒢㒚㒙㒟㒢㒞㒗㒢㒗㒤㒙㒞㒤㒤㒛㒢㒢㒦㒟㒠㒡㒘㒠㒙㒟㒚㒟㒝㒡㒗㒜㒝㒣㒜㒚㒟㒗㒙㒘㒡㒗㒢㒦㒣㒦㒦㒘㒠㒣㒦㒚㒦㒢㒘㒞㒢㒠㒚㒟㒛㒞㒜㒝㒝㒙㒞㒛㒟㒢㒜㒙㒡㒠㒡㒗㒣㒦㒦㒥㒥㒦㒘㒗㒢㒣㒘㒙㒦㒡㒚㒛㒗㒟㒝㒞㒝㒝㒞㒜㒟㒥㒥㒚㒡㒡㒞㒘㒣㒟㒠㒦㒥㒝㒣㒥㒗㒥㒚㒣㒙㒢㒛㒙㒘㒠㒜㒠㒗㒞㒠㒝㒟㒜㒠㒝㒡㒟㒤㒙㒤㒠㒡㒗㒥㒞㒣㒦㒗㒞㒦㒤㒚㒤㒜㒥㒦㒡㒜㒘㒛㒟㒞㒚㒙㒝㒢㒜㒡㒛㒢㒛㒥㒝㒟㒘㒥㒟㒥㒗㒗㒣㒡㒥㒙㒤㒚㒣㒛㒢㒜㒞㒝㒠㒞㒗㒜㒞㒠㒥㒠㒜㒢㒛㒥㒚㒤㒛㒗㒜㒡㒘㒗㒞㒦㒦㒙㒣㒦㒤㒛㒣㒜㒢㒝㒡㒞㒚㒤㒟㒠㒦㒞㒝㒢㒤㒠㒛㒤㒢㒣㒙㒦㒚㒙㒛㒣㒗㒙㒞㒘㒥㒛㒢㒗㒣㒟㒢㒞㒡㒟㒠㒠㒤㒣㒞㒢㒥㒢㒜㒤㒢㒢㒚㒦㒚㒗㒙㒘㒙㒛㒚㒥㒦㒛㒝㒜㒤㒝㒗㒜㒢㒡㒡㒠㒠㒡㒟㒢㒡㒤㒝㒥㒤㒤㒛㒦㒛㒙㒚㒘㒙㒛㒘㒚㒘㒝㒚㒗㒥㒝㒜㒞㒣㒟㒗㒠㒡㒢㒠㒢㒟㒣㒟㒦㒡㒠㒜㒦㒤㒘㒛㒘㒗㒢㒙㒚㒘㒛㒗㒜㒗㒟㒙㒙㒤㒟㒛㒢㒢㒡㒢㒜㒠㒣㒟㒤㒞㒥㒝㒦㒞㒗㒜㒘㒣㒜㒚㒚㒙㒛㒘㒜㒗㒝㒦㒞㒦㒡㒘㒛㒣㒡㒚㒦㒡㒣㒥㒥㒟㒦㒞㒦㒞㒗㒝㒘㒠㒜㒛㒛㒢㒞㒙㒜㒠㒡㒗㒞㒞㒢㒥㒠㒥㒗㒟㒠㒢㒣㒚㒘㒠㒥㒤㒙㒟㒗㒞㒙㒝㒙㒜㒛㒛㒛㒚㒜㒞㒟㒘㒞㒗㒟㒦㒠㒝㒤㒤㒢㒣㒣㒢㒤㒢㒥㒡㒙㒠㒘㒗㒛㒞㒙㒗㒘㒜㒜㒣㒠㒚㒝㒚㒠㒜㒚㒗㒠㒞㒥㒥㒢㒛㒢㒣㒥㒢㒥㒡㒦㒡㒝㒛㒦㒟㒙㒦㒟㒝㒛㒟㒠㒛㒝㒚㒟㒙㒟㒘㒢㒗㒡㒦㒢㒚㒥㒤㒤㒣㒥㒢㒦㒘㒠㒡㒘㒠㒙㒟㒚㒞㒛㒢㒞㒜㒝㒛㒞㒚㒟㒠㒜㒘㒡㒗㒢㒦㒣㒥㒤㒙㒘㒤㒗㒛㒚㒢㒘㒙㒝㒠㒚㒗㒠㒞㒜㒞㒟㒠㒙㒛㒟㒢㒤㒙㒡㒥㒛㒗㒣㒦㒤㒥㒥㒥㒘㒙㒚㒣㒘㒚㒞㒡㒚㒣㒥㒟㒜㒞㒝㒝㒞㒜㒟㒝㒠㒚㒡㒡㒥㒘㒣㒠㒘㒦㒥㒞㒛㒥㒗㒥㒚㒣㒙㒢㒚㒙㒟㒠㒜㒤㒡㒞㒠㒝㒟㒜㒠㒝㒡㒚㒢㒙㒣㒡㒘㒗㒥㒟㒚㒦㒗㒞㒦㒤㒚㒣㒚㒢㒛㒡㒜㒘㒡㒟㒞㒞㒠㒝㒠㒜㒣㒛㒢㒛㒥㒙㒤㒘㒥㒠㒛㒗㒗㒦㒢㒥㒛㒤㒚㒣㒛㒤㒜㒡㒝㒠㒞㒗㒤㒞㒠㒥㒦㒜㒢㒥㒡㒚㒥㒙㒥㒘㒦㒘㒗㒟㒝㒦㒙㒥㒛㒤㒛㒣㒞㒢㒝㒢㒠㒠㒟㒟㒠㒗㒗㒝㒢㒙㒘㒛㒥㒚㒥㒙㒦㒛㒗㒘㒘㒗㒙㒞㒡㒥㒛㒜㒟㒣㒝㒜㒜㒡㒠㒠㒠㒟㒡㒞㒢㒦㒛㒜㒤㒣㒥㒚㒦㒚㒗㒙㒘㒙㒛㒗㒚㒦㒜㒝㒥㒤㒝㒘㒢㒢㒡㒡㒠㒠㒡㒡㒢㒤㒜㒝㒥㒥㒞㒛㒦㒣㒠㒚㒘㒣㒗㒘㒛㒗㒛㒦㒜㒥㒝㒝㒗㒣㒟㒢㒡㒡㒡㒠㒢㒟㒣㒞㒤㒝㒥㒜㒦㒤㒞㒛㒘㒚㒙㒙㒚㒘㒝㒗㒜㒘㒝㒥㒞㒤㒟㒜㒘㒢㒡㒙㒥㒠㒣㒙㒢㒞㒦㒝㒦㒝㒗㒜㒘㒣㒢㒚㒚㒡㒜㒘㒜㒗㒝㒦㒞㒦㒡㒤㒠㒣㒡㒛㒜㒡㒣㒡㒞㒠㒗㒞㒦㒞㒗㒟㒘㒜㒙㒛㒚㒢㒥㒙㒜㒡㒗㒗㒞㒠㒝㒥㒡㒤㒡㒣㒢㒢㒣㒚㒞㒠㒥㒠㒗㒟㒗㒞㒘㒝㒙㒜㒚㒛㒛㒚㒜㒡㒥㒘㒞㒗㒟㒦㒠㒥㒣㒤㒢㒥㒣㒢㒤㒡㒥㒙㒟㒠㒗㒗㒛㒞㒙㒗㒘㒜㒜㒛㒜㒟㒟㒙㒞㒡㒙㒗㒠㒞㒣㒥㒢㒤㒣㒣㒤㒤㒗㒥㒡㒡㒗㒘㒣㒟㒙㒚㒟㒝㒜㒜㒜㒛㒝㒚㒞㒦㒟㒘㒠㒠㒚㒦㒢㒞㒞㒤㒤㒤㒗㒢㒦㒢㒗㒢㒘㒠㒙㒗㒤㒞㒛㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒥㒘㒗㒢㒟㒞㒥㒤㒝㒠㒣㒦㒣㒗㒢㒘㒢㒛㒣㒥㒟㒛㒗㒘㒝㒝㒡㒥㒛㒟㒚㒠㒙㒡㒙㒤㒛㒞㒦㒤㒞㒢㒤㒦㒡㒝㒣㒚㒢㒙㒡㒚㒠㒡㒛㒚㒞㒝㒦㒜㒜㒟㒝㒢㒚㒡㒙㒣㒘㒣㒗㒦㒦㒥㒥㒦㒚㒙㒤㒘㒣㒙㒢㒚㒘㒗㒠㒜㒟㒝㒞㒞㒝㒟㒡㒢㒛㒡㒚㒢㒙㒣㒡㒠㒗㒥㒦㒦㒦㒗㒥㒞㒠㒗㒣㒚㒛㒚㒡㒜㒗㒙㒟㒞㒞㒠㒝㒠㒜㒣㒛㒢㒚㒣㒞㒦㒘㒥㒗㒦㒗㒗㒞㒦㒥㒙㒤㒚㒣㒛㒢㒜㒦㒟㒠㒞㒟㒟㒞㒠㒦㒞㒜㒢㒛㒣㒚㒤㒚㒛㒤㒤㒘㒗㒟㒣㒦㒙㒘㒦㒤㒛㒣㒝㒢㒝㒡㒢㒠㒟㒟㒠㒣㒣㒝㒢㒜㒣㒛㒤㒡㒣㒙㒦㒙㒗㒘㒘㒗㒙㒛㒜㒥㒛㒤㒜㒣㒝㒙㒙㒡㒟㒠㒠㒟㒡㒞㒢㒢㒥㒜㒤㒛㒥㒚㒦㒢㒦㒙㒘㒘㒙㒗㒚㒦㒛㒚㒞㒤㒝㒣㒞㒢㒟㒘㒚㒠㒡㒟㒢㒞㒣㒝㒤㒝㒤㒜㒗㒣㒣㒚㒘㒙㒙㒘㒚㒗㒛㒦㒜㒥㒝㒤㒞㒣㒟㒛㒜㒡㒡㒠㒢㒟㒣㒟㒜㒝㒥㒞㒘㒜㒗㒛㒘㒢㒦㒙㒚㒤㒥㒗㒞㒦㒝㒥㒞㒥㒡㒣㒠㒢㒡㒚㒠㒠㒣㒜㒙㒞㒦㒝㒦㒝㒗㒜㒘㒛㒙㒚㒚㒢㒗㒘㒜㒠㒚㒦㒞㒞㒝㒤㒠㒤㒣㒢㒢㒡㒣㒙㒡㒟㒥㒟㒤㒞㒚㒝㒘㒜㒙㒜㒜㒚㒛㒙㒜㒡㒛㒗㒞㒢㒤㒥㒡㒤㒡㒣㒢㒢㒣㒡㒤㒠㒥㒘㒢㒟㒗㒦㒥㒝㒙㒥㒘㒛㒛㒛㒞㒙㒝㒘㒞㒠㒜㒦㒠㒗㒞㒤㒤㒣㒣㒢㒤㒣㒗㒠㒦㒠㒗㒗㒦㒞㒙㒙㒟㒜㒜㒛㒜㒚㒝㒙㒞㒘㒟㒗㒠㒟㒝㒥㒢㒝㒠㒣㒤㒛㒣㒡㒦㒢㒙㒠㒘㒟㒙㒗㒗㒝㒛㒠㒗㒛㒞㒚㒞㒙㒟㒙㒢㒗㒡㒦㒢㒞㒡㒤㒤㒠㒚㒣㒗㒢㒗㒡㒘㒠㒙㒟㒚㒞㒛㒦㒘㒜㒝㒤㒛㒚㒟㒢㒞㒘㒡㒘㒤㒦㒣㒥㒤㒝㒢㒣㒦㒥㒥㒢㒙㒡㒙㒠㒚㒠㒝㒞㒜㒝㒝㒥㒜㒛㒟㒦㒥㒙㒢㒘㒢㒗㒣㒦㒤㒥㒥㒤㒦㒜㒣㒣㒘㒚㒦㒡㒚㒙㒙㒟㒜㒟㒟㒝㒞㒜㒟㒤㒝㒚㒡㒜㒛㒘㒣㒗㒤㒦㒥㒗㒘㒥㒗㒤㒘㒜㒗㒢㒚㒝㒠㒠㒝㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒣㒞㒙㒣㒡㒡㒗㒥㒟㒤㒦㒗㒦㒚㒤㒙㒣㒚㒛㒘㒡㒜㒚㒢㒟㒟㒞㒟㒝㒠㒝㒣㒛㒢㒚㒣㒢㒢㒘㒥㒘㒠㒗㒙㒦㒘㒥㒙㒦㒚㒣㒛㒢㒜㒚㒛㒠㒞㒘㒝㒞㒠㒗㒟㒜㒣㒛㒣㒚㒤㒙㒥㒡㒤㒘㒗㒗㒙㒦㒙㒥㒜㒤㒛㒣㒜㒢㒝㒡㒞㒙㒛㒟㒠㒗㒞㒝㒢㒥㒡㒛㒤㒜㒗㒙㒦㒙㒗㒠㒥㒗㒙㒢㒢㒥㒛㒤㒜㒣㒝㒣㒠㒡㒟㒠㒠㒘㒟㒞㒢㒞㒝㒜㒦㒛㒥㒚㒦㒜㒗㒙㒘㒘㒙㒠㒘㒦㒛㒞㒚㒤㒝㒝㒜㒢㒠㒡㒠㒠㒡㒟㒢㒗㒡㒝㒤㒜㒦㒛㒦㒛㒙㒚㒘㒙㒙㒘㒚㒗㒛㒟㒘㒥㒝㒝㒛㒣㒟㒛㒞㒡㒡㒠㒢㒟㒣㒞㒤㒦㒢㒜㒦㒜㒗㒛㒘㒛㒙㒙㒚㒙㒝㒗㒜㒦㒝㒞㒜㒤㒟㒛㒟㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒥㒦㒜㒘㒗㒞㒚㒛㒙㒛㒘㒜㒗㒝㒦㒞㒥㒟㒝㒝㒣㒡㒛㒠㒡㒣㒙㒣㒟㒥㒠㒘㒞㒗㒝㒘㒥㒗㒛㒚㒛㒛㒙㒟㒘㒝㒗㒞㒗㒡㒥㒠㒤㒡㒜㒡㒢㒣㒞㒙㒠㒦㒟㒦㒟㒗㒞㒘㒝㒙㒜㒚㒤㒘㒚㒜㒢㒛㒘㒞㒠㒞㒦㒠㒦㒣㒤㒢㒣㒣㒛㒢㒡㒥㒙㒚㒠㒘㒟㒘㒞㒙㒞㒜㒜㒛㒛㒜㒣㒜㒙㒞㒤㒤㒗㒡㒦㒡㒥㒢㒤㒣㒣㒤㒢㒥㒚㒣㒡㒗㒘㒦㒟㒙㒗㒙㒝㒛㒝㒞㒛㒝㒚㒞㒢㒝㒘㒠㒞㒗㒦㒢㒥㒣㒤㒤㒥㒗㒢㒦㒢㒗㒚㒗㒠㒙㒛㒟㒞㒜㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒡㒞㒗㒢㒟㒡㒥㒤㒝㒤㒣㒦㒤㒙㒢㒘㒡㒙㒙㒘㒟㒛㒜㒥㒝㒟㒜㒞㒛㒟㒛㒢㒙㒡㒘㒢㒠㒢㒦㒤㒢㒚㒥㒗㒤㒗㒣㒘㒢㒙㒡㒚㒠㒛㒘㒙㒞㒝㒦㒜㒜㒟㒤㒟㒚㒡㒚㒤㒘㒣㒗㒤㒟㒣㒥㒦㒡㒜㒤㒙㒣㒙㒢㒚㒢㒛㒠㒜㒟㒝㒗㒛㒝㒟㒥㒙㒛㒣㒣㒠㒙㒣㒙㒦㒗㒥㒦㒦㒞㒥㒥㒘㒞㒡㒣㒛㒢㒛㒡㒜㒡㒟㒟㒞㒞㒟㒦㒟㒜㒡㒘㒗㒚㒤㒙㒤㒘㒥㒗㒦㒗㒗㒦㒘㒝㒦㒤㒚㒜㒙㒢㒜㒚㒜㒠㒞㒠㒡㒞㒠㒝㒡㒥㒠㒛㒣㒗㒙㒙㒦㒘㒦㒘㒗㒘㒘㒦㒙㒥㒚㒝㒘㒣㒜㒥㒤㒡㒞㒙㒝㒟㒠㒟㒣㒝㒢㒜㒣㒤㒢㒚㒥㒠㒞㒙㒗㒘㒘㒗㒙㒗㒜㒥㒛㒤㒜㒜㒜㒢㒞㒝㒤㒠㒡㒟㒡㒞㒢㒝㒣㒜㒤㒛㒥㒣㒣㒚㒗㒡㒦㒘㒙㒠㒙㒦㒛㒦㒞㒤㒝㒣㒞㒛㒝㒡㒠㒤㒞㒟㒤㒞㒣㒝㒤㒞㒗㒛㒦㒛㒗㒣㒗㒙㒙㒤㒟㒗㒜㒦㒜㒥㒝㒤㒞㒣㒟㒢㒠㒚㒞㒠㒢㒘㒡㒞㒤㒦㒤㒜㒦㒝㒙㒛㒘㒚㒙㒢㒘㒘㒛㒠㒢㒦㒟㒥㒞㒤㒟㒤㒢㒢㒡㒡㒢㒙㒢㒟㒤㒛㒚㒞㒗㒝㒗㒜㒘㒛㒙㒚㒚㒙㒛㒡㒙㒗㒝㒟㒜㒥㒟㒝㒟㒣㒡㒣㒤㒡㒣㒠㒤㒘㒣㒞㒦㒥㒞㒝㒙㒜㒙㒛㒚㒛㒝㒙㒜㒘㒝㒠㒝㒦㒟㒡㒥㒤㒢㒣㒢㒢㒣㒡㒤㒠㒥㒟㒦㒗㒤㒞㒘㒦㒗㒜㒚㒤㒚㒚㒜㒚㒟㒘㒞㒗㒟㒟㒞㒥㒡㒡㒟㒣㒥㒢㒤㒡㒥㒢㒘㒠㒗㒟㒘㒗㒘㒝㒚㒘㒠㒛㒝㒚㒝㒙㒞㒘㒟㒗㒠㒦㒡㒞㒟㒤㒣㒜㒢㒢㒥㒚㒥㒡㒗㒡㒚㒟㒙㒞㒚㒦㒙㒜㒜㒟㒗㒚㒟㒙㒟㒘㒠㒘㒣㒦㒢㒥㒣㒝㒣㒣㒥㒟㒛㒢㒘㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒥㒚㒛㒞㒣㒝㒙㒠㒡㒠㒗㒢㒗㒥㒥㒤㒤㒥㒜㒤㒣㒗㒗㒦㒡㒙㒠㒚㒟㒛㒟㒞㒝㒝㒜㒞㒤㒞㒚㒠㒥㒦㒘㒣㒗㒣㒦㒤㒥㒥㒤㒦㒤㒗㒛㒥㒢㒙㒚㒘㒠㒛㒘㒛㒞㒝㒞㒠㒜㒟㒛㒠㒣㒟㒙㒢㒟㒜㒗㒦㒦㒥㒥㒦㒦㒙㒤㒘㒣㒙㒛㒙㒡㒛㒜㒡㒟㒞㒞㒞㒝㒟㒜㒠㒛㒡㒚㒢㒢㒠㒘㒤㒠㒣㒦㒦㒞㒦㒥㒘㒤㒙㒣㒚㒢㒛㒚㒚㒠㒝㒟㒞㒞㒟㒝㒢㒜㒡㒜㒤㒚㒣㒙㒤㒡㒤㒗㒦㒡㒗㒦㒙㒥㒙㒤㒚㒤㒝㒢㒜㒡㒝㒙㒞㒟㒟㒟㒚㒝㒣㒜㒢㒛㒣㒜㒤㒟㒗㒙㒗㒡㒗㒗㒘㒟㒙㒥㒚㒞㒙㒣㒝㒢㒝㒗㒤㒠㒠㒘㒠㒞㒡㒝㒣㒜㒣㒛㒦㒚㒥㒙㒦㒝㒚㒘㒙㒠㒗㒦㒚㒞㒚㒤㒜㒜㒝㒢㒞㒢㒡㒤㒛㒟㒡㒗㒡㒝㒣㒣㒠㒛㒦㒚㒦㒚㒗㒚㒚㒛㒤㒗㒚㒟㒛㒥㒜㒠㒢㒣㒟㒢㒟㒡㒠㒠㒡㒣㒥㒞㒤㒦㒢㒜㒥㒤㒥㒛㒗㒣㒘㒙㒙㒙㒜㒗㒛㒦㒝㒞㒜㒤㒞㒘㒣㒢㒢㒡㒡㒠㒢㒡㒣㒣㒦㒝㒦㒥㒥㒜㒗㒤㒗㒚㒙㒣㒘㒘㒜㒘㒞㒚㒘㒥㒞㒝㒟㒣㒠㒠㒚㒡㒢㒠㒣㒟㒤㒠㒗㒡㒡㒝㒗㒥㒙㒛㒙㒗㒣㒙㒛㒘㒜㒗㒝㒗㒠㒙㒚㒤㒠㒜㒣㒢㒢㒟㒜㒠㒤㒟㒥㒞㒦㒞㒗㒚㒘㒜㒙㒤㒙㒚㒛㒢㒞㒘㒝㒗㒠㒦㒟㒦㒢㒤㒡㒣㒣㒛㒣㒡㒤㒦㒙㒠㒘㒟㒗㒞㒘㒟㒙㒡㒜㒛㒜㒣㒜㒙㒝㒡㒞㒗㒟㒠㒞㒥㒢㒥㒤㒗㒞㒢㒤㒚㒦㒠㒦㒝㒠㒟㒘㒞㒙㒝㒚㒝㒝㒟㒗㒚㒝㒢㒠㒘㒟㒥㒙㒦㒡㒥㒢㒤㒣㒤㒦㒦㒠㒡㒦㒚㒚㒠㒘㒜㒢㒞㒚㒝㒛㒜㒜㒛㒝㒗㒞㒙㒟㒡㒠㒗㒡㒟㒥㒥㒣㒤㒦㒣㒥㒤㒘㒢㒗㒡㒙㒙㒚㒟㒚㒞㒥㒝㒞㒜㒝㒛㒞㒜㒟㒞㒢㒘㒢㒠㒣㒦㒣㒞㒥㒤㒥㒝㒤㒣㒘㒣㒚㒤㒤㒠㒚㒘㒝㒞㒜㒚㒦㒜㒞㒛㒟㒚㒠㒚㒣㒜㒝㒗㒣㒠㒗㒥㒥㒢㒟㒤㒗㒣㒘㒢㒙㒡㒚㒝㒛㒟㒜㒗㒞㒝㒞㒥㒢㒛㒠㒚㒣㒙㒢㒙㒥㒛㒟㒦㒥㒟㒘㒥㒗㒞㒤㒣㒚㒢㒚㒡㒛㒠㒜㒡㒘㒞㒞㒦㒡㒜㒠㒢㒚㒚㒢㒢㒥㒘㒤㒗㒥㒡㒛㒦㒗㒞㒙㒤㒙㒜㒛㒢㒛㒚㒞㒠㒝㒠㒠㒞㒟㒝㒡㒥㒣㒛㒢㒛㒝㒙㒦㒘㒥㒗㒦㒙㒗㒛㒚㒥㒚㒝㒜㒣㒛㒛㒞㒡㒝㒚㒜㒟㒠㒟㒢㒡㒜㒜㒢㒤㒦㒚㒤㒗㒞㒘㒦㒘㒗㒗㒘㒗㒛㒘㒥㒤㒛㒜㒠㒢㒝㒟㒗㒠㒟㒟㒠㒞㒡㒝㒢㒙㒣㒛㒤㒤㒗㒙㒦㒢㒛㒘㒘㒗㒛㒦㒚㒦㒝㒘㒗㒣㒝㒛㒡㒡㒟㒟㒜㒟㒡㒞㒢㒝㒣㒜㒤㒝㒠㒚㒦㒣㒚㒙㒘㒞㒢㒗㒚㒟㒞㒥㒜㒤㒝㒝㒣㒢㒟㒚㒢㒠㒡㒘㒤㒞㒣㒗㒗㒜㒥㒝㒘㒞㒢㒚㒘㒢㒜㒘㒚㒤㒤㒦㒜㒥㒝㒤㒞㒤㒡㒦㒛㒡㒡㒙㒦㒟㒣㒛㒗㒞㒗㒜㒦㒜㒗㒜㒚㒝㒤㒙㒚㒡㒠㒗㒜㒢㒗㒥㒠㒤㒟㒣㒠㒣㒣㒥㒝㒠㒣㒙㒚㒞㒥㒚㒙㒝㒙㒜㒘㒛㒙㒛㒜㒜㒦㒘㒜㒠㒤㒦㒞㒣㒘㒤㒠㒣㒡㒢㒢㒢㒥㒤㒟㒟㒥㒘㒞㒞㒗㒘㒤㒜㒚㒛㒚㒚㒛㒙㒢㒤㒛㒗㒞㒠㒘㒥㒠㒦㒙㒣㒢㒢㒤㒡㒤㒡㒟㒟㒦㒟㒗㒣㒚㒝㒙㒜㒚㒛㒛㒣㒣㒙㒝㒘㒞㒗㒟㒦㒠㒚㒣㒤㒢㒣㒣㒢㒤㒘㒠㒠㒦㒠㒗㒟㒘㒞㒙㒢㒜㒜㒛㒛㒜㒚㒝㒢㒛㒘㒟㒗㒠㒦㒡㒥㒢㒙㒥㒣㒤㒢㒥㒡㒦㒚㒜㒠㒘㒟㒙㒞㒚㒝㒛㒡㒞㒛㒝㒚㒞㒙㒟㒡㒛㒗㒡㒦㒢㒥㒣㒤㒤㒙㒗㒢㒦㒢㒗㒡㒘㒘㒥㒟㒚㒞㒛㒝㒜㒜㒝㒠㒠㒚㒟㒙㒠㒘㒡㒠㒡㒦㒣㒥㒤㒤㒥㒣㒦㒘㒙㒢㒘㒡㒙㒠㒚㒘㒛㒞㒜㒝㒝㒜㒞㒛㒟㒟㒢㒙㒡㒘㒢㒗㒣㒞㒙㒥㒥㒤㒦㒤㒗㒣㒘㒗㒛㒡㒚㒠㒛㒟㒜㒗㒣㒝㒞㒜㒟㒛㒠㒚㒡㒝㒥㒘㒤㒠㒞㒦㒥㒟㒞㒥㒗㒝㒡㒣㒙㒣㒜㒤㒦㒠㒜㒘㒥㒞㒞㒠㒥㒜㒣㒛㒡㒚㒢㒚㒙㒤㒢㒗㒥㒠㒟㒦㒗㒜㒞㒤㒙㒣㒛㒢㒛㒡㒡㒠㒝㒟㒞㒣㒡㒝㒠㒜㒡㒛㒢㒣㒞㒙㒤㒘㒥㒗㒦㒗㒗㒛㒚㒥㒙㒤㒚㒣㒛㒛㒘㒡㒝㒠㒞㒟㒟㒞㒠㒢㒣㒜㒢㒛㒣㒚㒤㒣㒗㒘㒦㒘㒗㒗㒘㒦㒙㒚㒜㒤㒛㒣㒜㒢㒝㒚㒜㒠㒟㒟㒠㒞㒡㒝㒢㒡㒥㒛㒤㒚㒥㒙㒦㒢㒘㒘㒘㒗㒙㒦㒚㒥㒛㒘㒟㒣㒞㒛㒘㒡㒟㒚㒘㒟㒡㒘㒛㒝㒣㒝㒦㒟㒠㒚㒦㒣㒟㒙㒘㒦㒛㒗㒛㒦㒛㒥㒜㒤㒣㒟㒜㒢㒟㒛㒙㒠㒡㒢㒙㒞㒣㒝㒥㒜㒥㒜㒚㒛㒗㒚㒘㒞㒛㒘㒚㒗㒛㒦㒜㒞㒙㒤㒞㒣㒟㒢㒠㒡㒡㒥㒤㒟㒣㒞㒤㒝㒥㒦㒚㒜㒗㒛㒘㒚㒙㒙㒚㒝㒝㒗㒜㒦㒝㒥㒞㒝㒝㒣㒠㒢㒡㒡㒢㒠㒣㒤㒦㒞㒥㒝㒦㒝㒗㒥㒛㒛㒙㒚㒚㒙㒛㒘㒜㒛㒠㒦㒟㒞㒙㒤㒠㒝㒙㒢㒢㒛㒜㒠㒤㒠㒛㒚㒤㒞㒗㒦㒠㒜㒙㒡㒚㒚㒛㒙㒝㒘㒝㒗㒟㒦㒟㒥㒠㒙㒣㒣㒢㒢㒣㒡㒤㒙㒢㒟㒦㒟㒗㒞㒘㒝㒟㒘㒘㒛㒛㒣㒥㒙㒝㒘㒟㒗㒟㒦㒡㒥㒡㒤㒣㒣㒣㒢㒤㒗㒗㒠㒦㒠㒗㒟㒘㒦㒥㒝㒚㒜㒛㒛㒜㒚㒣㒥㒜㒘㒟㒡㒚㒦㒡㒗㒦㒤㒣㒣㒥㒢㒥㒢㒗㒡㒗㒠㒘㒤㒛㒞㒚㒝㒛㒜㒜㒤㒛㒚㒞㒙㒟㒘㒠㒘㒗㒢㒠㒥㒣㒞㒟㒣㒥㒚㒢㒢㒗㒡㒙㒠㒙㒟㒛㒞㒛㒝㒜㒡㒟㒛㒞㒚㒟㒙㒠㒡㒝㒗㒢㒦㒣㒥㒤㒥㒛㒟㒤㒣㒗㒛㒤㒡㒙㒦㒜㒟㒛㒞㒝㒝㒝㒜㒟㒛㒟㒚㒠㒞㒣㒘㒢㒗㒣㒦㒤㒞㒡㒤㒦㒤㒗㒣㒘㒢㒟㒝㒘㒠㒛㒙㒙㒞㒝㒡㒤㒜㒟㒛㒡㒚㒡㒙㒣㒘㒣㒗㒤㒜㒗㒥㒦㒥㒗㒤㒘㒜㒗㒢㒚㒡㒛㒠㒜㒟㒟㒣㒡㒝㒟㒦㒞㒛㒡㒞㒚㒙㒣㒘㒤㒗㒥㒘㒘㒙㒢㒥㒘㒞㒘㒣㒚㒤㒣㒡㒟㒠㒝㒟㒞㒞㒥㒙㒞㒜㒡㒥㒢㒚㒣㒟㒚㒘㒥㒘㒗㒗㒗㒦㒠㒥㒙㒤㒚㒘㒝㒢㒜㒡㒝㒠㒞㒦㒠㒞㒠㒝㒡㒜㒢㒛㒣㒟㒦㒙㒥㒘㒦㒘㒗㒠㒠㒦㒙㒥㒚㒤㒛㒣㒜㒗㒟㒡㒞㒠㒟㒟㒠㒦㒛㒝㒢㒜㒣㒛㒤㒚㒥㒟㒘㒙㒗㒘㒘㒗㒙㒟㒤㒥㒛㒤㒜㒣㒝㒢㒞㒦㒡㒠㒠㒟㒡㒞㒢㒗㒠㒜㒤㒛㒥㒚㒦㒚㒗㒞㒚㒘㒙㒗㒚㒦㒛㒞㒥㒤㒝㒣㒞㒢㒟㒡㒠㒥㒣㒟㒢㒞㒣㒝㒤㒦㒡㒛㒦㒛㒗㒚㒘㒙㒙㒝㒜㒗㒛㒦㒜㒥㒝㒞㒙㒣㒟㒢㒠㒡㒡㒠㒢㒣㒦㒞㒥㒦㒟㒜㒦㒥㒦㒛㒘㒤㒙㒙㒚㒙㒝㒛㒗㒦㒝㒟㒝㒤㒟㒘㒘㒢㒢㒡㒢㒠㒣㒠㒚㒚㒣㒝㒦㒗㒗㒜㒘㒢㒡㒚㒚㒙㒜㒘㒜㒗㒣㒦㒞㒥㒟㒙㒢㒣㒡㒢㒢㒡㒣㒚㒛㒟㒥㒞㒦㒞㒗㒝㒘㒡㒛㒛㒚㒚㒛㒙㒜㒢㒛㒗㒞㒦㒟㒥㒠㒤㒡㒘㒤㒢㒣㒡㒤㒠㒥㒘㒢㒟㒗㒞㒘㒝㒙㒜㒚㒠㒝㒚㒜㒙㒝㒘㒞㒠㒜㒦㒠㒥㒡㒤㒢㒣㒣㒗㒦㒡㒥㒠㒦㒠㒗㒗㒦㒞㒙㒝㒚㒜㒛㒛㒜㒟㒟㒙㒞㒘㒟㒗㒠㒝㒢㒥㒢㒤㒣㒣㒤㒢㒥㒦㒙㒡㒘㒘㒢㒟㒙㒘㒙㒝㒛㒦㒜㒛㒝㒚㒞㒚㒦㒘㒠㒡㒙㒦㒢㒥㒣㒤㒤㒣㒥㒢㒦㒢㒗㒢㒟㒠㒙㒗㒥㒞㒛㒝㒜㒜㒝㒛㒞㒚㒟㒙㒦㒤㒟㒗㒢㒟㒞㒥㒤㒘㒚㒣㒦㒣㒘㒢㒘㒡㒝㒠㒚㒟㒛㒣㒞㒝㒝㒜㒞㒛㒟㒢㒘㒙㒡㒘㒢㒗㒣㒦㒤㒛㒗㒤㒦㒤㒗㒣㒘㒙㒙㒡㒚㒠㒛㒟㒜㒞㒝㒢㒠㒜㒟㒛㒠㒚㒡㒢㒘㒘㒣㒗㒤㒦㒥㒥㒦㒚㒙㒤㒘㒣㒙㒢㒚㒘㒡㒠㒜㒟㒝㒞㒞㒝㒥㒘㒞㒛㒡㒣㒞㒙㒣㒘㒤㒗㒥㒗㒗㒦㒗㒦㒚㒤㒙㒣㒚㒗㒝㒡㒜㒠㒝㒟㒞㒦㒦㒝㒠㒜㒡㒛㒢㒚㒣㒞㒦㒘㒥㒗㒦㒗㒗㒞㒢㒥㒙㒤㒚㒣㒛㒢㒜㒦㒟㒠㒞㒟㒟㒞㒠㒦㒙㒜㒢㒛㒣㒚㒤㒙㒥㒞㒘㒘㒗㒗㒘㒦㒙㒝㒣㒤㒛㒣㒜㒢㒝㒡㒞㒥㒡㒟㒠㒞㒡㒝㒢㒣㒢㒛㒤㒚㒥㒙㒦㒙㒗㒝㒚㒗㒙㒦㒚㒥㒛㒛㒜㒣㒝㒢㒞㒡㒟㒠㒠㒤㒣㒞㒢㒝㒣㒜㒤㒢㒢㒚㒦㒚㒗㒙㒘㒘㒙㒜㒜㒦㒛㒥㒜㒤㒝㒛㒤㒢㒟㒡㒠㒠㒡㒟㒢㒣㒥㒝㒤㒜㒥㒛㒦㒡㒢㒚㒘㒙㒙㒘㒚㒗㒛㒛㒞㒥㒝㒤㒞㒣㒟㒚㒞㒡㒡㒠㒢㒟㒣㒞㒤㒣㒗㒜㒦㒜㒗㒛㒘㒢㒞㒙㒚㒘㒛㒗㒜㒦㒝㒚㒠㒤㒟㒣㒠㒢㒡㒙㒟㒠㒣㒟㒤㒞㒥㒝㒦㒢㒙㒜㒘㒛㒙㒚㒚㒡㒚㒘㒜㒗㒝㒦㒞㒥㒟㒙㒢㒣㒡㒢㒢㒡㒣㒗㒝㒟㒥㒞㒦㒞㒗㒝㒘㒡㒛㒛㒚㒚㒛㒙㒜㒠㒡㒗㒞㒦㒟㒥㒠㒤㒡㒘㒤㒢㒣㒡㒤㒠㒥㒗㒢㒟㒗㒞㒘㒝㒙㒜㒚㒠㒝㒚㒜㒙㒝㒘㒞㒟㒗㒦㒠㒥㒡㒤㒢㒣㒣㒗㒦㒡㒥㒠㒦㒠㒗㒗㒣㒞㒙㒝㒚㒜㒛㒛㒜㒜㒙㒙㒟㒡㒜㒗㒠㒦㒡㒥㒢㒤㒣㒣㒤㒢㒥㒡㒦㒡㒗㒘㒦㒟㒙㒗㒝㒝㒛㒜㒜㒛㒝㒚㒞㒙㒟㒘㒠㒠㒥㒦㒢㒥㒣㒤㒤㒣㒥㒢㒦㒢㒗㒡㒘㒠㒙㒘㒟㒞㒛㒝㒜㒜㒝㒛㒢㒚㒟㒚㒢㒘㒡㒗㒢㒠㒙㒥㒤㒘㒚㒤㒘㒣㒗㒢㒘㒡㒙㒠㒚㒟㒛㒗㒣㒝㒝㒜㒟㒛㒟㒚㒠㒙㒡㒘㒢㒗㒣㒦㒤㒟㒚㒤㒦㒝㒝㒣㒘㒛㒠㒡㒚㒡㒝㒟㒜㒞㒝㒦㒤㒜㒟㒦㒙㒚㒣㒙㒢㒘㒣㒗㒤㒦㒥㒥㒦㒞㒞㒤㒘㒣㒚㒢㒚㒡㒛㒠㒜㒟㒝㒞㒞㒝㒟㒥㒥㒛㒡㒤㒘㒙㒣㒢㒛㒗㒥㒘㒘㒙㒢㒥㒘㒝㒟㒣㒚㒝㒤㒡㒝㒠㒝㒟㒞㒞㒟㒢㒜㒜㒡㒥㒙㒚㒣㒙㒥㒘㒥㒗㒦㒗㒗㒦㒘㒙㒜㒤㒛㒜㒠㒢㒜㒚㒣㒠㒞㒘㒦㒞㒠㒞㒣㒠㒝㒛㒣㒤㒚㒙㒥㒛㒤㒘㒗㒗㒘㒦㒙㒥㒚㒙㒗㒣㒜㒛㒤㒡㒞㒠㒠㒟㒠㒞㒡㒝㒢㒜㒣㒠㒗㒚㒦㒣㒛㒙㒗㒡㒞㒗㒙㒟㒡㒥㒛㒤㒜㒤㒝㒢㒞㒚㒥㒠㒠㒟㒡㒞㒢㒝㒥㒜㒤㒝㒗㒞㒡㒚㒗㒢㒟㒘㒙㒘㒘㒦㒜㒥㒜㒤㒝㒣㒞㒗㒛㒡㒠㒚㒙㒟㒢㒞㒤㒝㒤㒜㒥㒛㒦㒛㒗㒞㒛㒙㒚㒡㒠㒗㒛㒟㒣㒥㒝㒝㒦㒣㒟㒣㒢㒥㒜㒠㒢㒙㒚㒞㒤㒚㒛㒝㒗㒜㒗㒛㒘㒚㒙㒝㒦㒘㒛㒠㒤㒦㒝㒥㒟㒤㒟㒣㒠㒢㒡㒡㒢㒤㒦㒟㒥㒘㒛㒝㒦㒦㒞㒜㒘㒤㒡㒚㒚㒚㒝㒜㒗㒗㒝㒟㒥㒥㒟㒥㒠㒣㒡㒢㒢㒡㒣㒡㒚㒛㒣㒞㒦㒗㒟㒝㒘㒡㒚㒛㒚㒚㒜㒙㒜㒙㒚㒗㒞㒦㒟㒚㒢㒤㒡㒣㒢㒢㒣㒛㒙㒠㒥㒟㒦㒟㒗㒞㒘㒢㒛㒜㒚㒛㒛㒚㒜㒠㒡㒘㒞㒗㒟㒦㒠㒥㒡㒙㒤㒣㒣㒢㒤㒡㒥㒚㒜㒠㒗㒟㒘㒞㒙㒝㒚㒡㒝㒛㒜㒚㒝㒙㒞㒟㒦㒗㒠㒦㒡㒥㒢㒤㒣㒘㒦㒢㒥㒡㒦㒡㒗㒙㒜㒟㒙㒞㒚㒝㒛㒜㒜㒠㒟㒚㒞㒙㒟㒘㒠㒠㒤㒦㒢㒥㒣㒤㒤㒣㒥㒘㒘㒢㒗㒡㒘㒠㒙㒦㒢㒞㒛㒝㒜㒜㒝㒛㒞㒟㒡㒙㒠㒘㒡㒗㒢㒟㒣㒥㒤㒤㒥㒣㒦㒣㒗㒗㒚㒡㒙㒠㒚㒟㒛㒗㒞㒝㒝㒜㒞㒛㒟㒚㒠㒞㒣㒘㒢㒗㒣㒦㒤㒞㒦㒤㒦㒤㒗㒣㒘㒢㒙㒦㒜㒠㒛㒟㒜㒞㒝㒦㒝㒜㒟㒛㒠㒚㒡㒙㒢㒝㒥㒗㒤㒦㒥㒥㒦㒜㒜㒤㒘㒣㒙㒢㒚㒡㒛㒥㒞㒟㒝㒞㒞㒝㒟㒥㒞㒛㒡㒚㒢㒙㒣㒘㒤㒜㒘㒗㒗㒞㒤㒥㒘㒝㒠㒣㒚㒛㒣㒡㒜㒡㒟㒣㒙㒞㒟㒗㒗㒜㒡㒘㒞㒚㒥㒙㒤㒘㒥㒘㒜㒢㒥㒦㒘㒞㒡㒤㒚㒙㒟㒢㒜㒡㒞㒠㒞㒠㒛㒞㒠㒝㒡㒡㒤㒛㒣㒚㒤㒙㒥㒢㒛㒘㒗㒗㒘㒦㒙㒥㒚㒙㒝㒣㒜㒢㒝㒡㒞㒗㒣㒟㒠㒞㒡㒝㒢㒜㒣㒠㒦㒚㒥㒙㒦㒙㒗㒡㒞㒗㒙㒦㒚㒥㒛㒤㒜㒘㒟㒢㒞㒡㒟㒠㒠㒘㒥㒞㒢㒝㒣㒜㒤㒛㒥㒠㒘㒚㒗㒙㒘㒘㒙㒞㒢㒦㒛㒥㒜㒤㒝㒣㒞㒗㒡㒡㒠㒠㒡㒟㒢㒗㒦㒝㒤㒜㒥㒛㒦㒛㒗㒟㒚㒙㒙㒘㒚㒗㒛㒟㒜㒥㒝㒤㒞㒣㒟㒢㒠㒦㒣㒠㒢㒟㒣㒞㒤㒗㒗㒜㒦㒜㒗㒛㒘㒚㒙㒞㒜㒘㒛㒗㒜㒦㒝㒞㒟㒤㒟㒣㒠㒢㒡㒡㒢㒥㒥㒟㒤㒞㒥㒝㒦㒤㒜㒜㒘㒛㒙㒚㒚㒙㒛㒝㒞㒗㒝㒦㒞㒥㒟㒝㒟㒣㒡㒢㒢㒡㒣㒠㒤㒥㒗㒞㒦㒞㒗㒝㒘㒥㒗㒛㒚㒚㒛㒙㒜㒘㒝㒛㒡㒦㒠㒞㒝㒤㒡㒝㒙㒢㒣㒛㒜㒠㒥㒟㒦㒠㒞㒞㒘㒦㒗㒜㒚㒛㒛㒚㒜㒙㒝㒘㒞㒗㒥㒢㒞㒥㒡㒝㒠㒣㒣㒤㒠㒡㒥㒡㒗㒠㒗㒟㒣㒞㒙㒝㒚㒡㒝㒛㒜㒚㒝㒙㒞㒠㒗㒗㒠㒦㒡㒥㒢㒤㒣㒘㒦㒢㒥㒡㒦㒡㒗㒘㒝㒟㒙㒞㒚㒝㒛㒜㒜㒠㒟㒚㒞㒙㒟㒘㒠㒟㒥㒦㒢㒥㒣㒤㒤㒣㒥㒘㒘㒢㒗㒡㒘㒠㒙㒗㒠㒞㒛㒝㒜㒜㒝㒛㒞㒟㒡㒙㒠㒘㒡㒗㒢㒟㒚㒥㒤㒤㒥㒣㒦㒣㒗㒗㒚㒡㒙㒠㒚㒟㒛㒦㒤㒝㒝㒜㒞㒛㒟㒚㒠㒞㒣㒘㒢㒗㒣㒦㒤㒞㒞㒤㒦㒤㒗㒣㒘㒢㒙㒦㒜㒠㒛㒟㒜㒞㒝㒦㒛㒜㒟㒛㒠㒚㒡㒙㒢㒝㒥㒗㒤㒦㒥㒥㒦㒜㒚㒤㒘㒣㒙㒢㒚㒡㒛㒥㒞㒟㒝㒞㒞㒝㒟㒥㒜㒛㒡㒚㒢㒙㒣㒘㒤㒝㒗㒦㒦㒦㒗㒥㒘㒜㒣㒣㒚㒢㒛㒡㒜㒠㒣㒛㒜㒞㒟㒦㒟㒜㒡㒜㒝㒚㒣㒙㒥㒘㒥㒘㒙㒗㒗㒦㒘㒚㒛㒤㒚㒣㒛㒢㒜㒚㒗㒠㒞㒟㒟㒞㒠㒝㒡㒡㒤㒛㒣㒚㒤㒙㒥㒠㒙㒘㒗㒗㒘㒦㒙㒥㒚㒙㒝㒣㒜㒢㒝㒡㒞㒙㒜㒟㒠㒞㒡㒝㒢㒜㒣㒠㒠㒚㒥㒢㒦㒙㒗㒘㒘㒗㒙㒦㒚㒥㒛㒤㒢㒟㒛㒢㒞㒚㒠㒠㒠㒠㒘㒞㒢㒝㒤㒜㒤㒜㒘㒚㒦㒚㒗㒞㒚㒘㒙㒗㒚㒦㒛㒞㒜㒤㒝㒣㒞㒢㒟㒡㒠㒥㒣㒟㒢㒞㒣㒝㒤㒥㒤㒛㒦㒛㒗㒚㒘㒙㒙㒝㒜㒗㒛㒦㒜㒥㒝㒝㒜㒣㒟㒢㒠㒡㒡㒡㒘㒛㒡㒞㒤㒗㒗㒜㒦㒟㒤㒛㒘㒚㒚㒙㒚㒘㒝㒗㒜㒦㒝㒚㒠㒤㒟㒣㒠㒢㒡㒙㒗㒠㒣㒟㒤㒞㒥㒝㒦㒢㒙㒜㒘㒛㒙㒚㒚㒢㒜㒘㒜㒗㒝㒦㒞㒥㒥㒠㒞㒣㒡㒛㒥㒡㒣㒣㒤㒟㒥㒟㒗㒞㒗㒝㒚㒜㒙㒛㒚㒟㒝㒙㒜㒘㒝㒗㒞㒞㒚㒥㒠㒤㒡㒣㒢㒢㒣㒦㒦㒠㒥㒟㒦㒟㒗㒗㒚㒝㒙㒜㒚㒛㒛㒛㒞㒠㒣㒘㒟㒠㒥㒦㒠㒠㒛㒤㒤㒣㒣㒢㒤㒡㒥㒠㒦㒠㒗㒘㒜㒞㒙㒤㒛㒜㒛㒤㒢㒚㒝㒚㒠㒘㒟㒗㒠㒠㒗㒥㒢㒜㒝㒣㒥㒢㒥㒡㒦㒢㒙㒠㒘㒟㒙㒗㒡㒝㒛㒗㒙㒛㒟㒚㒞㒙㒟㒙㒢㒗㒡㒦㒢㒟㒛㒤㒤㒣㒙㒣㒘㒢㒗㒡㒘㒡㒛㒟㒚㒞㒛㒦㒥㒜㒝㒦㒚㒚㒠㒙㒠㒘㒡㒗㒢㒦㒣㒥㒤㒞㒛㒣㒦㒜㒠㒢㒘㒡㒛㒠㒚㒟㒛㒞㒜㒝㒝㒥㒥㒛㒟㒣㒣㒙㒡㒘㒢㒗㒣㒦㒤㒥㒥㒤㒦㒝㒟㒣㒘㒢㒙㒡㒚㒠㒛㒟㒜㒞㒝㒝㒞㒜㒟㒥㒙㒚㒡㒡㒛㒘㒣㒗㒤㒦㒥㒥㒦㒥㒗㒤㒘㒜㒣㒢㒚㒘㒦㒠㒜㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒤㒜㒙㒣㒠㒟㒗㒥㒠㒠㒦㒗㒥㒘㒤㒙㒣㒚㒛㒟㒡㒜㒚㒗㒟㒞㒞㒠㒝㒠㒜㒡㒛㒢㒚㒣㒢㒤㒘㒥㒗㒦㒗㒗㒦㒘㒥㒙㒤㒚㒣㒛㒢㒜㒚㒝㒠㒞㒟㒟㒞㒠㒞㒘㒜㒢㒜㒥㒚㒤㒙㒥㒢㒗㒘㒗㒛㒙㒦㒚㒥㒚㒤㒛㒤㒞㒢㒝㒡㒞㒙㒡㒟㒠㒦㒛㒝㒣㒜㒣㒛㒤㒜㒗㒙㒦㒙㒗㒡㒛㒗㒙㒠㒜㒥㒝㒤㒜㒣㒝㒣㒠㒡㒟㒠㒠㒘㒥㒞㒢㒛㒠㒜㒤㒛㒥㒚㒦㒛㒙㒙㒘㒘㒙㒠㒟㒦㒛㒠㒘㒤㒞㒣㒞㒢㒟㒡㒠㒠㒡㒟㒢㒗㒥㒝㒤㒦㒚㒛㒦㒛㒙㒚㒘㒙㒙㒘㒚㒗㒛㒟㒜㒥㒝㒝㒟㒣㒟㒛㒢㒡㒡㒡㒤㒟㒣㒞㒤㒦㒦㒜㒦㒥㒜㒛㒙㒚㒙㒙㒚㒙㒝㒗㒜㒦㒝㒞㒠㒤㒟㒛㒚㒢㒢㒡㒢㒠㒣㒠㒦㒞㒥㒝㒦㒦㒚㒜㒘㒝㒥㒚㒝㒙㒛㒘㒜㒘㒟㒦㒞㒥㒟㒝㒤㒣㒡㒣㒛㒡㒥㒠㒤㒟㒥㒠㒘㒞㒗㒝㒘㒥㒞㒛㒚㒦㒙㒙㒜㒘㒝㒗㒞㒦㒟㒥㒠㒤㒡㒜㒤㒢㒣㒛㒙㒠㒥㒠㒘㒟㒗㒞㒘㒝㒙㒜㒚㒤㒛㒚㒜㒢㒞㒘㒞㒠㒡㒦㒠㒦㒣㒤㒢㒣㒣㒛㒥㒡㒥㒙㒥㒠㒗㒟㒘㒞㒙㒞㒜㒜㒛㒛㒜㒣㒟㒙㒞㒠㒙㒗㒡㒦㒡㒥㒢㒥㒥㒣㒤㒢㒥㒛㒙㒡㒗㒛㒥㒟㒚㒞㒚㒝㒛㒝㒞㒛㒝㒚㒞㒢㒣㒘㒠㒜㒛㒦㒤㒥㒣㒤㒤㒥㒗㒢㒦㒢㒗㒚㒝㒠㒙㒢㒥㒞㒝㒝㒜㒜㒝㒛㒞㒚㒟㒙㒠㒡㒣㒗㒢㒠㒘㒥㒤㒥㒗㒣㒦㒣㒗㒢㒘㒡㒙㒙㒚㒟㒛㒗㒝㒝㒝㒥㒠㒛㒟㒛㒢㒙㒡㒘㒢㒠㒤㒦㒤㒚㒡㒤㒦㒤㒗㒣㒘㒣㒛㒡㒚㒠㒛㒘㒞㒞㒝㒥㒘㒜㒠㒛㒠㒚㒡㒚㒤㒘㒣㒗㒤㒠㒘㒥㒦㒛㒙㒤㒚㒣㒙㒢㒚㒢㒝㒠㒜㒟㒝㒗㒢㒝㒟㒚㒦㒛㒡㒚㒢㒙㒣㒙㒦㒗㒥㒦㒦㒟㒜㒥㒘㒘㒣㒣㒛㒢㒛㒡㒜㒠㒝㒟㒞㒞㒟㒦㒢㒜㒡㒥㒗㒚㒣㒙㒦㒘㒥㒗㒦㒗㒗㒦㒘㒞㒙㒤㒚㒜㒜㒢㒜㒚㒟㒠㒞㒠㒡㒞㒠㒝㒡㒥㒣㒛㒣㒡㒠㒚㒗㒘㒦㒘㒗㒘㒚㒦㒙㒥㒚㒝㒝㒣㒜㒚㒗㒡㒟㒠㒟㒟㒠㒟㒣㒝㒢㒜㒣㒥㒗㒚㒥㒚㒜㒙㒚㒘㒘㒗㒙㒗㒜㒥㒛㒤㒜㒜㒡㒢㒞㒛㒜㒠㒡㒟㒡㒞㒢㒞㒥㒜㒤㒛㒥㒤㒛㒚㒗㒛㒜㒘㒙㒗㒚㒦㒛㒥㒜㒤㒝㒣㒞㒛㒡㒡㒠㒙㒦㒟㒢㒞㒥㒝㒤㒜㒥㒛㒦㒛㒗㒣㒘㒙㒙㒡㒛㒗㒛㒟㒞㒥㒝㒥㒠㒣㒟㒢㒠㒚㒢㒠㒢㒛㒝㒞㒤㒝㒥㒜㒦㒝㒙㒛㒘㒚㒙㒢㒜㒘㒛㒞㒦㒦㒞㒥㒞㒤㒟㒤㒢㒢㒡㒡㒢㒙㒦㒟㒤㒞㒤㒝㒦㒝㒗㒜㒘㒜㒛㒚㒚㒙㒛㒡㒠㒗㒝㒥㒗㒥㒟㒤㒠㒣㒡㒣㒤㒡㒣㒠㒤㒙㒚㒞㒦㒢㒡㒝㒙㒜㒙㒛㒚㒚㒛㒙㒜㒘㒝㒠㒠㒦㒟㒞㒥㒤㒡㒣㒤㒢㒣㒡㒤㒠㒥㒟㒦㒘㒗㒞㒘㒦㒚㒜㒚㒤㒝㒚㒜㒚㒟㒘㒞㒗㒟㒟㒡㒥㒡㒗㒡㒣㒣㒢㒤㒡㒥㒢㒘㒠㒗㒟㒘㒗㒛㒝㒚㒣㒥㒛㒝㒚㒝㒙㒞㒙㒡㒗㒠㒦㒡㒞㒥㒤㒣㒙㒟㒣㒗㒡㒦㒡㒗㒡㒚㒟㒙㒞㒚㒦㒟㒜㒜㒣㒞㒚㒠㒙㒟㒘㒠㒘㒣㒦㒢㒥㒣㒞㒙㒣㒥㒣㒟㒢㒘㒡㒘㒠㒙㒟㒚㒞㒛㒝㒜㒥㒟㒛㒞㒣㒤㒙㒠㒘㒣㒗㒢㒦㒣㒥㒤㒤㒥㒜㒦㒣㒗㒛㒙㒡㒙㒙㒜㒟㒛㒟㒞㒝㒝㒜㒞㒤㒠㒚㒠㒘㒠㒘㒢㒗㒣㒦㒤㒗㒗㒤㒦㒤㒗㒜㒚㒢㒙㒘㒠㒠㒛㒟㒜㒞㒝㒝㒞㒜㒟㒛㒠㒣㒢㒙㒢㒡㒤㒗㒤㒠㒗㒥㒦㒦㒙㒤㒘㒣㒙㒛㒜㒡㒛㒝㒝㒟㒝㒞㒞㒝㒟㒜㒠㒛㒡㒚㒢㒢㒤㒘㒤㒠㒦㒦㒦㒟㒙㒥㒘㒥㒛㒣㒚㒢㒛㒚㒟㒠㒝㒝㒜㒞㒠㒝㒠㒜㒡㒛㒢㒚㒣㒙㒤㒡㒦㒗㒦㒠㒘㒦㒘㒞㒜㒤㒚㒣㒡㒞㒚㒡㒝㒙㒡㒟㒟㒥㒚㒝㒡㒜㒣㒛㒣㒛㒚㒙㒥㒘㒦㒝㒙㒗㒘㒦㒙㒥㒚㒤㒟㒣㒜㒢㒝㒡㒞㒠㒟㒤㒢㒞㒡㒝㒢㒜㒣㒞㒚㒚㒥㒙㒦㒙㒗㒘㒘㒜㒛㒦㒚㒥㒛㒤㒜㒜㒝㒢㒞㒡㒟㒠㒠㒟㒡㒣㒤㒝㒣㒜㒤㒛㒥㒟㒤㒚㒗㒙㒘㒘㒙㒗㒚㒛㒝㒥㒜㒤㒝㒣㒞㒥㒞㒡㒠㒠㒡㒟㒢㒞㒣㒢㒦㒜㒥㒛㒦㒛㒗㒝㒙㒙㒙㒘㒚㒗㒛㒦㒜㒚㒚㒤㒟㒜㒠㒢㒠㒚㒤㒠㒢㒟㒤㒞㒤㒟㒗㒤㒞㒜㒘㒤㒙㒚㒙㒘㒙㒘㒛㒗㒜㒦㒝㒦㒠㒤㒟㒣㒠㒛㒣㒡㒢㒘㒙㒟㒤㒞㒥㒝㒦㒝㒗㒜㒘㒛㒙㒣㒛㒙㒛㒡㒝㒗㒝㒟㒠㒥㒟㒥㒢㒣㒡㒢㒢㒚㒥㒠㒤㒡㒦㒞㒦㒞㒗㒝㒘㒜㒙㒛㒚㒚㒛㒢㒝㒘㒝㒠㒟㒦㒟㒞㒢㒤㒡㒤㒤㒢㒣㒡㒤㒚㒗㒟㒦㒚㒚㒞㒘㒝㒙㒜㒚㒛㒛㒚㒜㒙㒝㒡㒟㒗㒟㒟㒡㒥㒡㒝㒤㒣㒣㒣㒦㒡㒥㒠㒦㒙㒚㒟㒘㒜㒗㒝㒛㒜㒛㒛㒜㒚㒝㒙㒞㒘㒟㒠㒡㒦㒡㒞㒣㒤㒣㒝㒗㒢㒥㒢㒜㒜㒥㒠㒘㒘㒜㒞㒚㒣㒗㒜㒜㒛㒞㒚㒞㒙㒠㒘㒠㒗㒡㒛㒤㒥㒣㒤㒤㒣㒥㒥㒥㒢㒗㒡㒘㒠㒙㒟㒚㒣㒘㒝㒝㒥㒞㒛㒞㒣㒢㒙㒠㒘㒢㒗㒢㒗㒥㒥㒤㒤㒦㒝㒗㒣㒗㒡㒗㒡㒙㒠㒚㒟㒛㒟㒞㒡㒘㒜㒞㒤㒡㒚㒠㒡㒗㒘㒢㒗㒣㒦㒤㒥㒥㒦㒟㒤㒗㒜㒙㒢㒙㒚㒛㒠㒛㒘㒞㒞㒝㒞㒠㒠㒚㒛㒠㒣㒣㒙㒢㒣㒠㒗㒤㒦㒥㒥㒦㒥㒗㒥㒡㒣㒙㒛㒛㒡㒛㒙㒝㒟㒝㒗㒠㒝㒟㒝㒢㒟㒜㒚㒢㒢㒦㒘㒤㒥㒣㒗㒗㒦㒗㒥㒘㒤㒙㒙㒠㒢㒛㒚㒝㒠㒝㒘㒟㒞㒟㒦㒣㒜㒡㒜㒘㒦㒡㒙㒤㒢㒘㒗㒦㒜㒟㒦㒘㒥㒚㒤㒚㒣㒞㒢㒜㒡㒝㒥㒠㒟㒟㒞㒠㒝㒡㒟㒘㒛㒣㒚㒤㒙㒥㒘㒦㒝㒙㒗㒘㒦㒙㒥㒚㒝㒛㒣㒜㒢㒝㒡㒞㒠㒟㒤㒢㒞㒡㒝㒢㒜㒣㒜㒘㒚㒥㒙㒦㒙㒗㒘㒘㒞㒜㒦㒚㒞㒜㒤㒜㒜㒠㒢㒞㒡㒠㒠㒠㒠㒣㒞㒢㒝㒣㒥㒥㒛㒥㒝㒙㒚㒚㒙㒘㒘㒙㒗㒚㒦㒛㒥㒜㒝㒞㒣㒞㒢㒢㒡㒠㒙㒢㒟㒢㒟㒥㒝㒤㒜㒥㒥㒙㒛㒗㒗㒦㒙㒚㒘㒚㒗㒛㒦㒜㒥㒝㒤㒞㒜㒠㒢㒠㒚㒢㒠㒢㒘㒦㒞㒤㒞㒛㒘㒤㒜㒗㒤㒛㒚㒙㒝㒟㒘㒛㒗㒝㒦㒝㒥㒠㒤㒟㒣㒠㒗㒣㒡㒢㒠㒣㒟㒤㒡㒞㒝㒦㒝㒗㒜㒘㒛㒙㒟㒜㒙㒛㒘㒜㒗㒝㒦㒡㒥㒟㒤㒠㒣㒡㒢㒢㒞㒜㒠㒤㒘㒦㒞㒦㒗㒚㒝㒘㒜㒚㒛㒚㒛㒝㒙㒜㒘㒝㒠㒡㒦㒟㒜㒚㒤㒡㒣㒢㒢㒣㒡㒤㒠㒥㒟㒦㒘㒘㒞㒘㒠㒘㒜㒚㒤㒞㒚㒜㒙㒝㒘㒞㒗㒟㒟㒡㒥㒡㒤㒤㒣㒣㒢㒥㒡㒥㒠㒦㒠㒗㒟㒘㒞㒙㒝㒚㒜㒜㒛㒜㒚㒝㒙㒞");local M=(0x6a+-91)local d=34 local o=l;local e={}e={[((0x68-93)+-#[[ambattakam]])]=function()local n,l,e,r=I(A,o,o+g);o=o+B;d=(d+(M*B))%a;return(((r+d-(M)+f*(B*y))%f)*((y*j)^y))+(((e+d-(M*y)+f*(y^g))%a)*(f*a))+(((l+d-(M*g)+j)%a)*f)+((n+d-(M*B)+j)%a);end,[(0x13e/(-#'Pipe te amo'+(12920/0x4c)))]=function(e,e,e)local e=I(A,o,o);o=o+S;d=(d+(M))%a;return((e+d-(M)+j)%f);end,[(231/0x4d)]=function()local e,l=I(A,o,o+y);d=(d+(M*y))%a;o=o+y;return(((l+d-(M)+f*(y*B))%f)*a)+((e+d-(M*y)+a*(y^g))%f);end,[(43-0x27)]=function(o,e,d)if d then local e=(o/y^(e-l))%y^((d-S)-(e-l)+S);return e-e%l;else local e=y^(e-S);return(o%(e+e)>=e)and l or p;end;end,[(800/0xa0)]=function()local o=e[(0x14/20)]();local d=e[(-#"Rip Technoblade but he truly never dies in our hearts"+(0xa4-110))]();local r=l;local n=(e[(0x59-85)](d,S,z+B)*(y^(z*y)))+o;local o=e[(0x3c0/240)](d,21,31);local e=((-l)^e[(956/0xef)](d,32));if(o==p)then if(n==v)then return e*p;else o=S;r=v;end;elseif(o==(f*(y^g))-S)then return(n==p)and(e*(S/v))or(e*(p/v));end;return R(e,o-((a*(B))-l))*(r+(n/(y^G)));end,[(-#[[testpsx dupe no scam legit 2022 free no virus]]+(0x52+-31))]=function(n,r,r)local r;if(not n)then n=e[(153/0x99)]();if(n==p)then return'';end;end;r=E(A,o,o+n-l);o=o+n;local e=''for o=S,#r do e=Y(e,H((I(E(r,o,o))+d)%a))d=(d+M)%f end return e;end}local function R(...)return{...},q('#',...)end local function E()local r={};local i={};local o={};local n={r,i,nil,o};local d={}local b=((-15260/0xda)+98)local a={[(0/0xd7)]=(function(o)return not(#o==e[(0x30+-46)]())end),[(-#[[python]]+((-1273/0x43)+27))]=(function(o)return e[((0x56+-50)+-#'Boosted moonsec for meme string')]()end),[(-#"saitama solos"+(0x66+-86))]=(function(o)return e[(0x24-30)]()end),[(70+-0x42)]=(function(o)local d=e[((0x3a+(80-0x67))+-#[[Only A to Z 0 to 9 is allowed]])]()local o=''local e=1 for l=1,#d do e=(e+b)%a o=Y(o,H((I(d:sub(l,l))+e)%f))end return o end)};n[3]=e[(0x1a6/211)]();for e=S,e[(-0x14+21)]()do i[e-S]=E();end;local o=e[(-#'pls free synapse x i am gamer girl uwu'+(6435/(-#"i would jerk off to federals feet"+(0x1e4-286))))]()for o=1,o do local e=e[(37-0x23)]();local l;local e=a[e%(192-0x9f)];d[o]=e and e({});end;for b=1,e[(91+-0x5a)]()do local o=e[(0x1e6/243)]();if(e[(0x56-82)](o,l,S)==v)then local i=e[(252/0x3f)](o,y,g);local a=e[(-0x52+86)](o,B,y+B);local o={e[((106-0x62)+-#'ballz')](),e[(-#[[81072288006025753475892953766016422248802943297561016754277806637153679671241827]]+(-80+(-#"If no father return milk end"+(0x10d+-78))))](),nil,nil};local n={[((0x7a-122)/0xb4)]=function()o[s]=e[(133-0x82)]();o[C]=e[((0x6c-86)+-#[[I hate black people]])]();end,[(100-0x63)]=function()o[t]=e[(((132+-0x3b)+-#"impulse is hot")-58)]();end,[(0x44+-66)]=function()o[h]=e[(41-0x28)]()-(y^z)end,[(-127+(356-0xe2))]=function()o[O]=e[(0xac/172)]()-(y^z)o[D]=e[(85+-0x52)]();end};n[i]();if(e[(0x35+-49)](a,S,l)==S)then o[k]=d[o[w]]end if(e[(-#'I feel a good'+(0x5d-76))](a,y,y)==l)then o[c]=d[o[s]]end if(e[(0x45+-65)](a,g,g)==S)then o[P]=d[o[P]]end r[b]=o;end end;return n;end;local function A(e,B,f)local p=e[y];local d=e[g];local a=e[l];return(function(...)local I=q('#',...)-S;local j={};local e=l e*=-1 local g=e;local o=l;local M=d;local z={...};local d={};local v={};local a=a;local H=p;local p=R for e=0,I do if(e>=M)then j[e-M]=z[e+S];else d[e]=z[e+l];end;end;local e=I-M+l local e;local M;while true do e=a[o];M=e[(-0x12+19)];n=(3479935)while(-#[[Please stop hitting my ribcage with a metal bar]]+(0x6644/(-#[[i love minors]]+(0x13c-193))))>=M do n-= n n=(1877258)while((-0x19+149)+-#"Only A to Z 0 to 9 is allowed")>=M do n-= n n=(151293)while M<=(167+-0x78)do n-= n n=(8959764)while(0x5b-68)>=M do n-= n n=(3255564)while M<=((0x1528-2765)/0xf1)do n-= n n=(302905)while M<=(((0x5514/198)+-#[[Hey y7]])-0x63)do n-= n n=(5355952)while M<=((-26+0x22)+-#'shlong')do n-= n n=(6930560)while(94+-0x5e)>=M do n-= n local n;d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[b]]==d[e[N]])then o=o+S;else o=e[s];end;break;end while 3920==(n)/((-#[[Eu gosto de peitos]]+(3670-0x75c)))do n=(1236378)while(217/0xd9)<M do n-= n local M;local n;d[e[i]]=e[c];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];d[e[x]]=B[e[O]];o=o+l;e=a[o];n=e[k];M=d[e[h]];d[n+1]=M;d[n]=M[e[D]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[x]]=e[h];break end while 1573==(n)/(((-0x3a+931)+-#'MSC 793z487nhvcgsdfgsudfza9889jgvz56gz56z547684z5g54z948g56z74j56475jzg645z6456 oh wait'))do local n;d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[w]]=d[e[s]][e[P]];o=o+l;e=a[o];if(d[e[k]]==e[C])then o=o+S;else o=e[t];end;break end;break;end break;end while 1358==(n)/((4051+-0x6b))do n=(4328370)while M<=(-#"Real deobfuscator"+(102-0x52))do n-= n local n;d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[b]][e[s]]=d[e[_]];o=o+l;e=a[o];d[e[i]]=B[e[U]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];do return end;break;end while 1886==(n)/((-27+0x912))do n=(6285690)while M>(-#[[pairu sucks dick]]+(-0x31+69))do n-= n if d[e[w]]then o=o+l;else o=e[t];end;break end while(n)/((-#"Give nitro"+(21645/0xd)))==3798 do do return d[e[r]]end break end;break;end break;end break;end while 2089==(n)/((-#"im gay"+(151/0x1)))do n=(9841810)while(-0x40+72)>=M do n-= n n=(1421700)while(702/0x75)>=M do n-= n local n;d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if not d[e[r]]then o=o+S;else o=e[h];end;break;end while 2031==(n)/((-68+(795+-0x1b)))do n=(9465610)while M>((-#'e621DotNet'+(137808/0xc6))/98)do n-= n local r;local h;local n;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];h=e[s];r=d[h]for e=h+1,e[P]do r=r..d[e];end;d[e[i]]=r;o=o+l;e=a[o];o=e[U];break end while(n)/((0x175b-3053))==3235 do local h;local n;n=e[r];h=d[e[c]];d[n+1]=h;d[n]=h[e[D]];o=o+l;e=a[o];d[e[r]]={};o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]][e[c]]=d[e[D]];break end;break;end break;end while(n)/((-0x38+2826))==3553 do n=(13881924)while(0x2d0/80)>=M do n-= n local M;local n;d[e[r]][e[O]]=e[P];o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];n=e[w];M=d[e[h]];d[n+1]=M;d[n]=M[e[P]];o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[r]][e[s]]=d[e[N]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][e[O]]=d[e[N]];o=o+l;e=a[o];d[e[r]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[w]][e[O]]=d[e[C]];o=o+l;e=a[o];d[e[k]][e[h]]=e[_];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];do return end;break;end while 3554==(n)/((0xf55+-19))do n=(46246)while(-0x2b+53)<M do n-= n local n;d[e[i]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[c]]=d[e[C]];o=o+l;e=a[o];d[e[w]][e[O]]=e[_];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[x]]=e[O];break end while(n)/(((-0x2f+2527)+-#'blinx1 is a sissy little femboy that loves men'))==19 do local r;local n;d[e[i]][e[U]]=d[e[_]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];n=e[w];r=d[e[t]];d[n+1]=r;d[n]=r[e[C]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]][e[O]]=d[e[_]];break end;break;end break;end break;end break;end while 1527==(n)/((0x10d6-2178))do n=(825840)while M<=(-#'yiff'+(0x49-52))do n-= n n=(7548624)while M<=(-#[[10 black dicks in your mouth]]+(1638/0x27))do n-= n n=(8247800)while M<=((0x78+-77)+-#"Boosted moonsec for meme string")do n-= n local l=e[b];local a=d[l]local n=d[l+2];if(n>0)then if(a>d[l+1])then o=e[t];else d[l+3]=a;end elseif(a<d[l+1])then o=e[U];else d[l+3]=a;end break;end while(n)/((-#"gozei na parede"+(8252-(-#"Daddy fuck me"+(0x2118-4297)))))==2024 do n=(9116800)while M>(3107/0xef)do n-= n local e=e[k]local a,o=p(d[e]())g=o+e-l local o=0;for e=e,g do o=o+S;d[e]=a[o];end;break end while 3850==(n)/(((2442+-0x46)+-#"null"))do local n;d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[r]]();o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[i]][e[s]]=d[e[D]];o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[k]][e[c]]=d[e[_]];o=o+l;e=a[o];d[e[k]][e[U]]=e[C];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[b]][e[U]]=d[e[D]];o=o+l;e=a[o];d[e[w]][e[t]]=e[N];o=o+l;e=a[o];d[e[w]][e[h]]=d[e[N]];o=o+l;e=a[o];d[e[i]][e[h]]=e[C];o=o+l;e=a[o];do return d[e[r]]end o=o+l;e=a[o];do return end;break end;break;end break;end while(n)/((-#[[Rip Technoblade but he truly never dies in our hearts]]+(159797/0x49)))==3534 do n=(3541733)while M<=(0x7ad/131)do n-= n local D;local M;local y,v;local n;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[P]];o=o+l;e=a[o];n=e[w]y,v=p(d[n](d[n+S]))g=v+n-l M=0;for e=n,g do M=M+l;d[e]=y[M];end;o=o+l;e=a[o];n=e[x]d[n](u(d,n+S,g))o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[m]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];d[e[r]]=B[e[U]];o=o+l;e=a[o];n=e[x];D=d[e[s]];d[n+1]=D;d[n]=D[e[m]];o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[b]][e[O]]=d[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[k]][e[s]]=d[e[C]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[k]][e[U]]=e[P];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];o=e[h];break;end while 1103==(n)/((661466/0xce))do n=(1078350)while M>(-#[[If you see this string you are cool]]+(0x2c3a/222))do n-= n d[e[x]]=d[e[O]]%d[e[m]];break end while(n)/((0x1f31-4035))==273 do d[e[i]]={};break end;break;end break;end break;end while(n)/((399+-0x67))==2790 do n=(1014130)while(-#"impulse was here omg"+(3440/0x56))>=M do n-= n n=(3055580)while(0xe6a/205)>=M do n-= n local h;local n;d[e[b]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[C]];o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[i]d[n](d[n+S])o=o+l;e=a[o];n=e[w];h=d[e[c]];d[n+1]=h;d[n]=h[e[_]];o=o+l;e=a[o];d[e[i]]=d[e[t]];o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];o=e[s];break;end while(n)/(((2995-0x5f0)+-#[[ur mom is hot]]))==2090 do n=(808143)while(-#'nico der hurensohn'+(183-0x92))<M do n-= n local a=e[i];local r=e[P];local n=a+2 local a={d[a](d[a+1],d[n])};for e=1,r do d[n+e]=a[e];end;local a=a[1]if a then d[n]=a o=e[c];else o=o+l;end;break end while 609==(n)/((0x598+((-0x57-1)+-#[[iPipeh i love You]])))do d[e[r]]=d[e[s]]-d[e[D]];break end;break;end break;end while(n)/((-0x4a+612))==1885 do n=(7426728)while(0x78+-99)>=M do n-= n local x;local n;d[e[b]][e[s]]=d[e[P]];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[r];x=d[e[t]];d[n+1]=x;d[n]=x[d[e[D]]];o=o+l;e=a[o];d[e[i]]={};o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))break;end while(n)/(((4030+-0x3e)+-#"so much white liquid daddy"))==1884 do n=(3328132)while M>((1167892/0xd1)/0xfe)do n-= n local n=e[i];local l={};for e=1,#v do local e=v[e];for o=0,#e do local o=e[o];local a=o[1];local e=o[2];if a==d and e>=n then l[e]=a[e];o[1]=l;end;end;end;break end while(n)/((41786/(-0x60+130)))==2708 do d[e[r]]=-d[e[c]];break end;break;end break;end break;end break;end break;end while(n)/((5367-0xaab))==3399 do n=(110979)while M<=(152-0x75)do n-= n n=(10158940)while M<=((4346/0x52)+-#'fatee is gay 0nly on top')do n-= n n=(1133055)while((59+-0x1a)+-#'El pepe')>=M do n-= n n=(1683040)while M<=(216/0x9)do n-= n local i;local n;d[e[x]]=B[e[s]];o=o+l;e=a[o];n=e[r];i=d[e[t]];d[n+1]=i;d[n]=i[e[P]];o=o+l;e=a[o];d[e[b]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[h]][d[e[N]]];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=B[e[U]];o=o+l;e=a[o];n=e[k];i=d[e[t]];d[n+1]=i;d[n]=i[e[C]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[c]][d[e[_]]];o=o+l;e=a[o];d[e[k]]=(e[s]~=0);o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[O]))break;end while(n)/((2564-0x51c))==1340 do n=(5209802)while(138-0x71)<M do n-= n d[e[i]]();break end while(n)/((-123+0xad9))==1963 do d[e[r]]=d[e[t]][d[e[C]]];break end;break;end break;end while(n)/((-#"ip grabbing in progress"+(0x135d4/79)))==1155 do n=(1607848)while M<=(-#[[how to find my dad at the dollar store getting milk]]+(-122+0xc8))do n-= n d[e[w]]=d[e[h]]/d[e[N]];break;end while 1661==(n)/((2049-((59785/0x37)+-#'python')))do n=(1436931)while M>(-0x55+113)do n-= n local n;d[e[x]]=e[U];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];do return d[e[w]]end o=o+l;e=a[o];o=e[t];break end while 711==(n)/((-96+0x845))do local U;local M;local n;d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[x]]=d[e[O]];o=o+l;e=a[o];M=e[s];U=d[M]for e=M+1,e[_]do U=U..d[e];end;d[e[r]]=U;o=o+l;e=a[o];n=e[r]d[n](d[n+S])o=o+l;e=a[o];do return end;break end;break;end break;end break;end while(n)/((0x17ea-3094))==3355 do n=(2250710)while M<=(0xb5-149)do n-= n n=(4051348)while M<=(((-0x69+168)+-#"nerd")+-29)do n-= n local i;local r;local n;d[e[k]]=e[t];o=o+l;e=a[o];d[e[w]]=#d[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[U]]-e[N];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[x];r=d[n]i=d[n+2];if(i>0)then if(r>d[n+1])then o=e[t];else d[n+3]=r;end elseif(r<d[n+1])then o=e[s];else d[n+3]=r;end break;end while(n)/((4584-0x91c))==1799 do n=(1833600)while(88-0x39)<M do n-= n local n;d[e[k]][d[e[U]]]=d[e[C]];o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[N]];o=o+l;e=a[o];n=e[k]d[n]=d[n]()o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[D]];o=o+l;e=a[o];n=e[b]d[n]=d[n]()o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[b]]=d[e[t]];break end while(n)/((-#[[boronide sucks ass]]+(0x22f02/183)))==2400 do local c;local n;n=e[i];c=d[e[t]];d[n+1]=c;d[n]=c[e[m]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[U];break end;break;end break;end while(n)/((2314-0x4b8))==2035 do n=(2492625)while(0x4e6/38)>=M do n-= n local M;local _;local n;d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[D]];o=o+l;e=a[o];n=e[x];_=d[e[O]];d[n+1]=_;d[n]=_[e[D]];o=o+l;e=a[o];d[e[b]]=B[e[c]];o=o+l;e=a[o];d[e[x]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[k]]=d[e[c]][d[e[P]]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];M={d,e};M[S][M[y][k]]=M[l][M[y][C]]+M[S][M[y][h]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];do return end;break;end while 1955==(n)/((-38+0x521))do n=(10012485)while(0x19a2/193)<M do n-= n local e=e[r]local a,o=p(d[e](d[e+S]))g=o+e-l local o=0;for e=e,g do o=o+l;d[e]=a[o];end;break end while 3997==(n)/((-112+0xa39))do local n;d[e[w]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[r]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[D]];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];if d[e[i]]then o=o+l;else o=e[c];end;break end;break;end break;end break;end break;end while 627==(n)/((-#'goofy ahh uncle productions'+(0x1f7-299)))do n=(88478)while((0x209d/121)+-#'With rock shock rap with Doc')>=M do n-= n n=(2245180)while M<=(-0x2c+82)do n-= n n=(1960152)while M<=((9900/0xa5)+-#'fatee is gay 0nly on top')do n-= n local n;d[e[i]]=e[t];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[w]][e[s]]=d[e[C]];o=o+l;e=a[o];d[e[r]][e[c]]=d[e[C]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[b]][e[O]]=e[N];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[w]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[w]][e[t]]=d[e[_]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[w]][e[t]]=d[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[i]][e[t]]=d[e[D]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[b]][e[t]]=e[N];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[s]]=d[e[C]];o=o+l;e=a[o];d[e[r]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[i]][e[O]]=d[e[_]];o=o+l;e=a[o];d[e[x]][e[t]]=e[_];o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]][e[U]]=d[e[C]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[r]]=f[e[h]];break;end while 1219==(n)/((-#'33 cocks in my mouth'+((0x22b99c8/106)/0xd3)))do n=(10802900)while M>(152+-0x73)do n-= n local l=e[w];local o=d[e[c]];d[l+1]=o;d[l]=o[e[C]];break end while 3662==(n)/((0xbc7+-65))do local n;d[e[r]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[w]][e[s]]=d[e[C]];o=o+l;e=a[o];d[e[b]][e[s]]=d[e[C]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[x]][e[U]]=d[e[N]];o=o+l;e=a[o];d[e[k]][e[O]]=e[C];o=o+l;e=a[o];d[e[b]][e[h]]=e[D];o=o+l;e=a[o];d[e[r]][e[U]]=e[C];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]][e[h]]=d[e[m]];o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[N]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]][e[O]]=d[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][e[t]]=d[e[m]];o=o+l;e=a[o];d[e[r]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][e[O]]=d[e[_]];o=o+l;e=a[o];d[e[r]][e[t]]=e[C];o=o+l;e=a[o];d[e[r]][e[s]]=e[m];o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]][e[O]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[N]];o=o+l;e=a[o];do return end;break end;break;end break;end while(n)/(((0x65e68/204)+-#[[warboy hates you]]))==1106 do n=(2616120)while(936/0x18)>=M do n-= n local n;d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[w]][e[t]]=d[e[N]];o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];B[e[O]]=d[e[k]];break;end while(n)/(((0xa47-1375)+-#[[roblox roblox zimjelja roblox roblox sastalajala roblox roblox roblox salamelja roblox]]))==2236 do n=(8353143)while M>(62+-0x16)do n-= n local n;d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[r]]=e[t];break end while(n)/((0x98a+-75))==3529 do local n;d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]][d[e[U]]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[i]]=(e[t]~=0);o=o+l;e=a[o];d[e[k]][d[e[h]]]=d[e[C]];break end;break;end break;end break;end while 26==(n)/((752063/0xdd))do n=(6747001)while M<=(0x63+-55)do n-= n n=(418119)while M<=(-0x67+145)do n-= n for e=e[k],e[t]do d[e]=nil;end;break;end while 213==(n)/((-0x4d+2040))do n=(453196)while(-#[[balls]]+(0x1800/128))<M do n-= n local e=e[w]d[e](d[e+S])break end while(n)/((47676/0xae))==1654 do local n;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[m]];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];if d[e[i]]then o=o+l;else o=e[U];end;break end;break;end break;end while 1849==(n)/((3679+-0x1e))do n=(2348478)while(0x2cd3/255)>=M do n-= n d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[r]][e[O]]=e[C];o=o+l;e=a[o];do return end;break;end while(n)/(((0xa06-1329)+-#[[ambattakam]]))==1914 do n=(9981111)while M>(-49+0x5f)do n-= n d[e[k]]=f[e[s]];break end while(n)/((0x188f-3194))==3227 do local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[r]]=d[e[h]];o=o+l;e=a[o];for e=e[x],e[t]do d[e]=nil;end;o=o+l;e=a[o];d[e[k]]=(e[s]~=0);o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];o=e[h];break end;break;end break;end break;end break;end break;end break;end while(n)/((0x1994-3329))==47 do n=(1229250)while M<=(-#'Deezbutts'+(0x2760/126))do n-= n n=(6099570)while M<=(0x1be3/121)do n-= n n=(25193)while(-#"me when they are is have the me when are is do me when"+(-0x36+161))>=M do n-= n n=(700740)while M<=(-#'ooga booga sex'+(149+-0x55))do n-= n n=(2741832)while M<=(146+-0x62)do n-= n if(d[e[i]]~=d[e[_]])then o=o+S;else o=e[t];end;break;end while 2034==(n)/(((0x5c9+-106)+-#'goofy ahh uncle productions'))do n=(209897)while M>(-#'Throw on Lose Yourself and make em lose it'+(273-0xb6))do n-= n local n;d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[x]]~=d[e[N]])then o=o+S;else o=e[c];end;break end while 431==(n)/((0x4fe6/42))do d[e[i]]=d[e[U]][e[D]];o=o+l;e=a[o];B[e[c]]=d[e[w]];o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];d[e[k]][e[O]]=e[P];o=o+l;e=a[o];d[e[x]]=B[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[_]];o=o+l;e=a[o];B[e[c]]=d[e[r]];o=o+l;e=a[o];d[e[i]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[_]];break end;break;end break;end while(n)/((-0x36+1428))==510 do n=(208656)while M<=(4335/0x55)do n-= n local n;d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]]=(e[c]~=0);o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];d[e[r]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=d[e[O]];o=o+l;e=a[o];n=e[i]d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];B[e[s]]=d[e[i]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[i]d[n](d[n+S])o=o+l;e=a[o];o=e[c];break;end while 3864==(n)/((0x2d90/216))do n=(1593018)while(-#'ive seen your mothers ass'+(0x138d/65))<M do n-= n local n;d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];f[e[O]]=d[e[r]];o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];if d[e[w]]then o=o+l;else o=e[s];end;break end while(n)/((-#'holy shit'+((0xf37a/46)-0x2b0)))==2421 do local i;local n;d[e[w]][e[h]]=d[e[P]];o=o+l;e=a[o];n=e[x]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];n=e[r];i=d[e[h]];d[n+1]=i;d[n]=i[e[N]];o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]][e[c]]=d[e[_]];break end;break;end break;end break;end while 59==(n)/((94794/0xde))do n=(6115232)while M<=(3080/0x37)do n-= n n=(1285892)while M<=((-#"Axeo of the worst boronide forks Includes nocredito dumpedito nigedito"+(-0x41+305))+-116)do n-= n local n;d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[c]];o=o+l;e=a[o];n=e[x]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]][d[e[h]]]=d[e[_]];o=o+l;e=a[o];o=e[t];break;end while 563==(n)/((0x955+-105))do n=(793361)while M>(0x15ea/102)do n-= n local z;local y;local v,I;local M;local n;d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];n=e[x];M=d[e[s]];d[n+1]=M;d[n]=M[e[N]];o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[P]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[D]];o=o+l;e=a[o];n=e[r]v,I=p(d[n](d[n+S]))g=I+n-l y=0;for e=n,g do y=y+l;d[e]=v[y];end;o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,g))o=o+l;e=a[o];d[e[x]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];n=e[r];M=d[e[h]];d[n+1]=M;d[n]=M[e[_]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[N]];o=o+l;e=a[o];n=e[b]v,I=p(d[n](d[n+S]))g=I+n-l y=0;for e=n,g do y=y+l;d[e]=v[y];end;o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,g))o=o+l;e=a[o];d[e[i]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=B[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[i]]=d[e[s]]-e[N];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];M=e[t];z=d[M]for e=M+1,e[m]do z=z..d[e];end;d[e[b]]=z;o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];o=e[U];break end while(n)/((638-0x147))==2551 do local n;d[e[b]]=e[U];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[w]][d[e[c]]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=(e[s]~=0);o=o+l;e=a[o];d[e[i]][d[e[O]]]=d[e[_]];break end;break;end break;end while(n)/((0x35ee0/117))==3239 do n=(3784136)while M<=((184+-0x58)+-#'psx real dupe steal all ur pets no joke')do n-= n local x;local n;f[e[h]]=d[e[r]];o=o+l;e=a[o];d[e[k]]=(e[t]~=0);o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];n=e[r];x=d[e[h]];d[n+1]=x;d[n]=x[e[N]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];n=e[r];x=d[e[O]];d[n+1]=x;d[n]=x[e[_]];break;end while 3403==(n)/((-#'Rip Technoblade but he truly never dies in our hearts'+(2412-0x4df)))do n=(10568173)while((0x9f+-84)+-#"Impulse real 2022")<M do n-= n d[e[b]]=e[h];break end while(n)/((-#[[hey guys do you remember the jar of latex]]+(7733-0xf4f)))==2801 do local e={d,e};e[S][e[y][i]]=e[l][e[y][D]]+e[S][e[y][t]];break end;break;end break;end break;end break;end while 1845==(n)/(((6658-0xd0b)+-#[[Pyrite On Top]]))do n=(4756220)while(-0x56+151)>=M do n-= n n=(5653148)while M<=((-0x15+101)+-#"jtoh is cringe ngl")do n-= n n=(10553620)while(0x1dc4/127)>=M do n-= n local n;d[e[k]]=B[e[c]];o=o+l;e=a[o];d[e[r]]=#d[e[t]];o=o+l;e=a[o];n={e,d};n[y][n[S][i]]=n[y][n[l][h]]+n[S][m];o=o+l;e=a[o];d[e[i]][d[e[h]]]=d[e[D]];o=o+l;e=a[o];d[e[x]][e[c]]=e[C];break;end while(n)/((7934-0xfb2))==2695 do n=(1789382)while(-#"heil eco mother fuckers"+(145+-0x3d))<M do n-= n if(d[e[x]]~=e[C])then o=o+S;else o=e[h];end;break end while 1519==(n)/(((2453-0x4e9)+-#"Zapperqr is leaker"))do local n;d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[k]]==d[e[N]])then o=o+S;else o=e[t];end;break end;break;end break;end while(n)/((((0x647f3+-113)+-#'0nly was here mf')/0x7a))==1676 do n=(7298144)while M<=(-#[[I boiled them into scrambled eggs]]+(10272/0x6b))do n-= n if(d[e[x]]<d[e[P]])then o=e[h];else o=o+S;end;break;end while(n)/((0x4b710/89))==2102 do n=(5906250)while(159-0x5f)<M do n-= n if(d[e[i]]==d[e[C]])then o=o+S;else o=e[c];end;break end while(n)/(((-0x34+1814)+-#"my name jeff"))==3375 do d[e[w]]=B[e[s]];break end;break;end break;end break;end while 3205==(n)/((221116/0x95))do n=(3612928)while(((0x9a+-38)+-41)+-#"fwunmbl")>=M do n-= n n=(3443952)while M<=((-0x2f+132)+-#[[luraph deobfuscator]])do n-= n local M;local n;d[e[x]][e[O]]=d[e[C]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[r];M=d[e[t]];d[n+1]=M;d[n]=M[d[e[_]]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[b]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))break;end while(n)/((((-#[[ok last string before i]]+(174209+-0x1e))/46)+-#[[my heart is racing]]))==914 do n=(12500100)while M>(-#'yiff'+(183+-0x70))do n-= n local n;d[e[w]][e[t]]=d[e[C]];o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[i]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[b]][e[U]]=d[e[D]];o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[C]];break end while 3225==(n)/((-123+0xf9f))do local i;local n;d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[r]]();o=o+l;e=a[o];d[e[r]]=B[e[h]];o=o+l;e=a[o];n=e[w];i=d[e[c]];d[n+1]=i;d[n]=i[e[_]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))break end;break;end break;end while(n)/((2929-0x5f1))==2566 do n=(7250925)while M<=(253-0xb8)do n-= n local e=e[k]d[e]=d[e]()break;end while 2057==(n)/((754350/0xd6))do n=(7501760)while(-#'MSC 793z487nhvcgsdfgsudfza9889jgvz56gz56z547684z5g54z948g56z74j56475jzg645z6456 oh wait bitch'+(22820/0x8c))<M do n-= n local i;local n;d[e[w]]=B[e[O]];o=o+l;e=a[o];n=e[k];i=d[e[h]];d[n+1]=i;d[n]=i[e[P]];o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];n=e[r];i=d[e[U]];d[n+1]=i;d[n]=i[e[m]];break end while(n)/((-60+0x7ac))==3940 do d[e[k]]=B[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[m]];o=o+l;e=a[o];d[e[r]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[x]]=-d[e[h]];o=o+l;e=a[o];d[e[b]][d[e[U]]]=d[e[_]];break end;break;end break;end break;end break;end break;end while 375==(n)/(((6603-0xcf2)+-#'sp5rit suck'))do n=(5783140)while(0x2165/103)>=M do n-= n n=(4215653)while M<=(-#'waste of sperm'+(-78+0xa9))do n-= n n=(728984)while M<=(192-0x76)do n-= n n=(10835326)while(245-0xad)>=M do n-= n local n;d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[i]]={};o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[s]]=d[e[_]];o=o+l;e=a[o];d[e[i]][e[c]]=d[e[C]];o=o+l;e=a[o];d[e[x]]=d[e[O]]*e[_];o=o+l;e=a[o];d[e[x]][e[s]]=d[e[P]];o=o+l;e=a[o];do return d[e[r]]end o=o+l;e=a[o];do return end;break;end while 2762==(n)/((7944-((-0x14+4070)+-#"moonsec is better then my ass")))do n=(968356)while(-#"I FUCKING HATE FEMBOYS"+(282-0xbb))<M do n-= n local n;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[x]]~=d[e[P]])then o=o+S;else o=e[t];end;break end while(n)/((2259+-0x26))==436 do local r;local n;d[e[x]]=d[e[t]][e[m]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];d[e[x]]=d[e[U]][e[D]];o=o+l;e=a[o];n=e[b];r=d[e[O]];d[n+1]=r;d[n]=r[e[P]];o=o+l;e=a[o];n=e[k]d[n](d[n+S])break end;break;end break;end while(n)/((435984/0xba))==311 do n=(1847715)while M<=(237-0xa2)do n-= n local n=e[b];local l={};for e=1,#v do local e=v[e];for o=0,#e do local e=e[o];local a=e[1];local o=e[2];if a==d and o>=n then l[o]=a[o];e[1]=l;end;end;end;break;end while 597==(n)/((0x1879-3170))do n=(5827140)while(277-(0x210-327))<M do n-= n local l=d[e[N]];if not l then o=o+S;else d[e[b]]=l;o=e[h];end;break end while 2398==(n)/((153090/0x3f))do d[e[x]]=(e[U]~=0);break end;break;end break;end break;end while 3907==(n)/((103584/0x60))do n=(2013752)while(-#"MSC 793z487nhvcgsdfgsudfza9889jgvz56gz56z547684z5g54z948g56z74j56475jzg645z6456 oh wait bitch"+(192+-0x13))>=M do n-= n n=(9329845)while(0x368a/179)>=M do n-= n if(d[e[b]]<d[e[P]])then o=e[c];else o=o+S;end;break;end while(n)/(((-#[[something you will never get]]+(0x25a1-4841))-0x965))==3955 do n=(1771317)while M>(-0x79+200)do n-= n local b;local n;n=e[x];b=d[e[s]];d[n+1]=b;d[n]=b[e[D]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[x]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[i]][e[h]]=d[e[m]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[x]][e[h]]=d[e[m]];o=o+l;e=a[o];d[e[w]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[i]][e[U]]=d[e[D]];break end while(n)/((0x715-940))==2029 do local n;d[e[i]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[k]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[w]][e[c]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[t]][e[C]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]][e[O]]=d[e[C]];o=o+l;e=a[o];d[e[w]][e[U]]=e[D];o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]][e[U]]=d[e[N]];o=o+l;e=a[o];d[e[w]][e[U]]=d[e[N]];o=o+l;e=a[o];d[e[w]][e[U]]=e[P];o=o+l;e=a[o];d[e[w]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[w]][e[c]]=e[C];o=o+l;e=a[o];do return d[e[x]]end o=o+l;e=a[o];do return end;break end;break;end break;end while 1768==(n)/((0x280b/9))do n=(4394960)while((-0x47+-46)+0xc6)>=M do n-= n d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[i]]=d[e[U]][d[e[_]]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[r]][e[U]]=d[e[C]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[i]]=(e[t]~=0);o=o+l;e=a[o];d[e[i]][d[e[O]]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[r]]=f[e[t]];break;end while 2192==(n)/((-31+0x7f4))do n=(2346750)while M>(190-(0x137-203))do n-= n d[e[r]]=A(H[e[O]],nil,f);break end while 3129==(n)/((-#"Negro"+(0x63e-843)))do d[e[r]]=d[e[U]];break end;break;end break;end break;end break;end while(n)/((-#"testpsx dupe no scam legit 2022 free no virus"+(393030/0xc6)))==2981 do n=(705960)while M<=(-0x1a+115)do n-= n n=(295974)while(269-0xb7)>=M do n-= n n=(1602192)while M<=(((654-0x166)+-#[[testing this thingy lololollez]])-0xb6)do n-= n d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[x]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[r]]=d[e[t]][e[_]];o=o+l;e=a[o];do return d[e[b]]end o=o+l;e=a[o];do return end;break;end while(n)/((0xdfb+-126))==464 do n=(6920816)while(0xc7-114)<M do n-= n d[e[k]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[N]];o=o+l;e=a[o];if(d[e[b]]==e[_])then o=o+S;else o=e[s];end;break end while 1708==(n)/(((0x17d112/190)-0x1043))do local l=e[w];local n=d[l+2];local a=d[l]+n;d[l]=a;if(n>0)then if(a<=d[l+1])then o=e[O];d[l+3]=a;end elseif(a>=d[l+1])then o=e[h];d[l+3]=a;end break end;break;end break;end while 243==(n)/(((2531-0x51d)+-#'flat'))do n=(4018728)while M<=(15312/0xb0)do n-= n local k;local n;local r;d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];r=e[c];n=d[r]for e=r+1,e[C]do n=n..d[e];end;d[e[x]]=n;o=o+l;e=a[o];k=e[b]d[k](d[k+S])o=o+l;e=a[o];o=e[U];break;end while(n)/((-#'warboy hates you'+(0x2b818/165)))==3777 do n=(6789300)while(0x101-169)<M do n-= n local i;local n;d[e[x]][e[c]]=d[e[N]];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];n=e[b];i=d[e[h]];d[n+1]=i;d[n]=i[d[e[m]]];o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))break end while(n)/(((0x11d2-2329)+-#"why men"))==3050 do local o=e[i];local l=d[e[h]];d[o+1]=l;d[o]=l[d[e[C]]];break end;break;end break;end break;end while(n)/(((0xbc0-1513)+-#"Russian letters"))==477 do n=(2543948)while M<=(0x75+-25)do n-= n n=(1071470)while M<=(0x2bf2/125)do n-= n local n;d[e[b]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[P]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[C]];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=d[e[c]][e[_]];break;end while(n)/((0x2ed60/176))==983 do n=(1946816)while(21658/0xee)<M do n-= n local M;local n;d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]][e[s]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[w]][e[U]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=(e[U]~=0);o=o+l;e=a[o];d[e[x]][e[U]]=d[e[C]];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[x];M=d[e[O]];d[n+1]=M;d[n]=M[e[m]];o=o+l;e=a[o];d[e[r]]={};o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[i]][e[h]]=d[e[N]];o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]][e[t]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=(e[c]~=0);o=o+l;e=a[o];d[e[k]][e[O]]=d[e[C]];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[w];M=d[e[c]];d[n+1]=M;d[n]=M[e[N]];o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[r]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]][e[s]]=d[e[m]];o=o+l;e=a[o];d[e[x]]=(e[s]~=0);o=o+l;e=a[o];d[e[b]][e[s]]=d[e[m]];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[x];M=d[e[t]];d[n+1]=M;d[n]=M[d[e[m]]];o=o+l;e=a[o];d[e[i]]={};o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[x]]=(e[s]~=0);o=o+l;e=a[o];d[e[i]][e[s]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[b]]=(e[c]~=0);o=o+l;e=a[o];d[e[i]][d[e[h]]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[x]][d[e[s]]]=d[e[C]];break end while(n)/((0x2d20/19))==3202 do local n;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))break end;break;end break;end while(n)/((-#[[how do i get moonsex v3]]+(0x38c+-49)))==3043 do n=(446037)while((235-0x83)+-#[[moon on top]])>=M do n-= n local a=e[k]local n={d[a](d[a+1])};local o=0;for e=a,e[C]do o=o+l;d[e]=n[o];end break;end while 947==(n)/((-28+0x1f3))do n=(3574539)while(0x16c4/62)<M do n-= n local n;d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]]=d[e[U]][d[e[m]]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[i]]=d[e[h]][d[e[_]]];o=o+l;e=a[o];if(d[e[k]]==d[e[P]])then o=o+S;else o=e[O];end;break end while 3111==(n)/((0x14328/72))do d[e[i]]=(e[U]~=0);break end;break;end break;end break;end break;end break;end break;end break;end while(n)/((0x3012d/223))==2126 do n=(6793570)while(164+-0x15)>=M do n-= n n=(5016346)while(0x1cd2/((14141/0xb3)+-#'i fucked your dad'))>=M do n-= n n=(53632)while(0x9c+-49)>=M do n-= n n=(26980)while(8686/0x56)>=M do n-= n n=(419336)while(193+-0x5f)>=M do n-= n n=(2356992)while(-#'number 15 you get no bitches'+(0x41e0/136))>=M do n-= n d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=d[e[s]][d[e[P]]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[k]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[i]]=(e[h]~=0);o=o+l;e=a[o];d[e[i]][d[e[c]]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[x]]=f[e[h]];break;end while(n)/((0x8e2-((0x945-1197)+-#"Impulse youtube ez")))==2112 do n=(3619464)while(0x5726/230)<M do n-= n local n;d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];do return d[e[b]]end o=o+l;e=a[o];o=e[s];break end while(n)/((-#"i would jerk off to federals feet"+(-0x5c+3943)))==948 do do return d[e[r]]end break end;break;end break;end while 172==(n)/((4912-(2573+-0x63)))do n=(6371508)while(0xba+-87)>=M do n-= n local n;d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[i]]~=e[D])then o=o+S;else o=e[t];end;break;end while 2054==(n)/((0x18a4-(618758/0xc1)))do n=(2100648)while M>(-0x6f+211)do n-= n local e={e,d};e[y][e[S][w]]=e[y][e[l][s]]+e[S][_];break end while(n)/((-#"da hood money generator 2022 working free no virus"+(0xdab2/21)))==803 do local i;local h;local n;d[e[x]]=d[e[O]][e[N]];o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];h=e[t];i=d[h]for e=h+1,e[C]do i=i..d[e];end;d[e[x]]=i;o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];do return end;break end;break;end break;end break;end while(n)/((1820/0x5b))==1349 do n=(5471634)while M<=(-75+0xb3)do n-= n n=(8789220)while M<=(171+-0x45)do n-= n local o=e[r];local l=d[e[s]];d[o+1]=l;d[o]=l[d[e[P]]];break;end while 3036==(n)/((5914-((0x57590/118)+-#'saitama solos')))do n=(2128956)while((-125+0x17a)-150)<M do n-= n local n;d[e[k]]=e[h];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[k]][e[O]]=d[e[C]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[h];break end while(n)/((0x79f+-122))==1164 do local n;d[e[w]]=(e[s]~=0);o=o+l;e=a[o];d[e[r]][e[t]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]][d[e[t]]]=d[e[P]];o=o+l;e=a[o];d[e[i]]=e[s];break end;break;end break;end while 1554==(n)/(((0x8a16/(27+-0x11))+-#[[jjsplot on top]]))do n=(2657475)while M<=((412-0x10d)+-#'i still cannot find who the fuck asked')do n-= n local n;d[e[w]]=B[e[c]];o=o+l;e=a[o];d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[b]]=(e[c]~=0);o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[t]))break;end while 775==(n)/((0x1afd-3480))do n=(7525500)while(-#"Quiero pene"+(0x15b-230))<M do n-= n local n;d[e[w]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];o=e[c];break end while(n)/(((0x17730/36)+-#'local bolsac equals game dot localplayer dot character dot legs dot bolls'))==2900 do local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];if(d[e[b]]~=d[e[P]])then o=o+S;else o=e[O];end;break end;break;end break;end break;end break;end while 64==(n)/((0x372+-44))do n=(4471365)while M<=((-0x1a+153)+-#[[0 divided by 0]])do n-= n n=(8665342)while(278-0xa8)>=M do n-= n n=(1627227)while M<=(203+-0x5f)do n-= n local n;d[e[k]]=d[e[O]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]]=d[e[t]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[w]]=e[c];break;end while(n)/(((94976/0x1c)+-#"Should have used luraph"))==483 do n=(5917421)while(25179/0xe7)<M do n-= n local c;local n;n=e[x];c=d[e[h]];d[n+1]=c;d[n]=c[e[P]];o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[i]]=d[e[U]][d[e[_]]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];do return end;break end while 1907==(n)/((((-30+0x96c59)+-#[[Show me your meme stealing license]])/199))do d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[r]]=(not d[e[s]]);o=o+l;e=a[o];d[e[r]][e[h]]=d[e[m]];o=o+l;e=a[o];d[e[i]]=B[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[C]];o=o+l;e=a[o];if(d[e[x]]~=e[C])then o=o+S;else o=e[h];end;break end;break;end break;end while 3166==(n)/((0x437d5/(0x13e-217)))do n=(5456103)while M<=(0x56b8/200)do n-= n local n;d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if d[e[r]]then o=o+l;else o=e[s];end;break;end while 1979==(n)/(((0x402d1/95)+-#[[IP grabbed]]))do n=(4856500)while M>(322-(486-0x114))do n-= n local n;d[e[x]]=e[c];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[i]][d[e[U]]]=d[e[C]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[x]][d[e[c]]]=d[e[C]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[b]]=f[e[U]];break end while(n)/((-0x74+1491))==3532 do local w;local n;d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[P]];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];n=e[k];w=d[e[t]];d[n+1]=w;d[n]=w[e[m]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[r]]=e[h];break end;break;end break;end break;end while 2755==(n)/((1695+-0x48))do n=(6724080)while(0x12c-184)>=M do n-= n n=(48096)while M<=((0x4b8f+-77)/0xa9)do n-= n local n;d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[i]][e[s]]=d[e[P]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];B[e[O]]=d[e[b]];break;end while(n)/((-#[[ooga booga sex]]+(341042/0xa9)))==24 do n=(4353783)while(-#[[ching chong]]+(0x34aa/107))<M do n-= n local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[x]]==d[e[N]])then o=o+S;else o=e[c];end;break end while 3171==(n)/((-#"cilerteddoesntlikeburgers"+(211098/0x97)))do local r;local n;n=e[k]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[w]]=d[e[U]][d[e[P]]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[i];r=d[e[s]];d[n+1]=r;d[n]=r[d[e[C]]];break end;break;end break;end while(n)/((-#"Ok guys relax Theyre just fucking socks Its impossible for socks to turn me gay My heterosexuality will be fine dudes"+((0x2f60106/170)/0xa1)))==3960 do n=(2559466)while M<=(298-0xb5)do n-= n local i;local n;n=e[b]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[b];i=d[e[t]];d[n+1]=i;d[n]=i[d[e[P]]];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]]=e[h];break;end while(n)/(((-0x31+777)+-#'Throw on Lose Yourself and make em lose it'))==3731 do n=(164640)while M>(0x61b8/212)do n-= n local n;d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[x]]=d[e[s]]*d[e[P]];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=d[e[t]]-e[m];o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[i]]=B[e[c]];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=d[e[s]]-e[m];o=o+l;e=a[o];d[e[k]]=d[e[s]]/d[e[m]];break end while(n)/((0x690-896))==210 do local l=e[w];local n=d[l+2];local a=d[l]+n;d[l]=a;if(n>0)then if(a<=d[l+1])then o=e[O];d[l+3]=a;end elseif(a>=d[l+1])then o=e[O];d[l+3]=a;end break end;break;end break;end break;end break;end break;end while(n)/((2701-0x573))==3841 do n=(525716)while(0x123-160)>=M do n-= n n=(7747228)while M<=(-#[[ballz]]+(1950/0xf))do n-= n n=(11129308)while(0x5010/168)>=M do n-= n n=(2828720)while M<=(-59+0xb3)do n-= n local n;d[e[b]]=B[e[h]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[w]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[r]d[n](d[n+S])break;end while(n)/(((1605-0x339)+-#"loading trojan horse"))==3722 do n=(6404200)while M>((16758/(379-0xf6))+-#"negus")do n-= n local n;d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[P]];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]]=d[e[h]];o=o+l;e=a[o];o=e[s];break end while 3124==(n)/((-#"Your cookie has been leaked"+(0x10b0-2195)))do if(d[e[b]]<=e[C])then o=e[O];else o=o+S;end;break end;break;end break;end while(n)/((-53+0xdd8))==3188 do n=(166650)while(371-0xf8)>=M do n-= n local o=e[b]d[o]=d[o](u(d,o+l,e[O]))break;end while 101==(n)/((-0x60+(-0x2d+1791)))do n=(1735128)while M>(293-(-0x10+185))do n-= n d[e[b]][e[O]]=e[P];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[x]][e[h]]=e[P];o=o+l;e=a[o];d[e[i]]=B[e[s]];o=o+l;e=a[o];d[e[w]][e[O]]=e[C];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[x]]=e[h];break end while 1662==(n)/((0x20a0/8))do d[e[b]]=d[e[h]]%d[e[P]];break end;break;end break;end break;end while 3148==(n)/(((555594/0xdd)+-#'Rip Technoblade but he truly never dies in our hearts'))do n=(3199527)while M<=(-0x71+((0xdb36/199)+-#"nate higger nuck figgers and nill kiggers"))do n-= n n=(415680)while(-54+0xb4)>=M do n-= n local o=e[w];local l=d[o];for e=o+1,e[t]do T(l,d[e])end;break;end while 160==(n)/((0x145d-2615))do n=(3447968)while M>(12319/0x61)do n-= n local i;local n;n=e[k];i=d[e[c]];d[n+1]=i;d[n]=i[e[m]];o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]]=d[e[s]][e[m]];o=o+l;e=a[o];n=e[r];i=d[e[c]];d[n+1]=i;d[n]=i[e[N]];break end while(n)/((-#"cilertedcool"+(-39+0x824)))==1696 do local n;d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];for e=e[x],e[h]do d[e]=nil;end;o=o+l;e=a[o];d[e[x]]=(e[U]~=0);o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];o=e[U];break end;break;end break;end while 2181==(n)/((-78+0x609))do n=(6182370)while M<=(0x468c/140)do n-= n local n;d[e[i]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];do return d[e[b]]end o=o+l;e=a[o];do return end;break;end while 2190==(n)/((-#'Real deobfuscator'+(0x7cce0/(-#'Zapperqr is leaker'+(0x15a8/28)))))do n=(4061079)while M>(-#"Ok guys relax Theyre just fucking socks Its impossible for socks to turn me gay My heterosexuality will be fine dudes"+(5434/0x16))do n-= n local n;d[e[b]]=e[c];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];if(d[e[w]]~=d[e[D]])then o=o+S;else o=e[U];end;break end while(n)/(((0x4e5+-72)+-#'hol on leme chec ur seirc histori toll'))==3553 do d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=#d[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[U]][d[e[P]]];o=o+l;e=a[o];if(d[e[i]]==d[e[D]])then o=o+S;else o=e[U];end;break end;break;end break;end break;end break;end while(n)/((0x14e0/8))==787 do n=(13989681)while M<=(-48+(0x6810/144))do n-= n n=(1432112)while M<=(0x7758/228)do n-= n n=(762000)while(-83+0xd7)>=M do n-= n local b;local n;d[e[k]][e[t]]=d[e[m]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];n=e[w];b=d[e[c]];d[n+1]=b;d[n]=b[e[m]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]][e[h]]=d[e[m]];break;end while(n)/((-#[[why 6 hours cooldown to send a meme strings]]+((552+-0x18)+-104)))==2000 do n=(2507568)while M>(-0x20+165)do n-= n local e=e[w]d[e]=d[e](u(d,e+l,g))break end while(n)/((-#'Pipe te amo'+(0x7f2b/17)))==1317 do if(d[e[r]]<e[_])then o=o+S;else o=e[s];end;break end;break;end break;end while 869==(n)/(((3322368/0x38)/36))do n=(2071740)while((388-0xd7)+-#'If not skid then return hasbitches end')>=M do n-= n local o=e[w]d[o](u(d,o+S,e[t]))break;end while(n)/((((-0x4b+5077)-0x9d5)+-#[[function howtofucknicuse print you cant fuck nicuse sorry haha you noooo end]]))==860 do n=(676620)while(-#'Bwomp'+((-0x27de/189)+0xc3))<M do n-= n if not d[e[r]]then o=o+S;else o=e[h];end;break end while 895==(n)/((0x63b-839))do local x;local n;n=e[b]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];n=e[k];x=d[e[h]];d[n+1]=x;d[n]=x[e[m]];o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]]=e[s];break end;break;end break;end break;end while 3933==(n)/((-#'Throw on Lose Yourself and make em lose it'+(-0x1a+3625)))do n=(7006368)while(0x129-157)>=M do n-= n n=(1296555)while M<=(-#"windows xp startup sfx"+((0x89a4-17636)/110))do n-= n local n;d[e[i]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[i]]=d[e[t]];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[w]]==d[e[D]])then o=o+S;else o=e[h];end;break;end while(n)/((-22+0x15d))==3965 do n=(1891050)while(21406/((21094/0x6a)+-#[[Smokey BArbecue BAcon BUford from checkers mm]]))<M do n-= n local n;d[e[k]]=e[t];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]][e[h]]=d[e[N]];o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[i]]=e[t];break end while 1801==(n)/(((4304-0x883)-0x433))do d[e[r]]=A(H[e[U]],nil,f);break end;break;end break;end while(n)/(((-0x4d+3913)+-125))==1888 do n=(6309645)while M<=(0x3339/93)do n-= n if(d[e[x]]<=e[m])then o=o+S;else o=e[h];end;break;end while(n)/((-#"Well thats what they do when they get jealous they confuse it"+(-0x46+1772)))==3845 do n=(241996)while M>(402-0x104)do n-= n d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[m]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[C]];o=o+l;e=a[o];if not d[e[w]]then o=o+S;else o=e[U];end;break end while 404==(n)/((0x514-701))do d[e[k]]=d[e[c]]/e[P];break end;break;end break;end break;end break;end break;end break;end while(n)/(((-94+0xcd3)+-#[[mama mo]]))==2135 do n=(2768837)while M<=((0x491d/51)+-#"Moonsec An IB2 fork sooo secure and we love it and federal is so straight and federal owns Luauth and we love spoons and if sonic was here federal would die a painful death and he would turn into dust")do n-= n n=(5709432)while(255+-0x64)>=M do n-= n n=(1576199)while M<=(15198/0x66)do n-= n n=(6308455)while M<=(23214/0x9f)do n-= n n=(3502980)while(0x107+-119)>=M do n-= n d[e[w]]=#d[e[h]];break;end while 2994==(n)/((2366-0x4ac))do n=(8248030)while M>(375-0xe6)do n-= n d[e[b]]=B[e[U]];break end while(n)/((5134-0xa43))==3290 do d[e[i]]=(e[O]~=0);o=o+S;break end;break;end break;end while(n)/((0x33d1/7))==3329 do n=(13450836)while(0x184-241)>=M do n-= n local n;d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]][e[U]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[x]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[m]];break;end while 3948==(n)/((0xcf1d7/249))do n=(6467472)while M>(((0x56e60a/233)+-#'windows xp startup sfx')/165)do n-= n local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[k]][e[U]]=e[D];o=o+l;e=a[o];o=e[s];break end while(n)/((-#"Pyrite On Top"+(278528/0x44)))==1584 do d[e[w]]=e[s]*d[e[C]];break end;break;end break;end break;end while 887==(n)/((-#"I FUCKING HATE FEMBOYS"+(377790/0xd2)))do n=(1857784)while M<=(-0x7c+276)do n-= n n=(2774796)while M<=(0x1a1-(0x8ee3/137))do n-= n if not d[e[b]]then o=o+S;else o=e[c];end;break;end while 2927==(n)/((173484/0xb7))do n=(4315628)while M>((12844/0x4c)+-#'Zapperqr is leaker')do n-= n local n;d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[x]d[n](d[n+S])break end while(n)/(((5676-0xb24)+-#"Impulse youtube ez"))==1538 do local n;d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[r]]();o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[_]];o=o+l;e=a[o];d[e[i]][e[t]]=d[e[N]];o=o+l;e=a[o];d[e[b]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]][e[t]]=d[e[m]];o=o+l;e=a[o];d[e[x]][e[O]]=e[P];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[c]]=d[e[D]];o=o+l;e=a[o];d[e[w]][e[t]]=d[e[C]];o=o+l;e=a[o];d[e[w]][e[O]]=e[D];o=o+l;e=a[o];d[e[i]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[r]][e[c]]=e[m];o=o+l;e=a[o];do return d[e[k]]end o=o+l;e=a[o];do return end;break end;break;end break;end while 1448==(n)/((0x321e0/160))do n=(11350390)while M<=((193+-0x1b)+-#"ur mom is hot")do n-= n local U;local r;local n;n=e[x]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];n=e[i];r=d[e[h]];d[n+1]=r;d[n]=r[e[D]];o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]]=d[e[t]];o=o+l;e=a[o];r=e[c];U=d[r]for e=r+1,e[N]do U=U..d[e];end;d[e[w]]=U;break;end while(n)/(((0x58ee3/119)+-#'my heart is racing'))==3730 do n=(1257962)while(0x7d2/13)<M do n-= n local e=e[r];do return u(d,e,g)end;break end while(n)/(((0x9b2-(-65+0x53f))+-#"howtodumpscript"))==1058 do if(e[x]<d[e[C]])then o=o+S;else o=e[h];end;break end;break;end break;end break;end break;end while(n)/((-120+0x5ee))==4084 do n=(118066)while M<=((0x1cd-284)+-#'0nly was here mf')do n-= n n=(14386982)while M<=(((0xa6a3-21384)/115)+-#'tutorial how to deobfuscate')do n-= n n=(14643120)while(-#"Impulse real 2022"+(231+(-0x125a/81)))>=M do n-= n if(d[e[w]]~=e[P])then o=o+S;else o=e[c];end;break;end while(n)/((0x1dd6-3864))==3880 do n=(2494218)while(0x19a-253)<M do n-= n B[e[U]]=d[e[w]];break end while 2753==(n)/((0x3fa+((-0x62+-3)+-#"sp5rit suck")))do local n;d[e[r]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if(d[e[b]]~=d[e[D]])then o=o+S;else o=e[c];end;break end;break;end break;end while 3733==(n)/((0x1e7f-3953))do n=(3120040)while M<=(-0x79+(42560/0x98))do n-= n local n;local i;local h,c;local b;local n;d[e[r]]=f[e[U]];o=o+l;e=a[o];n=e[x];b=d[e[U]];d[n+1]=b;d[n]=b[e[C]];o=o+l;e=a[o];n=e[x]h,c=p(d[n](d[n+S]))g=c+n-l i=0;for e=n,g do i=i+l;d[e]=h[i];end;o=o+l;e=a[o];n=e[r]h={d[n](u(d,n+1,g))};i=0;for e=n,e[_]do i=i+l;d[e]=h[i];end o=o+l;e=a[o];o=e[s];break;end while(n)/((0x67e+-122))==2026 do n=(493950)while M>(-0x15+181)do n-= n f[e[s]]=d[e[x]];break end while 370==(n)/((0xadf-1448))do d[e[k]]=(e[t]~=0);o=o+l;e=a[o];d[e[b]][e[c]]=d[e[P]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[b]]=(e[s]~=0);o=o+l;e=a[o];d[e[x]][d[e[h]]]=d[e[_]];break end;break;end break;end break;end while 478==(n)/((55575/0xe1))do n=(2537920)while M<=((0x70b3/163)+-#"Pyrite On Top")do n-= n n=(3781855)while M<=((19210/0x71)+-#"monobola")do n-= n local n;n=e[b]d[n]=d[n]()o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[D]];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];if not d[e[r]]then o=o+S;else o=e[O];end;break;end while(n)/((-#[[iPipeh Is My god]]+(13793/0xd)))==3619 do n=(3618111)while(0x9b5c/244)<M do n-= n local z;local v;local j,I;local n;local M;d[e[x]]=B[e[O]];o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];d[e[w]]=B[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[i]]=d[e[s]]-d[e[C]];o=o+l;e=a[o];d[e[i]]=d[e[O]]*d[e[P]];o=o+l;e=a[o];d[e[i]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=d[e[h]]*d[e[C]];o=o+l;e=a[o];M={d,e};M[S][M[y][k]]=M[l][M[y][_]]+M[S][M[y][t]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];B[e[O]]=d[e[i]];o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[_]];o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=B[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[x]]=d[e[U]][e[C]];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[m]];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];d[e[x]]=B[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[P]];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=d[e[h]]-d[e[_]];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[b]]=-d[e[h]];o=o+l;e=a[o];n=e[i]j,I=p(d[n](d[n+S]))g=I+n-l v=0;for e=n,g do v=v+l;d[e]=j[v];end;o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[i]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[U]]*d[e[D]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[b]]=B[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[x]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[i]]=d[e[h]]-d[e[m]];o=o+l;e=a[o];d[e[k]]=B[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[_]];o=o+l;e=a[o];M={d,e};M[S][M[y][i]]=M[l][M[y][_]]+M[S][M[y][O]];o=o+l;e=a[o];d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[t]]-d[e[_]];o=o+l;e=a[o];d[e[r]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[U]][e[D]];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[s]][e[m]];o=o+l;e=a[o];d[e[k]]=d[e[h]]-d[e[P]];o=o+l;e=a[o];d[e[w]]=B[e[t]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[P]];o=o+l;e=a[o];M={d,e};M[S][M[y][x]]=M[l][M[y][D]]+M[S][M[y][h]];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[U]]-d[e[C]];o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[b]]=d[e[h]]-d[e[P]];o=o+l;e=a[o];d[e[k]]=B[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[N]];o=o+l;e=a[o];M={d,e};M[S][M[y][i]]=M[l][M[y][P]]+M[S][M[y][h]];o=o+l;e=a[o];d[e[w]]=B[e[t]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[b]]=d[e[h]]-d[e[D]];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[i]]=d[e[t]]*d[e[_]];o=o+l;e=a[o];d[e[k]]=B[e[h]];o=o+l;e=a[o];n=e[b];z=d[e[s]];d[n+1]=z;d[n]=z[e[N]];break end while 3171==(n)/((0x4af+-58))do if(e[r]<=d[e[N]])then o=o+S;else o=e[h];end;break end;break;end break;end while 1120==(n)/((-0x43+2333))do n=(1262151)while M<=((-0x25+246)+-#'MoonsecV2 deobfuscator 2020 free 100 percent')do n-= n d[e[w]]=d[e[h]]*d[e[_]];break;end while 3477==(n)/(((0xd9cf/137)+-#[[i shoved a whole bag of jellibeans up my ass]]))do n=(1458345)while M>(-107+0x111)do n-= n local e=e[i]d[e](u(d,e+S,g))break end while(n)/(((-#"moonsec got deobfuscated"+(0xd+-113))+0xec3))==399 do local x;local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[i];x=d[e[s]];d[n+1]=x;d[n]=x[e[C]];o=o+l;e=a[o];n=e[b]d[n](d[n+S])break end;break;end break;end break;end break;end break;end while 691==(n)/((673176/0xa8))do n=(5385795)while(-#"give me moonsex v4 or i will attach a car battery to your testicles"+(43296/0xb0))>=M do n-= n n=(5479110)while(0x9cc8/232)>=M do n-= n n=(182040)while(0x1fe/3)>=M do n-= n n=(5545005)while M<=(-#[[ohhhh nice code thanks]]+(406-0xd8))do n-= n local n;d[e[x]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]][e[t]]=d[e[P]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]][d[e[h]]]=d[e[D]];break;end while(n)/((742923/0xcf))==1545 do n=(1640320)while(2704/0x10)<M do n-= n d[e[i]]=d[e[c]]%e[m];break end while(n)/((((104516/0x44)+-#'deadphonelua')-821))==2330 do local n;d[e[i]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[r]]=(e[c]~=0);o=o+l;e=a[o];d[e[k]][d[e[c]]]=d[e[N]];break end;break;end break;end while(n)/((0x9b6+-26))==74 do n=(1306845)while M<=(-#[[Moonsec An IB2 fork sooo secure and we love it and federal is so straight and federal owns Luauth and we love spoons and if sonic was here federal would die a painful death and he would turn into dust]]+(-88+0x1cb))do n-= n local n;d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[k]d[n](d[n+S])break;end while(n)/((0x671-878))==1695 do n=(10191245)while M>(451-(0x257-320))do n-= n local M;local n;n=e[w]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[w]]=d[e[U]][d[e[m]]];o=o+l;e=a[o];d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[r]]=d[e[t]][d[e[C]]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[i]]=d[e[O]][d[e[N]]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[w]]=d[e[s]][d[e[m]]];o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[w]]=d[e[c]][d[e[_]]];o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[k]]=d[e[U]][d[e[N]]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[w]]=d[e[s]][d[e[D]]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[r]]=d[e[O]][d[e[D]]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];n=e[b];M=d[e[t]];d[n+1]=M;d[n]=M[e[_]];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];n=e[b];M=d[e[s]];d[n+1]=M;d[n]=M[e[D]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];n=e[x];M=d[e[c]];d[n+1]=M;d[n]=M[e[_]];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];n=e[i];M=d[e[U]];d[n+1]=M;d[n]=M[e[D]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];n=e[b];M=d[e[s]];d[n+1]=M;d[n]=M[e[D]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[r]]=f[e[h]];o=o+l;e=a[o];n=e[k];M=d[e[t]];d[n+1]=M;d[n]=M[e[C]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[x]]=d[e[s]][d[e[D]]];o=o+l;e=a[o];if not d[e[i]]then o=o+S;else o=e[O];end;break end while 3995==(n)/(((-0x3d+2616)+-#[[yiff]]))do f[e[t]]=d[e[b]];break end;break;end break;end break;end while(n)/((-41+(428032/0xd1)))==2730 do n=(2377641)while M<=(0x1bf-271)do n-= n n=(63232)while(0xfc+(-107+0x1d))>=M do n-= n local o=e[r];do return d[o](u(d,o+1,e[c]))end;break;end while(n)/((99788/0x65))==64 do n=(6837600)while M>(-68+0xf3)do n-= n local O;local B,M;local c;local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];n=e[b];c=d[e[U]];d[n+1]=c;d[n]=c[e[m]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[P]];o=o+l;e=a[o];n=e[k];c=d[e[h]];d[n+1]=c;d[n]=c[e[C]];o=o+l;e=a[o];n=e[r]B,M=p(d[n](d[n+S]))g=M+n-l O=0;for e=n,g do O=O+l;d[e]=B[O];end;break end while(n)/((-#"get some bitches"+(5797-0xb74)))==2400 do if(d[e[i]]<e[D])then o=e[U];else o=o+S;end;break end;break;end break;end while(n)/(((-#'if syn request then print your mom then end and then kill yourself'+(0x551+-31))+-25))==1919 do n=(1712205)while((279+-0x58)+-#"impulse is hot")>=M do n-= n d[e[i]]={};break;end while 495==(n)/((-#[[Eu gosto de peitos]]+(862296/0xf8)))do n=(5405874)while M>((545-0x145)+-#'Reduce meme string slowmode when plsplspls')do n-= n d[e[r]]=e[O]*d[e[_]];break end while(n)/(((288855/(-64+0xa9))+-#[[Zapperqr is leaker]]))==1978 do d[e[i]]=e[O];break end;break;end break;end break;end break;end while 3495==(n)/((-#"nigglet"+(3192-0x66c)))do n=(1225105)while(17020/0x5c)>=M do n-= n n=(9138288)while(0xf1+(-590/0xa))>=M do n-= n n=(3322320)while M<=(-#'now what the hell is this'+(482-(57616/0xd0)))do n-= n local e={e,d};e[y][e[S][x]]=e[y][e[l][s]]+e[S][m];break;end while(n)/((-#"this code is skidded"+(0x9ce00/(0x8267/133))))==1308 do n=(3638232)while M>(413-0xe8)do n-= n local o=e[k]local a,e=p(d[o](u(d,o+1,e[h])))g=e+o-1 local e=0;for o=o,g do e=e+l;d[o]=a[e];end;break end while(n)/((3623+-0x23))==1014 do local n;d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[b]]~=d[e[m]])then o=o+S;else o=e[t];end;break end;break;end break;end while 2928==(n)/(((0x9876c/198)+-#'qwertyui is not hot and is a skid'))do n=(3094990)while(0xf1+-58)>=M do n-= n d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[r]]=d[e[t]][e[P]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[C]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[m]];o=o+l;e=a[o];if(d[e[r]]==e[C])then o=o+S;else o=e[c];end;break;end while 2437==(n)/(((-111+0x56d)+-#"amongass"))do n=(8798230)while M>(434-0xfa)do n-= n local n;d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];for e=e[x],e[O]do d[e]=nil;end;o=o+l;e=a[o];d[e[w]]=(e[h]~=0);o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[s]))break end while(n)/((((569538/0xc7)+-#[[free bobux no skem]])+-0x4f))==3182 do o=e[O];break end;break;end break;end break;end while 2485==(n)/(((-0x59+106577)/216))do n=(9866880)while(-57+0xf5)>=M do n-= n n=(10966844)while M<=(-#[[flat]]+(0x4f6a/107))do n-= n local n;d[e[w]]=e[U];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]][e[t]]=d[e[D]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]][e[O]]=d[e[P]];break;end while 3362==(n)/((-#[[niggers]]+(-0x3e+(-0x50+3411))))do n=(4680531)while(0x1b3-248)<M do n-= n local e=e[b]d[e]=d[e](d[e+S])break end while(n)/(((0x927+-52)+-#'go kys go kys go kys'))==2061 do d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[_]];o=o+l;e=a[o];do return d[e[i]]end o=o+l;e=a[o];do return end;break end;break;end break;end while(n)/((-53+0xd97))==2880 do n=(99540)while(30618/0xa2)>=M do n-= n local n=e[i];local r=e[C];local a=n+2 local n={d[n](d[n+1],d[a])};for e=1,r do d[a+e]=n[e];end;local n=n[1]if n then d[a]=n o=e[c];else o=o+l;end;break;end while 948==(n)/((0x27c9/97))do n=(4693403)while(29830/0x9d)<M do n-= n local n;d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[x]][e[c]]=d[e[D]];o=o+l;e=a[o];d[e[i]]=f[e[U]];break end while 3289==(n)/(((1447/0x1)+-#"33 cocks in my mouth"))do local i=H[e[t]];local n;local l={};n=F({},{__index=function(o,e)local e=l[e];return e[1][e[2]];end,__newindex=function(d,e,o)local e=l[e]e[1][e[2]]=o;end;});for n=1,e[D]do o=o+S;local e=a[o];if e[(-0x2f+48)]==82 then l[n-1]={d,e[U]};else l[n-1]={B,e[s]};end;v[#v+1]=l;end;d[e[r]]=A(i,n,f);break end;break;end break;end break;end break;end break;end break;end break;end break;end while 2395==(n)/((0xb9f-1522))do n=(3540912)while M<=(684-0x18d)do n-= n n=(1631916)while M<=(299+-0x3c)do n-= n n=(4428864)while M<=(-#[[MemeStrings]]+((108086-0xd338)/239))do n-= n n=(83952)while M<=(0x143+-120)do n-= n n=(3323590)while M<=(0xf1+-44)do n-= n n=(5850434)while M<=((537-0x126)+-#'Innovative and Im made of rubber so that anything')do n-= n n=(8928043)while(475-0x11b)>=M do n-= n d[e[r]][d[e[t]]]=e[_];break;end while 3587==(n)/((-#'W4rboy was here'+(0x61d00/160)))do n=(2412481)while M>(0x1dc-283)do n-= n local n;d[e[r]][e[t]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]][e[O]]=d[e[P]];o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[N]];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[P]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[b]][e[s]]=d[e[P]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]][e[t]]=d[e[_]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[w]][e[s]]=d[e[D]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][e[t]]=d[e[_]];o=o+l;e=a[o];d[e[k]][e[c]]=d[e[P]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[N]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]][e[t]]=d[e[P]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[i]][e[s]]=d[e[P]];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[k]][e[O]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[w]][e[O]]=d[e[C]];o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[w]][e[O]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]][e[O]]=d[e[N]];o=o+l;e=a[o];d[e[x]]=e[s];break end while 2029==(n)/((-103+0x50c))do d[e[w]][e[s]]=e[D];break end;break;end break;end while(n)/((282710/0x55))==1759 do n=(2390292)while M<=(0x1ba-247)do n-= n local n;d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[k]]==d[e[m]])then o=o+S;else o=e[t];end;break;end while 1982==(n)/((1265+-0x3b))do n=(1489524)while M>((0x227-321)+-#[[Show me your meme stealing license]])do n-= n local n;d[e[x]]=e[s];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[r]]==d[e[C]])then o=o+S;else o=e[U];end;break end while 564==(n)/(((5470-0xad0)+-#[[Well thats what they do when they get jealous they confuse it]]))do d[e[i]]();break end;break;end break;end break;end while 1270==(n)/((-#[[Ginglebog]]+(-0x1b+((517980/0xc2)+-#"anime is for fags"))))do n=(2416295)while(0xee+-38)>=M do n-= n n=(6032060)while(-0x60+294)>=M do n-= n local n;d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];if(d[e[b]]~=d[e[P]])then o=o+S;else o=e[s];end;break;end while 2180==(n)/((-0x74+2883))do n=(8706720)while M>(-0x5e+293)do n-= n local e=e[i]d[e](u(d,e+S,g))break end while 3298==(n)/((84480/0x20))do for e=e[k],e[h]do d[e]=nil;end;break end;break;end break;end while(n)/((260400/0xf0))==2227 do n=(2552850)while(2211/0xb)>=M do n-= n local r;local n;n=e[w]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[b];r=d[e[O]];d[n+1]=r;d[n]=r[d[e[D]]];o=o+l;e=a[o];n=e[i]d[n](d[n+S])o=o+l;e=a[o];do return end;break;end while 1674==(n)/((-#'penis'+(-59+0x635)))do n=(1057984)while(-0x2f+249)<M do n-= n local M;local P;local n;d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=B[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[k]]=d[e[c]][d[e[N]]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[i]][e[U]]=d[e[C]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[w]]=d[e[s]][e[_]];o=o+l;e=a[o];n=e[x]d[n]=d[n](d[n+S])o=o+l;e=a[o];P=e[s];M=d[P]for e=P+1,e[C]do M=M..d[e];end;d[e[r]]=M;o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];do return end;break end while 488==(n)/((234144/0x6c))do local n;d[e[k]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[x]]=d[e[O]];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]][e[h]]=d[e[_]];o=o+l;e=a[o];d[e[r]][e[U]]=e[_];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[b]][e[U]]=d[e[C]];o=o+l;e=a[o];d[e[b]][e[U]]=e[_];o=o+l;e=a[o];d[e[k]]=(e[c]~=0);o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[_]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[m]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[t]][e[_]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[C]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[c];break end;break;end break;end break;end break;end while 44==(n)/((3857-0x79d))do n=(596592)while M<=(-#"Oh hes too mainstream"+(0x5abe/101))do n-= n n=(10973620)while M<=(-#[[PLEASE HELP MY BOYFRIEND TRAPPED ME IN HIS BASEMENT]]+(-0x20+289))do n-= n n=(2245875)while(17340/0x55)>=M do n-= n local h;local n;d[e[b]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[_]];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[w]][e[U]]=d[e[P]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[i]]();o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[_]];o=o+l;e=a[o];n=e[k];h=d[e[O]];d[n+1]=h;d[n]=h[e[N]];o=o+l;e=a[o];d[e[b]]=f[e[t]];break;end while(n)/((2681-0x54c))==1695 do n=(7013666)while M>(-#[[Ok guys relax Theyre just fucking socks Its impossible for socks to turn me gay My heterosexuality will be fine dudes]]+(-40+0x16a))do n-= n local r;local n;n=e[i]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];n=e[i];r=d[e[U]];d[n+1]=r;d[n]=r[e[P]];o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[w]]=e[h];break end while(n)/((683422/0xb3))==1837 do local n;d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[x]][e[h]]=d[e[_]];o=o+l;e=a[o];d[e[b]][e[O]]=d[e[C]];o=o+l;e=a[o];d[e[k]][e[U]]=d[e[_]];o=o+l;e=a[o];d[e[x]][e[U]]=e[_];break end;break;end break;end while 3044==(n)/((3667+-0x3e))do n=(134977)while M<=(-0x62+305)do n-= n d[e[w]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[k]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[P]];o=o+l;e=a[o];d[e[k]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[w]]=B[e[O]];o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[s]][d[e[N]]];o=o+l;e=a[o];d[e[b]][e[O]]=d[e[P]];o=o+l;e=a[o];o=e[t];break;end while 1849==(n)/((0xb9-112))do n=(7024243)while M>(0x1d7-263)do n-= n d[e[i]]=-d[e[h]];break end while(n)/((-#[[2406924069240 your mom is gay af lol]]+(4958-0x9cd)))==2911 do local o=e[r]d[o]=d[o](u(d,o+l,e[t]))break end;break;end break;end break;end while(n)/((38664/(-#"elbicho"+(19344/0x68))))==2762 do n=(2313696)while(456-0xf4)>=M do n-= n n=(13126106)while(444-0xea)>=M do n-= n if(d[e[k]]<=e[C])then o=o+S;else o=e[s];end;break;end while(n)/((0x6b935/133))==3962 do n=(13711610)while M>(37769/0xb3)do n-= n local e=e[k]local a,o=p(d[e]())g=o+e-l local o=0;for e=e,g do o=o+S;d[e]=a[o];end;break end while(n)/((0x1af5-3491))==4021 do local M;local P,B;local O;local n;d[e[x]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[C]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[N]];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];n=e[i];O=d[e[c]];d[n+1]=O;d[n]=O[e[N]];o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[r]d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];n=e[r];O=d[e[c]];d[n+1]=O;d[n]=O[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[x]P,B=p(d[n](u(d,n+1,e[c])))g=B+n-1 M=0;for e=n,g do M=M+l;d[e]=P[M];end;o=o+l;e=a[o];n=e[x]d[n](u(d,n+S,g))o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[b]]();break end;break;end break;end while 1848==(n)/((0x10cfc/55))do n=(161586)while(0x201-300)>=M do n-= n local c;local n;n=e[k];c=d[e[s]];d[n+1]=c;d[n]=c[e[P]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[r]]=(e[t]~=0);o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[k]]=f[e[U]];break;end while 94==(n)/((-#"tunnelposting"+((-0x79+3634)-1781)))do n=(3486265)while M>((0x4d25/87)+-#'i love minors')do n-= n if(d[e[x]]==e[m])then o=o+S;else o=e[U];end;break end while 1685==(n)/((-#"Smokey BArbecue BAcon BUford from checkers mm"+(-0x70+2226)))do local e=e[r]d[e]=d[e](u(d,e+l,g))break end;break;end break;end break;end break;end break;end while 2112==(n)/((0x8ac+-123))do n=(4619776)while(0x7ecd/143)>=M do n-= n n=(6761085)while M<=(0x7d2d/145)do n-= n n=(5310176)while((0x200-272)+-#"windows xp startup sfx")>=M do n-= n n=(2688660)while M<=(-#'Shrimps was here'+(572-0x154))do n-= n local n;d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[x]d[n](d[n+S])break;end while(n)/((-115+0x74e))==1532 do n=(3751817)while M>(-#'I have stolen your father figure and all your milk muahahahahahaha'+(55185/((42292/0xc2)+-#"Should have used luraph")))do n-= n local n;d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[r]][d[e[t]]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[b]]=(e[U]~=0);o=o+l;e=a[o];d[e[i]][d[e[c]]]=d[e[_]];break end while 1537==(n)/((0x13aa9/(191-0x9e)))do local n;d[e[r]]=e[U];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[D]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[k]][d[e[U]]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]][d[e[c]]]=e[P];break end;break;end break;end while 3232==(n)/((-#'me and the monkey'+(((-11868/0x8a)+-#[[lego hax]])+1754)))do n=(4034888)while M<=((591-0x150)+-#'hi momma teach me how to make incest')do n-= n d[e[w]]=d[e[h]]-d[e[D]];break;end while 1144==(n)/((-0x60+3623))do n=(3638994)while(-#"Asses"+(2700/0xc))<M do n-= n if(e[k]<=d[e[N]])then o=e[U];else o=o+S;end;break end while(n)/((663765/0xff))==1398 do d[e[b]]=e[U];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]][d[e[h]]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[i]][d[e[t]]]=d[e[P]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[x]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=f[e[O]];break end;break;end break;end break;end while(n)/((5682-0xb2b))==2395 do n=(3789219)while(0xb980/(-83+0x127))>=M do n-= n n=(7269095)while((0x245-329)+-#"Nicuse is good at sucking dick")>=M do n-= n local M;local N;local n;d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[b]]=B[e[O]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]]=(e[O]~=0);o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];d[e[r]]=B[e[h]];o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[w]d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];B[e[O]]=d[e[x]];o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]]=B[e[O]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];N=e[h];M=d[N]for e=N+1,e[m]do M=M..d[e];end;d[e[b]]=M;o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];o=e[t];break;end while 3005==(n)/(((459016/0xb5)+-#'Ok guys relax Theyre just fucking socks Its impossible for socks to turn me gay My heterosexuality will be fine dudes'))do n=(12902709)while M>(-#[[You are an absolute baboon]]+(-0x49+322))do n-= n local n;n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[r]]=e[s];break end while(n)/((0x1d80-3811))==3449 do local e=e[r]d[e](d[e+S])break end;break;end break;end while 1043==(n)/((-#'fwunmbl'+(0x14708/23)))do n=(7794731)while M<=(-#'MemeStrings'+(15576/(0x2940/160)))do n-= n local n;d[e[w]]=e[h];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];do return d[e[i]]end break;end while 1957==(n)/((-46+0xfbd))do n=(4978215)while M>(0x1fc-282)do n-= n local n;d[e[r]]=d[e[s]][e[D]];o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[r]]==d[e[C]])then o=o+S;else o=e[U];end;break end while(n)/((-42+0x6c9))==2937 do local n;d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[b]]=B[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[w]]=d[e[U]][d[e[m]]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[k]]=d[e[O]][d[e[D]]];o=o+l;e=a[o];if(d[e[k]]==d[e[N]])then o=o+S;else o=e[c];end;break end;break;end break;end break;end break;end while(n)/((0xa8f-1414))==3584 do n=(3468333)while(-#[[elbicho]]+(-56+0x128))>=M do n-= n n=(231516)while(-0x6a+336)>=M do n-= n n=(4071546)while(-#[[mstir mid]]+(0x11d+-48))>=M do n-= n d[e[b]]=d[e[h]]%e[C];break;end while 1107==(n)/((0x4feae/89))do n=(4599382)while(-70+0x12b)<M do n-= n local n;d[e[k]]=d[e[U]][e[C]];o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]]=d[e[O]][d[e[P]]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[N]];o=o+l;e=a[o];if(d[e[x]]==e[C])then o=o+S;else o=e[O];end;break end while(n)/((-#[[no h]]+((-#"made by kim jong un"+(0x1c34-3628))-1836)))==2654 do local n;d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[w]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[h]]-d[e[m]];o=o+l;e=a[o];d[e[r]]=B[e[U]];o=o+l;e=a[o];d[e[w]]=e[h]-d[e[P]];o=o+l;e=a[o];d[e[x]]=d[e[U]]/d[e[P]];o=o+l;e=a[o];n=e[i];do return d[n](u(d,n+1,e[t]))end;o=o+l;e=a[o];n=e[x];do return u(d,n,g)end;o=o+l;e=a[o];do return end;break end;break;end break;end while(n)/(((120292/0x3d)+-#[[i want sex]]))==118 do n=(380484)while M<=(0x1e0-249)do n-= n if(e[w]<d[e[C]])then o=e[h];else o=o+S;end;break;end while(n)/((((0x23bbd5/33)/249)+-#"jjsplot on top"))==1404 do n=(15152832)while(558-(-33+0x167))<M do n-= n local o=e[i]local a,e=p(d[o](u(d,o+1,e[s])))g=e+o-1 local e=0;for o=o,g do e=e+l;d[o]=a[e];end;break end while 3792==(n)/(((843233+-0x4d)/0xd3))do local n;d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[x]]=d[e[t]];o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[x]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[c]];break end;break;end break;end break;end while(n)/((-112+0x5dd))==2497 do n=(6665715)while(565-0x149)>=M do n-= n n=(10478800)while(0x1f3-(-#[[stfu furry]]+(0x268-341)))>=M do n-= n if(d[e[k]]~=d[e[m]])then o=o+S;else o=e[t];end;break;end while(n)/((0x186f-3173))==3400 do n=(4354560)while M>((0x61a8/100)+-#[[zeynox was here]])do n-= n d[e[r]][d[e[s]]]=e[D];break end while 1512==(n)/((0x16cb-2955))do local l=d[e[D]];if not l then o=o+S;else d[e[i]]=l;o=e[t];end;break end;break;end break;end while(n)/((0x116f-2258))==3023 do n=(402732)while M<=(0x20c-287)do n-= n local i;local n;d[e[x]][e[c]]=d[e[m]];o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[U]))o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[x];i=d[e[c]];d[n+1]=i;d[n]=i[d[e[m]]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))break;end while 1188==(n)/((455+-0x74))do n=(7775298)while(-#'gay men'+(-122+0x16f))<M do n-= n d[e[x]][e[O]]=d[e[D]];o=o+l;e=a[o];for e=e[i],e[t]do d[e]=nil;end;o=o+l;e=a[o];B[e[h]]=d[e[w]];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[k]][e[O]]=d[e[P]];o=o+l;e=a[o];for e=e[x],e[U]do d[e]=nil;end;o=o+l;e=a[o];B[e[O]]=d[e[i]];o=o+l;e=a[o];d[e[k]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=B[e[s]];break end while(n)/((-#[[fatee is gay 0nly on top]]+(-0x3f+2189)))==3699 do local e={d,e};e[S][e[y][b]]=e[l][e[y][m]]+e[S][e[y][s]];break end;break;end break;end break;end break;end break;end break;end while(n)/(((-0x77+5944)-0xb9c))==572 do n=(9267570)while M<=(610-0x15b)do n-= n n=(209760)while(595-0x158)>=M do n-= n n=(2917887)while M<=(0x20b-(58102/0xd1))do n-= n n=(9027172)while M<=((0x290-379)+-#"how tf do i remove the meme strings")do n-= n n=(3469148)while(-#'mbb is a frag'+(0x25e-353))>=M do n-= n local h;local n;d[e[x]][e[c]]=d[e[D]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[b];h=d[e[c]];d[n+1]=h;d[n]=h[d[e[P]]];o=o+l;e=a[o];d[e[r]]={};o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))break;end while 3131==(n)/(((2285-0x48d)+-#'mike litoris'))do n=(906184)while M>(582-0x155)do n-= n if d[e[i]]then o=o+l;else o=e[h];end;break end while(n)/((0x767+-79))==499 do do return end;break end;break;end break;end while 3871==(n)/((4727-0x95b))do n=(2695873)while(-#'warboy hates you'+(0x119+-22))>=M do n-= n local n;d[e[w]]=e[s];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];do return d[e[i]]end o=o+l;e=a[o];do return end;break;end while(n)/(((0x4a548/152)+-#[[function howtofucknicuse print you cant fuck nicuse sorry haha you noooo end]]))==1399 do n=(10095600)while(601-(0x33d-472))<M do n-= n local n;d[e[i]]=B[e[c]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[w]]=B[e[c]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[x]]=d[e[s]]-d[e[C]];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=d[e[h]]*d[e[D]];o=o+l;e=a[o];d[e[k]]=B[e[c]];o=o+l;e=a[o];d[e[r]]=d[e[s]][e[m]];o=o+l;e=a[o];d[e[k]]=B[e[t]];o=o+l;e=a[o];d[e[k]]=d[e[s]]*d[e[_]];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[x]][e[U]]=e[N];o=o+l;e=a[o];n={d,e};n[S][n[y][x]]=n[l][n[y][P]]+n[S][n[y][t]];o=o+l;e=a[o];do return d[e[k]]end o=o+l;e=a[o];do return end;break end while 2864==(n)/((((-67+0x1c40)+-#[[Throw on Lose Yourself and make em lose it]])-3598))do local n;d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];f[e[U]]=d[e[r]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];if d[e[r]]then o=o+l;else o=e[t];end;break end;break;end break;end break;end while 1491==(n)/((2069+-0x70))do n=(3311220)while M<=(-#'Eu gosto de peitos'+(0x532/5))do n-= n n=(7790652)while(0xf50a/255)>=M do n-= n local r;local n;n=e[x];r=d[e[O]];d[n+1]=r;d[n]=r[d[e[_]]];o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[i];r=d[e[t]];d[n+1]=r;d[n]=r[d[e[C]]];o=o+l;e=a[o];n=e[b]d[n](d[n+S])break;end while 3492==(n)/((-#'you can pull my IP but you cant pull any bitches fucking loner'+(-0x68+2397)))do n=(544686)while(0x171+-122)<M do n-= n local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[i]]=B[e[c]];o=o+l;e=a[o];d[e[x]]=B[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[P]];o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[m]];break end while 3947==(n)/((0x18a-256))do local o=e[x];local l=d[e[h]];d[o+1]=l;d[o]=l[e[D]];break end;break;end break;end while(n)/((-0x52+1822))==1903 do n=(2821110)while(41334/0xa6)>=M do n-= n if(e[k]<d[e[m]])then o=e[U];else o=o+S;end;break;end while 4065==(n)/((((129160+-0x48)+-#'yeet')/186))do n=(9605790)while(0x269-367)<M do n-= n local n;n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[w]]=B[e[s]];o=o+l;e=a[o];d[e[i]]=(e[s]~=0);o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=d[e[t]][e[C]];o=o+l;e=a[o];d[e[w]]=d[e[s]][e[N]];break end while(n)/((((-0x2c+4963)-2476)+-#"suck my balls"))==3953 do local r;local i;local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];i=e[t];r=d[i]for e=i+1,e[_]do r=r..d[e];end;d[e[x]]=r;break end;break;end break;end break;end break;end while(n)/((-35+((0x4964/122)+-#"Sou usuário de HProtect")))==2185 do n=(510224)while M<=(339+-0x52)do n-= n n=(1758640)while M<=(0x263-357)do n-= n n=(674441)while(565-0x139)>=M do n-= n local r;local n;d[e[x]][e[t]]=d[e[N]];o=o+l;e=a[o];n=e[x]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[k];r=d[e[O]];d[n+1]=r;d[n]=r[d[e[N]]];o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))break;end while 409==(n)/((0x26a6/6))do n=(919480)while M>(0x3a4f/59)do n-= n local c;local n;d[e[r]]=e[O];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]][e[t]]=d[e[D]];o=o+l;e=a[o];d[e[w]]=(e[U]~=0);o=o+l;e=a[o];d[e[r]][e[t]]=d[e[N]];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[i];c=d[e[O]];d[n+1]=c;d[n]=c[e[N]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[x]]=f[e[U]];break end while 635==(n)/((0xb8c-1508))do local n;d[e[b]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))break end;break;end break;end while(n)/((-#[[deadphonelua]]+(1284+-0x73)))==1520 do n=(7308900)while(0xb14e/178)>=M do n-= n local n;local M;local B,v;local y;local n;d[e[b]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=d[e[s]][e[m]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[x]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[i]]=d[e[c]][d[e[P]]];o=o+l;e=a[o];for e=e[r],e[h]do d[e]=nil;end;o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];n=e[k];y=d[e[t]];d[n+1]=y;d[n]=y[e[N]];o=o+l;e=a[o];n=e[r]B,v=p(d[n](d[n+S]))g=v+n-l M=0;for e=n,g do M=M+l;d[e]=B[M];end;o=o+l;e=a[o];n=e[w]B={d[n](u(d,n+1,g))};M=0;for e=n,e[D]do M=M+l;d[e]=B[M];end o=o+l;e=a[o];o=e[t];break;end while(n)/((5517-0xafa))==2700 do n=(6199788)while((0x26b-351)+-#"Suck Sus0587")<M do n-= n local n;d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if(d[e[x]]~=d[e[C]])then o=o+S;else o=e[U];end;break end while(n)/((-#'boronide sucks ass'+(413056/0x80)))==1932 do d[e[k]]=f[e[c]];break end;break;end break;end break;end while(n)/((0x9ab0/225))==2899 do n=(1113770)while(0x282-382)>=M do n-= n n=(172064)while(0xb160/176)>=M do n-= n local n;d[e[k]]=d[e[h]][e[_]];o=o+l;e=a[o];d[e[i]]=d[e[t]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[b]]=d[e[h]];o=o+l;e=a[o];o=e[h];break;end while(n)/((-#'penis'+(16686/(-51+0x101))))==2264 do n=(7300832)while M>(-#[[Hoo gah hooga hoo gahoo hoo gah hooga hoo gahoo]]+(-119+((-23+0x1ce)+-#[[stroking my sh]])))do n-= n d[e[b]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[x]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[k]]=d[e[h]][e[D]];o=o+l;e=a[o];d[e[b]][d[e[s]]]=d[e[m]];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[r]]=d[e[s]][e[N]];o=o+l;e=a[o];do return d[e[x]]end o=o+l;e=a[o];do return end;break end while 2464==(n)/((-#"pairu sucks dick"+(0x1758-2997)))do d[e[x]][e[O]]=d[e[m]];break end;break;end break;end while 490==(n)/(((-0x68+(0x98b+-50))+-#'Shrimps was here'))do n=(717674)while(583-0x142)>=M do n-= n local r;local h,i;local n;d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];n=e[x]h,i=p(d[n](d[n+S]))g=i+n-l r=0;for e=n,g do r=r+l;d[e]=h[r];end;o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,g))o=o+l;e=a[o];o=e[O];break;end while 1277==(n)/((1217-0x28f))do n=(2442033)while M>((-81+0x178)+-#[[moon sex is better than lua guard]])do n-= n local r;local h,c;local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[U]];o=o+l;e=a[o];n=e[x]h,c=p(d[n](d[n+S]))g=c+n-l r=0;for e=n,g do r=r+l;d[e]=h[r];end;o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];if not d[e[i]]then o=o+S;else o=e[U];end;break end while 1683==(n)/((2974-0x5f3))do local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[w]]();o=o+l;e=a[o];d[e[b]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[U]][e[D]];o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[b]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[m]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[b]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[P]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]][e[s]]=d[e[_]];o=o+l;e=a[o];d[e[b]][e[s]]=e[_];o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[s]][e[m]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[D]];o=o+l;e=a[o];d[e[b]][e[U]]=d[e[P]];o=o+l;e=a[o];d[e[b]][e[h]]=e[P];o=o+l;e=a[o];d[e[x]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[x]][e[s]]=e[D];o=o+l;e=a[o];do return d[e[i]]end o=o+l;e=a[o];do return end;break end;break;end break;end break;end break;end break;end while(n)/((-#'chicken quesadillas are pretty good ngl'+(-115+0xb08)))==3471 do n=(2773584)while M<=((-109+0x19c)+-#[[If no father return milk end]])do n-= n n=(602458)while M<=((12384/0x2b)+-#'moonsex looks great')do n-= n n=(3045132)while(0x290-390)>=M do n-= n n=(9866396)while(-#'iPipeh i love You'+(0x285-364))>=M do n-= n if(d[e[k]]==e[D])then o=o+S;else o=e[O];end;break;end while(n)/((638204/0xa1))==2489 do n=(1578768)while(0xdd86/214)<M do n-= n local i;local n;d[e[r]][e[s]]=d[e[N]];o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];n=e[r];i=d[e[O]];d[n+1]=i;d[n]=i[e[D]];o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[x]][e[U]]=d[e[P]];break end while 2122==(n)/(((-44+(0x8e7e/46))+-#"the J"))do d[e[x]]=B[e[U]];o=o+l;e=a[o];d[e[i]]=B[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[b]][e[U]]=d[e[C]];o=o+l;e=a[o];do return end;break end;break;end break;end while 1004==(n)/((((0x186d+-47)-3160)+-#'Big black men'))do n=(883395)while(-#"real roblox omg builderman caught playing real"+(33491/((148+-0x14)+-#[[this is an ip grabber]])))>=M do n-= n if(d[e[x]]==d[e[m]])then o=o+S;else o=e[U];end;break;end while(n)/((-#[[da hood money generator 2022 working free no virus]]+(100332/0x6c)))==1005 do n=(4855254)while(0x25d-337)<M do n-= n local n;d[e[r]]=B[e[U]];o=o+l;e=a[o];d[e[b]][e[c]]=d[e[m]];o=o+l;e=a[o];d[e[r]]=B[e[O]];o=o+l;e=a[o];d[e[k]]=d[e[t]];o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=B[e[O]];o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[b]]=e[t];break end while(n)/((0xb21-1451))==3473 do local n;d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]]=f[e[s]];break end;break;end break;end break;end while 227==(n)/((-18+0xa70))do n=(3782597)while(598-0x146)>=M do n-= n n=(8769408)while((23352/0x54)+-#'whats up')>=M do n-= n local n;local k;local t,s;local O;local n;n=e[w];O=d[e[c]];d[n+1]=O;d[n]=O[e[_]];o=o+l;e=a[o];d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[r];O=d[e[c]];d[n+1]=O;d[n]=O[e[m]];o=o+l;e=a[o];n=e[x]t,s=p(d[n](d[n+S]))g=s+n-l k=0;for e=n,g do k=k+l;d[e]=t[k];end;o=o+l;e=a[o];n=e[i]t={d[n](u(d,n+1,g))};k=0;for e=n,e[_]do k=k+l;d[e]=t[k];end o=o+l;e=a[o];o=e[c];break;end while(n)/((-0x71+2737))==3342 do n=(1572912)while M>((585-(0x2ad-380))+-#'Crackzzzz')do n-= n d[e[i]]=d[e[t]][d[e[m]]];break end while 792==(n)/((0x7fa+-56))do local u;local C;local M;local S;local B;local n;n=e[r];B={};for e=1,#v do S=v[e];for e=0,#S do M=S[e];C=M[1];u=M[2];if C==d and u>=n then B[u]=C[u];M[1]=B;end;end;end;o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[r]][d[e[s]]]=d[e[D]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[b]][d[e[U]]]=d[e[_]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]][d[e[U]]]=d[e[P]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[w]][d[e[U]]]=d[e[m]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[m]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[P]];o=o+l;e=a[o];n=e[b]d[n]=d[n]()o=o+l;e=a[o];d[e[b]][d[e[t]]]=d[e[D]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[P]];o=o+l;e=a[o];n=e[i]d[n]=d[n]()o=o+l;e=a[o];d[e[w]][d[e[s]]]=d[e[D]];o=o+l;e=a[o];d[e[k]]={};o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[k]][d[e[O]]]=d[e[P]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[r]][d[e[h]]]=d[e[_]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[r]][d[e[U]]]=d[e[_]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]][d[e[O]]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[k]][d[e[h]]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[x]][e[t]]=d[e[N]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[x]][d[e[h]]]=d[e[P]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[b]][e[s]]=d[e[P]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[w]][d[e[c]]]=d[e[P]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[b]][d[e[U]]]=d[e[D]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[b]][d[e[U]]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[k]][d[e[U]]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[b]][d[e[s]]]=d[e[m]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[k]][d[e[s]]]=d[e[_]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]][d[e[O]]]=d[e[N]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[w]][d[e[t]]]=d[e[_]];o=o+l;e=a[o];d[e[i]]={};o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[b]]=f[e[c]];break end;break;end break;end while 2743==(n)/((2788-0x581))do n=(373581)while M<=(-#'get good use moonsec'+(666-0x175))do n-= n local r;local n;local i;d[e[w]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[P]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];i=e[t];n=d[i]for e=i+1,e[m]do n=n..d[e];end;d[e[k]]=n;o=o+l;e=a[o];r=e[b]d[r](u(d,r+S,e[U]))break;end while(n)/((250-0x85))==3193 do n=(4420170)while M>(37812/0x8a)do n-= n local n;d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[k]]==d[e[P]])then o=o+S;else o=e[O];end;break end while 3638==(n)/((166455/(392-0xff)))do d[e[i]]=e[t];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[x]][d[e[s]]]=d[e[m]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[w]]=(e[U]~=0);o=o+l;e=a[o];d[e[x]][d[e[U]]]=d[e[C]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[x]][d[e[U]]]=d[e[P]];o=o+l;e=a[o];d[e[x]]=f[e[c]];break end;break;end break;end break;end break;end while(n)/((0x1afe-3511))==816 do n=(431400)while(2810/((2033/0x6b)+-#'holy shit'))>=M do n-= n n=(10321218)while M<=(607-0x149)do n-= n n=(805920)while M<=(0x16c+-88)do n-= n local n;d[e[r]]=d[e[h]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[P]];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[b]]=d[e[U]];o=o+l;e=a[o];if d[e[k]]then o=o+l;else o=e[c];end;break;end while 584==(n)/((0x58f+-43))do n=(1660465)while(19113/0x45)<M do n-= n d[e[b]]=d[e[c]][e[N]];break end while 1061==(n)/((-0x1f+1596))do local n;d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];f[e[s]]=d[e[w]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];if d[e[k]]then o=o+l;else o=e[h];end;break end;break;end break;end while 3914==(n)/(((-#[[me and the monkey]]+(55950128/0xd0))/102))do n=(7573622)while(0x2a2-395)>=M do n-= n local O;local n;d[e[r]][e[U]]=d[e[C]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];n=e[w];O=d[e[h]];d[n+1]=O;d[n]=O[d[e[N]]];o=o+l;e=a[o];d[e[b]]={};o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[h]))break;end while(n)/((-#'keno 0347 is a nerdy fag'+((-33+0xc83)+-28)))==2429 do n=(413625)while M>(-#"When the"+(354+-0x42))do n-= n local n;d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]][d[e[h]]]=d[e[D]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[i]]=(e[s]~=0);o=o+l;e=a[o];d[e[x]][d[e[U]]]=d[e[C]];break end while(n)/((0xcfe+(-425/0x19)))==125 do d[e[w]]=(not d[e[s]]);break end;break;end break;end break;end while 2876==(n)/(((0xda+(-#'Nicuse will go in history'+(0x41-94)))+-#'moonsex is bad'))do n=(9145080)while((-#'monkey mode'+(0x303+-79))-0x18d)>=M do n-= n n=(2468040)while(-0x18+306)>=M do n-= n local b;local n;d[e[r]][e[U]]=d[e[D]];o=o+l;e=a[o];n=e[i]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];n=e[i];b=d[e[h]];d[n+1]=b;d[n]=b[e[P]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]][e[s]]=d[e[C]];break;end while 785==(n)/((0x6c3a8/(0x151-196)))do n=(544320)while(0xf7a0/224)<M do n-= n d[e[b]]={};o=o+l;e=a[o];for e=e[b],e[U]do d[e]=nil;end;o=o+l;e=a[o];d[e[x]]={};o=o+l;e=a[o];d[e[i]]={};o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=(e[c]~=0);o=o+l;e=a[o];d[e[x]][d[e[h]]]=d[e[C]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[i]]=(e[h]~=0);o=o+l;e=a[o];d[e[r]][d[e[c]]]=d[e[N]];break end while 1215==(n)/((0x1d2+(89+-0x6b)))do local n;d[e[x]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]][e[O]]=d[e[P]];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[b]][e[O]]=d[e[P]];o=o+l;e=a[o];d[e[w]][e[U]]=e[P];break end;break;end break;end while 3420==(n)/((0x155e-2796))do n=(4979780)while M<=(682-0x18d)do n-= n local n;B[e[c]]=d[e[i]];o=o+l;e=a[o];d[e[r]]=f[e[O]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[x]d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];if(d[e[x]]==e[P])then o=o+S;else o=e[t];end;break;end while(n)/((-#'pairu sucks dick'+(-40+0x894)))==2327 do n=(12535772)while M>((-0x70+426)+-#'something you will never get')do n-= n local n;d[e[k]]=(e[t]~=0);o=o+l;e=a[o];d[e[r]][e[c]]=d[e[_]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[x]][d[e[c]]]=d[e[C]];o=o+l;e=a[o];d[e[i]]=e[h];break end while(n)/((-#'good googly moogly'+(4118+-0x16)))==3074 do local n;d[e[i]]=d[e[h]];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[r]]=d[e[U]]*d[e[N]];o=o+l;e=a[o];do return d[e[i]]end o=o+l;e=a[o];do return end;break end;break;end break;end break;end break;end break;end break;end break;end while(n)/((-#'With rock shock rap with Doc'+(-84+0x718)))==2078 do n=(8477904)while(732-0x18d)>=M do n-= n n=(708644)while(0x639e/82)>=M do n-= n n=(5717186)while M<=(0x180+-85)do n-= n n=(3693915)while(339+-0x2e)>=M do n-= n n=(7062258)while M<=(0x29b-(0x311-408))do n-= n n=(1308327)while M<=(-#'local ballsack equals game dot players dot local player dot character dot humanoid dot torso dot ballsack'+(-0x73+508))do n-= n local n;n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[m]];o=o+l;e=a[o];d[e[w]]=d[e[U]][e[P]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[_]];o=o+l;e=a[o];for e=e[w],e[c]do d[e]=nil;end;o=o+l;e=a[o];d[e[x]]=f[e[h]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[D]];o=o+l;e=a[o];d[e[b]]=d[e[t]][e[C]];break;end while 327==(n)/((-102+0x1007))do n=(1638300)while M>(-24+(439+-0x7e))do n-= n d[e[i]]=d[e[h]]-e[N];break end while(n)/((-#[[ambattakam]]+(186180/0xd6)))==1905 do local n;d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[w]d[n](d[n+S])o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[w]]=f[e[O]];break end;break;end break;end while 1858==(n)/(((615040/0xa0)+-#'Im devastating more than ever demonstrating'))do n=(504127)while M<=(0x19c+-121)do n-= n local n;d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[s]))o=o+l;e=a[o];do return end;break;end while 157==(n)/((6461-0xcb2))do n=(2259822)while(-0x12+310)<M do n-= n local n;d[e[b]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]]=d[e[c]]*d[e[_]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[N]];o=o+l;e=a[o];d[e[w]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[c]]*d[e[_]];o=o+l;e=a[o];d[e[r]]=d[e[t]]*d[e[_]];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[k]]=d[e[t]]*d[e[C]];o=o+l;e=a[o];d[e[r]]=d[e[h]][e[C]];o=o+l;e=a[o];B[e[h]]=d[e[w]];o=o+l;e=a[o];d[e[k]]=B[e[t]];o=o+l;e=a[o];d[e[b]][e[h]]=d[e[m]];o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[C]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[r]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=-d[e[c]];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[x]]=d[e[s]]*d[e[P]];o=o+l;e=a[o];d[e[k]][e[t]]=d[e[P]];o=o+l;e=a[o];d[e[k]]=B[e[h]];o=o+l;e=a[o];d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[i]][e[c]]=d[e[P]];o=o+l;e=a[o];do return end;break end while 922==(n)/((4940-0x9b9))do local n;d[e[w]][e[t]]=d[e[_]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[t]))o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]]=d[e[h]][d[e[P]]];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[x]]=d[e[c]][d[e[C]]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[w]]=d[e[c]][d[e[m]]];o=o+l;e=a[o];d[e[i]]=e[s];break end;break;end break;end break;end while(n)/(((0x1d7d-3787)+-#"if syn then haxor alert end"))==989 do n=(7779075)while((658-(730-0x17b))+-#"panzerfaust")>=M do n-= n n=(6492288)while M<=(54390/(-75+0x104))do n-= n local n;d[e[b]]=(e[U]~=0);o=o+l;e=a[o];d[e[r]][e[O]]=d[e[D]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[r]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]][d[e[t]]]=d[e[P]];o=o+l;e=a[o];d[e[k]]=e[h];break;end while 1696==(n)/(((0xdd5fe/(-#'Oh hes too mainstream'+(-26+0x119)))+-#[[funtime foxy and funtime freddy having sex real]]))do n=(13567500)while((0xb6853c/186)/218)<M do n-= n local M;local N,D;local U;local n;d[e[b]]=d[e[h]][e[P]];o=o+l;e=a[o];B[e[O]]=d[e[w]];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];n=e[r];U=d[e[t]];d[n+1]=U;d[n]=U[e[P]];o=o+l;e=a[o];d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[P]];o=o+l;e=a[o];n=e[k]N,D=p(d[n]())g=D+n-l M=0;for e=n,g do M=M+S;d[e]=N[M];end;o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,g))o=o+l;e=a[o];d[e[w]]=B[e[c]];o=o+l;e=a[o];n=e[i];U=d[e[h]];d[n+1]=U;d[n]=U[e[P]];break end while 3375==(n)/((0x1fa9-4085))do local l=e[c];local o=d[l]for e=l+1,e[N]do o=o..d[e];end;d[e[w]]=o;break end;break;end break;end while(n)/((6059-(6135-0xc19)))==2575 do n=(431124)while M<=(41580/0x8c)do n-= n local h;local n;d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];n=e[x];h=d[n];for e=n+1,e[s]do T(h,d[e])end;break;end while(n)/((554-0x14c))==1942 do n=(1716096)while M>(0xf220/208)do n-= n local w;local i;local n;d[e[b]]=e[c];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[x]]=#d[e[t]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[b];i=d[n]w=d[n+2];if(w>0)then if(i>d[n+1])then o=e[s];else d[n+3]=i;end elseif(i<d[n+1])then o=e[c];else d[n+3]=i;end break end while(n)/(((0x592fe/((-81+0xf0)+-#'one foot is in the grave'))+-#'i have found your porn folder i am now approaching your house at 83 miles per hour'))==654 do d[e[b]]=#d[e[t]];break end;break;end break;end break;end break;end while(n)/((-#[[algebra]]+(0xc20-1598)))==3814 do n=(2629566)while M<=(0x27c-331)do n-= n n=(283500)while M<=(-#[[Gay porn]]+(667-0x165))do n-= n n=(5574007)while M<=((870-(0x1ace8/225))+-#'i have found your porn folder i am now approaching your house at 83 miles per hour')do n-= n local M;local _;local D;local m,C;local n;d[e[x]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=B[e[U]];o=o+l;e=a[o];n=e[r]m,C=p(d[n](d[n+S]))g=C+n-l D=0;for e=n,g do D=D+l;d[e]=m[D];end;o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];B[e[t]]=d[e[k]];o=o+l;e=a[o];d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]]=B[e[U]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[P]];o=o+l;e=a[o];_=e[O];M=d[_]for e=_+1,e[P]do M=M..d[e];end;d[e[b]]=M;o=o+l;e=a[o];n=e[r]d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=B[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];if(d[e[x]]==d[e[P]])then o=o+S;else o=e[c];end;break;end while(n)/(((0x6ba27/(0x2733/45))+-#[[Obfuscated by my ass hurts]]))==2857 do n=(2255372)while M>(0x1271f/251)do n-= n local n;d[e[k]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[k]]~=d[e[P]])then o=o+S;else o=e[s];end;break end while(n)/(((173802/0xa6)+-#"fix ownerof"))==2177 do do return end;break end;break;end break;end while(n)/((-#"luraph deobfuscator"+(0x1218-2363)))==126 do n=(11774380)while M<=(-#[[Me be like at 5am in the morning]]+(0x2e0-401))do n-= n local n;d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[w]]==d[e[N]])then o=o+S;else o=e[U];end;break;end while(n)/((-#[[pls free synapse x i am gamer girl uwu]]+(0x1b25-3508)))==3460 do n=(5568969)while(((-95+0x1e0)+-#'number 15 you get no bitches')+-53)<M do n-= n local e=e[x]d[e]=d[e](d[e+S])break end while(n)/((3636+-0x49))==1563 do local v;local M;local z,I;local j;local n;d[e[r]]=B[e[U]];o=o+l;e=a[o];n=e[i];j=d[e[h]];d[n+1]=j;d[n]=j[e[N]];o=o+l;e=a[o];d[e[r]]=d[e[h]];o=o+l;e=a[o];d[e[b]]=B[e[s]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[P]];o=o+l;e=a[o];d[e[x]]=d[e[s]];o=o+l;e=a[o];n=e[w]z,I=p(d[n](d[n+S]))g=I+n-l M=0;for e=n,g do M=M+l;d[e]=z[M];end;o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];n=e[b];j=d[e[t]];d[n+1]=j;d[n]=j[e[_]];o=o+l;e=a[o];d[e[b]]=d[e[O]];o=o+l;e=a[o];d[e[k]]=B[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[c]][e[_]];o=o+l;e=a[o];d[e[r]]=d[e[U]];o=o+l;e=a[o];n=e[w]z,I=p(d[n](d[n+S]))g=I+n-l M=0;for e=n,g do M=M+l;d[e]=z[M];end;o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[k]]=B[e[U]];o=o+l;e=a[o];n=e[b];j=d[e[O]];d[n+1]=j;d[n]=j[e[_]];o=o+l;e=a[o];d[e[r]]=d[e[t]];o=o+l;e=a[o];d[e[k]]=B[e[O]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[r]]=d[e[O]];o=o+l;e=a[o];n=e[r]z,I=p(d[n](d[n+S]))g=I+n-l M=0;for e=n,g do M=M+l;d[e]=z[M];end;o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[r]]=B[e[c]];o=o+l;e=a[o];d[e[x]]=B[e[c]];o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[r]z,I=p(d[n](d[n+S]))g=I+n-l M=0;for e=n,g do M=M+l;d[e]=z[M];end;o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[b]]=B[e[h]];o=o+l;e=a[o];d[e[k]]=B[e[s]];o=o+l;e=a[o];d[e[k]]=d[e[t]]/e[m];o=o+l;e=a[o];n=e[b]z,I=p(d[n](d[n+S]))g=I+n-l M=0;for e=n,g do M=M+l;d[e]=z[M];end;o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[k]]=d[e[h]]/d[e[C]];o=o+l;e=a[o];n=e[w]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=B[e[h]];o=o+l;e=a[o];d[e[b]]=B[e[t]];o=o+l;e=a[o];d[e[x]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[c]]*d[e[_]];o=o+l;e=a[o];d[e[i]]=d[e[c]]/d[e[_]];o=o+l;e=a[o];d[e[b]]=d[e[t]]*d[e[_]];o=o+l;e=a[o];v={d,e};v[S][v[y][k]]=v[l][v[y][N]]+v[S][v[y][t]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];B[e[c]]=d[e[k]];o=o+l;e=a[o];d[e[w]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=B[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[c]]*d[e[_]];o=o+l;e=a[o];d[e[r]]=d[e[U]]/d[e[D]];o=o+l;e=a[o];d[e[r]]=d[e[s]]*d[e[_]];o=o+l;e=a[o];v={d,e};v[S][v[y][k]]=v[l][v[y][D]]+v[S][v[y][O]];o=o+l;e=a[o];B[e[O]]=d[e[b]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=d[e[c]][e[N]];o=o+l;e=a[o];d[e[k]]=B[e[c]];o=o+l;e=a[o];d[e[b]]=B[e[h]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[_]];o=o+l;e=a[o];d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=-d[e[s]];o=o+l;e=a[o];d[e[b]]=B[e[c]];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[w]]=B[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[w]]=B[e[t]];o=o+l;e=a[o];d[e[r]]=e[s]*d[e[D]];o=o+l;e=a[o];d[e[i]]=d[e[c]]%d[e[m]];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];B[e[O]]=d[e[i]];o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[x]]=B[e[s]];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[i]]=B[e[O]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[D]];break end;break;end break;end break;end while 694==(n)/((0xf16+-73))do n=(14815836)while M<=((45678/0x8a)+-#'Sou usuário de HProtect')do n-= n n=(5758642)while(-117+0x1a7)>=M do n-= n d[e[i]]=e[h]-d[e[P]];break;end while 2614==(n)/((0x14f9d/39))do n=(10477756)while M>(-#[[no penne pasta]]+(-0x71+434))do n-= n local o=e[x]local n={d[o](d[o+1])};local a=0;for e=o,e[P]do a=a+l;d[e]=n[a];end break end while 2582==(n)/((0x7cd4c/126))do local n;d[e[i]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[r]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];if(d[e[k]]==d[e[N]])then o=o+S;else o=e[t];end;break end;break;end break;end while 4086==(n)/((-#'loading trojan horse'+(441166/0x79)))do n=(8307957)while M<=(72306/0xea)do n-= n d[e[b]][e[t]]=e[m];break;end while(n)/((8484/0x4))==3917 do n=(1566871)while M>(-0x71+423)do n-= n d[e[r]]=d[e[c]]/d[e[P]];break end while(n)/(((0x2efc8/243)+-#'made by kim jong un'))==2027 do local a=e[k]local n={d[a](u(d,a+1,g))};local o=0;for e=a,e[m]do o=o+l;d[e]=n[o];end break end;break;end break;end break;end break;end break;end while 2378==(n)/((0x186+-92))do n=(8173352)while(-0x4c+399)>=M do n-= n n=(1035348)while M<=(-0x55+402)do n-= n n=(11940596)while M<=(-52+0x16e)do n-= n n=(4054346)while M<=(-68+0x17c)do n-= n local n;n=e[r]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]]=d[e[U]][e[D]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]]=(e[t]~=0);o=o+l;e=a[o];d[e[k]]=(e[c]~=0);break;end while(n)/((6873-0xdac))==1202 do n=(3186810)while M>(-#'this is a meme string'+(689-0x163))do n-= n local U;local n;n=e[i];U=d[e[h]];d[n+1]=U;d[n]=U[e[D]];o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=B[e[t]];o=o+l;e=a[o];n=e[i];U=d[e[O]];d[n+1]=U;d[n]=U[e[P]];o=o+l;e=a[o];d[e[r]]={};o=o+l;e=a[o];d[e[k]][e[c]]=d[e[_]];o=o+l;e=a[o];d[e[x]][e[h]]=d[e[N]];o=o+l;e=a[o];d[e[w]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[w]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[i]][e[t]]=d[e[_]];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];o=e[h];break end while(n)/((0x70260/160))==1110 do if(d[e[k]]<e[P])then o=o+S;else o=e[t];end;break end;break;end break;end while 3026==(n)/((4027+-0x51))do n=(10888688)while(51030/0xa2)>=M do n-= n o=e[h];break;end while 3028==(n)/((0xe76+-106))do n=(6536221)while M>(0x2b4-(0x307-399))do n-= n local n;d[e[x]]=d[e[t]][e[m]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=d[e[h]][e[N]];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[w]]=f[e[s]];break end while 2711==(n)/((-#"avan"+((0xab017-350264)/0x91)))do local U;local M;local n;d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[i]]=d[e[s]];o=o+l;e=a[o];M=e[h];U=d[M]for e=M+1,e[C]do U=U..d[e];end;d[e[w]]=U;o=o+l;e=a[o];n=e[x]d[n](d[n+S])o=o+l;e=a[o];do return end;break end;break;end break;end break;end while 1444==(n)/((0x32d+-96))do n=(1439060)while((0x313-455)+-#"cilertedcool")>=M do n-= n n=(1101600)while(-#"blinx1 is a sissy little femboy that loves men"+(0x2fd-401))>=M do n-= n local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=B[e[c]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[D]];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])break;end while 680==(n)/((3275-0x677))do n=(4004872)while(62524/(-0x63+295))<M do n-= n if(d[e[w]]<e[N])then o=e[O];else o=o+S;end;break end while 1861==(n)/((0x1136-2254))do if(e[k]<d[e[_]])then o=o+S;else o=e[O];end;break end;break;end break;end while 665==(n)/((-120+0x8ec))do n=(5774624)while(365+-0x2c)>=M do n-= n local n;local r;local h,t;local k;local n;d[e[b]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[m]];o=o+l;e=a[o];n=e[i];k=d[e[U]];d[n+1]=k;d[n]=k[e[C]];o=o+l;e=a[o];n=e[b]h,t=p(d[n](d[n+S]))g=t+n-l r=0;for e=n,g do r=r+l;d[e]=h[r];end;o=o+l;e=a[o];n=e[x]h={d[n](u(d,n+1,g))};r=0;for e=n,e[D]do r=r+l;d[e]=h[r];end o=o+l;e=a[o];o=e[O];break;end while(n)/(((346052/0x77)+-#'deadphonelua'))==1994 do n=(6043563)while M>(707-0x181)do n-= n d[e[i]][d[e[c]]]=d[e[_]];break end while(n)/((8092-0xfe7))==1503 do local k;local n;d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[r]d[n](d[n+S])o=o+l;e=a[o];for e=e[w],e[c]do d[e]=nil;end;o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];n=e[i];k=d[e[c]];d[n+1]=k;d[n]=k[e[N]];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[b]]=f[e[c]];o=o+l;e=a[o];if not d[e[r]]then o=o+S;else o=e[t];end;break end;break;end break;end break;end break;end while 2882==(n)/((241060/0x55))do n=(6275640)while M<=(-#'testpsx dupe no scam legit 2022 free no virus'+(0x8206/89))do n-= n n=(2786450)while M<=(-78+0x194)do n-= n n=(4537778)while((0x2940/30)+-#'number 15 you get no bitches')>=M do n-= n local U;local n;d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[r]]=d[e[s]][e[N]];o=o+l;e=a[o];d[e[r]]=B[e[s]];o=o+l;e=a[o];d[e[b]]=d[e[s]][e[N]];o=o+l;e=a[o];d[e[x]]=d[e[c]][d[e[N]]];o=o+l;e=a[o];n=e[r];U=d[e[t]];d[n+1]=U;d[n]=U[e[N]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if d[e[i]]then o=o+l;else o=e[h];end;break;end while(n)/((0x5d5ae/143))==1697 do n=(6549952)while M>(0x114c2/218)do n-= n d[e[r]]=(e[c]~=0);o=o+S;break end while(n)/((-0x6c+2039))==3392 do local n;d[e[r]]=d[e[U]][e[_]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]]=d[e[h]][d[e[C]]];o=o+l;e=a[o];d[e[k]]=d[e[t]][e[P]];o=o+l;e=a[o];if(d[e[r]]~=e[P])then o=o+S;else o=e[s];end;break end;break;end break;end while(n)/((-0x27+1189))==2423 do n=(4699533)while M<=(53955/0xa5)do n-= n d[e[b]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=B[e[h]];o=o+l;e=a[o];d[e[b]]=d[e[h]][e[C]];o=o+l;e=a[o];d[e[i]][e[t]]=d[e[_]];o=o+l;e=a[o];do return end;break;end while 1151==(n)/((8189-((997040/0xf2)+-#[[Moonsex v5 eta]])))do n=(2423088)while((830+-0x42)-0x1b4)<M do n-= n d[e[i]][e[c]]=d[e[D]];break end while 1896==(n)/((2666-0x56c))do local n;d[e[r]]=f[e[h]];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[i]]==d[e[m]])then o=o+S;else o=e[t];end;break end;break;end break;end break;end while 2604==(n)/((359090/0x95))do n=(4525016)while(0x2d2-390)>=M do n-= n n=(124968)while M<=(768-0x1b6)do n-= n local n;d[e[k]]=e[c];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];do return d[e[k]]end o=o+l;e=a[o];o=e[c];break;end while(n)/((9348/0x26))==508 do n=(2896190)while M>(38065/(214+-0x63))do n-= n local n;d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[i]]==d[e[C]])then o=o+S;else o=e[t];end;break end while(n)/((5068-0xa16))==1165 do local l=e[b];local a=d[l]local n=d[l+2];if(n>0)then if(a>d[l+1])then o=e[h];else d[l+3]=a;end elseif(a<d[l+1])then o=e[c];else d[l+3]=a;end break end;break;end break;end while 2347==(n)/(((3996-0x7fe)+-#"legend says i was here"))do n=(2464260)while((-94+0x1c5)+-#[[You are an absolute baboon]])>=M do n-= n local o=e[x]d[o](u(d,o+S,e[c]))break;end while(n)/((0x33c+-24))==3065 do n=(5758382)while(696-0x16a)<M do n-= n local c;local n;d[e[k]]=f[e[s]];o=o+l;e=a[o];n=e[i];c=d[e[U]];d[n+1]=c;d[n]=c[e[_]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];n=e[b];c=d[e[U]];d[n+1]=c;d[n]=c[e[N]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[k]]=e[t];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];n=e[w];c=d[e[O]];d[n+1]=c;d[n]=c[e[C]];o=o+l;e=a[o];d[e[x]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=d[e[O]][e[C]];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if d[e[r]]then o=o+l;else o=e[h];end;break end while 1754==(n)/((-#'mysecondegg'+(6622-0xd00)))do local n;d[e[x]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]]=B[e[c]];o=o+l;e=a[o];d[e[k]]=(e[h]~=0);o=o+l;e=a[o];d[e[w]]=B[e[O]];o=o+l;e=a[o];d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[t]][e[m]];break end;break;end break;end break;end break;end break;end break;end while 3054==(n)/((0x4be80/112))do n=(4035879)while M<=((0x36e-475)+-#"i shoved a whole bag of jellibeans up my ass")do n-= n n=(1864695)while M<=(463+((-0x70+12)+-#[[iPipeh Is My god]]))do n-= n n=(6550039)while M<=(785-0x1bc)do n-= n n=(5594910)while M<=(-0x6d+447)do n-= n n=(2254980)while M<=(56112/0xa7)do n-= n local e=e[k];do return u(d,e,g)end;break;end while(n)/((0xa3a70/228))==767 do n=(467988)while M>(697-0x168)do n-= n d[e[w]]=d[e[h]][e[m]];break end while(n)/((0x5eb-807))==661 do d[e[b]]=e[O]-d[e[_]];break end;break;end break;end while(n)/((3506-0x710))==3295 do n=(3725826)while M<=(67461/(0x1c4-253))do n-= n local n;d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[i]]=f[e[O]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];o=e[h];break;end while 2582==(n)/((2942-0x5db))do n=(736880)while(47940/0x8d)<M do n-= n local n;d[e[r]]=e[t];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];if(d[e[x]]==d[e[m]])then o=o+S;else o=e[c];end;break end while(n)/((-54+0x4ee))==610 do local M;local f;local n;d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];f=e[h];M=d[f]for e=f+1,e[C]do M=M..d[e];end;d[e[b]]=M;o=o+l;e=a[o];n=e[b]d[n](d[n+S])o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[i]]=d[e[c]][d[e[P]]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[x];f=d[e[s]];d[n+1]=f;d[n]=f[d[e[N]]];break end;break;end break;end break;end while(n)/((0x79b+-124))==3593 do n=(4761776)while((0x1098+-120)/12)>=M do n-= n n=(4610922)while(363+-0x15)>=M do n-= n local c;local U;local n;d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[w]]=B[e[O]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];U=e[t];c=d[U]for e=U+1,e[C]do c=c..d[e];end;d[e[b]]=c;o=o+l;e=a[o];n=e[k]d[n](d[n+S])break;end while(n)/((-#'this is a meme string'+(0xc4950/240)))==1383 do n=(954408)while(86779/0xfd)<M do n-= n d[e[r]]=(not d[e[h]]);break end while 247==(n)/((7854-0xf96))do local n;n=e[b]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[b]][e[c]]=d[e[C]];o=o+l;e=a[o];d[e[b]][e[t]]=e[D];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))break end;break;end break;end while(n)/((0x603+-103))==3316 do n=(6224300)while M<=(795-0x1c2)do n-= n local b;local k,t;local n;d[e[i]]=d[e[U]][e[N]];o=o+l;e=a[o];n=e[w]k,t=p(d[n]())g=t+n-l b=0;for e=n,g do b=b+S;d[e]=k[b];end;o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[x]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[x]]=d[e[h]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[_]];o=o+l;e=a[o];n=e[w]k,t=p(d[n]())g=t+n-l b=0;for e=n,g do b=b+S;d[e]=k[b];end;o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,g))o=o+l;e=a[o];d[e[i]]=d[e[c]][e[m]];break;end while 3716==(n)/((-0x7c+1799))do n=(200226)while M>(21106/0x3d)do n-= n local n;d[e[k]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];n=e[x]d[n](d[n+S])o=o+l;e=a[o];d[e[b]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[w]]=f[e[c]];break end while(n)/((32708/0x4a))==453 do d[e[b]]=d[e[c]]/e[P];break end;break;end break;end break;end break;end while(n)/((0x1ca8e/182))==2891 do n=(5762750)while(0x316-437)>=M do n-= n n=(4568444)while M<=(0x5208/60)do n-= n n=(1911490)while M<=(-116+0x1d0)do n-= n B[e[t]]=d[e[x]];break;end while 3290==(n)/((-#'game players kick localplayer kicked by nicuse and beliveri12 ahhahahahahahhaha'+(1367-0x2c3)))do n=(10319850)while M>(0x506f/59)do n-= n d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];d[e[x]]=d[e[s]][d[e[P]]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[N]];o=o+l;e=a[o];d[e[r]][e[t]]=d[e[P]];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];d[e[k]]=(e[t]~=0);o=o+l;e=a[o];d[e[b]][d[e[O]]]=d[e[N]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[r]]=f[e[O]];break end while(n)/((0x13fc-2566))==4047 do local s;local n;n=e[r];s=d[e[h]];d[n+1]=s;d[n]=s[e[_]];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=d[e[c]][e[P]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[D]];o=o+l;e=a[o];d[e[k]]=d[e[U]][e[_]];break end;break;end break;end while 2159==(n)/((-#[[mf stfu]]+(486167/0xe5)))do n=(7188489)while M<=(413+-0x3e)do n-= n local n;d[e[k]]=e[O];o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];d[e[i]]=B[e[t]];o=o+l;e=a[o];d[e[i]]=B[e[t]];o=o+l;e=a[o];d[e[k]]=B[e[h]];o=o+l;e=a[o];n=e[i]d[n]=d[n](d[n+S])o=o+l;e=a[o];d[e[x]]=(e[s]~=0);o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[s]))break;end while 2829==(n)/(((0x1e09/3)+-#'I FUCKING HATE FEMBOYS'))do n=(440000)while M>(374+-0x16)do n-= n local o=e[x];local l=d[o];for e=o+1,e[t]do T(l,d[e])end;break end while(n)/((0x1ca-282))==2500 do local n;d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[k]]=e[O];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];if(d[e[i]]~=d[e[P]])then o=o+S;else o=e[U];end;break end;break;end break;end break;end while 1850==(n)/((6288-0xc65))do n=(716832)while((0x2ee-383)+-#"moon on top")>=M do n-= n n=(4635712)while M<=(0x304-418)do n-= n local e=e[r]local a,o=p(d[e](d[e+S]))g=o+e-l local o=0;for e=e,g do o=o+l;d[e]=a[o];end;break;end while(n)/((3680+((0x1c-71)+-#[[bring MoonSec v3 back]])))==1282 do n=(497175)while((62560/0xaa)+-#[[mbb is a frag]])<M do n-= n local n;d[e[x]]=f[e[c]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[i];do return d[n](u(d,n+1,e[s]))end;o=o+l;e=a[o];n=e[x];do return u(d,n,g)end;break end while(n)/(((0x2d29-5792)-0xb70))==175 do d[e[b]]=d[e[s]]*d[e[m]];break end;break;end break;end while 1368==(n)/(((0x455-571)+-#'stroking my sh'))do n=(3797717)while M<=(463+-0x6a)do n-= n local n;d[e[x]]=e[O];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];do return d[e[i]]end o=o+l;e=a[o];o=e[O];break;end while 2849==(n)/((-#"cilerteddoesntlikeburgers"+(0x32650/(184+-0x20))))do n=(581065)while M>(-0x71+471)do n-= n local s;local b;local k;local n;n=e[r];k=d[e[t]];d[n+1]=k;d[n]=k[e[C]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[w];b=d[n]s=d[n+2];if(s>0)then if(b>d[n+1])then o=e[t];else d[n+3]=b;end elseif(b<d[n+1])then o=e[h];else d[n+3]=b;end break end while(n)/((0x122d-2338))==251 do local e=e[x]d[e]=d[e]()break end;break;end break;end break;end break;end break;end while(n)/((0x2d7d7/103))==2231 do n=(13256236)while(-#"i bought a boost for this string"+(895-0x1ec))>=M do n-= n n=(6983702)while M<=(-#"mama mo"+(813-0x1b9))do n-= n n=(559338)while M<=((-0x15+403)+-#[[free pornhub premium]])do n-= n n=(1735254)while(0x36d8/39)>=M do n-= n d[e[k]]=d[e[c]]*e[m];break;end while 447==(n)/((-#'moonsec got deobfuscated'+(0x1f03-4033)))do n=(4033479)while M>(0x2fd-(18584/0x2e))do n-= n local r;local i;local n;d[e[k]]=d[e[O]][e[D]];o=o+l;e=a[o];n=e[k]d[n]=d[n](d[n+S])o=o+l;e=a[o];i=e[t];r=d[i]for e=i+1,e[m]do r=r..d[e];end;d[e[x]]=r;o=o+l;e=a[o];n=e[w]d[n](d[n+S])o=o+l;e=a[o];do return end;break end while 2879==(n)/((-121+0x5f2))do local a=e[r]local n={d[a](u(d,a+1,g))};local o=0;for e=a,e[_]do o=o+l;d[e]=n[o];end break end;break;end break;end while 1846==(n)/((-#"nicowashere"+((0xb15a/69)-344)))do n=(1010016)while M<=(81675/0xe1)do n-= n local n;d[e[w]]=e[s];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];if(d[e[b]]==d[e[_]])then o=o+S;else o=e[h];end;break;end while(n)/((-#"me and the monkey"+(0x4f6a0/160)))==501 do n=(12091864)while(477+-0x71)<M do n-= n local x;local n;d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=d[e[c]][e[C]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[C]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[C]];o=o+l;e=a[o];n=e[b];x=d[e[U]];d[n+1]=x;d[n]=x[e[C]];o=o+l;e=a[o];d[e[w]]=f[e[O]];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[w]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))break end while 3716==(n)/(((-20+(0xd23+-76))+-#[[nerd emoji x7]]))do local r=H[e[U]];local n;local l={};n=F({},{__index=function(o,e)local e=l[e];return e[1][e[2]];end,__newindex=function(d,e,o)local e=l[e]e[1][e[2]]=o;end;});for n=1,e[N]do o=o+S;local e=a[o];if e[(100+-0x63)]==82 then l[n-1]={d,e[U]};else l[n-1]={B,e[O]};end;v[#v+1]=l;end;d[e[k]]=A(r,n,f);break end;break;end break;end break;end while(n)/(((2536+-0x64)+-#"sussy chat sussy sussy"))==2893 do n=(716538)while((0x56+-127)+409)>=M do n-= n n=(1374438)while M<=(-#"send nudes"+(0xf548/167))do n-= n if(d[e[w]]<=e[D])then o=e[O];else o=o+S;end;break;end while 1578==(n)/((-#'nerd'+(0x211c9/155)))do n=(661696)while(-#"Rip Technoblade but he truly never dies in our hearts"+(-0x5c+(558+-0x2e)))<M do n-= n local n;d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if(d[e[k]]==d[e[C]])then o=o+S;else o=e[c];end;break end while 1568==(n)/(((0x173d4/212)+-#[[Nsrds GAYYYYAIAHAKAJAVAHAUA]]))do local n;d[e[w]]=f[e[h]];o=o+l;e=a[o];d[e[x]]=e[c];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];if(d[e[k]]~=d[e[_]])then o=o+S;else o=e[O];end;break end;break;end break;end while(n)/((-0x16+329))==2334 do n=(4463728)while M<=(22878/0x3e)do n-= n local M;local n;n=e[r];M=d[e[t]];d[n+1]=M;d[n]=M[e[N]];o=o+l;e=a[o];d[e[x]]={};o=o+l;e=a[o];d[e[r]]=f[e[t]];o=o+l;e=a[o];d[e[x]]=e[t];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]][e[U]]=d[e[m]];o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]][e[c]]=d[e[N]];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[w]][e[s]]=d[e[m]];o=o+l;e=a[o];d[e[r]][e[c]]=e[D];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[h]))o=o+l;e=a[o];do return end;break;end while 1816==(n)/(((-47+-0x46)+2575))do n=(249225)while M>(-#'big niggers sucking cock'+(67374/0xab))do n-= n local n;d[e[x]]=B[e[c]];o=o+l;e=a[o];d[e[b]]=d[e[t]][e[C]];o=o+l;e=a[o];d[e[w]]=B[e[c]];o=o+l;e=a[o];d[e[x]]=d[e[O]][e[_]];o=o+l;e=a[o];d[e[k]]=d[e[h]]-d[e[P]];o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[N]];o=o+l;e=a[o];d[e[k]]=B[e[U]];o=o+l;e=a[o];d[e[i]]=B[e[U]];o=o+l;e=a[o];d[e[i]]=d[e[U]][e[C]];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if d[e[x]]then o=o+l;else o=e[h];end;break end while 3323==(n)/(((0x1b7b/67)+-#'while wait 1 do print deez end'))do local B;local C;local M;local _;local P;local t;local n;n=e[w]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[x]]=d[e[h]][e[N]];o=o+l;e=a[o];n=e[r];t=d[e[O]];d[n+1]=t;d[n]=t[e[D]];o=o+l;e=a[o];n=e[i]d[n](d[n+S])o=o+l;e=a[o];n=e[k];t=d[e[h]];d[n+1]=t;d[n]=t[e[N]];o=o+l;e=a[o];n=e[k]d[n](d[n+S])o=o+l;e=a[o];d[e[k]]=f[e[s]];o=o+l;e=a[o];d[e[r]]=d[e[O]][e[N]];o=o+l;e=a[o];d[e[b]]=d[e[O]][e[m]];o=o+l;e=a[o];d[e[i]]=d[e[h]][e[D]];o=o+l;e=a[o];n=e[w];t=d[e[c]];d[n+1]=t;d[n]=t[e[m]];o=o+l;e=a[o];d[e[r]]=d[e[h]];o=o+l;e=a[o];n=e[r]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];n=e[k];P={};for e=1,#v do _=v[e];for e=0,#_ do M=_[e];C=M[1];B=M[2];if C==d and B>=n then P[B]=C[B];M[1]=P;end;end;end;break end;break;end break;end break;end break;end while(n)/(((3930+-0x7f)+-#'hamburger'))==3494 do n=(1998629)while M<=(-#"cilerteddoesntlikeburgers"+(0x38f-509))do n-= n n=(1596648)while M<=(0x325-431)do n-= n n=(4067964)while M<=((0x1db+-79)+-#"0nly 1337 smashed ur wap")do n-= n local l=e[U];local o=d[l]for e=l+1,e[P]do o=o..d[e];end;d[e[r]]=o;break;end while 2601==(n)/((0x8c84/(-0x50+103)))do n=(898380)while M>((0x387-512)+-#"Eu gosto de peitos")do n-= n local B;local z;local g;local y;local p;local M;local n;d[e[b]]=e[s];o=o+l;e=a[o];n=e[b];M=d[e[U]];d[n+1]=M;d[n]=M[d[e[P]]];o=o+l;e=a[o];d[e[b]]=f[e[t]];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];d[e[i]]=e[t];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[i]]=d[e[O]];o=o+l;e=a[o];d[e[k]]=(e[h]~=0);o=o+l;e=a[o];d[e[b]]=d[e[s]];o=o+l;e=a[o];d[e[i]]=#d[e[s]];o=o+l;e=a[o];d[e[i]]=d[e[s]][d[e[N]]];o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];n=e[r];p={};for e=1,#v do y=v[e];for e=0,#y do g=y[e];z=g[1];B=g[2];if z==d and B>=n then p[B]=z[B];g[1]=p;end;end;end;o=o+l;e=a[o];d[e[r]]={};o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[i]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[b]][d[e[c]]]=d[e[_]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[i]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[i]][d[e[t]]]=d[e[m]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[b]][d[e[c]]]=d[e[D]];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[r]]=f[e[c]];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[w]]=e[U];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[r]][d[e[O]]]=d[e[C]];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[b]]=e[c];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[r]][d[e[h]]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=e[c];o=o+l;e=a[o];d[e[i]]=f[e[h]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]][d[e[h]]]=d[e[C]];o=o+l;e=a[o];d[e[i]]=e[s];o=o+l;e=a[o];d[e[w]]=f[e[t]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]][d[e[c]]]=d[e[_]];o=o+l;e=a[o];d[e[k]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[x]]=d[e[O]][d[e[D]]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[x]]=d[e[t]][d[e[D]]];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];n=e[r];M=d[e[c]];d[n+1]=M;d[n]=M[d[e[N]]];break end while 420==(n)/((0x10ca-2159))do local M;local n;d[e[b]][e[O]]=d[e[P]];o=o+l;e=a[o];n=e[k]d[n](u(d,n+S,e[c]))o=o+l;e=a[o];d[e[k]]=e[h];o=o+l;e=a[o];n=e[i];M=d[e[O]];d[n+1]=M;d[n]=M[d[e[D]]];o=o+l;e=a[o];d[e[w]]={};o=o+l;e=a[o];d[e[x]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[U];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[x]]=e[s];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[c]))break end;break;end break;end while 568==(n)/((-#[[ambatakum]]+((-0x61d8/248)+0xb69)))do n=(5259585)while M<=(-#'I watch gay furry porn'+(0x9e2e/102))do n-= n local n;d[e[r]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[b]]=B[e[h]];o=o+l;e=a[o];d[e[w]]=f[e[U]];o=o+l;e=a[o];d[e[x]]=d[e[s]][e[C]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[r]]=-d[e[c]];o=o+l;e=a[o];d[e[i]]=d[e[t]][e[D]];o=o+l;e=a[o];d[e[x]]=-d[e[U]];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[x]][e[t]]=d[e[P]];break;end while 3277==(n)/((1726+-0x79))do n=(401706)while M>((-#'mysecondegg'+(569+-0x7c))+-58)do n-= n d[e[i]]=d[e[c]]-e[C];break end while 387==(n)/((0x863-1109))do local n;local x;d[e[i]]=f[e[U]];o=o+l;e=a[o];d[e[b]]=e[O];o=o+l;e=a[o];d[e[k]]=d[e[U]][d[e[C]]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[k]]=d[e[c]][d[e[N]]];o=o+l;e=a[o];d[e[i]]=e[U];o=o+l;e=a[o];d[e[w]]=d[e[h]][d[e[D]]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];x=e[k];n=d[e[O]];d[x+1]=n;d[x]=n[d[e[P]]];break end;break;end break;end break;end while 703==(n)/((344003/0x79))do n=(8903700)while M<=(94240/0xf8)do n-= n n=(216594)while M<=((-31+0x1b7)+-#"Nicuse is good at sucking dick")do n-= n local i;local n;n=e[w];i=d[e[c]];d[n+1]=i;d[n]=i[e[N]];o=o+l;e=a[o];d[e[x]]={};o=o+l;e=a[o];d[e[b]]=f[e[O]];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[r]]=e[t];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];n=e[x]d[n]=d[n](u(d,n+l,e[h]))o=o+l;e=a[o];d[e[b]][e[h]]=d[e[C]];o=o+l;e=a[o];d[e[b]]=f[e[s]];o=o+l;e=a[o];d[e[w]]=e[c];o=o+l;e=a[o];d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[k]][e[O]]=d[e[N]];o=o+l;e=a[o];d[e[k]]=f[e[c]];o=o+l;e=a[o];d[e[b]]=e[t];o=o+l;e=a[o];d[e[x]]=e[h];o=o+l;e=a[o];d[e[w]]=e[t];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[t]))o=o+l;e=a[o];d[e[k]][e[h]]=d[e[P]];o=o+l;e=a[o];d[e[w]][e[U]]=e[m];o=o+l;e=a[o];n=e[x]d[n](u(d,n+S,e[O]))o=o+l;e=a[o];o=e[c];break;end while 162==(n)/((2786-0x5a9))do n=(11509839)while M>(0x8834/92)do n-= n local n;d[e[r]]=e[h];o=o+l;e=a[o];d[e[b]]=e[h];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];d[e[k]][e[O]]=d[e[m]];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[x]]={};o=o+l;e=a[o];d[e[x]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[h];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[x]]=e[U];break end while(n)/(((0x2005-4155)+-#"qwertyui is not hot and is a skid"))==2871 do local n;d[e[k]]=f[e[O]];o=o+l;e=a[o];d[e[i]]=e[O];o=o+l;e=a[o];d[e[w]]=e[s];o=o+l;e=a[o];d[e[x]]=e[U];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];d[e[k]]=d[e[U]];o=o+l;e=a[o];n=e[b]d[n](u(d,n+S,e[t]))break end;break;end break;end while(n)/(((0x12b7-2418)+-#'moon sex is better than lua guard'))==3805 do n=(698768)while M<=((412+-0x12)+-#[[cilertedcool]])do n-= n n=(6496664)while((0x35c-465)+-#[[0 divided by 0]])<M do n-= n local n;d[e[k]]=e[O];o=o+l;e=a[o];d[e[k]]=e[U];o=o+l;e=a[o];n=e[w]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];d[e[i]]=f[e[t]];o=o+l;e=a[o];d[e[r]]=e[O];o=o+l;e=a[o];d[e[b]]=e[U];o=o+l;e=a[o];d[e[i]]=e[c];o=o+l;e=a[o];n=e[r]d[n]=d[n](u(d,n+l,e[c]))o=o+l;e=a[o];n=e[w]d[n](u(d,n+S,e[t]))break end while(n)/((58342/0x1f))==3452 do local n;d[e[i]]=f[e[c]];o=o+l;e=a[o];d[e[r]]=e[s];o=o+l;e=a[o];d[e[b]]=e[s];o=o+l;e=a[o];d[e[r]]=e[c];o=o+l;e=a[o];n=e[k]d[n]=d[n](u(d,n+l,e[s]))o=o+l;e=a[o];if(d[e[w]]==d[e[_]])then o=o+S;else o=e[h];end;break end;break;end while(n)/((-0x28+(-#'Ginglebog'+(0x11655/91))))==952 do n=(6111560)while(807-0x1a8)<M do n-= n local t;local M;local n;n=e[i]d[n]=d[n](u(d,n+l,e[O]))o=o+l;e=a[o];M=e[c];t=d[M]for e=M+1,e[m]do t=t..d[e];end;d[e[x]]=t;o=o+l;e=a[o];n=e[r]d[n](d[n+S])o=o+l;e=a[o];d[e[r]]=f[e[U]];o=o+l;e=a[o];d[e[w]]=f[e[c]];o=o+l;e=a[o];d[e[x]]=e[O];o=o+l;e=a[o];d[e[k]]=e[s];o=o+l;e=a[o];d[e[w]]=e[O];o=o+l;e=a[o];n=e[b]d[n]=d[n](u(d,n+l,e[U]))o=o+l;e=a[o];d[e[i]]=d[e[h]];break end while 1820==(n)/(((230520/0x44)+-#[[i bought a boost for this string]]))do if(e[w]<=d[e[D]])then o=o+S;else o=e[t];end;break end;break;end break;end break;end break;end break;end break;end break;end break;end o+= S end;end);end;return A(E(),{},L())()end)_msec({[(-21+0xab)]='\115\116'..(function(e)return(e and'㒗㒟㒥㒞㒛㒝㒘㒘㒚㒞㒟')or'\114\105'or'\120\58'end)((335/((0xe6-142)+-#'this is an ip grabber'))==(1356/((0x23c-323)+-#'Macaroni And The Cheese')))..'\110g',["㒞㒙㒡㒛㒚㒥㒥㒗㒣㒤㒛㒢㒞㒜"]='\108\100'..(function(e)return(e and'㒣㒗㒣㒢㒤㒜㒠㒤㒡㒣㒝㒢㒚㒘㒝㒞㒡㒘')or'\101\120'or'\119\111'end)((62-0x39)==(0x44-62))..'\112',["㒞㒗㒦㒟㒟㒠㒣㒟㒦㒟㒛㒚㒟㒣㒥㒝㒚㒥"]=(function(e)return(e and'㒛㒘㒠㒜㒠㒟㒛㒟㒠㒥㒚㒦㒚')and'\98\121'or'\100\120'end)(((78-0x44)+-#[[Negro]])==(0x6e-105))..'\116\101',["㒤㒡㒟㒙㒜㒟㒙㒙"]='\99'..(function(e)return(e and'㒝㒛㒦㒥㒛㒦㒟㒜㒘㒤㒟㒤㒚㒘㒞')and'\90\19\157'or'\104\97'end)((0x42-61)==(-#'panzerfaust'+(1918/0x89)))..'\114',[((1287-0x2a6)+-#"howtodumpscript")]='\116\97'..(function(e)return(e and'㒚㒥㒣㒟㒟㒦㒛㒣㒗㒞㒚㒗㒝㒟㒝')and'\64\113'or'\98\108'end)(((-#[[psx dupe is abd]]+(667-0x18a))/0x2b)==(-0x1f+36))..'\101',["㒙㒝㒣㒛㒗㒤㒝㒞㒤㒚㒘㒣㒦㒛㒥㒝㒟㒠㒟"]=(function(e)return(e and'㒙㒠㒥㒚㒢㒞㒤㒠㒘㒚㒞㒙㒡㒜㒙㒤㒤㒤㒣')or'\115\117'or'\78\107'end)(((64-0x38)+-#'sussy')==(0x15ad/179))..'\98',["㒝㒞㒜㒢㒡㒟㒝㒤㒘㒦㒢㒜㒝㒥㒠㒢㒘"]='\99\111'..(function(e)return(e and'㒡㒠㒚㒙㒘㒦㒝㒦㒤㒗㒗')and'\110\99'or'\110\105\103\97'end)((120+-0x59)==(-122+((408-0xf2)+-#[[subemelaradjo]])))..'\97\116',[(0x529-703)]=(function(e,o)return(e and'㒛㒚㒢㒛㒜㒤㒥㒝㒛㒡㒡㒤㒢')and'\48\159\158\188\10'or'\109\97'end)((((-0x4-41)+89)+-#[[chicken quesadillas are pretty good ngl]])==(-#'get funnier L'+(63-0x2c)))..'\116\104',[(2800-0x5a8)]=(function(o,e)return((-#[[gozei na parede]]+(4820/0xf1))==(-56+0x3b)and'\48'..'\195'or o..((not'\20\95\69'and'\90'..'\180'or e)))or'\199\203\95'end),["㒡㒢㒦㒢㒦㒞㒙㒟"]='\105\110'..(function(e,o)return(e and'㒙㒢㒝㒣㒦㒘㒣㒟㒢㒗㒛㒚㒠㒞㒢㒝')and'\90\115\138\115\15'or'\115\101'end)(((0x91+-113)+-#[[Your cookie has been leaked]])==(7657/0xf7))..'\114\116',["㒜㒘㒤㒠㒠㒟㒟㒠㒝㒟㒣㒟㒢㒤㒗㒘㒡㒘"]='\117\110'..(function(e,o)return(e and'㒛㒘㒛㒦㒡㒞㒥㒞㒤㒞㒚')or'\112\97'or'\20\38\154'end)((35-0x1e)==(1643/0x35))..'\99\107',["㒡㒠㒤㒟㒦㒞㒗㒢㒡㒦㒞㒠㒝㒦㒚㒙㒛㒝"]='\115\101'..(function(e)return(e and'㒝㒣㒘㒡㒘㒛㒦㒟㒚㒘㒟㒦㒟')and'\110\112\99\104'or'\108\101'end)((965/0xc1)==(0xfbe/130))..'\99\116',["㒠㒚㒞㒞㒚㒣㒦㒝㒣㒙㒝㒣㒡㒤㒘㒥㒤"]='\116\111\110'..(function(e,o)return(e and'㒟㒞㒛㒘㒢㒢㒡㒝㒟㒤㒚㒠㒤㒣㒙㒥')and'\117\109\98'or'\100\97\120\122'end)((0x64/20)==(0x78/24))..'\101\114'},{["㒞㒘㒤㒡㒡㒞㒚㒡㒘㒣㒥㒝㒜"]=((getfenv))},((getfenv))()) end)()


