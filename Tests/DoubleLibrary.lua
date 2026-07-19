-- ///////////// CHECAR JOGO ///////////// --

if game.PlaceId == 893973440 then
    
    -- ///////// VARIAVEIS ///////// --

    local syn = getgenv().syn
    getgenv().syn = false

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local Lighting = game:GetService("Lighting")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Player = Players.LocalPlayer
    local LocalPlayer = Player

    -- ///////// LIBRARY | INICIO ///////// --

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Tests/DoubleLibrary.lua"))()

-- local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/LibraryV1/LibraryV1/Tests/SourceTester.lua"))()
        
    -- ///////// WINDOW ///////// --

    local Window =
         OrionLib:MakeWindow({
            Name = "Six Hub | Flee The Facility",
            HidePremium = false,
            SaveConfig = true,
            ConfigFolder = "SixHub",
            IntroEnabled = true,
            IntroText = "Welcome to Six Hub, " .. Player.DisplayName,
            IntroIcon = "rbxassetid://18503600329",
            ShowIcon = true,
            Icon = "rbxassetid://18503600329",
            SearchBar = true
        })

    -- ///////// MINIMIZE ///////// --

    OrionLib:BtnMinimize({
            Button = {
                Size = UDim2.new(0, 50, 0, 50),
                Position = UDim2.new(0, 10, 1, -160),
                BackgroundColor3 = Color3.new(0.2, 0.2, 0.2),
                Image = "rbxassetid://18503887946"
            },
            Corner = {
                CornerRadius = UDim.new(0.1, 0)
            }
         })

    -- ///////////// SCRIPTS ///////////// --

    local currentMapObject = ReplicatedStorage:FindFirstChild("CurrentMap")
    
    local function getBeastPlayer()
        for _, p in pairs(Players:GetPlayers()) do
            local stats = p:FindFirstChild("TempPlayerStatsModule")
            if stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value == true then
                return p
            end
        end
        return nil
    end
    
    local function isLocalBeast()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value == true
    end
    
    local function getCharacter()
        return LocalPlayer.Character
    end
    
    local function getHumanoid()
        local char = getCharacter()
        return char and char:FindFirstChildOfClass("Humanoid")
    end
    
    local function getHumanoidRootPart()
        local char = getCharacter()
        return char and char:FindFirstChild("HumanoidRootPart")
    end

    -- ///////////// APIs ///////////// --

    local api = {}
    
    function api:notify(Name, Content, Image, Time, Closable)
        OrionLib:MakeNotification(
            {
                Name = Name,
                Content = Content,
                Image = Image,
                Time = Time,
                Closable = (Closable == nil) and true or Closable
            }
        )
    end
    
    function api:getCurrentMap()
        if not currentMapObject then
            return nil
        end
        local v = currentMapObject.Value
        return type(v) == "string" and v or nil
    end
    
    function api:getCurrentMapModel()
        local mapName = api:getCurrentMap()
        if not mapName then
            return nil
        end
        return workspace:FindFirstChild(mapName)
    end

    -- ///////////// TABS ///////////// --

    local Infos =
        Window:MakeTab({
            Name = "Infos/Credits",
            Icon = "rbxassetid://15841490359"
        })
    
    local Main =
        Window:MakeTab({
            Name = "Main",
            Icon = "rbxassetid://10723407389"
        })
    
    local Beast =
        Window:MakeTab({
            Name = "Beast",
            Icon = "rbxassetid://114129233283600"
        })
    
    local Survivor =
        Window:MakeTab({
            Name = "Survivor",
            Icon = "rbxassetid://99466139675639"
        })
    
    local Visual =
        Window:MakeTab({
            Name = "Visual/ESP",
            Icon = "rbxassetid://10723346959"
        })

    local Teleport =
        Window:MakeTab({
            Name = "Teleports",
            Icon = "rbxassetid://81349737972173"
        })
    
    local Humanoid =
        Window:MakeTab({
            Name = "Humanoid",
            Icon = "rbxassetid://76306747363252"
        })
    
    local Misc =
        Window:MakeTab({
            Name = "Misc",
            Icon = "rbxassetid://121467841215193"
        })
    
    local Settings =
        Window:MakeTab({
            Name = "Settings",
            Icon = "rbxassetid://7734053495"
        })

-- =========== INFO/CREDITS ===========

local Creditos = Infos:AddSection({
    Name = "Credits",
    Icon = "rbxassetid://15841490359",
    Collapsible = false,
})

Creditos:AddParagraph(
    "<b>Made with <font color='#ff9999'>love</font> by <font color='#ff9999'>ySixx</font></b>",
    "<i>I vanished for a while, but the spark never died. Now I'm back maybe just for this project, maybe for the long run. Either way, the journey continues.</i><br/><br/><font color='#dddddd'>Hope you enjoy the experience.</font> <b>Join the Discord server to stay updated.</b>"
)

Creditos:AddParagraph(
    "<b>Need help or have ideas?</b>",
    "<font color='#ffbb88'>If you find a bug, have a suggestion, or simply want to chat, reach out on <b>Discord</b> or join our community using the links below.</font> <i>Your feedback matters.</i>"
)


-- > Discord

local Discord = Infos:AddSection({
    Name = "Server Discord",
    Icon = "rbxassetid://130701884508915",
    Collapsible = false,
})

Discord:AddDiscordInvite({
    ServerName = "Six Hub Community",
    InviteLink = "https://discord.gg/NzN4eKWx5d",
    Icon = "rbxassetid://18503887946",
    Description = "Join the community for scripts, updates, and support.",
})

-- > Social Media

local SocialMedia = Infos:AddSection({
    Name = "Social Media",
    Icon = "rbxassetid://7734032056",
    Collapsible = false,
})

SocialMedia:AddLinks({
    ServerName = "GitHub",
    InviteLink = "https://github.com/ySixxNz",
    Icon = "rbxassetid://140372804208079",
    Description = "My GitHub Profile",
})

SocialMedia:AddLinks({
    ServerName = "Discord Account",
    InviteLink = "https://discord.com/users/130701884508915",
    Icon = "rbxassetid://130701884508915",
    Description = "My Discord Profile",
})

SocialMedia:AddLinks({
    ServerName = "YouTube",
    InviteLink = "https://youtube.com/@ysixxnz",
    Icon = "rbxassetid://138786416771641",
    Description = "My YouTube Channel",
})

SocialMedia:AddLinks({
    ServerName = "ScriptBlox",
    InviteLink = "https://scriptblox.com/u/ySixxNz",
    Icon = "rbxassetid://106729456824762",
    Description = "My ScriptBlox Profile",
})

Infos:AddParagraph(
    "<b>More features coming soon.</b>",
    "<i>Please be kind to the 'artist' (yes, that's me lol)</i>"
)

-- =========== MAIN TAB =========== --

-- ======================================
--            NEVER FAIL PC
-- ======================================

local FailPC = Main:AddSection({
    Name = "Never Fail PC",
    Icon = "rbxassetid://120392486145093",
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local NeverFailPC = {}
do
    local enabled = false
    local oldNamecall = nil
    local oldIndex = nil
    local hooked = false
    local connections = {}
    local loop = nil

    local methods = {"SetPlayerMinigameResult", "MinigameResult", "PCResult", "PCMinigameResult", "SetMinigame", "CompleteMinigame"}
    local invokes = {"GetMinigameResult", "CheckPCResult", "GetPCResult", "CheckMinigame"}
    
    local methodLookup = {}
    for _, name in ipairs(methods) do methodLookup[name] = true end
    local invokeLookup = {}
    for _, name in ipairs(invokes) do invokeLookup[name] = true end

    local function clearConnections()
        for _, conn in ipairs(connections) do
            pcall(function() conn:Disconnect() end)
        end
        connections = {}
        if loop then loop:Disconnect() loop = nil end
    end

    local function getRemote()
        return ReplicatedStorage:FindFirstChild("RemoteEvent")
    end

    local function installHook()
        if hooked then return end
        local success = pcall(function()
            local mt = getrawmetatable(game)
            if not mt then return end
            oldNamecall = mt.__namecall
            oldIndex = mt.__index
            setreadonly(mt, false)

            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "Teleport" or method == "TeleportToPlaceInstance" or method == "TeleportAsync" then
                    return oldNamecall(self, ...)
                end

                local args = {...}

                if enabled then
                    if method == "FireServer" and typeof(args[1]) == "string" then
                        if methodLookup[args[1]] then
                            args[2] = true
                            return oldNamecall(self, unpack(args))
                        end
                    elseif method == "InvokeServer" and typeof(args[1]) == "string" then
                        if invokeLookup[args[1]] then
                            return true
                        end
                    end
                end

                return oldNamecall(self, unpack(args))
            end)

            mt.__index = newcclosure(function(self, key)
                if enabled and type(key) == "string" then
                    if methodLookup[key] then
                        return function() end
                    end
                end
                if oldIndex then
                    return oldIndex(self, key)
                end
                return nil
            end)

            setreadonly(mt, true)
            hooked = true
        end)
        return success
    end

    local function uninstallHook()
        if not hooked then return end
        pcall(function()
            local mt = getrawmetatable(game)
            if not mt then return end
            setreadonly(mt, false)
            if oldNamecall then mt.__namecall = oldNamecall end
            if oldIndex then mt.__index = oldIndex end
            setreadonly(mt, true)
            hooked = false
        end)
    end

    local function handleMinigame()
        if not enabled then return end
        
        local remote = getRemote()
        if remote then
            pcall(function()
                remote:FireServer("SetPlayerMinigameResult", true)
            end)
        end
        
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        if stats then
            local minigameResult = stats:FindFirstChild("MinigameResult")
            if minigameResult and minigameResult.Value == false then
                minigameResult.Value = true
            end
        end
    end

    local function setupListeners()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        if stats then
            local minigameResult = stats:FindFirstChild("MinigameResult")
            if minigameResult then
                local conn = minigameResult:GetPropertyChangedSignal("Value"):Connect(function()
                    if enabled and minigameResult.Value == false then
                        minigameResult.Value = true
                        local remote = getRemote()
                        if remote then
                            remote:FireServer("SetPlayerMinigameResult", true)
                        end
                    end
                end)
                table.insert(connections, conn)
            end
        end

        if not loop then
            loop = RunService.Heartbeat:Connect(handleMinigame)
        end
        
        local conn2 = LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            if enabled then
                handleMinigame()
            end
        end)
        table.insert(connections, conn2)
        
        local conn3 = ReplicatedStorage.ChildAdded:Connect(function(child)
            if child:IsA("RemoteEvent") or child:IsA("RemoteFunction") then
                task.wait(0.1)
                if enabled then
                    handleMinigame()
                end
            end
        end)
        table.insert(connections, conn3)
    end

    function NeverFailPC.Enable()
        if enabled then return end
        enabled = true
        clearConnections()
        installHook()
        setupListeners()
        handleMinigame()
    end

    function NeverFailPC.Disable()
        if not enabled then return end
        enabled = false
        uninstallHook()
        clearConnections()
    end
end

FailPC:AddToggle({
    Name = "Never Fail PCs",
    Default = false,
    Save = true,
    Flag = "NeverFailPC",
    Callback = function(v)
        if v then
            NeverFailPC.Enable()
        else
            NeverFailPC.Disable()
        end
    end,
})

-- ======================================
--            AUTO INTERACT
-- ======================================

local AutoInteractS = Main:AddDoubleSection({
    Name = "Auto Interact",
    Icon = "rbxassetid://7734010488"
})

local AutoInteract = {} do

    local enabled    = false
    local options    = { "All" }
    local heartbeat  = nil
    local exitConn   = nil
    local propConns  = {}

    local FIRE_CD        = 0.03
    local EXIT_CD        = 0.2
    local CACHE_INTERVAL = 0.4
    local WATCHER_CD     = 0.5

    local lastFire        = 0
    local lastExit        = 0
    local lastCacheUpd    = 0
    local lastExitUpd     = 0
    local lastWatcher     = 0

    local cachedBox       = nil
    local cachedExitAreas = {}

    local keywords = {
        Door      = { "open", "abrir", "door", "porta", "close", "fechar" },
        PC        = { "hack", "hackear", "pc", "computer", "computador", "hackar", "hacka" },
        ExitDoor  = { "exit", "saida", "escape", "sair", "leave", "partir", "abrir porta", "exit door", "open exit door" },
        FreezePod = { "freeze", "congelar", "pod", "capsula", "free", "livre", "store", "armazenar",
                      "deposit", "depositar", "insert", "inserir", "survivor", "sobrevivente", "cryo",
                      "chamber", "camara", "capsule", "entrar", "enter", "colocar", "place", "guardar",
                      "save", "salvar", "slot", "vaga", "lock", "travar", "frozen", "congelado",
                      "tube", "tubo", "tank", "tanque", "trap", "armadilha" }
    }

    local function optEnabled(cat)
        for _, o in ipairs(options) do
            if o == "All" or o == cat then return true end
        end
        return false
    end

    local function boxMatches(text)
        if not text or text == "" then return false end
        for _, o in ipairs(options) do
            if o == "All" then return true end
        end
        local lower = string.lower(text)
        for cat, kws in pairs(keywords) do
            if optEnabled(cat) then
                for _, kw in ipairs(kws) do
                    if string.find(lower, kw, 1, true) then return true end
                end
            end
        end
        return false
    end

    local function getActionBox()
        local now = tick()
        if cachedBox and cachedBox.Parent and now - lastCacheUpd < CACHE_INTERVAL then return cachedBox end
        lastCacheUpd = now
        local gui = LocalPlayer:FindFirstChild("PlayerGui")
        if gui then
            for _, g in ipairs(gui:GetChildren()) do
                local b = g:FindFirstChild("ActionBox", true)
                if b then cachedBox = b return b end
            end
        end
        cachedBox = nil
        return nil
    end

    local function getExitAreas()
        local now = tick()
        if now - lastExitUpd < CACHE_INTERVAL then return cachedExitAreas end
        lastExitUpd = now
        cachedExitAreas = {}
        for _, obj in ipairs(workspace:GetChildren()) do
            if obj.Name == "ExitArea" and obj:IsA("BasePart") then
                table.insert(cachedExitAreas, obj)
            elseif obj.Name == "ExitDoor" then
                local area = obj:FindFirstChild("ExitArea")
                if area and area:IsA("BasePart") then table.insert(cachedExitAreas, area) end
                if obj:IsA("BasePart") then table.insert(cachedExitAreas, obj) end
            end
        end
        return cachedExitAreas
    end

    local function fireInteract()
        local now = tick()
        if now - lastFire < FIRE_CD then return end
        lastFire = now
        pcall(function()
            local r = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if r then r:FireServer("Input", "Action", true) end
        end)
    end

    local function fireExitInteract()
        local now = tick()
        if now - lastExit < EXIT_CD then return end
        lastExit = now
        pcall(function()
            local r = ReplicatedStorage:FindFirstChild("RemoteEvent")
            if r then
                r:FireServer("Input", "Action", true)
                r:FireServer("Input", "Trigger", true, nil)
                r:FireServer("Interact")
            end
        end)
    end

    local function nearExit()
        if not optEnabled("ExitDoor") then return false end
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return false end
        for _, area in ipairs(getExitAreas()) do
            if area and area:IsA("BasePart") and area.Parent then
                if (area.Position - hrp.Position).Magnitude < 12 then return true end
            end
        end
        return false
    end

    local function tryInteract()
        if not enabled then return end
        local box = getActionBox()
        if box and box.Visible and boxMatches(box.Text) then fireInteract() end
        if nearExit() then fireExitInteract() end
    end

    local function clearPropConns()
        for _, c in ipairs(propConns) do pcall(function() c:Disconnect() end) end
        propConns = {}
    end

    local function setupWatchers()
        clearPropConns()
        local box = getActionBox()
        if not box then return end
        local function onChanged()
            if enabled and box.Visible and boxMatches(box.Text) then fireInteract() end
        end
        table.insert(propConns, box:GetPropertyChangedSignal("Visible"):Connect(onChanged))
        table.insert(propConns, box:GetPropertyChangedSignal("Text"):Connect(onChanged))
    end

    local function setupExitTouch()
        if exitConn then pcall(function() exitConn:Disconnect() end) exitConn = nil end
        if not optEnabled("ExitDoor") then return end
        task.spawn(function()
            task.wait(0.5)
            local areas = getExitAreas()
            if #areas > 0 then
                local area = areas[1]
                if area and area:IsA("BasePart") then
                    exitConn = area.Touched:Connect(function(hit)
                        if not enabled then return end
                        local char = LocalPlayer.Character
                        if char and hit:IsDescendantOf(char) then fireExitInteract() end
                    end)
                end
            end
        end)
    end

    local function startHeartbeat()
        if heartbeat then return end
        heartbeat = RunService.Heartbeat:Connect(function()
            if not enabled then return end
            local now = tick()
            if now - lastWatcher >= WATCHER_CD then
                lastWatcher = now
                if #propConns == 0 then setupWatchers() end
            end
            tryInteract()
        end)
    end

    local function stopHeartbeat()
        if heartbeat then pcall(function() heartbeat:Disconnect() end) heartbeat = nil end
        if exitConn  then pcall(function() exitConn:Disconnect()  end) exitConn  = nil end
    end

    if currentMapObject then
        currentMapObject:GetPropertyChangedSignal("Value"):Connect(function()
            if enabled then task.delay(1, setupExitTouch) end
        end)
    end

    function AutoInteract.SetOptions(v) options = v if enabled then setupExitTouch() end end

    function AutoInteract.Enable()
        enabled = true
        setupWatchers()
        setupExitTouch()
        startHeartbeat()
    end

    function AutoInteract.Disable()
        enabled = false
        stopHeartbeat()
        clearPropConns()
    end

