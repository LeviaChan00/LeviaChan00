if not game:IsLoaded() then
	game.Loaded:wait()
end

local LocalPlayer = game:GetService('Players').LocalPlayer

local function waitFor(Parent, Child)
	if not Parent:FindFirstChild(Child) then
		repeat
			Parent.ChildAdded:wait()
		until Parent:FindFirstChild(Child)
	end
	return Parent:FindFirstChild(Child)
end

waitFor(LocalPlayer,'PlayerGui')
waitFor(LocalPlayer.PlayerGui,'Intro')
waitFor(LocalPlayer.PlayerGui.Intro,'PlayButton')
if not (LocalPlayer.PlayerGui.Intro.PlayButton.Size.X.Scale >= .4) or not (LocalPlayer.PlayerGui.Intro.PlayButton.Size.Y.Scale >= 0.075) then
	repeat
		LocalPlayer.PlayerGui.Intro.PlayButton:GetPropertyChangedSignal'Size':wait()
	until LocalPlayer.PlayerGui.Intro.PlayButton.Size.X.Scale >= .4 and LocalPlayer.PlayerGui.Intro.PlayButton.Size.Y.Scale >= 0.075
end
for _, v in pairs(getconnections(LocalPlayer.PlayerGui.Intro.PlayButton.MouseButton1Click)) do
	v:Fire()
end

wait(1)

if _G.LoadPlace == true then
local playerp = game.Players.LocalPlayer
local oldp = playerp.Character.HumanoidRootPart.CFrame
local loadg = game.Players.LocalPlayer.PlayerGui.Main

    loadg.AreYouSureFrame.Visible = true
    loadg.AreYouSureFrame.Title.TextLabel.Text = "Please Wait."
    loadg.AreYouSureFrame.Title.Exit.Visible = false
    loadg.AreYouSureFrame.Container.Action.Text = "The Script is Loading.."
    loadg.AreYouSureFrame.Container.Buy.Visible = false
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v:IsA("Part") and v.Name == "Durability" or v.Name == "Chakra" or v.Name == "Strength" or v.Name == "Speed" or v.Name == "Agility" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,-1,0)
                wait(0.5)
            end
        end

        wait()

        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v:IsA("ClickDetector") and v.Parent.Name == "ClickBox" and v.Parent.Parent.Name == "ChikaraCrate" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0,0,0)
                wait(0.2)
            end
        end

        wait(0.2)

        --[[for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v:IsA("Part") and v.Name == "Durability" or v.Name == "Chakra" or v.Name == "Strength" or v.Name == "Speed" or v.Name == "Agility" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,-1,0)
                wait(0.2)
            end
        end

        wait(0.2)]]

        --[[for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v:IsA("Part") and v.Name == "Durability" or v.Name == "Chakra" or v.Name == "Strength" or v.Name == "Speed" or v.Name == "Agility" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,-1,0)
                wait(0.2)
            end
        end

        wait(0.2)

        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v:IsA("Part") and v.Name == "Durability" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0,-1,0)
                wait(0.2)
            end
        end]]

    loadg.AreYouSureFrame.Visible = false
    playerp.Character.HumanoidRootPart.CFrame = oldp
end

