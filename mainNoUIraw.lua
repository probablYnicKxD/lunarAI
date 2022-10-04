local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart

local currentEntity = "None"

local libraryFigureSpawned = false
local escapeFigureSpawned = false

--[[

Lunar AI 0.3.0 Beta // Made by probablYnicK

]]--

local aiVersion = "0.3.0 "

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
key.Name = "SkipKeybind"
key.Value = "R"

local tpKeyKey = Instance.new("StringValue", lunarFolder)
key.Name = "TPKeyKeybind"
key.Value = "T"

local fullAIKey = Instance.new("StringValue", lunarFolder)
key.Name = "FullAIKeybind"
key.Value = "G"

local hideKey = Instance.new("StringValue", lunarFolder)
key.Name = "HideKeybind"
key.Value = "H"

local completeLibraryKey = Instance.new("StringValue", lunarFolder)
key.Name = "CompleteLibraryKeybind"
key.Value = "B"

local tipsEnabled = true

--[[ Entity Info GUI ]]--

local LunarUI = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local EntityInfo = Instance.new("Frame")
local EntityImage = Instance.new("ImageLabel")
local EntityName = Instance.new("TextLabel")
local EntityDistance = Instance.new("TextLabel")
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

	returnMsg = string.gsub(returnMsg, "{roomsUntilEntity}", tostring(ChaseStart.Value - LatestRoom.Value))

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

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local function notifyUser(title, text)
	OrionLib:MakeNotification({
        Name = title,
        Content = text,
        Image = "rbxassetid://4483345998",
		Time = 5
    })
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

lunarTab:AddToggle({
	Name = "Tips",
	Default = true,
	Flag = "LunarTipsEnabled",
    Save = true,
    Callback = function(value)
        tipsEnabled = value
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
        song.SoundId = "rbxassetid://0"
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

OrionLib:MakeNotification({
	Name = "Loaded GUI!",
	Content = "Loaded Lunar GUI!",
	Image = "rbxassetid://4483345998",
	Time = 5
})

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

LatestRoom:GetPropertyChangedSignal("Value"):Connect(function()
    ApplyDoorChams(game.Workspace.CurrentRooms[LatestRoom.Value].Door.Door)
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

local function searchForBooks()
    for i,v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
        if v.Name == "LiveHintBook" then
            ApplyBookChams(v)
        end
    end
end



local function chat(msg)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
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

game.Workspace.DescendantAdded:Connect(function(inst)
    if inst.Name == "RushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Rush"))
		ApplyRushChams(inst)
        currentEntity = "Rush"
        warn("Rush spawned!")
    elseif inst.Name == "AmbushMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Ambush"))
		ApplyAmbushChams(inst)
        currentEntity = "Ambush"
        warn("Ambush spawned!")
    elseif inst.Name == "SeekMoving" then
        chat(returnDefinedMessage(entitySpawnedMsg, "Seek"))
        ApplySeekChams(inst)
        currentEntity = "Seek"
        warn("Seek chase has started! (Room " .. LatestRoom.Value .. ")")
    elseif inst.Name == "FigureRagdoll" then
		ApplyFigureChams(inst)
	elseif inst.Name == "Shade" or inst.Name == "Halt" or inst.Name == "HaltMoving" then
		chat(returnDefinedMessage(entitySpawnedMsg, "Halt"))
        currentEntity = "Halt"
		warn("Halt spawned! (Room " .. LatestRoom.Value .. ")")
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
			chat(returnDefinedMessage(nextCommandMsg))
		end

		if string.lower(msg) == "/predict" then
			local prediction = predict()
			wait(0.1)
			chat(returnDefinedMessage(predictCommandMsg, nil, prediction))
		end

        if string.lower(msg) == "/aiversion" then
			wait(0.1)
            chat("Current Version: Lunar AI // Version " .. aiVersion)
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
	local char = game.Players.LocalPlayer.Character

	if char then
		print("Got character for autocompletion!")
	else
		notifyUser("Failed", "No character was found!")
		return
	end

	if LatestRoom.Value == 50 then
		for i, book in pairs(getBooks()) do
			local destination = CFrame.new(book.Base.CFrame.X, book.Base.CFrame.Y, book.Base.CFrame.Z)

         
			char:SetPrimaryPartCFrame(destination)

            char:WaitForChild("Head").CFrame = CFrame.lookAt(char.Head.Position, book.Base.Position)

            wait()

            fireproximityprompt(book:WaitForChild("ActivateEventPrompt"))

            wait(0.1)
		end

        local paper = getPaper()
        local destination = CFrame.new(paper.CFrame.X, paper.CFrame.Y, paper.CFrame.Z)

        if paper then
            char:SetPrimaryPartCFrame(destination)

            char:WaitForChild("Head").CFrame = CFrame.lookAt(char.Head.Position, paper.Position)

            fireproximityprompt(paper.Parent:WaitForChild("ModulePrompt"))
        else
            notifyUser("Failed", "Could not find Paper!")
            return
        end
	else
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
        player.Character.Humanoid.WalkSpeed = 50
    end

    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PlayKeybind"].Value] then
        playMusic(OrionLib.Flags["CurrentSongLunar"].Value)
    end
    
    if input.KeyCode == Enum.KeyCode[OrionLib.Flags["PauseKeybind"].Value] then
        song.Playing = not song.Playing

        if song.Playing == true then
            notifyUser("Music", "Paused music!")
        elseif song.Playing == false then
            notifyUser("Music", "Unpaused music!")
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

		if room.Door:FindFirstChild("Lock") then
    		OrionLib:MakeNotification({
            	Name = "Door Locked",
				Content = "The door is locked! Press 'T' to teleport to the key.",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end

		char:SetPrimaryPartCFrame(destination)

        OrionLib:MakeNotification({
            Name = "Skipped Room",
			Content = "Successfully skipped Room " .. LatestRoom.Value,
			Image = "rbxassetid://4483345998",
			Time = 5
		})
    end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["TpKeyKeybind"].Value] then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]

		local destination = nil

		local char = game.Players.LocalPlayer.Character

		for i, obj in pairs(room:GetDescendants()) do
			if obj.Name == "KeyObtain" then
				destination = CFrame.new(obj.Hitbox.CFrame.X, obj.Hitbox.CFrame.Y + 5, obj.Hitbox.CFrame.Z)
			end
		end

		if destination == nil then
			OrionLib:MakeNotification({
            	Name = "No Key",
				Content = "A key was not found!",
				Image = "rbxassetid://4483345998",
				Time = 5
			})
			return
		end

		char:SetPrimaryPartCFrame(destination)

        OrionLib:MakeNotification({
            Name = "Teleported To Key",
			Content = "Press 'R' to teleport to the door.",
			Image = "rbxassetid://4483345998",
			Time = 5
		})
    end