end

AutoInteractS:AddMultiDropdown({
    Name = "Interact Filter",
    Options = { "All", "Door", "PC", "ExitDoor", "FreezePod" },
    Default = { "All" },
    MaxSelections = 0,
    Save = true,
    Flag = "AutoInteractOptions",
    Callback = function(v)
        AutoInteract.SetOptions(v)
    end
})

AutoInteractS:AddToggle({
    Name = "Auto Interact",
    Default = false,
    Save = true,
    Flag = "AutoInteract",
    Callback = function(v)
        if v then AutoInteract.Enable() else AutoInteract.Disable() end
    end
})

-- ======================================
--               OTHERS
-- ======================================

local MiscMainTab = Main:AddSection({
    Name = "Others",
    Icon = "rbxassetid://121080677465007"
})

-- Full Bright

local FullBright = {} do

    local enabled     = false
    local loop        = nil
    local atmoConns   = {}
    local lastCheck   = 0
    local defaults    = {}

    local function saveDefaults()
        defaults.Brightness              = Lighting.Brightness
        defaults.ClockTime               = Lighting.ClockTime
        defaults.FogEnd                  = Lighting.FogEnd
        defaults.FogStart                = Lighting.FogStart
        defaults.FogColor                = Lighting.FogColor
        defaults.GlobalShadows           = Lighting.GlobalShadows
        defaults.Ambient                 = Lighting.Ambient
        defaults.OutdoorAmbient          = Lighting.OutdoorAmbient
        defaults.EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale
        defaults.EnvironmentSpecularScale= Lighting.EnvironmentSpecularScale
        defaults.ExposureCompensation    = Lighting.ExposureCompensation
        defaults.ShadowSoftness          = Lighting.ShadowSoftness
        defaults.Technology              = Lighting.Technology
        defaults.effects = {}
        for _, child in ipairs(Lighting:GetChildren()) do
            if child:IsA("Atmosphere") then
                defaults.effects[child] = { Density = child.Density, Haze = child.Haze, Glare = child.Glare, Offset = child.Offset }
            else
                pcall(function() defaults.effects[child] = child.Enabled end)
            end
        end
    end

    local function clearAtmo(obj)
        pcall(function() obj.Density = 0 obj.Haze = 0 obj.Glare = 0 obj.Offset = 0 end)
    end

    local function apply()
        if not enabled then return end
        pcall(function()
            Lighting.Brightness               = 3
            Lighting.ClockTime                = 14
            Lighting.FogEnd                   = 999999999
            Lighting.FogStart                 = 999999999
            Lighting.FogColor                 = Color3.fromRGB(0, 0, 0)
            Lighting.GlobalShadows            = false
            Lighting.Ambient                  = Color3.fromRGB(178, 178, 178)
            Lighting.OutdoorAmbient           = Color3.fromRGB(178, 178, 178)
            Lighting.EnvironmentDiffuseScale  = 0
            Lighting.EnvironmentSpecularScale = 0
            Lighting.ExposureCompensation     = 0
            Lighting.ShadowSoftness           = 0
            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA("Atmosphere") then
                    clearAtmo(child)
                elseif child:IsA("ColorCorrectionEffect") or child:IsA("BloomEffect") or
                       child:IsA("SunRaysEffect") or child:IsA("DepthOfFieldEffect") or child:IsA("BlurEffect") then
                    pcall(function() child.Enabled = false end)
                end
            end
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("Atmosphere") then clearAtmo(obj) end
            end
        end)
    end

    local function watchAtmo()
        for _, c in ipairs(atmoConns) do c:Disconnect() end
        atmoConns = {}
        table.insert(atmoConns, workspace.DescendantAdded:Connect(function(obj)
            if enabled and obj:IsA("Atmosphere") then task.wait(0.1) clearAtmo(obj) end
        end))
        table.insert(atmoConns, Lighting.ChildAdded:Connect(function(obj)
            if enabled and obj:IsA("Atmosphere") then task.wait(0.1) clearAtmo(obj) end
        end))
    end

    local function stopWatch()
        for _, c in ipairs(atmoConns) do c:Disconnect() end
        atmoConns = {}
    end

    local function restore()
        pcall(function()
            Lighting.Brightness               = defaults.Brightness               or 2
            Lighting.ClockTime                = defaults.ClockTime                or 14
            Lighting.FogEnd                   = defaults.FogEnd                   or 100000
            Lighting.FogStart                 = defaults.FogStart                 or 0
            Lighting.FogColor                 = defaults.FogColor                 or Color3.fromRGB(0,0,0)
            Lighting.GlobalShadows            = defaults.GlobalShadows ~= nil and defaults.GlobalShadows or true
            Lighting.Ambient                  = defaults.Ambient                  or Color3.fromRGB(70,70,70)
            Lighting.OutdoorAmbient           = defaults.OutdoorAmbient           or Color3.fromRGB(63,103,100)
            Lighting.EnvironmentDiffuseScale  = defaults.EnvironmentDiffuseScale  or 0
            Lighting.EnvironmentSpecularScale = defaults.EnvironmentSpecularScale or 0
            Lighting.ExposureCompensation     = defaults.ExposureCompensation     or 0
            Lighting.ShadowSoftness           = defaults.ShadowSoftness           or 0.5
            Lighting.Technology               = defaults.Technology               or Enum.Technology.Future
            for child, data in pairs(defaults.effects or {}) do
                if child and child.Parent then
                    if child:IsA("Atmosphere") then
                        pcall(function()
                            child.Density = data.Density or 0
                            child.Haze    = data.Haze    or 0
                            child.Glare   = data.Glare   or 0
                            child.Offset  = data.Offset  or 0
                        end)
                    else
                        pcall(function() child.Enabled = data end)
                    end
                end
            end
        end)
    end

    saveDefaults()

    function FullBright.Enable()
        enabled = true
        apply()
        watchAtmo()
        if loop then return end
        loop = RunService.Heartbeat:Connect(function()
            if not enabled then return end
            local now = tick()
            if now - lastCheck < 1 then return end
            lastCheck = now
            if Lighting.FogEnd < 999999 or Lighting.Ambient ~= Color3.fromRGB(178, 178, 178) then apply() end
            for _, child in ipairs(Lighting:GetChildren()) do
                if child:IsA("Atmosphere") and child.Density > 0 then clearAtmo(child) end
            end
        end)
    end

    function FullBright.Disable()
        enabled = false
        if loop then loop:Disconnect() loop = nil end
        stopWatch()
        restore()
    end

end

MiscMainTab:AddToggle({
    Name = "Full Bright",
    Default = false,
    Flag = "FullBright",
    Save = false,
    Callback = function(v)
        if v then FullBright.Enable() else FullBright.Disable() end
    end
})

-- Anti Ragdoll

local AntiRagdoll = {} do

    local enabled = false
    local thread  = nil

    local function isRagdolled()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("Ragdoll") and stats.Ragdoll.Value == true
    end

    function AntiRagdoll.Enable()
        enabled = true
        if thread then return end
        thread = task.spawn(function()
            while enabled do
                task.wait()
                pcall(function()
                    local h = getHumanoid()
                    if h and not isLocalBeast() then
                        h:SetStateEnabled(Enum.HumanoidStateType.Physics,         false)
                        h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,         false)
                        h:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
                        if isRagdolled() then
                            h:ChangeState(Enum.HumanoidStateType.GettingUp)
                            h:ChangeState(Enum.HumanoidStateType.Running)
                        end
                        h:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                        h.JumpPower = 36
                    end
                end)
            end
        end)
    end

    function AntiRagdoll.Disable()
        enabled = false
        if thread then task.cancel(thread) thread = nil end
        pcall(function()
            local h = getHumanoid()
            if h then
                h:SetStateEnabled(Enum.HumanoidStateType.Physics,          true)
                h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,          true)
                h:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding, true)
                h:SetStateEnabled(Enum.HumanoidStateType.Jumping,          true)
            end
        end)
    end

end

MiscMainTab:AddToggle({
    Name = "Anti Ragdoll",
    Default = false,
    Flag = "AntiRagdoll",
    Save = false,
    Callback = function(v)
        if v then AntiRagdoll.Enable() else AntiRagdoll.Disable() end
    end
})

Main:AddLabel("More features coming soon. Future updates will include new tools, improvements and additional functionality.")

-- ========== BEAST TAB ========== --

local BeastSystem = {} do

    local beastSection = Beast:AddSection({
        Name = "Beast",
        Icon = "rbxassetid://114129233283600"
    })

    beastSection:AddParagraph(
        "<b>Beast Section</b>",
        [[<b>Auto Hit:</b> Automatically strikes nearby survivors
<b>Auto Rope:</b> Ties up survivors automatically in range
<b>Anti Slow:</b> Prevents movement speed reduction
<b>Ragdoll Progress:</b> Shows escape progress above captured players
<b>Third Person:</b> Forces third-person camera view]]
    )

    -- ======================================
    --               CONSTANTS
    -- ======================================

    local HIT_RANGE        = 32
    local HIT_COOLDOWN     = 0.2
    local ROPE_COOLDOWN    = 0.3
    local REAPPLY_COOLDOWN = 1
    local BASE_SPEED       = 17
    local BASE_JUMP        = 36

    -- ======================================
    --                STATE
    -- ======================================

    local hitEnabled        = false
    local ropeEnabled       = false
    local antiSlowEnabled   = false
    local thirdPersonEnabled = false
    local ragdollEspEnabled = false

    local beastConn     = nil
    local antiSlowConn  = nil
    local ragdollConn   = nil

    local ropedTargets    = {}
    local ragdollBoards   = {}
    local beastWhitelist  = {}

    local lastHit     = 0
    local lastRope    = 0
    local lastReapply = 0

    -- ======================================
    --              HELPERS
    -- ======================================

    local function isBeast()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value == true
    end

    local function getHammerEvent(char)
        if not char then return end
        for _, child in ipairs(char:GetChildren()) do
            if child.Name:lower():find("hammer") and child:FindFirstChild("HammerEvent") then
                return child.HammerEvent
            end
        end
    end

    local function getTargets(char, range)
        local list = {}
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return list end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and not beastWhitelist[p.UserId] and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - root.Position).Magnitude <= range then
                    local torso = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso")
                    if torso then
                        table.insert(list, { player = p, torso = torso, hrp = hrp })
                    end
                end
            end
        end
        return list
    end

    local function hasRope(player)
        if not player or not player.Character then return false end
        for _, d in ipairs(player.Character:GetDescendants()) do
            if d:IsA("RopeConstraint") or d:IsA("SpringConstraint") then return true end
        end
        return false
    end

    local function isRagdolled(player)
        local stats = player:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("Ragdoll") and stats.Ragdoll.Value == true
    end

    local function getProgress(player)
        local stats = player:FindFirstChild("TempPlayerStatsModule")
        local prog  = stats and stats:FindFirstChild("ActionProgress")
        return prog and prog.Value or 0
    end

    -- ======================================
    --            BEAST MAIN LOOP
    -- ======================================

    local function onBeastTick()
        if not isBeast() then return end
        local char  = getCharacter()
        local event = getHammerEvent(char)
        local now   = tick()

        if thirdPersonEnabled then
            pcall(function()
                LocalPlayer.CameraMaxZoomDistance = 99999
                LocalPlayer.CameraMode = Enum.CameraMode.Classic
                local cam = workspace.CurrentCamera
                if cam then
                    cam.CameraType = Enum.CameraType.Classic
                    cam.FieldOfView = 70
                end
            end)
        end

        if event and char and char:FindFirstChild("HumanoidRootPart") then

            if hitEnabled and now - lastHit >= HIT_COOLDOWN then
                lastHit = now
                for _, t in ipairs(getTargets(char, HIT_RANGE)) do
                    pcall(function() event:FireServer("HammerHit", t.torso) end)
                end
                pcall(function() event:FireServer("HammerHit") end)
            end

            if ropeEnabled then
                if now - lastRope >= ROPE_COOLDOWN then
                    lastRope = now
                    for _, t in ipairs(getTargets(char, HIT_RANGE)) do
                        pcall(function()
                            event:FireServer("HammerTieUp", t.torso, t.hrp.Position)
                            ropedTargets[t.player.Name] = now
                        end)
                    end
                    pcall(function() event:FireServer("HammerTieUp") end)
                end

                if now - lastReapply >= REAPPLY_COOLDOWN then
                    lastReapply = now
                    for _, t in ipairs(getTargets(char, HIT_RANGE + 18)) do
                        local wasRoped = ropedTargets[t.player.Name] and (now - ropedTargets[t.player.Name] < 5)
                        if wasRoped and not hasRope(t.player) then
                            local torso = t.player.Character and (t.player.Character:FindFirstChild("Torso") or t.player.Character:FindFirstChild("UpperTorso"))
                            if torso then
                                pcall(function()
                                    event:FireServer("HammerTieUp", torso, t.hrp.Position)
                                    ropedTargets[t.player.Name] = now
                                end)
                            end
                        end
                    end
                end
            end
        end
    end

    local function syncBeastLoop()
        if hitEnabled or ropeEnabled or thirdPersonEnabled then
            if beastConn then return end
            beastConn = RunService.Heartbeat:Connect(onBeastTick)
        else
            if beastConn then beastConn:Disconnect() beastConn = nil end
        end
    end

    -- ======================================
    --              ANTI SLOW
    -- ======================================

    local function startAntiSlow()
        if antiSlowConn then return end
        antiSlowConn = RunService.Heartbeat:Connect(function()
            if not antiSlowEnabled or not isBeast() then return end
            local h = getHumanoid()
            if h then
                if h.WalkSpeed < BASE_SPEED then h.WalkSpeed = BASE_SPEED end
                if h.JumpPower  < BASE_JUMP  then h.JumpPower  = BASE_JUMP  end
            end
        end)
    end

    local function stopAntiSlow()
        if antiSlowConn then antiSlowConn:Disconnect() antiSlowConn = nil end
    end

    -- ======================================
    --           RAGDOLL PROGRESS ESP
    -- ======================================

    local function removeBoard(player)
        local data = ragdollBoards[player]
        if data and data.Billboard then data.Billboard:Destroy() end
        ragdollBoards[player] = nil
    end

    local function createBoard(player)
        if ragdollBoards[player] then return end
        local char = player.Character
        local head = char and char:FindFirstChild("Head")
        if not head then return end

        local billboard = Instance.new("BillboardGui")
        billboard.Name        = "RagdollTimerESP"
        billboard.Size        = UDim2.new(0, 140, 0, 36)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Adornee     = head
        billboard.Parent      = head

        local container = Instance.new("Frame")
        container.Size                  = UDim2.new(1, 0, 1, 0)
        container.BackgroundColor3      = Color3.fromRGB(10, 10, 15)
        container.BackgroundTransparency = 0.25
        container.BorderSizePixel       = 0
        container.Parent                = billboard

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent       = container

        local stroke = Instance.new("UIStroke")
        stroke.Color        = Color3.fromRGB(80, 80, 120)
        stroke.Thickness    = 1
        stroke.Transparency = 0.5
        stroke.Parent       = container

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size               = UDim2.new(1, -8, 0, 13)
        nameLabel.Position           = UDim2.new(0, 4, 0, 2)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3         = Color3.fromRGB(220, 220, 255)
        nameLabel.Font               = Enum.Font.GothamBold
        nameLabel.TextSize           = 9
        nameLabel.TextXAlignment     = Enum.TextXAlignment.Left
        nameLabel.Text               = player.DisplayName
        nameLabel.Parent             = container

        local barBg = Instance.new("Frame")
        barBg.Size             = UDim2.new(1, -8, 0, 8)
        barBg.Position         = UDim2.new(0, 4, 0, 17)
        barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
        barBg.BorderSizePixel  = 0
        barBg.Parent           = container

        local barBgCorner = Instance.new("UICorner")
        barBgCorner.CornerRadius = UDim.new(0, 4)
        barBgCorner.Parent       = barBg

        local bar = Instance.new("Frame")
        bar.Name             = "Progress"
        bar.Size             = UDim2.new(0, 0, 1, 0)
        bar.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        bar.BorderSizePixel  = 0
        bar.Parent           = barBg

        local barCorner = Instance.new("UICorner")
        barCorner.CornerRadius = UDim.new(0, 4)
        barCorner.Parent       = bar

        local pctLabel = Instance.new("TextLabel")
        pctLabel.Size                = UDim2.new(1, -8, 0, 10)
        pctLabel.Position            = UDim2.new(0, 4, 0, 24)
        pctLabel.BackgroundTransparency = 1
        pctLabel.TextColor3          = Color3.fromRGB(200, 200, 200)
        pctLabel.Font                = Enum.Font.Gotham
        pctLabel.TextSize            = 8
        pctLabel.TextXAlignment      = Enum.TextXAlignment.Right
        pctLabel.Text                = "0%"
        pctLabel.Parent              = container

        ragdollBoards[player] = { Billboard = billboard, Bar = bar, Label = pctLabel }
    end

    local function updateBoard(player)
        local data    = ragdollBoards[player]
        if not data then return end
        local pct     = math.clamp(getProgress(player) * 100, 0, 100)
        data.Bar.Size = UDim2.new(pct / 100, 0, 1, 0)
        if pct < 30 then
            data.Bar.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
        elseif pct < 70 then
            data.Bar.BackgroundColor3 = Color3.fromRGB(255, 180, 40)
        else
            data.Bar.BackgroundColor3 = Color3.fromRGB(60, 220, 100)
        end
        data.Label.Text = math.floor(pct) .. "%"
    end

    local function tickRagdollESP()
        if not ragdollEspEnabled or not isBeast() then
            for p in pairs(ragdollBoards) do removeBoard(p) end
            return
        end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                if isRagdolled(p) and p.Character then
                    if not ragdollBoards[p] then createBoard(p) end
                    updateBoard(p)
                else
                    if ragdollBoards[p] then removeBoard(p) end
                end
            end
        end
    end

    local function startRagdollESP()
        if ragdollConn then return end
        ragdollConn = RunService.Heartbeat:Connect(tickRagdollESP)
    end

    local function stopRagdollESP()
        if ragdollConn then ragdollConn:Disconnect() ragdollConn = nil end
        for p in pairs(ragdollBoards) do removeBoard(p) end
    end

    -- ======================================
    --               TOGGLES
    -- ======================================

    beastSection:AddToggle({
        Name = "Auto Hit",
        Default = false,
        Flag = "BeastAutoHit",
        Save = false,
        Callback = function(v)
            hitEnabled = v
            syncBeastLoop()
        end
    })

    beastSection:AddToggle({
        Name = "Auto Rope",
        Default = false,
        Flag = "BeastAutoRope",
        Save = true,
        Callback = function(v)
            ropeEnabled = v
            if not v then ropedTargets = {} end
            syncBeastLoop()
        end
    })

    beastSection:AddToggle({
        Name = "Anti Slow",
        Default = false,
        Flag = "AntiSlow",
        Save = true,
        Callback = function(v)
            antiSlowEnabled = v
            if v then startAntiSlow() else stopAntiSlow() end
        end
    })

    beastSection:AddToggle({
        Name = "ESP Ragdoll Timer",
        Default = false,
        Flag = "RagdollTimerESP",
        Save = true,
        Callback = function(v)
            ragdollEspEnabled = v
            if v then startRagdollESP() else stopRagdollESP() end
        end
    })

    beastSection:AddToggle({
        Name = "Third Person",
        Default = false,
        Flag = "ThirdPerson",
        Save = true,
        Callback = function(v)
            thirdPersonEnabled = v
            if not v and isBeast() then
                pcall(function()
                    LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                end)
            end
            syncBeastLoop()
        end
    })