if game.PlaceId == 5445504800 then
local Config = {
    WindowName = "Anime Fighting Simulator",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.Insert
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jaaaaay2/Lib/main/BracketV3/BracketV3%20Lib.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Autofarm")
local TabM = Window:CreateTab("UI Settings")

--// Tab 1 //
local Section1 = Tab1:CreateSection("Stat")

--// Tab M //
local SectionM1 = TabM:CreateSection("UI Option")

--// Tab 1 Sec 1 //
local Sec1Dropdown1 = Section1:CreateDropdown("Stat to train", {"Strength", "Durability", "Chakra", "Sword", "Speed", "Agility"}, function(String)
	_G.STT = String
end)
Sec1Dropdown1:AddToolTip("Did you know that when you're in a Durability Train Area\nyou can train your sword and still gain a durability stat. :)")

local Sec1Toggle1 = Section1:CreateToggle("Train Toggle", nil, function(State)
	getgenv().TT = State

    while getgenv().TT do wait()
        if _G.STT == "Sword" then
                
            wait()
            local args = {
            [1] = "SE",
            [2] = true
            }
    
            game:GetService("ReplicatedStorage").RSPackage.Events.GeneralEvent:FireServer(unpack(args))    
            local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
            a.SendToServer("Sword")
        
        else
    
            local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
            a.SendToServer(_G.STT)
            wait()
    
        end
    end
end)
Sec1Toggle1:SetState(false)


--// Section M //
local ToggleM1 = SectionM1:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
ToggleM1:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
ToggleM1:SetState(true)

local ColorpickerM1 = SectionM1:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
ColorpickerM1:UpdateColor(Config.Color)

local DropdownM1 = SectionM1:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")
end
    local StrTP = {}
    local durTP = {}
    local chkrTP = {}
    local spdTP = {}
    local agiTP = {}
    local NPCTP = {}
    local chapTP = {}
	local HumanModCons = {}

    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Strength" and not table.find(StrTP,v.Text) then
            table.insert(StrTP,v.Text)
        end
    end
    
    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Durability" and not table.find(durTP,v.Text) then
            table.insert(durTP,v.Text)
        end
    end

    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Chakra" and not table.find(chkrTP,v.Text) then
            table.insert(chkrTP,v.Text)
        end
    end

    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Speed" and not table.find(spdTP,v.Text) then
            table.insert(spdTP,v.Text)
        end
    end

    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Agility" and not table.find(agiTP,v.Text) then
            table.insert(agiTP,v.Text)
        end
    end

    for k,v in next,game:GetService("Workspace").NPCs:GetDescendants() do
        if v.Name == "HumanoidRootPart" and v.Parent.ClassName == "Model" and not table.find(NPCTP,v.Parent.Parent.Name) then
            table.insert(NPCTP,v.Parent.Parent.Name)
        end
    end

    for k,v in next,game:GetService("Workspace").Scriptable:GetDescendants() do
        if v.Name == "Interaction" and v.Parent.ClassName == "Model" and not table.find(chapTP,v.Parent.Name) then
            table.insert(chapTP,v.Parent.Name)
        end
    end

    wait(1.5)

    for k,v in next,game:GetService("Workspace").Scriptable:GetDescendants() do
        if v.Name == "Interaction" and v.Parent.ClassName == "Model" and not table.find(chapTP,v.Parent.Name) then
            table.insert(chapTP,v.Parent.Name)
        end
    end

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local Notify = AkaliNotif.Notify


local Config = {
    WindowName = "Anime Fighting Simulator",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.Insert
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jaaaaay2/Lib/main/BracketV3/BracketV3%20Lib.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

local Tab1 = Window:CreateTab("Autofarm")
local Tab2 = Window:CreateTab("Item TP")
local Tab3 = Window:CreateTab("Teleport")
local Tab4 = Window:CreateTab("Auto Buy")
local Tab5 = Window:CreateTab("Misc")
local TabM = Window:CreateTab("UI Settings")

--// Tab 1 //
local Section1 = Tab1:CreateSection("Stat")
local Section2 = Tab1:CreateSection("Chikara")
--// Tab 2 //
local Section3 = Tab2:CreateSection("DB/DF")
local Section4 = Tab2:CreateSection("Chapter 2")
--// Tab 3 //
local Section5 = Tab3:CreateSection("Area TP")
local Section6 = Tab3:CreateSection("NPC TP")
--// Tab 4 //
local Section7 = Tab4:CreateSection("Arnament")
local Section8 = Tab4:CreateSection("Bloodlines")
local Section9 = Tab4:CreateSection("Cursed Technique")
local Section10 = Tab4:CreateSection("Grimoires")
local Section11 = Tab4:CreateSection("Kagunes")
local Section12 = Tab4:CreateSection("Pyrokinesis")
local Section13 = Tab4:CreateSection("Quirks")
local Section14 = Tab4:CreateSection("Stands")
local Section15 = Tab4:CreateSection("Sword Style")
local Section16 = Tab4:CreateSection("Settings")
--// Tab 5 //
local Section17 = Tab5:CreateSection("Misc")
--// Tab M //
local SectionM1 = TabM:CreateSection("UI Option")

--// Tab 1 Sec 1 //
local Sec1Dropdown1 = Section1:CreateDropdown("Stat to train", {"Strength", "Durability", "Chakra", "Sword", "Speed", "Agility"}, function(String)
	_G.STT = String
end)
Sec1Dropdown1:AddToolTip("Did you know that when you're in a Durability Train Area\nyou can train your sword and still gain a durability stat. :)")

local Sec1Toggle1 = Section1:CreateToggle("Train Toggle", nil, function(State)
	getgenv().TT = State

    while getgenv().TT do wait()
        if _G.STT == "Sword" then
                
            wait()
            local args = {
            [1] = "SE",
            [2] = true
            }
    
            game:GetService("ReplicatedStorage").RSPackage.Events.GeneralEvent:FireServer(unpack(args))    
            local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
            a.SendToServer("Sword")
        
        else
    
            local a = require(game:GetService("Players").LocalPlayer.PlayerGui.Main.MainClient.StatModuleClient)
            a.SendToServer(_G.STT)
            wait()
    
        end
    end
end)
Sec1Toggle1:SetState(false)

local Sec1Toggle2 = Section1:CreateToggle("Auto Class Upgrade", nil, function(State)
	getgenv().ACU = State

    while getgenv().ACU do
		for i = 1, 25 do

			local args = {
				[1] = "Class",
				[2] = tostring(i)
			}

			game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
		end
		wait(10)
	end
end)
Sec1Toggle2:SetState(false)

--// Tab 1 Sec 2 //

local Sec2Toggle1 = Section2:CreateToggle("Normal", nil, function(State)
	getgenv().ctn = State
    
    local player = game.Players.LocalPlayer
    while getgenv().ctn do wait()
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if  v:IsA("ClickDetector") and v.Parent.Name == "ClickBox" and v.Parent.Parent.Name == "ChikaraCrate" then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                wait(0.5)
                fireclickdetector(v)
                wait(3.5)
                break
            end
        end
    end
end)
Sec2Toggle1:SetState(false)

local Sec2Toggle2 = Section2:CreateToggle("Stay in place", nil, function(State)
	getgenv().cts = State
    
    local playercts = game.Players.LocalPlayer
    local oldcts = playercts.Character.HumanoidRootPart.CFrame
    while getgenv().cts do wait()
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if  v:IsA("ClickDetector") and v.Parent.Name == "ClickBox" and v.Parent.Parent.Name == "ChikaraCrate" then
                playercts.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
                wait(0.5)
                fireclickdetector(v)
                wait(0.1)
                playercts.Character.HumanoidRootPart.CFrame = oldcts
                wait(3.5)
                break
            end
        end
    end
end)
Sec2Toggle2:SetState(false)

--// Tab 2 Sec 3 //

local Sec3Button1 = Section3:CreateButton("Dragonball", function()
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

    for _,i in pairs(game.Workspace.MouseIgnore:GetChildren()) do
        if i:FindFirstChild("ClickPart") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.ClickPart.CFrame
          break
        end
    end

    if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == old then
        Notify({
			Description = "No Dragonball/Dragon orb spawn yet.";
			Title = "Try again later.";
			Duration = 5;
		});
    end
end)

local Sec3Button2 = Section3:CreateButton("Devil Fruit", function()
	local old = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    local player = game:GetService('Players').LocalPlayer

    for k,v in next,game:GetService("Workspace").MiscModels:GetDescendants() do 
        if v.Name == "ManualWeld" and v.Parent.Parent.Name == "Model" then
            player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0,2,0)
            break
        end
    end

    if game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame == old then
        Notify({
			Description = "No Devil Fruit spawn yet.";
			Title = "Try again later.";
			Duration = 5;
		});
    end
end)

--// Tab 2 Sec 4 //

local Sec4Dropdown1 = Section4:CreateDropdown("Quest Item", chapTP, function(Name)
	_G.chapptp = Name
    local player = game:GetService('Players').LocalPlayer
    for k,v in next,game:GetService("Workspace").Scriptable:GetDescendants() do
        if v.Name == "Interaction" and v.Parent.ClassName == "Model" then
            if v.Parent.Name == _G.chapptp then
                player.Character.HumanoidRootPart.CFrame = v.CFrame + Vector3.new(0, 5, 0)
            end
        end
    end
end)

-- Tab 3 Sec 5 //

if game.PlaceId == 4042427666 then

    local player = game:GetService('Players').LocalPlayer

    local Sec5Dropdown1 = Section5:CreateDropdown("Portal", {"Dimension 2", "Dimension 3", "Dimension 4", "Dimension 5", "Tournament Dimension"}, function(Name)
        for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
            if v.Name == "ClickDetector" and v.Parent.Parent.Name == Name then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
                wait(1.5)
                local args = {
                    [1] = "Portal",
                    [2] = {
                        ["PlaceID"] = Name
                    }
                }
                
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
            end
        end
    end)
elseif game.PlaceId == 5113678354 then

    local player = game:GetService('Players').LocalPlayer

    local Sec5Dropdown1 = Section5:CreateDropdown("Portal", {"Dimension 1", "Dimension 3", "Dimension 4", "Dimension 5", "Tournament Dimension"}, function(Name)
        for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
            if v.Name == "ClickDetector" and v.Parent.Parent.Name == Name then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
                wait(1.5)
                local args = {
                    [1] = "Portal",
                    [2] = {
                        ["PlaceID"] = Name
                    }
                }
                
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
            end
        end
    end)
elseif game.PlaceId == 5113680396 then

    local player = game:GetService('Players').LocalPlayer

    local Sec5Dropdown1 = Section5:CreateDropdown("Portal", {"Dimension 1", "Dimension 2", "Dimension 4", "Dimension 5", "Tournament Dimension"}, function(Name)
        for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
            if v.Name == "ClickDetector" and v.Parent.Parent.Name == Name then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
                wait(1.5)
                local args = {
                    [1] = "Portal",
                    [2] = {
                        ["PlaceID"] = Name
                    }
                }
                
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
            end
        end
    end)
elseif game.PlaceId == 5445525505 then

    local player = game:GetService('Players').LocalPlayer

    local Sec5Dropdown1 = Section5:CreateDropdown("Portal", {"Dimension 1", "Dimension 2", "Dimension 3", "Dimension 5", "Tournament Dimension"}, function(Name)
        for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
            if v.Name == "ClickDetector" and v.Parent.Parent.Name == Name then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
                wait(1.5)
                local args = {
                    [1] = "Portal",
                    [2] = {
                        ["PlaceID"] = Name
                    }
                }
                
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
            end
        end
    end)
elseif game.PlaceId == 6479720355 then

    local player = game:GetService('Players').LocalPlayer

    local Sec5Dropdown1 = Section5:CreateDropdown("Portal", {"Dimension 1", "Dimension 2", "Dimension 3", "Dimension 4", "Tournament Dimension"}, function(Name)
        for k,v in next,game:GetService("Workspace").DimensionPortal:GetDescendants() do 
            if v.Name == "ClickDetector" and v.Parent.Parent.Name == Name then
                player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(2,2,0)
                wait(1.5)
                local args = {
                    [1] = "Portal",
                    [2] = {
                        ["PlaceID"] = Name
                    }
                }
                
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
            end
        end
    end)
end

local Sec5Dropdown2 = Section5:CreateDropdown("Strength Place", StrTP, function(ptp)
	_G.strptp = ptp
    local player = game:GetService('Players').LocalPlayer
    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Strength" then
            if v.Text == _G.strptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
            end
        end
    end
end)

local Sec5Dropdown3 = Section5:CreateDropdown("Durability Place", durTP, function(ptp)
    _G.durptp = ptp
    local player = game:GetService('Players').LocalPlayer
    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Durability" then
            if v.Text == _G.durptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
            end
        end
    end
end)

local Sec5Dropdown4 = Section5:CreateDropdown("Chakra Place", chkrTP, function(ptp)
    _G.chkrptp = ptp
    local player = game:GetService('Players').LocalPlayer
    for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
        if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Chakra" then
            if v.Text == _G.chkrptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
            end
        end
    end
end)

if game.PlaceId == 4042427666 then
    local Sec5Dropdown5 = Section5:CreateDropdown("Agility Place", agiTP, function(ptp)
        _G.agiptp = ptp
        local player = game:GetService('Players').LocalPlayer
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Agility" then
                if v.Text == _G.agiptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
                end
            end
        end
    end)

    local Sec5Dropdown6 = Section5:CreateDropdown("Speed Place", spdTP, function(ptp)
        _G.spdptp = ptp
        local player = game:GetService('Players').LocalPlayer
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Speed" then
                if v.Text == _G.spdptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
                end
            end
        end
    end)
elseif game.PlaceId == 6479720355 then
    local Sec5Dropdown5 = Section5:CreateDropdown("Agility Place", agiTP, function(ptp)
        _G.agiptp = ptp
        local player = game:GetService('Players').LocalPlayer
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Agility" then
                if v.Text == _G.agiptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
                end
            end
        end
    end)

    local Sec5Dropdown6 = Section5:CreateDropdown("Speed Place", spdTP, function(ptp)
        _G.spdptp = ptp
        local player = game:GetService('Players').LocalPlayer
        for k,v in next,game:GetService("Workspace").MouseIgnore:GetDescendants() do
            if v.Name == "Requires" and v.Parent.Parent.Parent.Name == "Speed" then
                if v.Text == _G.spdptp then
                player.Character.HumanoidRootPart.CFrame = v.Parent.Parent.Parent.CFrame
                end
            end
        end
    end)
end
--// Tab 3 Sec 6 //

local Sec5Dropdown7 = Section6:CreateDropdown("NPC", NPCTP, function(ptp)
    _G.npcptp = ptp
    local player = game:GetService('Players').LocalPlayer
    for k,v in next,game:GetService("Workspace").NPCs:GetDescendants() do
        if v.Name == "HumanoidRootPart" and v.Parent.ClassName == "Model" then
            if v.Parent.Parent.Name == _G.npcptp then
                player.Character.HumanoidRootPart.CFrame = v.CFrame
            end
        end
    end
end)

--// Tab 4 Sections //

local Tab4Dropdown1 = Section7:CreateDropdown("Arnament",{"Support Arnament","Vecta Sword","Black Swordsman Arnament", "Time Sword"},function(Ardr)
    _G.Arv = Ardr
end)

local Tab4Toggle1 = Section7:CreateToggle("Toggle", nil, function(State)
	getgenv().ArT = State

    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().ArT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Arnament.Frame:GetDescendants() do
            if v.Name == "ArnamentName" then
                if v.Text ~= _G.Arv then
                    local args = {
                        [1] = "SOb",
                        [2] = "Arnament"
                    }
                
                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.Arv then
                    getgenv().ArT = false
                    Tab4Toggle1:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle1:SetState(false)

local Tab4Dropdown2 = Section8:CreateDropdown("Bloodlines",{"Copy Eyes","White Eyes","Itachu's Copy Eyes", "Ripple Eyes"},function(Bdr)
    _G.Bv = Bdr
end)

local Tab4Toggle2 = Section8:CreateToggle("Toggle", nil, function(State)
	getgenv().BT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().BT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Bloodlines.Frame:GetDescendants() do
            if v.Name == "BloodlinesName" then
                if v.Text ~= _G.Bv then
                    local args = {
                        [1] = "SOb",
                        [2] = "Bloodlines"
                    }
                    
                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.Bv then
                    getgenv().BT = false
                    Tab4Toggle2:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle2:SetState(false)

local Tab4Dropdown3 = Section9:CreateDropdown("Cursed Technique",{"Straw Doll","Ratio","Volcano", "Limitless"},function(CTdr)
    _G.CTv = CTdr
end)

local Tab4Toggle3 = Section9:CreateToggle("Toggle", nil, function(State)
	getgenv().CTT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().CTT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.CursedTechniques.Frame:GetDescendants() do
            if v.Name == "TechniqueName" then
                if v.Text ~= _G.CTv then
                    local args = {
                        [1] = "SOb",
                        [2] = "CursedTechniques"
                    }

                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.CTv then
                    getgenv().CTT = false
                    Tab4Toggle3:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle3:SetState(false)

local Tab4Dropdown4 = Section10:CreateDropdown("Grimoires",{"Water Grimoire","Wind Grimoire","Demon Grimoire"},function(Gdr)
    _G.Gv = Gdr
end)

local Tab4Toggle4 = Section10:CreateToggle("Toggle", nil, function(State)
	getgenv().GT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().GT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Grimoires.Frame:GetDescendants() do
            if v.Name == "GrimoireName" then
                if v.Text ~= _G.Gv then
                    local args = {
                        [1] = "SOb",
                        [2] = "Grimoire"
                    }
                    
                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.Gv then
                    getgenv().GT = false
                    Tab4Toggle4:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle4:SetState(false)

local Tab4Dropdown5 = Section11:CreateDropdown("Kagunes",{"Eye Patch","Jason","Centipede","One Eye","Blue Steel"},function(Kdr)
    _G.Kv = Kdr
end)

local Tab4Toggle5 = Section11:CreateToggle("Toggle", nil, function(State)
	getgenv().KT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().KT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Kagunes.Frame:GetDescendants() do
            if v.Name == "KaguneName" then
                if v.Text ~= _G.Kv then
                    local args = {
                        [1] = "SOb",
                        [2] = "Kagune"
                    }
                    
                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.Kv then
                    getgenv().KT = false
                    Tab4Toggle5:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle5:SetState(false)

local Tab4Dropdown6 = Section12:CreateDropdown("Pyrokinesis",{"Electricity","Radiation","Devil's Flame","Severed Universe"},function(Pdr)
    _G.Pv = Pdr
end)

local Tab4Toggle6 = Section12:CreateToggle("Toggle", nil, function(State)
	getgenv().PT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
    while getgenv().PT do wait()
        for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Pyrokinesis.Frame:GetDescendants() do
            if v.Name == "PyrokinesisName" then
                if v.Text ~= _G.Pv then
                    local args = {
                        [1] = "SOb",
                        [2] = "Pyrokinesis"
                    }

                    game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                    wait(2)
                elseif v.Text == _G.Pv then
                    getgenv().PT = false
                    Tab4Toggle6:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                    wait()
                    break        
                end
            end
        end
    end
end)
Tab4Toggle6:SetState(false)

local Tab4Dropdown7 = Section13:CreateDropdown("Quirks",{"Belly Laser","Cremation","Half-Hot Half-Cold","Overhaul","One For Everything","Hell Flame"},function(Qdr)
    _G.Qv = Qdr
end)

local Tab4Toggle7 = Section13:CreateToggle("Toggle", nil, function(State)
	getgenv().QT = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
while getgenv().QT do wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Quirks.Frame:GetDescendants() do
        if v.Name == "QuirkName" then
            if v.Text ~= _G.Qv then
                local args = {
                    [1] = "SOb",
                    [2] = "Quirk"
                }
                    
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                wait(2)
            elseif v.Text == _G.Qv then
                getgenv().QT = false
                Tab4Toggle7:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                wait()
                break        
            end
        end
    end
end
end)
Tab4Toggle7:SetState(false)

local Tab4Dropdown8 = Section14:CreateDropdown("Stands",{"The Arm","Hierophant Lime", "Magician's Crimson", "Purple Smog", "Killer King", "Celestial Diamond", "Time Crusader", "Guardian's Arm", "Crafted in Heaven","Lord Crimson"},function(Sdr)
    _G.Sv = Sdr
end)

local Tab4Toggle8 = Section14:CreateToggle("Toggle", nil, function(State)
	getgenv().ST = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
while getgenv().ST do wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Stands.Frame:GetDescendants() do
        if v.Name == "StandName" then
            if v.Text ~= _G.Sv then
                local args = {
                    [1] = "SOb",
                    [2] = "Stand"
                }
                    
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                wait(2)
            elseif v.Text == _G.Sv then
                getgenv().ST = false
                Tab4Toggle8:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                wait()
                break        
            end
        end
    end
end
end)
Tab4Toggle8:SetState(false)

local Tab4Dropdown9 = Section15:CreateDropdown("Sword Style",{"Water Style","Thunder Style","Wind Style","Flame Style","Moon Style"},function(SSdr)
    _G.SSv = SSdr
end)

local Tab4Toggle9 = Section15:CreateToggle("Toggle", nil, function(State)
	getgenv().SST = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
while getgenv().SST do wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.BreathStyles.Frame:GetDescendants() do
        if v.Name == "BreathStyleName" then
            if v.Text ~= _G.SSv then
                local args = {
                    [1] = "SOb",
                    [2] = "BreathStyles"
                }
                    
                game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer(unpack(args))
                    
                wait(2)
            elseif v.Text == _G.SSv then
                getgenv().SST = false
                Tab4Toggle9:SetState(false)
                    Notify({
						Description = "You got the special!";
						Title = "Autobuy";
						Duration = 5;
					});
                wait()
                break        
            end
        end
    end
end
end)
Tab4Toggle9:SetState(false)

local Tab4Toggle10 = Section16:CreateToggle("Auto Off", nil, function(State)
	getgenv().CheckState = State
    
    local LocalPlayer = game:GetService("Players").LocalPlayer
while getgenv().CheckState do wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.BreathStyles.Frame:GetDescendants() do
        if v.Name == "BreathStyleName" then
            if v.Text == _G.SSv then
                Tab4Toggle9:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Stands.Frame:GetDescendants() do
        if v.Name == "StandName" then
            if v.Text == _G.Sv then
                Tab4Toggle8:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Quirks.Frame:GetDescendants() do
        if v.Name == "QuirkName" then
            if v.Text == _G.Qv then
                Tab4Toggle7:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Pyrokinesis.Frame:GetDescendants() do
        if v.Name == "PyrokinesisName" then
            if v.Text == _G.Pv then
                Tab4Toggle6:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Kagunes.Frame:GetDescendants() do
        if v.Name == "KaguneName" then
            if v.Text == _G.Kv then
                Tab4Toggle5:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Grimoires.Frame:GetDescendants() do
        if v.Name == "GrimoireName" then
            if v.Text == _G.Gv then
                Tab4Toggle4:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.CursedTechniques.Frame:GetDescendants() do
        if v.Name == "TechniqueName" then
            if v.Text == _G.CTv then
                Tab4Toggle3:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Bloodlines.Frame:GetDescendants() do
        if v.Name == "BloodlinesName" then
            if v.Text == _G.Bv then
                Tab4Toggle2:SetState(false)
                break 
            end
        end
    end
    wait()
    for k,v in next,LocalPlayer.PlayerGui.Main.Category.Frames.Specials.Container.Buttons.Arnament.Frame:GetDescendants() do
        if v.Name == "ArnamentName" then
            if v.Text == _G.Arv then
                Tab4Toggle1:SetState(false)
                break 
            end
        end
    end
end
end)
Tab4Toggle10:AddToolTip("Automatically Turn the toggles off\nIf you got the special that you want from Auto Buy")
Tab4Toggle10:SetState(false)

--// Tab 5 //

local Tab5Slider1 = Section17:CreateSlider("Walkspeed", 16,500,nil,true, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
Tab5Slider1:SetValue(126)

local Tab5Slider2 = Section17:CreateSlider("Jump Power", 50,500,nil,true, function(Value)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)
Tab5Slider2:SetValue(175)

local Tab5Slider3 = Section17:CreateSlider("Zoom", 70,1000,nil,true, function(Value)
	game.Players.LocalPlayer.CameraMaxZoomDistance = Value
end)
Tab5Slider3:SetValue(70)

local Tab5TextBox1 = Section17:CreateTextBox("Flyspeed", "Value", true, function(Value)
	local lp = game.Players.LocalPlayer
    local mc = lp.PlayerGui.Main.MainClient
    local fly, speedidx

for i, f in pairs(getconnections(lp.CharacterAdded)) do
    if f.Function and debug.getinfo(f.Function).short_src == mc:GetFullName() then
        fly = debug.getupvalues(f.Function)[1]
        for _, v in pairs(debug.getupvalues(fly)) do
            if v==20 and type(v) == "number" then
                speedidx = _
                break
            end
        end
    end
end

local function onCharacterAdded()
	repeat wait() until lp.Character and lp.Character:FindFirstChild('HumanoidRootPart') and lp.Character.HumanoidRootPart:FindFirstChild('BodyPosition')
	local bp = lp.Character.HumanoidRootPart.BodyPosition
	bp.Changed:Connect(function(prop)
		if prop == "Position" then
			debug.setupvalue(fly, speedidx or 22, Value)
		end
	end)
end
lp.CharacterAdded:Connect(onCharacterAdded)
onCharacterAdded()
end)

local Tab5Button1 = Section17:CreateButton("Redeem All Codes", function()
	local codes = {
        "gggames50k",
        "thankseveryonefor1mlikeweloveyou",
        "kelvin600k",
        "secretrazorfishcode",
        "Elemperadorinlive",
        "Mrrhino50k",
        "medtw50k",
        "Defildpromo",
        "vexostream",
        "subtofrangoforchikara",
        "elemperador100k!",
        "bigboi100k",
        "anotherbugfix",
        "sub2kelvin",
        "thanksbugfixes",
        "5000chikara",
        "Subtodefildplays",
        "Defildstream",
        "NNG",
        "sub2hakimbo",
        "emperadorsubs",
        "GGgames40k",
        "lastyearcode750k",
        "defild700k",
        "Tigre200k",
        "sub2emperadormaxi",
        "defild",
        "n1colas2sub",
        "tigretvsub",
        "tigretv2sub",
        "subfrango",
        "subn1colas",
        "L3NI",
        "Sub2tanqr",
        "sub2tplanetmilo",
        "subemperadormaxi",
        "frango2yen",
        "Defildyen",
        "fav75",
        "subtomrrhino",
        "sub2razorfishgaming",
        "subtokelvingts",
        "tigrehaveyen",
        "dwaxinstream",
        "emperadorstar",
        "frangonewcode",
        "follow2defildplays",
        "1billionvisits!",
        "dwax10k",
        "emperdor2kcode",
        "2millionsingroup!",
		"emperadorwapo",
		"sub2defildplays"
    }
    
    for index, code in ipairs(codes) do
        game:GetService("ReplicatedStorage").RSPackage.Events.GeneralFunction:InvokeServer("Code", code)
    end
end)

local Tab5Button2 = Section17:CreateButton("Rejoin", function()
	wait(1)
	game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

local Tab5Button3 = Section17:CreateButton("Serverhop", function()
	local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	else
		
	end
end)

local Tab5Button4 = Section17:CreateButton("Serverhop Lowest Player", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Jaaaaay2/AnotherScriptStore/main/Misc/Join%20Lowest%20Player"))()
end)

local Tab5Button5 = Section17:CreateButton("Anti Display Name", function()
	if not game['Loaded'] or not game:GetService('Players')['LocalPlayer'] then
        game['Loaded']:Wait();
        if game['PlaceId'] == '292439477' then return end -- (Phantom Forces).. maybe reduces lag, prevents bans etc
        game:WaitForChild(game:GetService('Players'));
        game:GetService('Players'):WaitForChild(game:GetService('Players').LocalPlayer.Name)
    end
    
    local Players = game:GetService('Players')
    local AppendName = function(plr)
        if plr:IsA('Player') and not (plr['Character'] and plr.Character ~= nil) then
            plr.CharacterAdded:wait()
            local HeadFound, HumFound = false, false
            local ChildAdded;ChildAdded = plr.Character.ChildAdded:Connect(function(v)
                if HeadFound and HumFound then ChildAdded:Disconnect() return end
                if v:IsA('BasePart') or v:IsA('MeshPart') and v.Name == 'Head' then
                    if HeadFound then return end
                    HeadFound = true
                    if v:IsA('MeshPart') and v.MeshId == 'rbxassetid://6686307858' then
                        local FakeName = Instance.new('BillboardGui')
                        local Name = Instance.new('TextLabel')
                        
                        FakeName.Name = 'FakeName'
                        FakeName.Parent = v
                        FakeName.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        FakeName.Active = true
                        FakeName.AlwaysOnTop = false
                        FakeName.LightInfluence = 1.000
                        FakeName.MaxDistance = 100.000
                        FakeName.Size = UDim2.new(1, 0, 3, 0)
                        FakeName.StudsOffset = Vector3.new(0, 1.7999999523163, 0)
                        FakeName.Adornee = v
                        
                        Name.Name = 'Name'
                        Name.Parent = FakeName
                        Name.Active = true
                        Name.AnchorPoint = Vector2.new(0.5, 0.5)
                        Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Name.BackgroundTransparency = 1.000
                        Name.BorderSizePixel = 0
                        Name.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Name.Size = UDim2.new(1, 30, 1, 0)
                        Name.Font = Enum.Font.SourceSans
                        Name.Text = plr.DisplayName..'\n['..tostring(plr.Name)..']'
                        Name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Name.TextScaled = true
                        Name.TextSize = 24.000
                        Name.TextStrokeTransparency = 0.600
                        Name.TextWrapped = true
                    end
                elseif v:IsA('Humanoid') then
                    if HumFound then return end
                    HumFound = true
                    if v.DisplayName ~= plr.Name and not v.DisplayName:gsub(' ', ''):find(plr.Name:gsub(' ', '')) then
                        v.DisplayName = plr.DisplayName..'\n[@'..tostring(plr.Name)..']'
                    end
                end
            end)
        elseif plr:IsA('Player') and (plr['Character'] and plr.Character ~= nil) and plr.Character:FindFirstChildOfClass('Humanoid') and plr.Character:FindFirstChild('Head') then
            local Char = plr.Character
    
            for _, v in next, Char:GetChildren() do
                coroutine.wrap(function()
                    if v.Name == 'Head' and v:IsA('MeshPart') and v.MeshId == 'rbxassetid://6686307858' then
                        local FakeName = Instance.new('BillboardGui')
                        local Name = Instance.new('TextLabel')
                        
                        FakeName.Name = 'FakeName'
                        FakeName.Parent = v
                        FakeName.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        FakeName.Active = true
                        FakeName.AlwaysOnTop = false
                        FakeName.LightInfluence = 1.000
                        FakeName.MaxDistance = 100.000
                        FakeName.Size = UDim2.new(1, 0, 3, 0)
                        FakeName.StudsOffset = Vector3.new(0, 1.7999999523163, 0)
                        FakeName.Adornee = v
                        
                        Name.Name = 'Name'
                        Name.Parent = FakeName
                        Name.Active = true
                        Name.AnchorPoint = Vector2.new(0.5, 0.5)
                        Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Name.BackgroundTransparency = 1.000
                        Name.BorderSizePixel = 0
                        Name.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Name.Size = UDim2.new(1, 30, 1, 0)
                        Name.Font = Enum.Font.SourceSans
                        Name.Text = plr.DisplayName..'\n['..tostring(plr.Name)..']'
                        Name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Name.TextScaled = true
                        Name.TextSize = 24.000
                        Name.TextStrokeTransparency = 0.600
                        Name.TextWrapped = true
                    elseif v:IsA('Humanoid') and v.DisplayName ~= plr.Name and not v.DisplayName:gsub(' ', ''):find(plr.Name:gsub(' ', '')) then
                        v.DisplayName = plr.DisplayName..'\n[@'..tostring(plr.Name)..']'
                    end
                end)()
            end
        end
        plr.CharacterAdded:Connect(function()
            local HeadFound, HumFound = false, false
            local ChildAdded;ChildAdded = plr.Character.ChildAdded:Connect(function(v)
                if HeadFound and HumFound then ChildAdded:Disconnect() return end
                if v:IsA('BasePart') or v:IsA('MeshPart') and v.Name == 'Head' then
                    if HeadFound then return end
                    HeadFound = true
                    if v:IsA('MeshPart') and v.MeshId == 'rbxassetid://6686307858' then
                        local FakeName = Instance.new('BillboardGui')
                        local Name = Instance.new('TextLabel')
                        
                        FakeName.Name = 'FakeName'
                        FakeName.Parent = v
                        FakeName.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        FakeName.Active = true
                        FakeName.AlwaysOnTop = false
                        FakeName.LightInfluence = 1.000
                        FakeName.MaxDistance = 100.000
                        FakeName.Size = UDim2.new(1, 0, 3, 0)
                        FakeName.StudsOffset = Vector3.new(0, 1.7999999523163, 0)
                        FakeName.Adornee = v
                        
                        Name.Name = 'Name'
                        Name.Parent = FakeName
                        Name.Active = true
                        Name.AnchorPoint = Vector2.new(0.5, 0.5)
                        Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                        Name.BackgroundTransparency = 1.000
                        Name.BorderSizePixel = 0
                        Name.Position = UDim2.new(0.5, 0, 0.5, 0)
                        Name.Size = UDim2.new(1, 30, 1, 0)
                        Name.Font = Enum.Font.SourceSans
                        Name.Text = plr.DisplayName..'\n['..tostring(plr.Name)..']'
                        Name.TextColor3 = Color3.fromRGB(255, 255, 255)
                        Name.TextScaled = true
                        Name.TextSize = 24.000
                        Name.TextStrokeTransparency = 0.600
                        Name.TextWrapped = true
                    end
                elseif v:IsA('Humanoid') then
                    if HumFound then return end
                    HumFound = true
                    if v.DisplayName ~= plr.Name and not v.DisplayName:gsub(' ', ''):find(plr.Name:gsub(' ', '')) then
                        v.DisplayName = plr.DisplayName..'\n[@'..tostring(plr.Name)..']'
                    end
                end
            end)
        end)
    end
    
    for _, plr in next, Players:GetPlayers() do
        if plr ~= game:GetService('Players').LocalPlayer then
            coroutine.wrap(function()
                AppendName(plr)
            end)()
        end
    end
    
    Players.PlayerAdded:Connect(function(plr)
        AppendName(plr)
    end)
end)

local Tab5Button6 = Section17:CreateButton("Show/Hide Total Power", function()
	local a = game:GetService("Players"):GetChildren()

	while wait() do
		for i = 1,#a do
			if not game:GetService("Workspace")[a[i].Name].HumanoidRootPart then
				game:GetService("Workspace")[a[i].Name].HumanoidRootPart.TotalPower.Enabled = false
				wait()
			elseif game:GetService("Workspace")[a[i].Name].HumanoidRootPart then
				game:GetService("Workspace")[a[i].Name].HumanoidRootPart.TotalPower.Enabled = true
				wait()
			end
		end
	end
end)
Tab5Button6:AddToolTip("Show/Hide Everyone's Total Power\n Applies only for people with conceal power gamepass")
--// Section M //
local ToggleM1 = SectionM1:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
ToggleM1:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
ToggleM1:SetState(true)

local ColorpickerM1 = SectionM1:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
ColorpickerM1:UpdateColor(Config.Color)

local DropdownM1 = SectionM1:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")
		