end)

UIS.InputEnded:Connect(function(input, gameProcessed)
	if gameProcessed == true then return end

	if input.KeyCode == Enum.KeyCode[OrionLib.Flags["SprintKeybind"].Value] then
		player.Character.Humanoid.WalkSpeed = 16
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

local PathfindingService = game:GetService("PathfindingService")

LatestRoom.Changed:Connect(function()
    if fullAI.Value == true then
        local room = game.Workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]

        OrionLib:MakeNotification({
            Name = "Full AI",
			Content = "Pathfinding to the door of Room " .. LatestRoom.Value,
			Image = "rbxassetid://4483345998",
			Time = 5
		})

        wait(1)

        print("Full AI // Lunar AI // Pathfinding to door...")

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
	None = "rbxassetid://403653614"
}

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
	end

	if try then return try end

	return nil
end

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
	if currentEntity == "None" then
		EntityImage.Image = images.None
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
end)

ChaseStart.Changed:Connect(function()
	RoomNumber.Text = "Room " .. ChaseStart.Value
end)

while wait(0.5) do
    

    if currentEntity ~= "None" then
		local entity = getEntity(currentEntity)

		if entity then
			game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityDistance.Text = math.round((game.Players.LocalPlayer.Character.Head.Position - entity.Position).magnitude) .. " studs away"
			game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityName.Text = currentEntity
			game.CoreGui.LunarUI.MainFrame.EntityInfo.EntityImage.Image = images[currentEntity]
		else
			warn("Could not find entity for name: " .. currentEntity .. "!")
		end
	end
end

OrionLib:Init()