-- ======================================
--           CONFIGS / WHITELIST
-- ======================================

    local SConfigBeast = Beast:AddSection({
        Name = "Configs Beast",
        Icon = "rbxassetid://106306510904979"
    })

    SConfigBeast:AddMultiPlayerDropdown({
        Name = "Whitelist Players",
        Placeholder = "No players whitelisted",
        Save = true,
        Flag = "BeastWhitelist",
        Callback = function(players)
            table.clear(beastWhitelist)
            for _, p in ipairs(players) do
                beastWhitelist[p.UserId] = true
            end
        end
    })

end

Beast:AddLabel("More features coming soon. Future updates will include new tools, improvements and additional functionality.")
  
-- ========== SURVIVOR TAB ========== --

-- ======================================
--            REMOTE ABUSE
-- ======================================

local remoteSection = Survivor:AddSection({
    Name = "Remote Abuse",
    Icon = "rbxassetid://96417680607974"
})

remoteSection:AddParagraph(
    "Remote Abuse",
    '<font face="SourceSansBold" color="#FFFFFF" size="14">Remote Abuse</font> <font face="SourceSans" color="#B0B0B0" size="12"> <b>Slow Beast</b> continuously reduces the beast\'s movement speed. <b>Remove Rope</b> automatically frees any survivor caught by the beast.</font>'
)

local SlowBeast = {} do

    local enabled = false
    local thread  = nil

    function SlowBeast.Enable()
        enabled = true
        if thread then return end
        thread = task.spawn(function()
            while enabled do
                local beast = getBeastPlayer()
                if beast and beast.Character then
                    local powers = beast.Character:FindFirstChild("BeastPowers")
                    if powers and powers:FindFirstChild("PowersEvent") then
                        pcall(function() powers.PowersEvent:FireServer("Jumped") end)
                    end
                end
                task.wait()
            end
        end)
    end

    function SlowBeast.Disable()
        enabled = false
        if thread then task.cancel(thread) thread = nil end
    end

end

local RemoveRope = {} do

    local enabled = false
    local thread  = nil

    function RemoveRope.Enable()
        enabled = true
        if thread then return end
        thread = task.spawn(function()
            while enabled do
                local beast = getBeastPlayer()
                if beast and beast.Character then
                    local hammer = beast.Character:FindFirstChild("Hammer")
                    local event  = hammer and hammer:FindFirstChild("HammerEvent")
                    if event then
                        pcall(function() event:FireServer("HammerClick", true) end)
                    end
                end
                task.wait()
            end
        end)
    end

    function RemoveRope.Disable()
        enabled = false
        if thread then task.cancel(thread) thread = nil end
    end

end

remoteSection:AddToggle({
    Name = "Slow Beast",
    Default = false,
    Flag = "SlowBeast",
    Save = false,
    Callback = function(v)
        if v then SlowBeast.Enable() else SlowBeast.Disable() end
    end
})

remoteSection:AddToggle({
    Name = "Remove Rope",
    Default = false,
    Flag = "RemoveRope",
    Save = false,
    Callback = function(v)
        if v then RemoveRope.Enable() else RemoveRope.Disable() end
    end
})

-- ======================================
--          SPEED UP HACKING
-- ======================================

local SpeedHackSection = Survivor:AddSection({
    Name = "Speed Up Hacking",
    Icon = "rbxassetid://121080677465007"
})

local SpeedUpHacking = {} do

    local enabled    = false
    local hackMode   = "Crawl"
    local thread     = nil

    local CRAWL_TIME   = 1/3
    local CYCLE_DELAY  = 3

    local function getStats()
        return LocalPlayer:FindFirstChild("TempPlayerStatsModule")
    end

    local function isTyping()
        local stats = getStats()
        return stats and stats:FindFirstChild("CurrentAnimation")
            and stats.CurrentAnimation.Value == "Typing"
    end

    local function getActionEvent()
        local stats = getStats()
        return stats and stats:FindFirstChild("ActionEvent") and stats.ActionEvent.Value
    end

    local function isBeast()
        local stats = getStats()
        return stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value == true
    end

    local function fireReconnect(event)
        local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
        if not remote or not event then return end
        local elapsed = 0
        repeat
            elapsed = elapsed + task.wait()
            remote:FireServer("Input", "Trigger", true, event)
            remote:FireServer("Input", "Action", true)
        until elapsed >= 2 or isTyping()

        task.wait(1/5)

        if not isTyping() then
            elapsed = 0
            repeat
                elapsed = elapsed + task.wait()
                remote:FireServer("Input", "Trigger", true, event)
                remote:FireServer("Input", "Action", true)
            until elapsed >= 2 or isTyping()
        end
    end

    local function doCrawl(event)
        local h = getHumanoid()
        if not h then return end
        local anim = h:LoadAnimation(ReplicatedStorage:WaitForChild("Animations"):WaitForChild("AnimCrawl"))

        ReplicatedStorage.RemoteEvent:FireServer("Input", "Crawl", true)
        h.HipHeight = -2
        anim:Play(0.1, 1, 0)
        h.WalkSpeed = 8

        task.wait(CRAWL_TIME)

        ReplicatedStorage.RemoteEvent:FireServer("Input", "Crawl", false)
        h.HipHeight = 0
        anim:Stop()
        h.WalkSpeed = 16

        fireReconnect(event)
    end

    local function doJump(event)
        local h = getHumanoid()
        if not h then return end

        h:ChangeState(Enum.HumanoidStateType.Jumping)

        local landed = false
        local elapsed = 0
        local conn = h.StateChanged:Connect(function(_, new)
            if new == Enum.HumanoidStateType.Landed then landed = true end
        end)
        repeat elapsed = elapsed + task.wait() until landed or elapsed >= 2
        conn:Disconnect()

        fireReconnect(event)
    end

    local function doAir(event)
        local remote = ReplicatedStorage:FindFirstChild("RemoteEvent")
        if not remote then return end

        local elapsed = 0
        repeat
            elapsed = elapsed + task.wait()
            remote:FireServer("Input", "Trigger", false, event)
            remote:FireServer("Input", "Action", false)
        until not isTyping() or elapsed >= 2

        fireReconnect(event)
    end

    local function shouldRun(event)
        if not enabled then return false end
        if isBeast() then return false end
        if not isTyping() then return false end
        if not event then return false end
        return true
    end

    local function startThread()
        if thread then return end
        thread = task.spawn(function()
            while enabled do
                task.wait(CYCLE_DELAY)
                local event = getActionEvent()
                if shouldRun(event) then
                    local ok, err = pcall(function()
                        if hackMode == "Crawl" then
                            doCrawl(event)
                        elseif hackMode == "Jump" then
                            doJump(event)
                        elseif hackMode == "Air" then
                            doAir(event)
                        end
                    end)
                    if not ok then
                        warn("[SpeedUpHacking] " .. tostring(err))
                    end
                end
            end
            thread = nil
        end)
    end

    local function stopThread()
        if thread then task.cancel(thread) thread = nil end
        pcall(function()
            local h = getHumanoid()
            if h then
                h.HipHeight = 0
                h.WalkSpeed = 16
                ReplicatedStorage.RemoteEvent:FireServer("Input", "Crawl", false)
            end
        end)
    end

    function SpeedUpHacking.SetMode(v) hackMode = v end

    function SpeedUpHacking.Enable()
        enabled = true
        startThread()
    end

    function SpeedUpHacking.Disable()
        enabled = false
        stopThread()
    end

end

SpeedHackSection:AddDropdown({
    Name = "Hack Speed Mode",
    Default = "Air",
    Options = { "Crawl", "Jump", "Air" },
    Flag = "HackSpeedMode",
    Save = true,
    Callback = function(v)
        SpeedUpHacking.SetMode(v)
    end
})

SpeedHackSection:AddToggle({
    Name = "Enable Speed Up Hacking",
    Default = false,
    Flag = "SpeedUpHackingEnabled",
    Save = false,
    Callback = function(v)
        if v then SpeedUpHacking.Enable() else SpeedUpHacking.Disable() end
    end
})

-- ======================================
--         HELP CAPTURED PLAYERS
-- ======================================

local SFreezePodHack = Survivor:AddSection({
    Name = "Help Captured Players",
    Icon = "rbxassetid://126835730170366"
})

local AutoHelp = {} do

    local enabled          = false
    local thread           = nil
    local helping          = false
    local teleportingBack  = false
    local originalPosition = nil

    -- Helpers

    local function isCaptured()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("Captured") and stats.Captured.Value == true
    end

    local function isDead()
        local stats = LocalPlayer:FindFirstChild("TempPlayerStatsModule")
        return stats and stats:FindFirstChild("Health") and stats.Health.Value <= 0
    end

    local function getRemote()
        return ReplicatedStorage:FindFirstChild("RemoteEvent")
            or ReplicatedStorage:FindFirstChild("Remote")
            or ReplicatedStorage:FindFirstChild("Events")
    end

    local function fireAction()
        local r = getRemote()
        if not r then return end
        pcall(function()
            r:FireServer("Input", "Action", true)
            r:FireServer("Action", true)
            r:FireServer("Interact")
            r:FireServer("Use")
        end)
    end

    local function fireTrigger()
        local r = getRemote()
        if not r then return end
        pcall(function()
            r:FireServer("Input", "Trigger", true, nil)
            r:FireServer("Trigger", true)
        end)
    end

    local function savePos()
        local hrp = getHumanoidRootPart()
        if not hrp then return false end
        originalPosition = hrp.CFrame
        return true
    end

    local function teleportTo(pos)
        local hrp = getHumanoidRootPart()
        if not hrp then return false end
        hrp.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        return true
    end

    local function teleportBack()
        if not originalPosition then return false end
        local hrp = getHumanoidRootPart()
        if not hrp then return false end
        hrp.CFrame    = originalPosition
        originalPosition  = nil
        teleportingBack   = false
        return true
    end

    local function getCaptured()
        local list = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then
                local stats = p:FindFirstChild("TempPlayerStatsModule")
                if stats and stats:FindFirstChild("Captured") and stats.Captured.Value then
                    local dead     = stats:FindFirstChild("Health") and stats.Health.Value <= 0
                    local ragdoll  = stats:FindFirstChild("Ragdoll") and stats.Ragdoll.Value
                    if not dead and not ragdoll then
                        table.insert(list, p)
                    end
                end
            end
        end
        return list
    end

    local function findPod(player)
        if not player or not player.Character then return nil, nil end
        local torso = player.Character:FindFirstChild("Torso") or player.Character:FindFirstChild("UpperTorso")
        if not torso then return nil, nil end
        for _, pod in ipairs(workspace:GetDescendants()) do
            if pod.Name == "FreezePod" and pod:IsA("Model") then
                local trigger = pod:FindFirstChild("PodTrigger", true)
                if trigger and trigger:IsA("BasePart") and (trigger.Position - torso.Position).Magnitude < 5 then
                    return pod, trigger
                end
            end
        end
        return nil, nil
    end

    local function helpOne(player)
        local _, trigger = findPod(player)
        if not trigger then return false end
        if not savePos() then return false end
        teleportingBack = true
        teleportTo(trigger.Position)
        task.wait(0.08)
        fireAction()
        task.wait(0.05)
        fireTrigger()
        task.wait(0.05)
        fireAction()
        task.wait(0.08)
        teleportBack()
        return true
    end

    local function execute()
        if isLocalBeast() or isDead() or isCaptured() or helping then return end
        local list = getCaptured()
        if #list == 0 then
            if teleportingBack and originalPosition then teleportBack() end
            return
        end
        helping = true
        for _, p in ipairs(list) do
            if not enabled then break end
            if helpOne(p) then task.wait(0.2) end
        end
        if originalPosition then teleportBack() end
        helping = false
    end

    -- Public

    function AutoHelp.HelpOne()
        local list = getCaptured()
        if #list > 0 then helpOne(list[1]) end
    end

    function AutoHelp.Enable()
        enabled = true
        if thread then return end
        thread = task.spawn(function()
            while enabled do
                local ok, err = pcall(execute)
                if not ok then warn("[AutoHelp] " .. tostring(err)) end
                task.wait(0.15)
            end
        end)
    end

    function AutoHelp.Disable()
        enabled          = false
        helping          = false
        teleportingBack  = false
        if thread then task.cancel(thread) thread = nil end
        if originalPosition then teleportBack() end
        originalPosition = nil
    end

end

SFreezePodHack:AddToggle({
    Name = "Auto Help Captured Players",
    Default = false,
    Flag = "AutoHelpCaptured",
    Save = false,
    Callback = function(v)
        if v then AutoHelp.Enable() else AutoHelp.Disable() end
    end
})

SFreezePodHack:AddButton({
    Name = "Help Captured Player",
    Callback = function()
        AutoHelp.HelpOne()
    end
})

Survivor:AddLabel("More features coming soon. Future updates will include new tools, improvements and additional functionality.")

-- =========== VISUAL TAB =========== --

local currentMap = currentMapObject

local ESPContainer = Instance.new("Folder")
ESPContainer.Name = "ESPContainer"
ESPContainer.Parent = workspace

-- ======================================
--              PLAYERS ESP
-- ======================================

local playerEspSection = Visual:AddSection({
    Name = "Players",
    Icon = "rbxassetid://139806730174727"
})

_G.PlayersESPEnabled = false
_G.PlayersNameESPEnabled = false

local ESPPlayers = {} do

    local connections = {}
    local espData = {}
    local loop = nil
    local updateTick = 0
    local UPDATE_RATE = 0.08

    local function getBeast()
        for _, p in ipairs(Players:GetPlayers()) do
            local stats = p:FindFirstChild("TempPlayerStatsModule")
            if stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value then return p end
            local char = p.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None then return p end
            end
        end
    end

    local function getPlayerRole(player)
        if player == getBeast() then return "Beast" end
        local stats = player:FindFirstChild("TempPlayerStatsModule")
        if stats and stats:FindFirstChild("Captured") and stats.Captured.Value == true then return "Captured" end
        return "Survivor"
    end

    local RoleTheme = {
        Beast    = { fill = Color3.fromRGB(200, 40, 40),  outline = Color3.fromRGB(255, 90, 90),  nameColor = Color3.fromRGB(255, 100, 100) },
        Captured = { fill = Color3.fromRGB(200, 120, 0),  outline = Color3.fromRGB(255, 180, 50), nameColor = Color3.fromRGB(255, 195, 70)  },
        Survivor = { fill = Color3.fromRGB(20, 180, 80),  outline = Color3.fromRGB(60, 230, 110), nameColor = Color3.fromRGB(130, 255, 165) },
    }

    local function createBillboard(player)
        if not player.Character then return end
        local char = player.Character
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildOfClass("BasePart")
        if not hrp then return end

        local old = char:FindFirstChild("ESPBillboard_" .. player.UserId)
        if old then old:Destroy() end

        if not _G.PlayersNameESPEnabled then return end

        local theme = RoleTheme[getPlayerRole(player)]

        local bb = Instance.new("BillboardGui")
        bb.Name             = "ESPBillboard_" .. player.UserId
        bb.Adornee          = hrp
        bb.AlwaysOnTop      = true
        bb.Size             = UDim2.new(0, 100, 0, 14)
        bb.StudsOffset      = Vector3.new(0, 3.2, 0)
        bb.ResetOnSpawn     = false
        bb.ClipsDescendants = false
        bb.Parent           = char

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name                   = "NameLabel"
        nameLabel.Size                   = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3             = theme.nameColor
        nameLabel.TextStrokeColor3       = Color3.fromRGB(0, 0, 0)
        nameLabel.TextStrokeTransparency = 0
        nameLabel.Font                   = Enum.Font.GothamBold
        nameLabel.TextSize               = 11
        nameLabel.TextXAlignment         = Enum.TextXAlignment.Center
        nameLabel.TextYAlignment         = Enum.TextYAlignment.Center
        nameLabel.Text                   = player.DisplayName
        nameLabel.Parent                 = bb

        return bb, nameLabel
    end

    local function createESP(player)
        if not player.Character then return end
        local char = player.Character

        local old = espData[player]
        if old then
            if old.highlight and old.highlight.Parent then old.highlight:Destroy() end
            if old.billboard and old.billboard.Parent then old.billboard:Destroy() end
        end

        local role  = getPlayerRole(player)
        local theme = RoleTheme[role]

        local h = Instance.new("Highlight")
        h.Name                = "PlayerESP_" .. player.UserId
        h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
        h.FillColor           = theme.fill
        h.FillTransparency    = 0.55
        h.OutlineColor        = theme.outline
        h.OutlineTransparency = 0
        h.Parent              = char

        local bb, nameLabel = createBillboard(player)

        espData[player] = {
            highlight = h,
            billboard = bb,
            nameLabel = nameLabel,
            lastRole  = role,
        }
    end

    local function removeESP(player)
        local d = espData[player]
        if d then
            if d.highlight and d.highlight.Parent then d.highlight:Destroy() end
            if d.billboard and d.billboard.Parent then d.billboard:Destroy() end
        end
        espData[player] = nil
    end

    local function removeBillboards()
        for player, d in pairs(espData) do
            if d.billboard and d.billboard.Parent then d.billboard:Destroy() end
            d.billboard = nil
            d.nameLabel = nil
        end
    end

    local function updateESP(player)
        if not player.Character then return end

        local d = espData[player]
        if not d or not (d.highlight and d.highlight.Parent) then
            espData[player] = nil
            createESP(player)
            return
        end

        local role  = getPlayerRole(player)
        local theme = RoleTheme[role]

        d.highlight.FillColor    = theme.fill
        d.highlight.OutlineColor = theme.outline

        if _G.PlayersNameESPEnabled then
            if not (d.billboard and d.billboard.Parent) then
                local bb, nameLabel = createBillboard(player)
                d.billboard = bb
                d.nameLabel = nameLabel
            end
            if d.nameLabel then
                d.nameLabel.TextColor3 = theme.nameColor
                d.nameLabel.Text       = player.DisplayName
            end
        else
            if d.billboard and d.billboard.Parent then d.billboard:Destroy() end
            d.billboard = nil
            d.nameLabel = nil
        end

        d.lastRole = role
    end

    local function applyAll()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then updateESP(p) end
        end
    end

    local function removeAll()
        for p in pairs(espData) do removeESP(p) end
    end

    local function watchPlayer(player)
        if player == LocalPlayer then return end
        if connections[player] then connections[player]:Disconnect() end
        connections[player] = player.CharacterAdded:Connect(function()
            task.wait(0.5)
            if _G.PlayersESPEnabled then createESP(player) end
        end)
    end

    for _, p in ipairs(Players:GetPlayers()) do watchPlayer(p) end
    Players.PlayerAdded:Connect(function(p) watchPlayer(p) end)
    Players.PlayerRemoving:Connect(function(p)
        if connections[p] then connections[p]:Disconnect() connections[p] = nil end
        removeESP(p)
    end)

    function ESPPlayers.Enable()
        _G.PlayersESPEnabled = true
        applyAll()
        if loop then return end
        loop = RunService.Heartbeat:Connect(function()
            local now = tick()
            if now - updateTick < UPDATE_RATE then return end
            updateTick = now
            applyAll()
        end)
    end

    function ESPPlayers.Disable()
        _G.PlayersESPEnabled = false
        if loop then loop:Disconnect() loop = nil end
        removeAll()
    end

    function ESPPlayers.EnableName()
        _G.PlayersNameESPEnabled = true
        applyAll()
    end

    function ESPPlayers.DisableName()
        _G.PlayersNameESPEnabled = false
        removeBillboards()
    end

end

playerEspSection:AddToggle({
    Name = "ESP Players",
    Default = false,
    Save = true,
    Flag = "PlayerEsp",
    Callback = function(v)
        if v then ESPPlayers.Enable() else ESPPlayers.Disable() end
    end
})

playerEspSection:AddToggle({
    Name = "ESP Name Players",
    Default = false,
    Save = true,
    Flag = "PlayerNameEsp",
    Callback = function(v)
        if v then ESPPlayers.EnableName() else ESPPlayers.DisableName() end
    end
})

-- ======================================
--              COMPUTERS ESP
-- ======================================

local computerEspSection =
        Visual:AddSection(
        {
            Name = "Computers",
            Icon = "rbxassetid://95767266309410"
        }
    )
    
    _G.ESP_PCS = false
    
    local computerHighlights = {}
    local pcEspLoop = nil
    local pcDescendantConn = nil
    local function updatePCESP(computerModel, highlight)
        local screen = computerModel:FindFirstChild("Screen")
        if not screen or not screen:IsA("BasePart") then
            return
        end
        local col = screen.Color
        local r, g, b = math.floor(col.R * 255), math.floor(col.G * 255), math.floor(col.B * 255)
        if r == 40 and g == 127 and b == 71 then
            highlight.FillColor = Color3.fromRGB(40, 127, 71)
            highlight.OutlineColor = Color3.fromRGB(60, 180, 100)
        elseif r == 13 and g == 105 and b == 172 then
            highlight.FillColor = Color3.fromRGB(13, 105, 172)
            highlight.OutlineColor = Color3.fromRGB(66, 132, 197)
        elseif r == 196 and g == 40 and b == 28 then
            highlight.FillColor = Color3.fromRGB(196, 40, 28)
            highlight.OutlineColor = Color3.fromRGB(255, 100, 100)
        else
            highlight.FillColor = col
            highlight.OutlineColor =
                Color3.new(math.clamp(col.R + 0.3, 0, 1), math.clamp(col.G + 0.3, 0, 1), math.clamp(col.B + 0.3, 0, 1))
        end
    end
    local function addPCESP(computerModel)
        if not computerModel:IsA("Model") or computerHighlights[computerModel] then
            return
        end
        local screen = computerModel:FindFirstChild("Screen")
        if not screen or not screen:IsA("BasePart") then
            return
        end
        local highlight = Instance.new("Highlight")
        highlight.Name = "ComputerHighlight"
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = computerModel
        highlight.Enabled = true
        computerHighlights[computerModel] = highlight
        updatePCESP(computerModel, highlight)
        screen:GetPropertyChangedSignal("Color"):Connect(
            function()
                if _G.ESP_PCS and highlight and highlight.Parent then
                    updatePCESP(computerModel, highlight)
                end
            end
        )
    end
    local function clearPCESP()
        for _, h in pairs(computerHighlights) do
            if h then
                h:Destroy()
            end
        end
        computerHighlights = {}
    end
    local function scanMapForPCs()
        local mapModel = nil
        if currentMap and currentMap.Value then
            mapModel =
                typeof(currentMap.Value) == "string" and workspace:FindFirstChild(currentMap.Value) or currentMap.Value
        end
        local searchArea = mapModel or workspace
        for _, obj in pairs(searchArea:GetDescendants()) do
            if obj.Name == "ComputerTable" then
                addPCESP(obj)
            end
        end
    end
    local function startPCESP()
        if pcEspLoop then
            return
        end
        scanMapForPCs()
        if pcDescendantConn then
            pcDescendantConn:Disconnect()
        end
        pcDescendantConn =
            workspace.DescendantAdded:Connect(
            function(obj)
                if not _G.ESP_PCS then
                    return
                end
                task.wait(0.3)
                if obj.Name == "ComputerTable" and obj:IsA("Model") then
                    addPCESP(obj)
                end
            end
        )
        pcEspLoop =
            RunService.Heartbeat:Connect(
            function()
                if not _G.ESP_PCS then
                    return
                end
                for model, h in pairs(computerHighlights) do
                    if not h or not h.Parent then
                        computerHighlights[model] = nil
                        if model and model.Parent then
                            addPCESP(model)
                        end
                    end
                end
            end
        )
    end
    local function stopPCESP()
        if pcEspLoop then
            pcEspLoop:Disconnect()
            pcEspLoop = nil
        end
        if pcDescendantConn then
            pcDescendantConn:Disconnect()
            pcDescendantConn = nil
        end
        clearPCESP()
    end
    computerEspSection:AddToggle(
        {
            Name = "ESP PCs",
            Default = false,
            Flag = "ComputerEsp",
            Save = true,
            Callback = function(v)
                _G.ESP_PCS = v
                if v then
                    startPCESP()
                else
                    stopPCESP()
                end
            end
        }
    )
    if currentMap then
        currentMap:GetPropertyChangedSignal("Value"):Connect(
            function()
                clearPCESP()
                if _G.ESP_PCS then
                    task.delay(
                        3,
                        function()
                            if _G.ESP_PCS then
                                scanMapForPCs()
                            end
                        end
                    )
                end
            end
        )
    end


-- ======================================
--               MISC ESP
-- ======================================

local OthersESPs = Visual:AddSection({
    Name = "Others ESPs",
    Icon = "rbxassetid://7733917120"
})

_G.ESP_PODS = false
_G.ESP_EXITS = false

local ESPMisc = {} do

    local highlights = {}
    local descConn = nil
    local thread = nil

    local function applyHighlight(obj, fill, outline)
        if highlights[obj] then return end
        local h = Instance.new("Highlight")
        h.Name = "MiscHighlight"
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        h.FillColor = fill
        h.OutlineColor = outline
        h.FillTransparency = 0.75
        h.OutlineTransparency = 0
        h.Adornee = obj
        h.Parent = ESPContainer
        highlights[obj] = h
    end

    local function removeByName(name)
        for obj, h in pairs(highlights) do
            if obj.Name == name then
                if h then h:Destroy() end
                highlights[obj] = nil
            end
        end
    end

    local function scan()
        for _, obj in ipairs(workspace:GetDescendants()) do
            if _G.ESP_PODS and obj.Name == "FreezePod" then
                applyHighlight(obj, Color3.fromRGB(0, 220, 255), Color3.fromRGB(100, 240, 255))
            end
            if _G.ESP_EXITS and obj.Name == "ExitDoor" then
                applyHighlight(obj, Color3.fromRGB(255, 230, 0), Color3.fromRGB(255, 180, 50))
            end
        end
    end

    local function startScan()
        if thread then return end
        scan()
        if descConn then descConn:Disconnect() end
        descConn = workspace.DescendantAdded:Connect(function(obj)
            if not (_G.ESP_PODS or _G.ESP_EXITS) then return end
            task.wait(0.2)
            if _G.ESP_PODS and obj.Name == "FreezePod" then
                applyHighlight(obj, Color3.fromRGB(0, 220, 255), Color3.fromRGB(100, 240, 255))
            end
            if _G.ESP_EXITS and obj.Name == "ExitDoor" then
                applyHighlight(obj, Color3.fromRGB(255, 230, 0), Color3.fromRGB(255, 180, 50))
            end
        end)
        thread = task.spawn(function()
            while _G.ESP_PODS or _G.ESP_EXITS do
                scan()
                task.wait(3)
            end
            thread = nil
        end)
    end

    local function stopScan()
        if descConn then descConn:Disconnect() descConn = nil end
        thread = nil
    end

    if currentMap then
        currentMap:GetPropertyChangedSignal("Value"):Connect(function()
            if _G.ESP_PODS or _G.ESP_EXITS then
                task.delay(3, function() if _G.ESP_PODS or _G.ESP_EXITS then scan() end end)
            end
        end)
    end

    function ESPMisc.RemoveByName(name) removeByName(name) end
    function ESPMisc.StartScan()       startScan() end
    function ESPMisc.StopScan()        stopScan()  end

end

OthersESPs:AddToggle({
    Name = "ESP Freeze Pods",
    Default = false,
    Save = true,
    Flag = "FreezePodEsp",
    Callback = function(v)
        _G.ESP_PODS = v
        if v then
            ESPMisc.StartScan()
        else
            ESPMisc.RemoveByName("FreezePod")
            if not _G.ESP_EXITS then ESPMisc.StopScan() end
        end
    end
})

OthersESPs:AddToggle({
    Name = "ESP Exit Door",
    Default = false,
    Save = true,
    Flag = "ExitDoorEsp",
    Callback = function(v)
        _G.ESP_EXITS = v
        if v then
            ESPMisc.StartScan()
        else
            ESPMisc.RemoveByName("ExitDoor")
            if not _G.ESP_PODS then ESPMisc.StopScan() end
        end
    end
})

-- ======================================
--           HIDING SPOTS ESP
-- ======================================

local HIDING_SPOT_NAMES = {
    Locker         = true,
    HidingCloset   = true,
    RestroomStall  = true,
    BathroomDoor   = true,
    Closet         = true,
    Cabinet        = true,
}

local function isHidingSpotByStructure(obj)
    if not obj:IsA("Model") then return false end
    if not obj:FindFirstChild("Door") then return false end
    local doorCount, legCount, partCount = 0, 0, 0
    for _, child in ipairs(obj:GetChildren()) do
        if child.Name == "Door"  then doorCount = doorCount + 1 end
        if child.Name == "Leg"   then legCount  = legCount  + 1 end
        if child:IsA("BasePart") then partCount = partCount + 1 end
    end
    return doorCount >= 2 and legCount >= 1 and partCount >= 4
end

local ESPHiding = {} do

    local enabled   = false
    local data      = {}
    local descConn  = nil
    local loop      = nil

    local function getPlayersInside(spot)
        local part = spot.PrimaryPart or spot:FindFirstChildWhichIsA("BasePart")
        if not part then return 0, {} end
        local cf   = part.CFrame
        local size = part.Size * 1.6
        local count, list = 0, {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local lp = cf:PointToObjectSpace(hrp.Position)
                    if math.abs(lp.X) < size.X / 2
                    and math.abs(lp.Y) < size.Y / 2
                    and math.abs(lp.Z) < size.Z / 2 then
                        count = count + 1
                        table.insert(list, p)
                    end
                end
            end
        end
        return count, list
    end

    local function updateHighlight(spot, entry)
        local count, _ = getPlayersInside(spot)
        local h = entry.highlight

        if count > 0 then
            h.FillColor           = Color3.fromRGB(255, 60, 60)
            h.OutlineColor        = Color3.fromRGB(255, 30, 30)
            h.FillTransparency    = 0.2
            h.OutlineTransparency = 0
        else
            h.FillColor           = Color3.fromRGB(255, 200, 0)
            h.OutlineColor        = Color3.fromRGB(255, 140, 0)
            h.FillTransparency    = 0.72
            h.OutlineTransparency = 0
        end

        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

        if entry.billboard then
            if count > 0 then
                entry.countLabel.Text    = tostring(count) .. " inside"
                entry.countLabel.Visible = true
            else
                entry.countLabel.Visible = false
            end
        end
    end

    local function addSpot(spot)
        if data[spot] or not spot or not spot.Parent then return end

        local h = Instance.new("Highlight")
        h.Name                = "HidingSpotESP"
        h.FillColor           = Color3.fromRGB(255, 200, 0)
        h.OutlineColor        = Color3.fromRGB(255, 140, 0)
        h.FillTransparency    = 0.72
        h.OutlineTransparency = 0
        h.DepthMode           = Enum.HighlightDepthMode.AlwaysOnTop
        h.Adornee             = spot
        h.Parent              = ESPContainer

        local primaryPart = spot.PrimaryPart or spot:FindFirstChildWhichIsA("BasePart")
        local billboard, countLabel

        if primaryPart then
            billboard = Instance.new("BillboardGui")
            billboard.Name             = "HidingESPBillboard"
            billboard.AlwaysOnTop      = true
            billboard.Size             = UDim2.new(0, 80, 0, 20)
            billboard.StudsOffset      = Vector3.new(0, 2.5, 0)
            billboard.Adornee          = primaryPart
            billboard.ResetOnSpawn     = false
            billboard.Parent           = ESPContainer

            countLabel = Instance.new("TextLabel")
            countLabel.Size                   = UDim2.new(1, 0, 1, 0)
            countLabel.BackgroundTransparency = 1
            countLabel.TextColor3             = Color3.fromRGB(255, 80, 80)
            countLabel.TextStrokeColor3       = Color3.fromRGB(0, 0, 0)
            countLabel.TextStrokeTransparency = 0
            countLabel.Font                   = Enum.Font.GothamBold
            countLabel.TextSize               = 12
            countLabel.Text                   = ""
            countLabel.Visible                = false
            countLabel.Parent                 = billboard
        end

        local entry = {
            highlight  = h,
            billboard  = billboard,
            countLabel = countLabel,
        }

        data[spot] = entry
        updateHighlight(spot, entry)
    end

    local function removeSpot(spot)
        local entry = data[spot]
        if not entry then return end
        if entry.highlight and entry.highlight.Parent then entry.highlight:Destroy() end
        if entry.billboard and entry.billboard.Parent then entry.billboard:Destroy() end
        data[spot] = nil
    end

    local function scan()
        local root = workspace
        if currentMap and currentMap.Value then
            root = (typeof(currentMap.Value) == "string" and workspace:FindFirstChild(currentMap.Value))
                or currentMap.Value
                or workspace
        end
        for _, obj in ipairs(root:GetDescendants()) do
            if obj:IsA("Model") and (HIDING_SPOT_NAMES[obj.Name] or isHidingSpotByStructure(obj)) then
                addSpot(obj)
            end
        end
    end

    local function startLoop()
        scan()
        if not descConn then
            descConn = workspace.DescendantAdded:Connect(function(obj)
                if not enabled then return end
                task.wait(0.2)
                if obj:IsA("Model") and (HIDING_SPOT_NAMES[obj.Name] or isHidingSpotByStructure(obj)) then
                    addSpot(obj)
                end
            end)
        end
        if not loop then
            loop = RunService.Heartbeat:Connect(function()
                if not enabled then return end
                for spot, entry in pairs(data) do
                    if not entry.highlight or not entry.highlight.Parent then
                        removeSpot(spot)
                        if spot and spot.Parent then addSpot(spot) end
                    else
                        updateHighlight(spot, entry)
                    end
                end
            end)
        end
    end

    local function stopLoop()
        if descConn then descConn:Disconnect() descConn = nil end
        if loop     then loop:Disconnect()     loop     = nil end
        for spot in pairs(data) do removeSpot(spot) end
    end

    if currentMap then
        currentMap:GetPropertyChangedSignal("Value"):Connect(function()
            if enabled then
                task.delay(3, function() if enabled then scan() end end)
            end
        end)
    end

    function ESPHiding.Enable()  enabled = true  startLoop() end
    function ESPHiding.Disable() enabled = false stopLoop()  end

end

OthersESPs:AddToggle({
    Name = "ESP Hiding Spots",
    Default = false,
    Save = true,
    Flag = "HidingSpotESP",
    Callback = function(v)
        if v then ESPHiding.Enable() else ESPHiding.Disable() end
    end
})

    Visual:AddLabel(
        "More features coming soon. Future updates will include new tools, improvements and additional functionality.")
    
-- ======================================
--         TELEPORT TO PLAYERS
-- ======================================

local STeleportPlayers = Teleport:AddSection({
    Name = "Teleport To Players",
    Icon = "rbxassetid://81349737972173"
})

local selectedPlayer = nil

STeleportPlayers:AddPlayerDropdown({
    Name = "Select Player",
    Placeholder = "Choose a player",
    Save = false,
    Callback = function(player)
        selectedPlayer = player
    end
})

STeleportPlayers:AddButton({
    Name = "Teleport To Player Selected",
    Callback = function()
        local target = selectedPlayer
        if not target or not target.Character then return end
        local targetHRP = target.Character:FindFirstChild("HumanoidRootPart")
        if not targetHRP then return end
        local hrp = getHumanoidRootPart()
        if not hrp then return end
        hrp.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 2)
    end
})

-- ======================================
--           TELEPORT SECTION
-- ======================================

local teleportSection = Teleport:AddSection({
    Name = "Teleports Game",
    Icon = "rbxassetid://15885360708"
})

-- ======================================
--           UTILITIES LOCAIS
-- ======================================

local TeleportUtils = {} do

    function TeleportUtils.findSpawnPad()
        local root = api:getCurrentMapModel() or workspace
        for _, v in ipairs(root:GetDescendants()) do
            if v.Name == "OBSpawnPad" and v:IsA("BasePart") then return v end
        end
    end

    function TeleportUtils.getHRP()
        local char = LocalPlayer.Character
        return char and char:FindFirstChild("HumanoidRootPart")
    end

    function TeleportUtils.isTriggerBusy(trigger)
        if not trigger then return true end
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - trigger.Position).Magnitude < 4 then
                    return true
                end
            end
        end
        return false
    end

    function TeleportUtils.getFreeTrigger(pc)
        for i = 1, 3 do
            local t = pc:FindFirstChild("ComputerTrigger" .. i)
            if t and not TeleportUtils.isTriggerBusy(t) then return t end
        end
    end

    function TeleportUtils.playersNearPC(pc, radius)
        radius = radius or 10
        local count, origin = 0, pc:GetPivot().Position
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - origin).Magnitude < radius then
                    count = count + 1
                end
            end
        end
        return count
    end

    function TeleportUtils.beastNearPC(pc, radius)
        radius = radius or 25
        local beast = getBeastPlayer()
        if not beast or not beast.Character then return false end
        local hrp = beast.Character:FindFirstChild("HumanoidRootPart")
        return hrp and (hrp.Position - pc:GetPivot().Position).Magnitude < radius
    end

    function TeleportUtils.getBeastTargetPC()
        local beast = getBeastPlayer()
        if not beast or not beast.Character then return end
        local hrp = beast.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local best, bestDist = nil, math.huge
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == "ComputerTable" and obj:IsA("Model") then
                local d = (obj:GetPivot().Position - hrp.Position).Magnitude
                if d < bestDist then
                    bestDist = d
                    best = obj
                end
            end
        end
        return best
    end

end

-- ======================================
--         SMOOTH MOVE (ANTI-KICK)
-- ======================================

local SmoothMove = {} do

    local MAX_STEP   = 35
    local STEP_TIME  = 0.18
    local STEP_PAUSE = 0.06
    local running    = false

    function SmoothMove.isRunning() return running end
    function SmoothMove.cancel()    running = false  end

    function SmoothMove.go(hrp, destination, onDone)
        if running then return end
        running = true

        task.spawn(function()
            local function step()
                if not running then return end
                local current = hrp.Position
                local diff    = destination - current
                local dist    = diff.Magnitude

                if dist < 2 then
                    running = false
                    if onDone then onDone() end
                    return
                end

                local moveVec = diff.Unit * math.min(MAX_STEP, dist)
                local target  = current + moveVec

                local tween = TweenService:Create(
                    hrp,
                    TweenInfo.new(STEP_TIME, Enum.EasingStyle.Linear),
                    { CFrame = CFrame.new(target) }
                )
                tween:Play()
                tween.Completed:Wait()

                if STEP_PAUSE > 0 then task.wait(STEP_PAUSE) end
                step()
            end

            step()
        end)
    end

end

-- ======================================
--        TELEPORT TO MAP / LOBBY
-- ======================================

teleportSection:AddButton({
    Name = "Teleport to Map",
    Callback = function()
        local pad = TeleportUtils.findSpawnPad()
        local hrp = TeleportUtils.getHRP()
        if pad and hrp then
            hrp.CFrame = CFrame.new(pad.Position + Vector3.new(0, 3, 0))
        else
            OrionLib:MakeNotification({ Name = "Teleport to Map", Content = "No spawn point found", Time = 1.5 })
        end
    end
})

teleportSection:AddButton({
    Name = "Teleport to Lobby",
    Callback = function()
        local hrp = TeleportUtils.getHRP()
        if hrp then hrp.CFrame = CFrame.new(103.5, 8.01, -417) end
    end
})

-- ======================================
--          TELEPORT TO PC
-- ======================================

local recentPCs = {}

teleportSection:AddButton({
    Name = "Teleport to PC",
    Callback = function()
        if SmoothMove.isRunning() then return end

        local hrp = TeleportUtils.getHRP()
        if not hrp then return end

        local candidates = {}
        local beastPC    = TeleportUtils.getBeastTargetPC()
        local root       = api:getCurrentMapModel() or workspace

        for _, obj in ipairs(root:GetDescendants()) do
            if obj.Name == "ComputerTable" and obj:IsA("Model") then
                local screen = obj:FindFirstChild("Screen")
                if screen and screen:IsA("BasePart") then
                    local c = screen.Color
                    local r = math.floor(c.R * 255)
                    local g = math.floor(c.G * 255)
                    local b = math.floor(c.B * 255)
                    if r == 13 and g == 105 and b == 172 then
                        local trigger = TeleportUtils.getFreeTrigger(obj)
                        if trigger then
                            table.insert(candidates, {
                                pc      = obj,
                                trigger = trigger,
                                dist    = (trigger.Position - hrp.Position).Magnitude
                            })
                        end
                    end
                end
            end
        end

        if #candidates == 0 then
            OrionLib:MakeNotification({ Name = "Teleport to PC", Content = "No computers available", Time = 1.5 })
            return
        end

        local best, bestScore = nil, -math.huge
        for _, e in ipairs(candidates) do
            local score = 0
            if e.dist < 15 then
                score = score - 500
            elseif e.dist < 30 then
                score = score + 300
            else
                score = score + 100
            end
            if beastPC and e.pc == beastPC           then score = score - 1000 end
            if table.find(recentPCs, e.pc)           then score = score - 300  end
            if TeleportUtils.playersNearPC(e.pc) > 2 then score = score - 200  end
            if TeleportUtils.beastNearPC(e.pc, 25)   then score = score - 400  end
            score = score - (e.dist * 2)
            if score > bestScore then
                bestScore = score
                best = e
            end
        end

        if not best then best = candidates[math.random(1, #candidates)] end

        local dest = best.trigger.Position + Vector3.new(0, 3, 0)

        SmoothMove.go(hrp, dest, function()
            table.insert(recentPCs, best.pc)
            if #recentPCs > 3 then table.remove(recentPCs, 1) end
        end)
    end
})

-- ======================================
--        TELEPORT TO EXIT DOOR
-- ======================================

teleportSection:AddButton({
    Name = "Teleport to Exit Door",
    Callback = function()
        local exits = {}
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name == "ExitDoor" and (obj:IsA("Model") or obj:IsA("BasePart")) then
                table.insert(exits, obj)
            end
        end
        if #exits > 0 then
            local hrp = TeleportUtils.getHRP()
            if hrp then
                hrp.CFrame = exits[math.random(1, #exits)]:GetPivot() * CFrame.new(0, 0, -5)
            end
        end
    end
})
    
Teleport:AddLabel(
        "More features coming soon. Future updates will include new tools, improvements and additional functionality.")

-- ========== HUMANOID TAB ========== --

local defaultGravity = workspace.Gravity

-- ======================================
--            HUMANOID STATS
-- ======================================

local HumanoidSection = Humanoid:AddSection({
    Name = "Humanoid",
    Icon = "rbxassetid://99466139675639"
})

local walkSlider = HumanoidSection:AddSlider({
    Name = "Speed",
    Min = 0,
    Max = 500,
    Increment = 1,
    Default = 16,
    Callback = function(v)
        local h = getHumanoid()
        if h then h.WalkSpeed = v end
    end
})

local jumpSlider = HumanoidSection:AddSlider({
    Name = "Jump",
    Min = 0,
    Max = 500,
    Increment = 1,
    Default = 36,
    Callback = function(v)
        local h = getHumanoid()
        if h then h.JumpPower = v end
    end
})

local gravitySlider = HumanoidSection:AddSlider({
    Name = "Gravity",
    Min = 0,
    Max = 500,
    Increment = 10,
    Default = defaultGravity,
    Callback = function(v)
        workspace.Gravity = v
    end
})

-- ======================================
--           RESET HUMANOID
-- ======================================

local SResetHumanoid = Humanoid:AddSection({
    Name = "Reset Humanoid",
    Icon = "rbxassetid://139455170136212"
})

SResetHumanoid:AddButton({
    Name = "Reset Speed",
    Callback = function()
        local h = getHumanoid()
        if h then h.WalkSpeed = 16 end
        walkSlider:Set(16)
    end
})

SResetHumanoid:AddButton({
    Name = "Reset JumpPower",
    Callback = function()
        local h = getHumanoid()
        if h then h.JumpPower = 36 end
        jumpSlider:Set(36)
    end
})

SResetHumanoid:AddButton({
    Name = "Reset Gravity",
    Callback = function()
        workspace.Gravity = defaultGravity
        gravitySlider:Set(defaultGravity)
    end
})

-- ======================================
--              FLY SYSTEM
-- ======================================

local flySection = Humanoid:AddSection({
    Name = "Fly System",
    Icon = "rbxassetid://95147215007801"
})

flySection:AddParagraph(
    "<b><font color='#FFD700'>How it works</font></b>",
    "<font color='#AAAAAA'><b>Fly</b> You fly freely, but everyone sees you flying.<br/><br/><b>CFly</b> You move your camera and fly, but your real body stays frozen at the starting point. When you disable CFly, you are teleported to the position where you stopped moving. To others, you never left the original spot it's like a ghost flight.</font>"
)

local FlySystem = {} do

    local flyConn    = nil
    local cflyConn   = nil
    local flyEnabled = false
    local cflyEnabled = false
    local active     = false
    local mode       = "CFly"
    local speed      = 50

    local function buildMovement(dt, hd)
        local hum    = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        local moveDir = hum.MoveDirection * (speed * dt)
        local headCF  = hd.CFrame
        local camCF   = workspace.CurrentCamera.CFrame
        local camOff  = headCF:ToObjectSpace(camCF).Position
        camCF = camCF * CFrame.new(-camOff.X, -camOff.Y, -camOff.Z + 1)
        local objSpace = CFrame.new(camCF.Position, Vector3.new(headCF.Position.X, camCF.Position.Y, headCF.Position.Z)):VectorToObjectSpace(moveDir)
        return CFrame.new(headCF.Position) * (camCF - camCF.Position) * CFrame.new(objSpace)
    end

    local function setupChar()
        local char = LocalPlayer.Character
        if not char then return nil, nil end
        local hum  = char:FindFirstChildOfClass("Humanoid")
        local head = char:FindFirstChild("Head")
        return hum, head
    end

    local function stopFly()
        if flyConn then flyConn:Disconnect() flyConn = nil end
        flyEnabled = false
        local hum, head = setupChar()
        if hum  then hum.PlatformStand = false hum:ChangeState(Enum.HumanoidStateType.Landed) end
        if head then head.Anchored = false end
    end

    local function stopCFly()
        if cflyConn then cflyConn:Disconnect() cflyConn = nil end
        cflyEnabled = false
        local hum, head = setupChar()
        if hum  then hum.PlatformStand = false end
        if head then head.Anchored = false end
    end

    local function startFly()
        if flyConn then return end
        local hum, head = setupChar()
        if not hum or not head then return end
        hum.PlatformStand = true
        head.Anchored = true
        flyConn = RunService.Heartbeat:Connect(function(dt)
            if not flyEnabled then return end
            local c   = LocalPlayer.Character
            local hd  = c and c:FindFirstChild("Head")
            if not hd then return end
            local cf  = buildMovement(dt, hd)
            if cf then hd.CFrame = cf end
        end)
    end

    local function startCFly()
        if cflyConn then return end
        local hum, head = setupChar()
        if not hum or not head then return end
        hum.PlatformStand = true
        head.Anchored = true
        cflyConn = RunService.Heartbeat:Connect(function(dt)
            if not cflyEnabled then return end
            local c  = LocalPlayer.Character
            local hd = c and c:FindFirstChild("Head")
            if not hd then return end
            local cf = buildMovement(dt, hd)
            if cf then hd.CFrame = cf end
        end)
    end

    function FlySystem.setMode(v)
        mode = v
        if active then
            FlySystem.disable()
            FlySystem.enable()
        end
    end

    function FlySystem.setSpeed(v)
        speed = v
    end

    function FlySystem.enable()
        active = true
        if mode == "Fly" then
            flyEnabled = true
            startFly()
        else
            cflyEnabled = true
            startCFly()
        end
    end

    function FlySystem.disable()
        stopFly()
        stopCFly()
        active = false
    end

end

flySection:AddDropdown({
    Name = "Fly Mode",
    Default = "CFly",
    Options = {"Fly", "CFly"},
    Flag = "FlyMode",
    Save = false,
    Callback = function(v)
        FlySystem.setMode(v)
    end
})

flySection:AddSlider({
    Name = "Fly Speed",
    Min = 10,
    Max = 300,
    Default = 50,
    Increment = 5,
    ValueName = "st/s",
    Save = true,
    Flag = "FlySpeed",
    Callback = function(v)
        FlySystem.setSpeed(v)
    end
})

flySection:AddToggle({
    Name = "Enable Fly",
    Default = false,
    Flag = "FlyMasterToggle",
    Save = false,
    Callback = function(v)
        if v then FlySystem.enable() else FlySystem.disable() end
    end
})

-- ======================================
--               MISC
-- ======================================

local miscHumanoidSection = Humanoid:AddSection({
    Name = "Misc",
    Icon = "rbxassetid://7733917120"
})

local noclipEnabled       = false
local infiniteJumpEnabled = false

miscHumanoidSection:AddToggle({
    Name = "Noclip",
    Default = false,
    Callback = function(v)
        noclipEnabled = v
    end
})

miscHumanoidSection:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(v)
        infiniteJumpEnabled = v
    end
})

----------------------------------------

RunService.Stepped:Connect(function()
    if not noclipEnabled then return end
    local char = getCharacter()
    if not char then return end
    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") and part.CanCollide then
            part.CanCollide = false
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if not infiniteJumpEnabled then return end
    local h = getHumanoid()
    if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid")
    task.wait(0.1)
    local h = getHumanoid()
    if not h then return end
    h.WalkSpeed = walkSlider.Value
    h.JumpPower = jumpSlider.Value
    workspace.Gravity = gravitySlider.Value
end)
    
    Humanoid:AddLabel(
        "More features coming soon. Future updates will include new tools, improvements and additional functionality."
    )

-- ============= MISC TAB ============= --

-- ======================================
--            AUDIO CONTROL
-- ======================================

local audioSection = Misc:AddSection({
    Name = "Audio Control",
    Icon = "rbxassetid://7743877081"
})

local AudioControl = {} do

    local spamActive    = false
    local thread        = nil
    local waitTime      = 0.5
    local selectedSounds = { "All" }

    local SOUND_CATEGORIES = {
        ["CorrectSound"]      = function(s) return s.Name == "CorrectSound" end,
        ["WarningSound"]      = function(s) return s.Name == "WarningSound" end,
        ["SafeSound"]         = function(s) return s.Name == "SafeSound" end,
        ["DetectedSound"]     = function(s) return s.Name == "DetectedSound" end,
        ["SeenSound"]         = function(s) return s.Name == "SeenSound" end,
        ["ErrorSound"]        = function(s) return s.Name == "ErrorSound" end,
        ["SoundExitsUnlock"]  = function(s) return s.Name == "SoundExitsUnlock" end,
    }

    local function matchesFilter(sound)
        if table.find(selectedSounds, "All") then return true end
        for _, cat in ipairs(selectedSounds) do
            local fn = SOUND_CATEGORIES[cat]
            if fn and fn(sound) then return true end
        end
        return false
    end

    local function iterSounds(callback)
        -- SoundService
        for _, s in ipairs(game:GetService("SoundService"):GetChildren()) do
            if s:IsA("Sound") and matchesFilter(s) then
                pcall(callback, s)
            end
        end
        -- Workspace
        for _, s in ipairs(workspace:GetDescendants()) do
            if s:IsA("Sound") and matchesFilter(s) then
                pcall(callback, s)
            end
        end
    end

    function AudioControl.SetDelay(v)   waitTime = v end
    function AudioControl.SetOptions(v) selectedSounds = v end

    function AudioControl.PlayAll()
        iterSounds(function(s) s:Play() end)
    end

    function AudioControl.StartSpam()
        spamActive = true
        if thread then return end
        thread = task.spawn(function()
            while spamActive do
                iterSounds(function(s) if s.Parent then s:Play() end end)
                task.wait(waitTime)
            end
            thread = nil
        end)
    end

    function AudioControl.StopSpam()
        spamActive = false
        if thread then task.cancel(thread) thread = nil end
    end

end

audioSection:AddMultiDropdown({
    Name = "Sound Filter",
    Options = {
        "All",
        "CorrectSound",
        "WarningSound",
        "SafeSound",
        "DetectedSound",
        "SeenSound",
        "ErrorSound",
        "SoundExitsUnlock",
    },
    Default = { "All" },
    MaxSelections = 0,
    Save = true,
    Flag = "AudioSoundFilter",
    Callback = function(v)
        AudioControl.SetOptions(v)
    end
})

audioSection:AddSlider({
    Name = "Spam Delay",
    Min = 0.1,
    Max = 5,
    Increment = 0.1,
    Default = 0.5,
    Callback = function(v)
        AudioControl.SetDelay(v)
    end
})

audioSection:AddButton({
    Name = "Play All Sounds Once",
    Callback = function()
        AudioControl.PlayAll()
    end
})

audioSection:AddToggle({
    Name = "Spam All Sounds",
    Default = false,
    Callback = function(v)
        if v then AudioControl.StartSpam() else AudioControl.StopSpam() end
    end
})

-- ======================================
--             ANTI ADM
-- ======================================

local AntiAdmin = Misc:AddSection({
    Name = "Anti Admin",
    Icon = "rbxassetid://7743877081"
})

local antiModerator = false

local function checkModerator()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if not playerGui then return false end
    
    local screenGui = playerGui:FindFirstChild("ScreenGui")
    if not screenGui then return false end
    
    local playerNamesFrame = screenGui:FindFirstChild("PlayerNamesFrame")
    if not playerNamesFrame then return false end
    
    for _, v in ipairs(playerNamesFrame:GetChildren()) do
        if v:FindFirstChild("IconLabel") then
            local icon = v.IconLabel.Image
            if icon ~= "" and icon ~= "rbxassetid://1188562340" then
                return true
            end
        end
    end
    
    return false
end

AntiAdmin:AddToggle({
    Name = "Anti Admin",
    Default = true,
    Save = true,
    Flag = "AntiModerator",
    Callback = function(v)
        antiModerator = v
    end
})

coroutine.wrap(function()
    while task.wait(1) do
        if antiModerator then
            if checkModerator() then
                LocalPlayer:Kick("Admin detected in server")
            end
        end
    end
end)()

-- ======================================
--               SERVER
-- ======================================

local ServerSection = Misc:AddSection({
    Name = "Server",
    Icon = "rbxassetid://84449280774010"
})

local ServerUtils = {} do

    local HttpService     = game:GetService("HttpService")
    local TeleportService = game:GetService("TeleportService")

    local function httpGet(url)
        local ok, res = pcall(function()
            if syn and syn.request then
                return syn.request({ Url = url, Method = "GET" }).Body
            elseif http_request then
                return http_request({ Url = url, Method = "GET" }).Body
            elseif request then
                return request({ Url = url, Method = "GET" }).Body
            end
        end)
        return ok and res or nil
    end

    function ServerUtils.Rejoin()
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end

    function ServerUtils.Hop()
        local placeId = game.PlaceId
        local jobId   = game.JobId
        local valid   = {}
        local cursor  = ""

        repeat
            local url = string.format(
                "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100%s",
                placeId,
                cursor ~= "" and ("&cursor=" .. cursor) or ""
            )
            local data = httpGet(url)
            if not data then break end
            local ok, decoded = pcall(HttpService.JSONDecode, HttpService, data)
            if not ok or not decoded or not decoded.data then break end
            for _, server in ipairs(decoded.data) do
                if server.id ~= jobId and server.playing ~= nil and server.playing <= 4 then
                    table.insert(valid, { id = server.id, playing = server.playing })
                end
            end
            cursor = (decoded.nextPageCursor and decoded.nextPageCursor ~= "") and decoded.nextPageCursor or ""
            if #valid >= 10 then break end
        until cursor == ""

        if #valid == 0 then
            OrionLib:MakeNotification({ Name = "Server Hop", Content = "No low-population servers found", Time = 3 })
            return
        end

        table.sort(valid, function(a, b) return a.playing < b.playing end)

        pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, valid[1].id, LocalPlayer)
        end)
    end

end

ServerSection:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        ServerUtils.Rejoin()
    end
})

ServerSection:AddButton({
    Name = "Server Hop",
    Callback = function()
        ServerUtils.Hop()
    end
})

Misc:AddLabel("More features coming soon. Future updates will include new tools, improvements and additional functionality.")

-- =========== SETTINGS =========== --

-- ======================================
--            THEMES LIBRARY
-- ======================================

local SConfigsTemas = Settings:AddSection({
    Name = "Themes Library",
    Icon = "rbxassetid://7734021595"
})

SConfigsTemas:ChooseTheme({
    Name = "Choose a Theme",
    Default = "Abyss",
    Save = false,
    Flag = "ThemeSelect"
})

-- ======================================
--          CONFIG TRANSPARENCY
-- ======================================

local TransparencySection = Settings:AddSection({
    Name = "Config Transparency UI",
    Icon = "rbxassetid://84168862769792",
    Collapsible = true,
    DefaultCollapsed = false
})

TransparencySection:AddTransparency({
    Toggle = {
        Name = "Enable Transparency",
        Default = true,
        Save = true,
        Flag = "UITransparencyEnabled"
    },
    Slider = {
        Name = "Transparency Ui",
        Default = 0.22,
        Save = true,
        Flag = "UITransparencyValue"
    }
})

-- ======================================
--                INIT
-- ======================================

OrionLib:Init()

task.defer(function()
    task.wait(1.5)

    for flagName, flag in pairs(OrionLib.Flags) do
        if type(flag) == "table" and flag.Save then
            print("Flag:", flagName, "| Type:", flag.Type, "| Value:", tostring(flag.Value))
        end
    end
    
    local sliderFlag = OrionLib.Flags["UITransparencyValue"]
    local toggleFlag = OrionLib.Flags["UITransparencyEnabled"]
    if sliderFlag then sliderFlag:Set(sliderFlag.Value) end
    if toggleFlag then toggleFlag:Set(toggleFlag.Value) end
end)

getgenv().syn = syn

-- ============= TRANSLATE ============= --

    local tr =
        OrionLib:AddTranslation({
            Default = false,
            Translations = {
                ["Infos/Credits"] = {
                    ["pt"] = "Infos/Creditos",
                    ["es"] = "Infos/Cr3ditos",
                    ["ru"] = "Инфо/Кредиты"
                },
                ["Main"] = {
                    ["pt"] = "Principal",
                    ["es"] = "Principal",
                    ["ru"] = "Главная"
                },
            ["Fly System"] = {
            ["pt"] = "Sistema de Voo",
            ["es"] = "Sistema de Vuelo",
            ["ru"] = "Система полёта"
         },
            ["Fly Mode"] = {
    ["pt"] = "Modo de Voo",
    ["es"] = "Modo de Vuelo",
    ["ru"] = "Режим полёта"
},
            ["ESP PC Progress"] = {
    ["pt"] = "ESP Progesso de PC",
    ["es"] = "ESP Progreso de PC",
    ["ru"] = "ESP Прогресс на ПК"
},
            ["Speed Up Hacking"] = {
    ["pt"] = "Acelerar Hack PC",
    ["es"] = "Acelerar el Hackeo",
    ["ru"] = "Ускорьте взлом"
},
            ["Hack Speed Mode"] = {
    ["pt"] = "Modo de Hack PC Rapido",
    ["es"] = "Modo de Velocidad de Hackeo",
    ["ru"] = "Режим ускорения взлома"
},
            ["Crawl"] = {
    ["pt"] = "Rastejar",
    ["es"] = "Gatear",
    ["ru"] = "Ползти"
},
            ["Air"] = {
    ["pt"] = "Ar",
    ["es"] = "Aire",
    ["ru"] = "Воздух"
},
            ["Enable Speed Up Hacking"] = {
    ["pt"] = "Ativar Hack PC Rapido",
    ["es"] = "Habilitar la Aceleracion del Hackeo",
    ["ru"] = "Включить ускорение взлома"
},
            ["Sound Filter"] = {
    ["pt"] = "Escolher Som",
    ["es"] = "Filtro de Sonido",
    ["ru"] = "Звуковой фильтр"
},
            ["Play All Sounds Once"] = {
    ["pt"] = "Reproduzir Todos Sons Uma Vez",
    ["es"] = "Reproducir Todos Sonidos una vez",
    ["ru"] = "Воспроизвести все звуки один раз"
},
            ["Enable Fly"] = {
    ["pt"] = "Ativar Voo",
    ["es"] = "Activar Vuelo",
    ["ru"] = "Включить полёт"
},
            ["How it works"] = {
    ["pt"] = "Como funciona",
    ["es"] = "Como funciona",
    ["ru"] = "Как это работает"
},
            ["<b><font color='#FFD700'>How it works</font></b>"] = {
            ["pt"] = "<b><font color='#FFD700'>Como funciona</font></b>",
            ["es"] = "<b><font color='#FFD700'>Como funciona</font></b>",
            ["ru"] = "<b><font color='#FFD700'>Как это работает</font></b>"
        },
            ["<font color='#AAAAAA'><b>Fly</b> You fly freely, but everyone sees you flying.<br/><br/><b>CFly</b> You move your camera and fly, but your real body stays frozen at the starting point. When you disable CFly, you are teleported to the position where you stopped moving. To others, you never left the original spot it's like a ghost flight.</font>"] = {
                ["pt"] = "<font color='#AAAAAA'><b>Fly</b> Voce voa livremente, mas todos veem voce voando.<br/><br/><b>CFly</b> Voce move sua camera e voa, mas seu corpo real fica congelado no ponto de partida. Quando voce desativa o CFly, voce e teleportado para a posicao onde parou de se mover. Para os outros, você nunca saiu do local original e como um voo fantasma.</font>",
                ["es"] = "<font color='#AAAAAA'><b>Fly</b> Vuelas libremente, pero todos te ven volando.<br/><br/><b>CFly</b> Mueves tu camara y vuelas, pero tu cuerpo real se queda congelado en el punto de inicio. Cuando desactivas CFly, eres teletransportado a la posicion donde dejaste de moverte. Para los demas, nunca saliste del lugar original es como un vuelo fantasma.</font>",
                ["ru"] = "<font color='#AAAAAA'><b>Fly</b> Вы свободно летаете, но все видят вас летящим.<br/><br/><b>CFly</b> Вы двигаете камеру и летите, но ваше реальное тело остаётся замороженным в начальной точке. Когда вы отключаете CFly, вы телепортируетесь в позицию, где остановились. Для других вы никогда не покидали исходное место, это как призрачный полёт.</font>"
                },
                ["Beast"] = {
                    ["pt"] = "Besta",
                    ["es"] = "Bestia",
                    ["ru"] = "Зверь"
                },
                ["Survivor"] = {
                    ["pt"] = "Sobrevivente",
                    ["es"] = "Sobreviviente",
                    ["ru"] = "Выживший"
                },
                ["Visual/ESP"] = {
                    ["pt"] = "Visual/ESP",
                    ["es"] = "Visual/ESP",
                    ["ru"] = "Визуал/ESP"
                },
                ["Teleports"] = {
                    ["pt"] = "Teletransportes",
                    ["es"] = "Teletransportes",
                    ["ru"] = "Телепорты"
                },
                ["Humanoid"] = {
                    ["pt"] = "Humanoide",
                    ["es"] = "Humanoide",
                    ["ru"] = "Гуманоид"
                },
                ["Misc"] = {
                    ["pt"] = "Outros",
                    ["es"] = "Varios",
                    ["ru"] = "Разное"
                },
                ["Settings"] = {
                    ["pt"] = "Configs",
                    ["es"] = "Ajustes",
                    ["ru"] = "Настройки"
                },
                ["Credits"] = {
                    ["pt"] = "Creditos",
                    ["es"] = "Creditos",
                    ["ru"] = "Кредиты"
                },
                ["Server Discord"] = {
                    ["pt"] = "Servidor Discord",
                    ["es"] = "Servidor de Discord",
                    ["ru"] = "Сервер Discord"
                },
                ["Social Media"] = {
                    ["pt"] = "Redes Sociais",
                    ["es"] = "Redes Sociales",
                    ["ru"] = "Соцсети"
                },
                ["Never Fail PC"] = {
                    ["pt"] = "Nunca Falhar no PC",
                    ["es"] = "Nunca Fallar en PC",
                    ["ru"] = "Никогда не провалить ПК"
                },
                ["Auto Interact"] = {
                    ["pt"] = "Interagir Automaticamente",
                    ["es"] = "Interaccion Automatica",
                    ["ru"] = "Авто-взаимодействие"
                },
                ["Beast"] = {
                    ["pt"] = "Besta",
                    ["es"] = "Bestia",
                    ["ru"] = "Чудовище"
                },
                ["Remote Abuse"] = {
                    ["pt"] = "Remote Abuse",
                    ["es"] = "Abuso de Remote",
                    ["ru"] = "Злоупотребление Remote"
                },
                ["Help Captured Players"] = {
                    ["pt"] = "Ajudar Capturados Automaticamente",
                    ["es"] = "Ayudar Capturados Automaticamente",
                    ["ru"] = "Авто-помощь захваченным"
                },
                ["Others"] = {
                    ["pt"] = "Outros",
                    ["es"] = "Otros",
                    ["ru"] = "Прочее"
                },
                ["Players"] = {
                    ["pt"] = "Jogadores",
                    ["es"] = "Jugadores",
                    ["ru"] = "Игроки"
                },
                ["Computers"] = {
                    ["pt"] = "Computadores",
                    ["es"] = "Computadoras",
                    ["ru"] = "Компьютеры"
                },
                ["Hiding Spots"] = {
                    ["pt"] = "Esconderijos",
                    ["es"] = "Escondites",
                    ["ru"] = "Укрытия"
                },
                ["Teleport To Players"] = {
                    ["pt"] = "Teleportar para Jogadores",
                    ["es"] = "Teletransportarse a Jugadores",
                    ["ru"] = "Телепорт к игрокам"
                },
                ["Teleports Game"] = {
                    ["pt"] = "Teletransportes do Jogo",
                    ["es"] = "Teletransportes del Juego",
                    ["ru"] = "Телепорты игры"
                },
                ["Speed"] = {
                    ["pt"] = "Velocidade",
                    ["es"] = "Velocidad",
                    ["ru"] = "Скорость"
                },
                ["Jump"] = {
                    ["pt"] = "Pulo",
                    ["es"] = "Salto",
                    ["ru"] = "Прыжок"
                },
                ["Gravity"] = {
                    ["pt"] = "Gravidade",
                    ["es"] = "Gravedad",
                    ["ru"] = "Гравитация"
                },
                ["Fly"] = {
                    ["pt"] = "Fly/Voar",
                    ["es"] = "Fly/Volar",
                    ["ru"] = "Fly/Полёт"
                },
                ["CFly"] = {
                    ["pt"] = "CFly/CVoar",
                    ["es"] = "Cfly/CVolar",
                    ["ru"] = "Cfly/CПолёт"
                },
                ["Audio Control"] = {
                    ["pt"] = "Controle de Audio",
                    ["es"] = "Control de Audio",
                    ["ru"] = "Управление звуком"
                },
                ["Server"] = {
                    ["pt"] = "Servidor",
                    ["es"] = "Servidor",
                    ["ru"] = "Сервер"
                },
                ["Rejoin"] = {
                    ["pt"] = "Reconectar",
                    ["es"] = "Reconectarse",
                    ["ru"] = "Переподключение"
                },
                ["Server Hop"] = {
                    ["pt"] = "Trocar Servidor",
                    ["es"] = "Cambiar Servidor",
                    ["ru"] = "Смена сервера"
                },
                ["Themes Library"] = {
                    ["pt"] = "Temas da Library",
                    ["es"] = "Temas de la Libreria",
                    ["ru"] = "Темы библиотеки"
                },
                ["Config Transparency UI"] = {
                    ["pt"] = "Configurar Transparencia",
                    ["es"] = "Configurar Transparencia",
                    ["ru"] = "Настройка прозрачности"
                },
                ["Configs Beast"] = {
                    ["pt"] = "Configs da Besta",
                    ["es"] = "Configs de la Bestia",
                    ["ru"] = "Настройки чудовища"
                },
                ["Never Fail PCs"] = {
                    ["pt"] = "Nunca Falhar nos PCs",
                    ["es"] = "Nunca Fallar en PCs",
                    ["ru"] = "Никогда не проваливать ПК"
                },
                ["Auto Hit"] = {
                    ["pt"] = "Bater Automaticamente",
                    ["es"] = "Golpe Automatico",
                    ["ru"] = "Авто-удар"
                },
                ["Auto Rope"] = {
                    ["pt"] = "Corda Automaticamente",
                    ["es"] = "Cuerda Automatica",
                    ["ru"] = "Авто-верёвка"
                },
                ["Anti Slow"] = {
                    ["pt"] = "Anti Ficar Lentidao (Pulo/Hammer)",
                    ["es"] = "Anti-Lentitud",
                    ["ru"] = "Анти-замедление"
                },
                ["ESP Ragdoll Timer"] = {
                    ["pt"] = "Ver Barra de Caido/Ragdoll",
                    ["es"] = "ESP Temporizador Caido/Ragdoll",
                    ["ru"] = "ESP таймер Ragdoll"
                },
                ["Third Person"] = {
                    ["pt"] = "Desbloquear Terceira Pessoa",
                    ["es"] = "Tercera Persona",
                    ["ru"] = "Третье лицо"
                },
                ["Slow Beast"] = {
                    ["pt"] = "Deixar a Besta Lenta",
                    ["es"] = "Ralentizar Bestia",
                    ["ru"] = "Замедлить чудовище"
                },
                ["Remove Rope"] = {
                    ["pt"] = "Remover Corda da Besta",
                    ["es"] = "Quitar Cuerda",
                    ["ru"] = "Убрать верёвку"
                },
                ["Full Bright"] = {
                    ["pt"] = "Brilho Total",
                    ["es"] = "Brillo Total",
                    ["ru"] = "Полная яркость"
                },
                ["Anti Ragdoll"] = {
                    ["pt"] = "Anti-Ragdoll",
                    ["es"] = "Anti-Ragdoll",
                    ["ru"] = "Анти-рэгдолл"
                },
                ["ESP Players"] = {
                    ["pt"] = "ESP Jogadores",
                    ["es"] = "ESP Jugadores",
                    ["ru"] = "ESP игроков"
                },
               ["ESP Name Players"] = {
                    ["pt"] = "ESP Nome Jogadores",
                    ["es"] = "ESP Nombres Jugadores",
                    ["ru"] = "ESP Назовите игроков"
                },
                    ["ESP Doors"] = {
                    ["pt"] = "ESP Portas",
                    ["es"] = "ESP Puertas",
                    ["ru"] = "ESP Двери"
                },
                    ["ESP Vents"] = {
                    ["pt"] = "ESP Dutos de Ventilacao",
                    ["es"] = "ESP Conductos de Ventilacion",
                    ["ru"] = "ESP Вентиляционные каналы"
                },
                ["ESP PCs"] = {
                    ["pt"] = "ESP Computadores",
                    ["es"] = "ESP Computadoras",
                    ["ru"] = "ESP компьютеров"
                },
                ["ESP BETA Hiding Spots"] = {
                    ["pt"] = "ESP BETA Esconderijos",
                    ["es"] = "ESP BETA Escondites",
                    ["ru"] = "ESP БЕТА укрытий"
                },
                ["ESP Freeze Pods"] = {
                    ["pt"] = "ESP Capsulas de Gelo",
                    ["es"] = "ESP Capsulas de Hielo",
                    ["ru"] = "ESP капсул заморозки"
                },
                ["ESP Exit Door"] = {
                    ["pt"] = "ESP Porta de Saida",
                    ["es"] = "ESP Puerta de Salida",
                    ["ru"] = "ESP выходной двери"
                },
                ["Noclip"] = {
                    ["pt"] = "Noclip/Atravessar Paredes",
                    ["es"] = "Noclip/Atravesando paredes",
                    ["ru"] = "Noclip/Прохождение сквозь стены"
                },
                ["Infinite Jump"] = {
                    ["pt"] = "Pulo Infinito",
                    ["es"] = "Salto Infinito",
                    ["ru"] = "Бесконечный прыжок"
                },
                ["Spam All Sounds"] = {
                    ["pt"] = "Spamar Todos os Sons",
                    ["es"] = "Spamear Todos los Sonidos",
                    ["ru"] = "Спамить все звуки"
                },
                ["Enable Transparency"] = {
                    ["pt"] = "Ativar Transparencia",
                    ["es"] = "Activar Transparencia",
                    ["ru"] = "Включить прозрачность"
                },
                ["Auto Help Captured Players"] = {
                    ["pt"] = "Ajuda Automatica Jogadores Capturados",
                    ["es"] = "Ayuda Automatica para jugadores capturados",
                    ["ru"] = "Автоматическая помощь. Захваченные игроки."
                },
                ["Help Captured Player"] = {
                    ["pt"] = "Ajuda Jogador Capturado",
                    ["es"] = " Ayuda al jugador capturado",
                    ["ru"] = "Помощь Захваченному игроку"
                },
                ["Reset Humanoid"] = {
                    ["pt"] = "Resetar Humanoide",
                    ["es"] = "Reiniciar humanoide",
                    ["ru"] = "Сбросить гуманоид"
                },
                ["Reset Gravity"] = {
                    ["pt"] = "Resetar Gravidade",
                    ["es"] = "Reiniciar Gravedad",
                    ["ru"] = "Сбросить гравитацию"
                },
               ["Reset Jump"] = {
                    ["pt"] = "Resetar Pulo",
                    ["es"] = "Reiniciar Salto",
                    ["ru"] = "Сбросить прыжок"
                },
                ["Reset Speed"] = {
                    ["pt"] = "Resetar Velocidade",
                    ["es"] = "Reiniciar Velocidad",
                    ["ru"] = "Сбросить скорость"
                },
                ["Teleport To Player Selected"] = {
                    ["pt"] = "Teleportar ao Jogador Selecionado",
                    ["es"] = "Teletransportarse al Jugador Seleccionado",
                    ["ru"] = "Телепорт к выбранному игроку"
                },
                ["Teleport to Map"] = {
                    ["pt"] = "Teleportar para o Mapa",
                    ["es"] = "Teletransportarse al Mapa",
                    ["ru"] = "Телепорт на карту"
                },
                ["Teleport to Lobby"] = {
                    ["pt"] = "Teleportar para o Lobby",
                    ["es"] = "Teletransportarse al Lobby",
                    ["ru"] = "Телепорт в лобби"
                },
                ["Teleport to PC"] = {
                    ["pt"] = "Teleportar para PC",
                    ["es"] = "Teletransportarse al PC",
                    ["ru"] = "Телепорт к ПК"
                },
                ["Teleport to Exit Door"] = {
                    ["pt"] = "Teleportar para Porta de Saida",
                    ["es"] = "Teletransportarse a la Puerta de Salida",
                    ["ru"] = "Телепорт к выходной двери"
                },
                ["Reset"] = {
                    ["pt"] = "Resetar",
                    ["es"] = "Reiniciar",
                    ["ru"] = "Сбросить"
                },
                ["Play All Sounds Once"] = {
                    ["pt"] = "Reproduzir Todos os Sons",
                    ["es"] = "Reproducir Todos los Sonidos",
                    ["ru"] = "Воспроизвести все звуки"
                },
                ["Rejoin Server"] = {
                    ["pt"] = "Reconectar ao Servidor",
                    ["es"] = "Reconectarse al Servidor",
                    ["ru"] = "Переподключиться к серверу"
                },
                ["Server Hop"] = {
                    ["pt"] = "Trocar de Servidor",
                    ["es"] = "Cambiar de Servidor",
                    ["ru"] = "Сменить сервер"
                },
                ["Walk Speed"] = {
                    ["pt"] = "Velocidade de Caminhada",
                    ["es"] = "Velocidad de Caminar",
                    ["ru"] = "Скорость ходьбы"
                },
                ["Jump Power"] = {
                    ["pt"] = "Forca do Pulo",
                    ["es"] = "Potencia de Salto",
                    ["ru"] = "Сила прыжка"
                },
                ["Fly Speed"] = {
                    ["pt"] = "Velocidade de Fly/Voo",
                    ["es"] = "Velocidad de Fly/Vuelo",
                    ["ru"] = "Скорость полёта"
                },
                ["CFly Speed"] = {
                    ["pt"] = "Velocidade de Cfly/CVoar",
                    ["es"] = "Velocidad de CFly/CVuelo",
                    ["ru"] = "Скорость CПолёта"
                },
                ["Spam Delay"] = {
                    ["pt"] = "Intervalo do Spam",
                    ["es"] = "Retraso del Spam",
                    ["ru"] = "Задержка спама"
                },
                ["Transparency Ui"] = {
                    ["pt"] = "Transparencia da UI",
                    ["es"] = "Transparencia de la UI",
                    ["ru"] = "Прозрачность интерфейса"
                },
                ["Auto Hit Range"] = {
                    ["pt"] = "Alcance do Auto Hit",
                    ["es"] = "Rango del Auto Golpe",
                    ["ru"] = "Радиус авто-удара"
                },
                ["Interact Filter"] = {
                    ["pt"] = "Filtro de Interacao",
                    ["es"] = "Filtro de Interaccion",
                    ["ru"] = "Фильтр взаимодействий"
                },
                ["Select Player"] = {
                    ["pt"] = "Selecionar Jogador",
                    ["es"] = "Seleccionar Jugador",
                    ["ru"] = "Выбрать игрока"
                },
                ["Choose a Player"] = {
                    ["pt"] = "Escolha um Jogador",
                    ["es"] = "Elige un Jugador",
                    ["ru"] = "Выберите игрока"
                },
                ["Choose a Theme"] = {
                    ["pt"] = "Escolha um Tema",
                    ["es"] = "Elige un Tema",
                    ["ru"] = "Выберите тему"
                },
                ["Whitelist Players"] = {
                    ["pt"] = "Lista Branca de Jogadores",
                    ["es"] = "Lista Blanca de Jugadores",
                    ["ru"] = "Белый список игроков"
                },
                ["No players whitelisted"] = {
                    ["pt"] = "Nenhum jogador na lista",
                    ["es"] = "Sin jugadores en la lista",
                    ["ru"] = "Нет игроков в списке"
                },
                ["More features coming soon. Future updates will include new tools, improvements and additional functionality."] = {
                    ["pt"] = "Mais recursos em breve. Futuras atualizacoes incluirao novas ferramentas, melhorias e funcionalidades adicionais.",
                    ["es"] = "Mas funciones proximamente. Las actualizaciones futuras incluiran nuevas herramientas, mejoras y funcionalidades adicionales.",
                    ["ru"] = "Больше функций скоро. Будущие обновления включат новые инструменты, улучшения и дополнительный функционал."
                },
                ["Made with <font color='#ff9999'>love</font> by <font color='#ff9999'>ySixx</font>"] = {
                    ["pt"] = "Feito com <font color='#ff9999'>amor</font> por <font color='#ff9999'>ySixx</font>",
                    ["es"] = "Hecho con <font color='#ff9999'>amor</font> por <font color='#ff9999'>ySixx</font>",
                    ["ru"] = "Сделано с <font color='#ff9999'>любовью</font> от <font color='#ff9999'>ySixx</font>"
                },
                ["Need help or have ideas?"] = {
                    ["pt"] = "Precisa de ajuda ou tem ideias?",
                    ["es"] = "Necesitas ayuda o tienes ideas?",
                    ["ru"] = "Нужна помощь или есть идеи?"
                },
                ["<font color='#FFD700'>Beta Feature</font>"] = {
                    ["pt"] = "<font color='#FFD700'>Funcionalidade Beta</font>",
                    ["es"] = "<font color='#FFD700'>Funcion Beta</font>",
                    ["ru"] = "<font color='#FFD700'>Бета-функция</font>"
                },
                ["<b><font color='#FFD700'>CFly Ghost Flight</font></b>"] = {
                    ["pt"] = "<b><font color='#FFD700'>CFly: Voo Fantasma</font></b>",
                    ["es"] = "<b><font color='#FFD700'>CFly: Vuelo Fantasma</font></b>",
                    ["ru"] = "<b><font color='#FFD700'>CFly: Призрачный полёт</font></b>"
                },
                ["<b>More features coming soon.</b>"] = {
                    ["pt"] = "<b>Mais recursos em breve.</b>",
                    ["es"] = "<b>Mas funciones proximamente.</b>",
                    ["ru"] = "<b>Больше функций скоро.</b>"
                },
                ["<b>Beast Section</b>"] = {
                    ["pt"] = "<b>Secao da Besta</b>",
                    ["es"] = "<b>Seccion de la Bestia</b>",
                    ["ru"] = "<b>Раздел чудовища</b>"
                },
                ["<b><font color='#FFD700'>Beast Configs</font></b>"] = {
                    ["pt"] = "<b><font color='#FFD700'>Configs da Besta</font></b>",
                    ["es"] = "<b><font color='#FFD700'>Configs de la Bestia</font></b>",
                    ["ru"] = "<b><font color='#FFD700'>Настройки чудовища</font></b>"
                },
                ["Remote Abuse"] = {
                    ["pt"] = "Abuso de Remote",
                    ["es"] = "Abuso de Remote",
                    ["ru"] = "Злоупотребление Remote"
                },
                ["<b>Server Options</b>"] = {
                    ["pt"] = "<b>Opcoes de Servidor</b>",
                    ["es"] = "<b>Opciones de Servidor</b>",
                    ["ru"] = "<b>Параметры сервера</b>"
                },
                ["<i>I vanished for a while, but the spark never died. Now I'm back maybe just for this project, maybe for the long run. Either way, the journey continues.</i><br/><br/><font color='#dddddd'>Hope you enjoy the experience.</font> <b>Join the Discord server to stay updated.</b>"] = {
                    ["pt"] = "<i>Fiquei ausente por um tempo, mas a chama nunca se apagou. Agora estou de volta talvez so para este projeto, talvez por muito mais. De qualquer forma, a jornada continua.</i><br/><br/><font color='#dddddd'>Espero que aproveite a experiencia.</font> <b>Entre no servidor do Discord para ficar por dentro.</b>",
                    ["es"] = "<i>Desapareci por un tiempo, pero la chispa nunca se apago. Ahora estoy de vuelta quizas solo para este proyecto, quizas por mucho mas. De cualquier manera, el viaje continua.</i><br/><br/><font color='#dddddd'>Espero que disfrutes la experiencia.</font> <b>Unete al servidor de Discord para estar al tanto.</b>",
                    ["ru"] = "<i>Я исчез на время, но искра не угасла. Теперь я вернулся может, только для этого проекта, а может, надолго. В любом случае, путешествие продолжается.</i><br/><br/><font color='#dddddd'>Надеюсь, вам понравится.</font> <b>Заходите на сервер Discord, чтобы быть в курсе.</b>"
                },
                ["<font color='#ffbb88'>If you find a bug, have a suggestion, or simply want to chat, reach out on <b>Discord</b> or join our community using the links below.</font> <i>Your feedback matters.</i>"] = {
                    ["pt"] = "<font color='#ffbb88'>Se encontrar um bug, tiver uma sugestao ou simplesmente quiser conversar, entre em contato pelo <b>Discord</b> ou junte-se a nossa comunidade pelos links abaixo.</font> <i>O seu feedback importa.</i>",
                    ["es"] = "<font color='#ffbb88'>Si encuentras un error, tienes una sugerencia o simplemente quieres charlar, contactanos en <b>Discord</b> o unete a nuestra comunidad usando los enlaces de abajo.</font> <i>Tu opinion importa.</i>",
                    ["ru"] = "<font color='#ffbb88'>Если вы нашли баг, есть предложение или просто хотите пообщаться напишите в <b>Discord</b> или вступайте в наше сообщество по ссылкам ниже.</font> <i>Ваш отзыв важен.</i>"
                },
                ["<i>Please be kind to the 'artist' (yes, that's me lol)</i>"] = {
                    ["pt"] = "<i>Seja gentil com o 'artista' (sim, sou eu kkk)</i>",
                    ["es"] = "<i>Se amable con el 'artista' (si, ese soy yo jaja)</i>",
                    ["ru"] = "<i>Будьте добры к «художнику» (да, это я лол)</i>"
                },
                ["<b>Auto Hit:</b> Automatically strikes nearby survivors\n<b>Auto Rope:</b> Ties up survivors automatically in range\n<b>Anti Slow:</b> Prevents movement speed reduction\n<b>Ragdoll Progress:</b> Shows escape progress above captured players\n<b>Third Person:</b> Forces third-person camera view"] = {
                    ["pt"] = "<b>Auto Hit:</b> Golpeia sobreviventes proximos automaticamente\n<b>Auto Rope:</b> Amarra sobreviventes no alcance automaticamente\n<b>Anti Slow:</b> Impede a reducao de velocidade de movimento\n<b>Ragdoll Progress:</b> Mostra o progresso de fuga acima dos capturados\n<b>Terceira Pessoa:</b> Forca a camera em terceira pessoa",
                    ["es"] = "<b>Auto Hit:</b> Golpea automaticamente a los supervivientes cercanos\n<b>Auto Rope:</b> Ata automaticamente a los supervivientes en rango\n<b>Anti Slow:</b> Evita la reduccion de velocidad de movimiento\n<b>Ragdoll Progress:</b> Muestra el progreso de escape sobre los capturados\n<b>Tercera Persona:</b> Fuerza la camara en tercera persona",
                    ["ru"] = "<b>Авто-удар:</b> Автоматически бьёт ближайших выживших\n<b>Авто-верёвка:</b> Автоматически связывает выживших в радиусе\n<b>Анти-замедление:</b> Предотвращает снижение скорости движения\n<b>Ragdoll прогресс:</b> Показывает прогресс побега над захваченными\n<b>Третье лицо:</b> Принудительная камера от третьего лица"
                },
                ["<b><font color='#FF6666'>Auto Hit Range:</font></b> <font color='#CCCCCC'>Defines how far Auto Hit and Auto Rope reach. Default is 32 studs.</font>\n\n<b><font color='#66FF99'>Range Visualizer:</font></b> <font color='#CCCCCC'>Shows a sphere around you representing the current hit range. Only visible to you.</font>\n\n<b><font color='#66AAFF'>Whitelist:</font></b> <font color='#CCCCCC'>Players added here will be <b>ignored</b> by Auto Hit and Auto Rope, even if they are in range.</font>"] = {
                    ["pt"] = "<b><font color='#FF6666'>Alcance do Auto Hit:</font></b> <font color='#CCCCCC'>Define o alcance do Auto Hit e Auto Rope. Padrao de 32 studs.</font>\n\n<b><font color='#66FF99'>Visualizador de Alcance:</font></b> <font color='#CCCCCC'>Mostra uma esfera ao redor de voce representando o alcance atual. Visivel apenas para voce.</font>\n\n<b><font color='#66AAFF'>Lista Branca:</font></b> <font color='#CCCCCC'>Jogadores adicionados aqui serao <b>ignorados</b> pelo Auto Hit e Auto Rope, mesmo estando no alcance.</font>",
                    ["es"] = "<b><font color='#FF6666'>Rango del Auto Golpe:</font></b> <font color='#CCCCCC'>Define el alcance del Auto Hit y Auto Rope. Por defecto 32 studs.</font>\n\n<b><font color='#66FF99'>Visualizador de Rango:</font></b> <font color='#CCCCCC'>Muestra una esfera alrededor tuyo representando el rango actual. Solo visible para ti.</font>\n\n<b><font color='#66AAFF'>Lista Blanca:</font></b> <font color='#CCCCCC'>Los jugadores aqui seran <b>ignorados</b> por Auto Hit y Auto Rope, aunque esten en rango.</font>",
                    ["ru"] = "<b><font color='#FF6666'>Радиус авто-удара:</font></b> <font color='#CCCCCC'>Задаёт дальность Авто-удара и Авто-верёвки. По умолчанию 32 студа.</font>\n\n<b><font color='#66FF99'>Визуализатор радиуса:</font></b> <font color='#CCCCCC'>Показывает сферу вокруг вас с текущим радиусом. Видна только вам.</font>\n\n<b><font color='#66AAFF'>Белый список:</font></b> <font color='#CCCCCC'>Игроки здесь будут <b>игнорироваться</b> Авто-ударом и Авто-верёвкой, даже если они в радиусе.</font>"
                },
                ['<font face="SourceSansBold" color="#FFFFFF" size="14">Remote Abuse</font> <font face="SourceSans" color="#B0B0B0" size="12"> <b>Slow Beast</b> continuously reduces the beast\'s movement speed. <b>Remove Rope</b> automatically frees any survivor caught by the beast.</font>'] = {
                    ["pt"] = '<font face="SourceSansBold" color="#FFFFFF" size="14">Abuso de Remote</font> <font face="SourceSans" color="#B0B0B0" size="12"> <b>Slow Beast</b> reduz continuamente a velocidade da Besta. <b>Remove Rope</b> libera automaticamente qualquer sobrevivente preso pela Besta.</font>',
                    ["es"] = '<font face="SourceSansBold" color="#FFFFFF" size="14">Abuso de Remote</font> <font face="SourceSans" color="#B0B0B0" size="12"> <b>Slow Beast</b> reduce continuamente la velocidad de la Bestia. <b>Remove Rope</b> libera automaticamente a cualquier superviviente atrapado por la Bestia.</font>',
                    ["ru"] = '<font face="SourceSansBold" color="#FFFFFF" size="14">Злоупотребление Remote</font> <font face="SourceSans" color="#B0B0B0" size="12"> <b>Slow Beast</b> непрерывно снижает скорость чудовища. <b>Remove Rope</b> автоматически освобождает любого выжившего, пойманного чудовищем.</font>'
                },
                ["<font color='#AAAAAA'>Freezes your character in place while you fly using camera direction. On deactivation you appear at the new position. <font color='#FF8888'>To others, you never moved.</font></font>"] = {
                    ["pt"] = "<font color='#AAAAAA'>Congela seu personagem no lugar enquanto voce voa usando a direcao da camera. Ao desativar, voce aparece na nova posicao. <font color='#FF8888'>Para os outros, voce nunca se moveu.</font></font>",
                    ["es"] = "<font color='#AAAAAA'>Congela tu personaje en el lugar mientras vuelas usando la direccion de la camara. Al desactivar, apareces en la nueva posicion. <font color='#FF8888'>Para los demas, nunca te moviste.</font></font>",
                    ["ru"] = "<font color='#AAAAAA'>Замораживает персонажа на месте, пока вы летите по направлению камеры. При отключении вы появляетесь в новом месте. <font color='#FF8888'>Для других вы никуда не двигались.</font></font>"
                },
                ["<font color='#ffaa00'>Rejoin the same server, quickly teleport back, or reset your character.</font>"] = {
                    ["pt"] = "<font color='#ffaa00'>Reconecte ao mesmo servidor, teletransporte-se rapidamente de volta ou resete seu personagem.</font>",
                    ["es"] = "<font color='#ffaa00'>Reconectate al mismo servidor, teletransportate rapidamente de vuelta o reinicia tu personaje.</font>",
                    ["ru"] = "<font color='#ffaa00'>Переподключитесь к тому же серверу, быстро телепортируйтесь обратно или сбросьте своего персонажа.</font>"
                }
            }
        })
    
    task.defer(
        function()
            task.wait(0.5)
            tr:Enable()
        end
    )
end