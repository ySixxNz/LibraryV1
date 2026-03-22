--> Library V1 - By ySixx / @ysixx <--

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local MinimizeGUI

if getgenv().LEEN_DEBUG then
    warn("[ DEBUG SCRIPT ]")

    warn("Swift Function:", swift_internal_correct)
    warn("Gethui Function:", gethui)
    warn(
        "Check:",
        swift_internal_correct and "Swift Issue" or gethui and "Normal" or game:GetService("CoreGui") and "Normal ²"
    )

    warn("[ DEBUG END ]")
end

local PARENT =
    swift_internal_correct and game:GetService("CoreGui") or gethui and gethui() or game:GetService("CoreGui")

local OrionLib = {
    Elements = {},
    ThemeObjects = {},
    Connections = {},
    Flags = {},
    Themes = {
        Default = {
            Main = Color3.fromRGB(0, 0, 0),
            Second = Color3.fromRGB(15, 15, 15),
            Stroke = Color3.fromRGB(70, 70, 70),
            Divider = Color3.fromRGB(60, 60, 60),
            Text = Color3.fromRGB(240, 240, 240),
            TextDark = Color3.fromRGB(170, 170, 170)
        },
        Cyberpunk = {
            Main = Color3.fromRGB(10, 0, 20),
            Second = Color3.fromRGB(25, 0, 50),
            Stroke = Color3.fromRGB(255, 0, 140),
            Divider = Color3.fromRGB(0, 255, 255),
            Text = Color3.fromRGB(255, 255, 255),
            TextDark = Color3.fromRGB(180, 0, 255)
        },
        NeonBlue = {
            Main = Color3.fromRGB(0, 10, 25),
            Second = Color3.fromRGB(0, 25, 50),
            Stroke = Color3.fromRGB(0, 170, 255),
            Divider = Color3.fromRGB(0, 255, 255),
            Text = Color3.fromRGB(220, 240, 255),
            TextDark = Color3.fromRGB(120, 180, 255)
        },
        Emerald = {
            Main = Color3.fromRGB(0, 20, 10),
            Second = Color3.fromRGB(0, 35, 20),
            Stroke = Color3.fromRGB(0, 255, 140),
            Divider = Color3.fromRGB(0, 200, 120),
            Text = Color3.fromRGB(220, 255, 240),
            TextDark = Color3.fromRGB(120, 200, 160)
        },
        Sunset = {
            Main = Color3.fromRGB(30, 10, 0),
            Second = Color3.fromRGB(60, 20, 0),
            Stroke = Color3.fromRGB(255, 120, 0),
            Divider = Color3.fromRGB(255, 60, 0),
            Text = Color3.fromRGB(255, 230, 200),
            TextDark = Color3.fromRGB(200, 140, 100)
        },
        VioletGlass = {
            Main = Color3.fromRGB(20, 0, 40),
            Second = Color3.fromRGB(40, 0, 70),
            Stroke = Color3.fromRGB(180, 0, 255),
            Divider = Color3.fromRGB(120, 0, 255),
            Text = Color3.fromRGB(240, 220, 255),
            TextDark = Color3.fromRGB(170, 120, 255)
        },
        Aurora = {
            Main = Color3.fromRGB(10, 10, 50),
            Second = Color3.fromRGB(30, 30, 90),
            Stroke = Color3.fromRGB(120, 255, 245),
            Divider = Color3.fromRGB(70, 180, 255),
            Text = Color3.fromRGB(235, 245, 255),
            TextDark = Color3.fromRGB(150, 200, 230)
        },
        Prism = {
            Main = Color3.fromRGB(0, 15, 25),
            Second = Color3.fromRGB(15, 30, 45),
            Stroke = Color3.fromRGB(255, 200, 0),
            Divider = Color3.fromRGB(255, 120, 90),
            Text = Color3.fromRGB(255, 245, 230),
            TextDark = Color3.fromRGB(180, 170, 150)
        },
        Twilight = {
            Main = Color3.fromRGB(25, 0, 40),
            Second = Color3.fromRGB(50, 0, 80),
            Stroke = Color3.fromRGB(200, 80, 255),
            Divider = Color3.fromRGB(120, 0, 180),
            Text = Color3.fromRGB(240, 210, 255),
            TextDark = Color3.fromRGB(160, 100, 200)
        },
        NeonPulse = {
            Main = Color3.fromRGB(5, 0, 20),
            Second = Color3.fromRGB(15, 0, 50),
            Stroke = Color3.fromRGB(0, 255, 255),
            Divider = Color3.fromRGB(0, 200, 255),
            Text = Color3.fromRGB(220, 255, 255),
            TextDark = Color3.fromRGB(100, 180, 200)
        },
        GlassMint = {
            Main = Color3.fromRGB(0, 35, 30),
            Second = Color3.fromRGB(0, 55, 45),
            Stroke = Color3.fromRGB(100, 255, 200),
            Divider = Color3.fromRGB(60, 180, 145),
            Text = Color3.fromRGB(225, 255, 245),
            TextDark = Color3.fromRGB(140, 200, 180)
        },
        EmberNight = {
            Main = Color3.fromRGB(30, 5, 10),
            Second = Color3.fromRGB(60, 10, 20),
            Stroke = Color3.fromRGB(255, 100, 50),
            Divider = Color3.fromRGB(255, 70, 30),
            Text = Color3.fromRGB(255, 235, 220),
            TextDark = Color3.fromRGB(200, 150, 130)
        },
        OceanWave = {
            Main = Color3.fromRGB(0, 30, 50),
            Second = Color3.fromRGB(0, 55, 80),
            Stroke = Color3.fromRGB(80, 220, 255),
            Divider = Color3.fromRGB(50, 180, 220),
            Text = Color3.fromRGB(220, 255, 255),
            TextDark = Color3.fromRGB(120, 190, 210)
        },
        LavaGlow = {
            Main = Color3.fromRGB(40, 0, 0),
            Second = Color3.fromRGB(80, 10, 10),
            Stroke = Color3.fromRGB(255, 90, 0),
            Divider = Color3.fromRGB(200, 60, 0),
            Text = Color3.fromRGB(255, 230, 210),
            TextDark = Color3.fromRGB(200, 130, 110)
        },
        SkyGlass = {
            Main = Color3.fromRGB(20, 25, 60),
            Second = Color3.fromRGB(40, 45, 90),
            Stroke = Color3.fromRGB(100, 180, 255),
            Divider = Color3.fromRGB(60, 130, 200),
            Text = Color3.fromRGB(225, 240, 255),
            TextDark = Color3.fromRGB(150, 180, 210)
        }
    },
    Categories = {
        Default = {"Default"},
        Dark = {"Emerald", "Sunset", "VioletGlass", "Twilight", "EmberNight"},
        White = {"GlassMint", "Aurora", "Prism", "OceanWave"},
        Misc = {"Cyberpunk", "NeonBlue", "NeonPulse", "LavaGlow", "SkyGlass"}
    },
    SelectedTheme = "Default",
    Folder = nil,
    SaveCfg = false
}

-- feather Icons https://github.com/evoincorp/lucideblox/tree/master/src/modules/util - Created by 7kayoh

local ICONS_URLS = {
    v1 = "https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Resources/IconsV1.json",
    v2 = "https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Resources/IconsV2.json"
}

local SelectedIconsVersion = "v1"
local Icons = {}

local function NormalizeVersion(v)
    v = tostring(v):lower()
    if v == "v1" then
        return "v1"
    elseif v == "v2" then
        return "v2"
    else
        return "v1"
    end
end

local function LoadIcons(version)
    version = NormalizeVersion(version)

    local success, response =
        pcall(
        function()
            return game:HttpGet(ICONS_URLS[version])
        end
    )

    if success then
        local decoded = HttpService:JSONDecode(response)
        Icons = decoded.icons or {}
        SelectedIconsVersion = version
    else
        warn("Erro ao carregar ícones (" .. version .. "): " .. tostring(response))
        Icons = {}
        SelectedIconsVersion = "v1"
    end
end

function SetIconsVersion(v)
    LoadIcons(v)
end

function GetIcon(name)
    return Icons[name]
end

LoadIcons(SelectedIconsVersion)

local Orion = Instance.new("ScreenGui")
Orion.Name = "Orion"
Orion.Parent = PARENT

for _, Interface in ipairs(PARENT:GetChildren()) do
    if Interface.Name == Orion.Name and Interface ~= Orion then
        Interface:Destroy()
    end
end

function OrionLib:IsRunning()
    return Orion.Parent == PARENT
end

local function AddConnection(Signal, Function)
    if (not OrionLib:IsRunning()) then
        return
    end
    local SignalConnect = Signal:Connect(Function)
    table.insert(OrionLib.Connections, SignalConnect)
    return SignalConnect
end

task.spawn(
    function()
        while (OrionLib:IsRunning()) do
            wait()
        end

        for _, Connection in next, OrionLib.Connections do
            Connection:Disconnect()
        end
    end
)

local function MakeDraggable(DragPoint, Main)
    pcall(
        function()
            local Dragging, DragInput, MousePos, FramePos = false

            AddConnection(
                DragPoint.InputBegan,
                function(Input)
                    if
                        Input.UserInputType == Enum.UserInputType.MouseButton1 or
                            Input.UserInputType == Enum.UserInputType.Touch
                     then
                        Dragging = true
                        MousePos = Input.Position
                        FramePos = Main.Position

                        Input.Changed:Connect(
                            function()
                                if Input.UserInputState == Enum.UserInputState.End then
                                    Dragging = false
                                end
                            end
                        )
                    end
                end
            )

            AddConnection(
                DragPoint.InputChanged,
                function(Input)
                    if
                        Input.UserInputType == Enum.UserInputType.MouseMovement or
                            Input.UserInputType == Enum.UserInputType.Touch
                     then
                        DragInput = Input
                    end
                end
            )

            AddConnection(
                UserInputService.InputChanged,
                function(Input)
                    if Input == DragInput and Dragging then
                        local Delta = Input.Position - MousePos
                        Main.Position =
                            UDim2.new(
                            FramePos.X.Scale,
                            FramePos.X.Offset + Delta.X,
                            FramePos.Y.Scale,
                            FramePos.Y.Offset + Delta.Y
                        )
                    end
                end
            )
        end
    )
end

local function Create(Name, Properties, Children)
    local Object = Instance.new(Name)
    for i, v in next, Properties or {} do
        Object[i] = v
    end
    for i, v in next, Children or {} do
        v.Parent = Object
    end
    return Object
end

local function CreateElement(ElementName, ElementFunction)
    OrionLib.Elements[ElementName] = function(...)
        return ElementFunction(...)
    end
end

local function AddItemTable(Table, Item, Value)
    local Item = tostring(Item)
    local Count = 1

    while Table[Item] do
        Count = Count + 1
        Item = string.format("%s-%d", Item, Count)
    end

    Table[Item] = Value
end

local function MakeElement(ElementName, ...)
    local NewElement = OrionLib.Elements[ElementName](...)
    return NewElement
end

local function SetProps(Element, Props)
    table.foreach(
        Props,
        function(Property, Value)
            Element[Property] = Value
        end
    )
    return Element
end

local Total = {
    SetChildren = 0,
    AddThemeObject = 0
}

local function SetChildren(Element, Children)
    Total.SetChildren = 1
    --print(Element, Children, Total.SetChildren)
    --print(`[{Total.SetChildren}] Added on "SetChildren": {Element}, {Children}`)
    table.foreach(
        Children,
        function(_, Child)
            Child.Parent = Element
        end
    )
    return Element
end

local function Round(Number, Factor)
    local Result = math.floor(Number / Factor + (math.sign(Number) * 0.5)) * Factor
    if Result < 0 then
        Result = Result + Factor
    end
    return Result
end

local function ReturnProperty(Object)
    if Object:IsA("Frame") or Object:IsA("TextButton") then
        return "BackgroundColor3"
    end
    if Object:IsA("ScrollingFrame") then
        return "ScrollBarImageColor3"
    end
    if Object:IsA("UIStroke") then
        return "Color"
    end
    if Object:IsA("TextLabel") or Object:IsA("TextBox") then
        return "TextColor3"
    end
    if Object:IsA("ImageLabel") or Object:IsA("ImageButton") then
        return "ImageColor3"
    end
end

local function AddThemeObject(Object, Type)
    if not OrionLib.ThemeObjects[Type] then
        OrionLib.ThemeObjects[Type] = {}
    end
    Total.AddThemeObject = 1
    --print(Object, Type)
    --print(`[{Total.AddThemeObject}] Added on "AddThemeObject": {Object}, {Type}`)
    table.insert(OrionLib.ThemeObjects[Type], Object)
    Object[ReturnProperty(Object)] = OrionLib.Themes[OrionLib.SelectedTheme][Type]
    return Object
end

function OrionLib:SetTheme()
    for Name, Type in pairs(OrionLib.ThemeObjects) do
        for _, Object in pairs(Type) do
            Object[ReturnProperty(Object)] = OrionLib.Themes[OrionLib.SelectedTheme][Name]
        end
    end

    if writefile then
        pcall(
            function()
                writefile("theme.txt", OrionLib.SelectedTheme)
            end
        )
    end
end

local function PackColor(Color)
    return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end

local function UnpackColor(Color)
    return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadCfg(Config)
    local Data = HttpService:JSONDecode(Config)
    table.foreach(
        Data,
        function(a, b)
            if OrionLib.Flags[a] then
                spawn(
                    function()
                        if OrionLib.Flags[a].Type == "Colorpicker" then
                            OrionLib.Flags[a]:Set(UnpackColor(b))
                        else
                            OrionLib.Flags[a]:Set(b)
                        end
                    end
                )
            else
                warn("Orion Library Config Loader - Could not find ", a, b)
            end
        end
    )
end

local function SaveCfg(Name)
    local Data = {}
    for i, v in pairs(OrionLib.Flags) do
        if v.Save then
            if v.Type == "Colorpicker" then
                Data[i] = PackColor(v.Value)
            else
                Data[i] = v.Value
            end
        end
    end

    if writefile then
        writefile(OrionLib.Folder .. "/" .. Name .. ".txt", tostring(HttpService:JSONEncode(Data)))
    end
end

local WhitelistedMouse = {
    Enum.UserInputType.MouseButton1,
    Enum.UserInputType.MouseButton2,
    Enum.UserInputType.MouseButton3
}
local BlacklistedKeys = {
    Enum.KeyCode.Unknown,
    Enum.KeyCode.W,
    Enum.KeyCode.A,
    Enum.KeyCode.S,
    Enum.KeyCode.D,
    Enum.KeyCode.Up,
    Enum.KeyCode.Left,
    Enum.KeyCode.Down,
    Enum.KeyCode.Right,
    Enum.KeyCode.Slash,
    Enum.KeyCode.Tab,
    Enum.KeyCode.Backspace,
    Enum.KeyCode.Escape
}

local function CheckKey(Table, Key)
    for _, v in next, Table do
        if v == Key then
            return true
        end
    end
end

CreateElement(
    "Corner",
    function(Scale, Offset)
        local Corner =
            Create(
            "UICorner",
            {
                CornerRadius = UDim.new(Scale or 0, Offset or 10)
            }
        )
        return Corner
    end
)

CreateElement(
    "Stroke",
    function(Color, Thickness)
        local Stroke =
            Create(
            "UIStroke",
            {
                Color = Color or Color3.fromRGB(255, 255, 255),
                Thickness = Thickness or 1
            }
        )
        return Stroke
    end
)

CreateElement(
    "List",
    function(Scale, Offset)
        local List =
            Create(
            "UIListLayout",
            {
                SortOrder = Enum.SortOrder.LayoutOrder,
                Padding = UDim.new(Scale or 0, Offset or 0)
            }
        )
        return List
    end
)

CreateElement(
    "Padding",
    function(Bottom, Left, Right, Top)
        local Padding =
            Create(
            "UIPadding",
            {
                PaddingBottom = UDim.new(0, Bottom or 4),
                PaddingLeft = UDim.new(0, Left or 4),
                PaddingRight = UDim.new(0, Right or 4),
                PaddingTop = UDim.new(0, Top or 4)
            }
        )
        return Padding
    end
)

CreateElement(
    "TFrame",
    function()
        local TFrame =
            Create(
            "Frame",
            {
                BackgroundTransparency = 1
            }
        )
        return TFrame
    end
)

CreateElement(
    "Frame",
    function(Color)
        local Frame =
            Create(
            "Frame",
            {
                BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0
            }
        )
        return Frame
    end
)

CreateElement(
    "RoundFrame",
    function(Color, Scale, Offset)
        local Frame =
            Create(
            "Frame",
            {
                BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0
            },
            {
                Create(
                    "UICorner",
                    {
                        CornerRadius = UDim.new(Scale, Offset)
                    }
                )
            }
        )
        return Frame
    end
)

CreateElement(
    "Button",
    function()
        local Button =
            Create(
            "TextButton",
            {
                Text = "",
                AutoButtonColor = false,
                BackgroundTransparency = 1,
                BorderSizePixel = 0
            }
        )
        return Button
    end
)

CreateElement(
    "ScrollFrame",
    function(Color, Width)
        local ScrollFrame =
            Create(
            "ScrollingFrame",
            {
                BackgroundTransparency = 1,
                MidImage = "rbxassetid://7445543667",
                BottomImage = "rbxassetid://7445543667",
                TopImage = "rbxassetid://7445543667",
                ScrollBarImageColor3 = Color,
                BorderSizePixel = 0,
                ScrollBarThickness = Width,
                CanvasSize = UDim2.new(0, 0, 0, 0)
            }
        )
        return ScrollFrame
    end
)

CreateElement(
    "Image",
    function(ImageID)
        local ImageNew =
            Create(
            "ImageLabel",
            {
                Image = ImageID,
                BackgroundTransparency = 1
            }
        )

        if GetIcon(ImageID) ~= nil then
            ImageNew.Image = GetIcon(ImageID)
        end

        return ImageNew
    end
)

CreateElement(
    "ImageButton",
    function(ImageID)
        local Image =
            Create(
            "ImageButton",
            {
                Image = ImageID,
                BackgroundTransparency = 1
            }
        )
        return Image
    end
)

CreateElement(
    "Label",
    function(Text, TextSize, Transparency)
        local Label =
            Create(
            "TextLabel",
            {
                Text = Text or "",
                TextColor3 = Color3.fromRGB(240, 240, 240),
                TextTransparency = Transparency or 0,
                TextSize = TextSize or 15,
                Font = Enum.Font.Gotham,
                RichText = true,
                BackgroundTransparency = 1,
                TextXAlignment = Enum.TextXAlignment.Left
            }
        )
        return Label
    end
)

local NotificationHolder =
    SetProps(
    SetChildren(
        MakeElement("TFrame"),
        {
            SetProps(
                MakeElement("List"),
                {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    Padding = UDim.new(0, 5)
                }
            )
        }
    ),
    {
        Position = UDim2.new(1, -25, 1, -25),
        Size = UDim2.new(0, 300, 1, -25),
        AnchorPoint = Vector2.new(1, 1),
        Parent = Orion
    }
)

function OrionLib:MakeNotification(NotificationConfig)
    spawn(
        function()
            NotificationConfig.Name = NotificationConfig.Name or "Notification"
            NotificationConfig.Content = NotificationConfig.Content or "Test"
            NotificationConfig.Image = NotificationConfig.Image or "rbxassetid://4384403532"
            NotificationConfig.Time = NotificationConfig.Time or 15
            NotificationConfig.Closable = (NotificationConfig.Closable == nil) and true or NotificationConfig.Closable

            local NotificationParent =
                SetProps(
                MakeElement("TFrame"),
                {
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    Parent = NotificationHolder
                }
            )

            local NotificationFrame =
                SetChildren(
                SetProps(
                    MakeElement("RoundFrame", Color3.fromRGB(25, 25, 25), 0, 10),
                    {
                        Parent = NotificationParent,
                        Size = UDim2.new(1, 0, 0, 0),
                        Position = UDim2.new(1, -55, 0, 0),
                        BackgroundTransparency = 0,
                        AutomaticSize = Enum.AutomaticSize.Y
                    }
                ),
                {
                    MakeElement("Stroke", Color3.fromRGB(93, 93, 93), 1.2),
                    MakeElement("Padding", 12, 12, 12, 12),
                    SetProps(
                        MakeElement("Image", NotificationConfig.Image),
                        {
                            Size = UDim2.new(0, 20, 0, 20),
                            ImageColor3 = Color3.fromRGB(240, 240, 240),
                            Name = "Icon"
                        }
                    ),
                    SetProps(
                        MakeElement("Label", NotificationConfig.Name, 15),
                        {
                            Size = UDim2.new(1, -30, 0, 20),
                            Position = UDim2.new(0, 30, 0, 0),
                            Font = Enum.Font.GothamBold,
                            Name = "Title"
                        }
                    ),
                    SetProps(
                        MakeElement("Label", NotificationConfig.Content, 14),
                        {
                            Size = UDim2.new(1, 0, 0, 0),
                            Position = UDim2.new(0, 0, 0, 25),
                            Font = Enum.Font.GothamSemibold,
                            Name = "Content",
                            RichText = true,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            TextColor3 = Color3.fromRGB(200, 200, 200),
                            TextWrapped = true
                        }
                    ),
                    (NotificationConfig.Closable) and
                        SetChildren(
                            SetProps(
                                MakeElement("Button"),
                                {
                                    Size = UDim2.new(0, 20, 0, 20),
                                    Position = UDim2.new(1, -8, 0, 8),
                                    AnchorPoint = Vector2.new(1, 0),
                                    BackgroundTransparency = 1,
                                    Name = "CloseBtn"
                                }
                            ),
                            {
                                SetProps(
                                    MakeElement("Image", "rbxassetid://7072725342"),
                                    {
                                        Size = UDim2.new(0, 12, 0, 12),
                                        Position = UDim2.new(0.5, 0, 0.5, 0),
                                        AnchorPoint = Vector2.new(0.5, 0.5),
                                        ImageColor3 = Color3.fromRGB(150, 150, 150)
                                    }
                                )
                            }
                        ) or
                        nil
                }
            )

            if NotificationFrame then
                TweenService:Create(
                    NotificationFrame,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint),
                    {Position = UDim2.new(0, 0, 0, 0)}
                ):Play()

                local closeRequested = false

                local function CloseNotification()
                    if closeRequested then
                        return
                    end
                    closeRequested = true
                    local icon = NotificationFrame:FindFirstChild("Icon")
                    if icon then
                        TweenService:Create(icon, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play(

                        )
                    end
                    TweenService:Create(
                        NotificationFrame,
                        TweenInfo.new(0.8, Enum.EasingStyle.Quint),
                        {BackgroundTransparency = 0.6}
                    ):Play()
                    wait(0.3)
                    if NotificationFrame:FindFirstChild("UIStroke") then
                        TweenService:Create(
                            NotificationFrame.UIStroke,
                            TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                            {Transparency = 0.9}
                        ):Play()
                    end
                    if NotificationFrame:FindFirstChild("Title") then
                        TweenService:Create(
                            NotificationFrame.Title,
                            TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                            {TextTransparency = 0.4}
                        ):Play()
                    end
                    if NotificationFrame:FindFirstChild("Content") then
                        TweenService:Create(
                            NotificationFrame.Content,
                            TweenInfo.new(0.6, Enum.EasingStyle.Quint),
                            {TextTransparency = 0.5}
                        ):Play()
                    end
                    wait(0.05)
                    NotificationFrame:TweenPosition(UDim2.new(1, 20, 0, 0), "In", "Quint", 0.8, true)
                    wait(1.35)
                    NotificationFrame:Destroy()
                end

                if NotificationConfig.Closable then
                    local closeBtn = NotificationFrame:FindFirstChild("CloseBtn")
                    if closeBtn then
                        AddConnection(
                            closeBtn.MouseButton1Click,
                            function()
                                CloseNotification()
                            end
                        )
                        AddConnection(
                            closeBtn.MouseEnter,
                            function()
                                local img = closeBtn:FindFirstChildOfClass("ImageLabel")
                                if img then
                                    img.ImageColor3 = Color3.fromRGB(255, 255, 255)
                                end
                            end
                        )
                        AddConnection(
                            closeBtn.MouseLeave,
                            function()
                                local img = closeBtn:FindFirstChildOfClass("ImageLabel")
                                if img then
                                    img.ImageColor3 = Color3.fromRGB(150, 150, 150)
                                end
                            end
                        )
                    end
                end

                if NotificationConfig.Time > 0 then
                    task.wait(NotificationConfig.Time - 0.88)
                    if not closeRequested then
                        CloseNotification()
                    end
                end
            else
                warn("NotificationFrame was not created properly.")
            end
        end
    )
end

local notificationName = "Configuration"
local userContent = "Auto-loaded configuration for the game"

function OrionLib:Init()
    if OrionLib.SaveCfg and (isfile and readfile) then
        pcall(
            function()
                if isfile(OrionLib.Folder .. "/" .. game.GameId .. ".txt") then
                    LoadCfg(readfile(OrionLib.Folder .. "/" .. game.GameId .. ".txt"))
                    OrionLib:MakeNotification(
                        {
                            Name = notificationName,
                            Content = userContent .. " " .. game.GameId .. ".",
                            Time = 5
                        }
                    )
                end
            end
        )
    end
end

function OrionLib:MakeWindow(WindowConfig)
    local FirstTab = true
    local Minimized = false
    local Loaded = false
    local UIHidden = false

    WindowConfig = WindowConfig or {}
    WindowConfig.ConfigFolder = WindowConfig.ConfigFolder or WindowConfig.Name
    WindowConfig.SaveConfig = WindowConfig.SaveConfig or false
    WindowConfig.HidePremium = WindowConfig.HidePremium or false
    if WindowConfig.IntroEnabled == nil then
        WindowConfig.IntroEnabled = true
    end
    WindowConfig.IntroText = WindowConfig.IntroText or "SixHub"
    WindowConfig.CloseCallback = WindowConfig.CloseCallback or function()
        end
    WindowConfig.ShowIcon = WindowConfig.ShowIcon or false
    WindowConfig.Icon = WindowConfig.Icon or "rbxassetid://8834748103"
    WindowConfig.IntroIcon = WindowConfig.IntroIcon or "rbxassetid://8834748103"
    WindowConfig.SearchBar = WindowConfig.SearchBar or nil
    WindowConfig.SecondText = WindowConfig.SecondText or nil

    OrionLib.Folder = WindowConfig.ConfigFolder
    OrionLib.SaveCfg = WindowConfig.SaveConfig

    if WindowConfig.SaveConfig then
        if (isfolder and makefolder) and not isfolder(WindowConfig.ConfigFolder) then
            makefolder(WindowConfig.ConfigFolder)
        end
    end

    local TabHolder =
        AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 4),
                WindowConfig.SearchBar and
                    {
                        Size = UDim2.new(1, 0, 1, -90),
                        Position = UDim2.new(0, 0, 0, 40)
                    } or
                    {
                        Size = UDim2.new(1, 0, 1, -50)
                    }
            ),
            {
                MakeElement("List"),
                MakeElement("Padding", 8, 0, 0, 8)
            }
        ),
        "Divider"
    )

    AddConnection(
        TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
        function()
            TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolder.UIListLayout.AbsoluteContentSize.Y + 16)
        end
    )

    local CloseBtn =
        SetChildren(
        SetProps(
            MakeElement("Button"),
            {
                Size = UDim2.new(0.5, 0, 1, 0),
                Position = UDim2.new(0.5, 0, 0, 0),
                BackgroundTransparency = 1
            }
        ),
        {
            AddThemeObject(
                SetProps(
                    MakeElement("Image", "rbxassetid://7072725342"),
                    {
                        Position = UDim2.new(0, 9, 0, 6),
                        Size = UDim2.new(0, 18, 0, 18)
                    }
                ),
                "Text"
            )
        }
    )

    local MinimizeBtn =
        SetChildren(
        SetProps(
            MakeElement("Button"),
            {
                Size = UDim2.new(0.5, 0, 1, 0),
                BackgroundTransparency = 1
            }
        ),
        {
            AddThemeObject(
                SetProps(
                    MakeElement("Image", "rbxassetid://7072719338"),
                    {
                        Position = UDim2.new(0, 9, 0, 6),
                        Size = UDim2.new(0, 18, 0, 18),
                        Name = "Ico"
                    }
                ),
                "Text"
            )
        }
    )

    local DragPoint =
        SetProps(
        MakeElement("TFrame"),
        {
            Size = UDim2.new(1, 0, 0, 50)
        }
    )

    local WindowStuff =
        AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10),
                {
                    Size = UDim2.new(0, 150, 1, -50),
                    Position = UDim2.new(0, 0, 0, 50)
                }
            ),
            {
                AddThemeObject(
                    SetProps(
                        MakeElement("Frame"),
                        {
                            Size = UDim2.new(1, 0, 0, 10),
                            Position = UDim2.new(0, 0, 0, 0)
                        }
                    ),
                    "Second"
                ),
                AddThemeObject(
                    SetProps(
                        MakeElement("Frame"),
                        {
                            Size = UDim2.new(0, 10, 1, 0),
                            Position = UDim2.new(1, -10, 0, 0)
                        }
                    ),
                    "Second"
                ),
                AddThemeObject(
                    SetProps(
                        MakeElement("Frame"),
                        {
                            Size = UDim2.new(0, 1, 1, 0),
                            Position = UDim2.new(1, -1, 0, 0)
                        }
                    ),
                    "Stroke"
                ),
                TabHolder,
                SetChildren(
                    SetProps(
                        MakeElement("TFrame"),
                        {
                            Size = UDim2.new(1, 0, 0, 50),
                            Position = UDim2.new(0, 0, 1, -50)
                        }
                    ),
                    {
                        AddThemeObject(
                            SetProps(
                                MakeElement("Frame"),
                                {
                                    Size = UDim2.new(1, 0, 0, 1)
                                }
                            ),
                            "Stroke"
                        ),
                        AddThemeObject(
                            SetChildren(
                                SetProps(
                                    MakeElement("Frame"),
                                    {
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        Size = UDim2.new(0, 32, 0, 32),
                                        Position = UDim2.new(0, 10, 0.5, 0)
                                    }
                                ),
                                {
                                    SetProps(
                                        MakeElement(
                                            "Image",
                                            "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
                                                LocalPlayer.UserId .. "&width=420&height=420&format=png"
                                        ),
                                        {
                                            Size = UDim2.new(1, 0, 1, 0)
                                        }
                                    ),
                                    AddThemeObject(
                                        SetProps(
                                            MakeElement("Image", "rbxassetid://4031889928"),
                                            {
                                                Size = UDim2.new(1, 0, 1, 0)
                                            }
                                        ),
                                        "Second"
                                    ),
                                    MakeElement("Corner", 1)
                                }
                            ),
                            "Divider"
                        ),
                        SetChildren(
                            SetProps(
                                MakeElement("TFrame"),
                                {
                                    AnchorPoint = Vector2.new(0, 0.5),
                                    Size = UDim2.new(0, 32, 0, 32),
                                    Position = UDim2.new(0, 10, 0.5, 0)
                                }
                            ),
                            {
                                AddThemeObject(MakeElement("Stroke"), "Stroke"),
                                MakeElement("Corner", 1)
                            }
                        ),
                        AddThemeObject(
                            SetProps(
                                MakeElement("Label", LocalPlayer.DisplayName, WindowConfig.HidePremium and 14 or 13),
                                {
                                    Size = UDim2.new(1, -60, 0, 13),
                                    Position = WindowConfig.HidePremium and UDim2.new(0, 50, 0, 19) or
                                        UDim2.new(0, 50, 0, 12),
                                    Font = Enum.Font.GothamBold,
                                    ClipsDescendants = true
                                }
                            ),
                            "Text"
                        ),
                        (WindowConfig.SecondText and WindowConfig.SecondText ~= "") and
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", WindowConfig.SecondText, 10),
                                    {
                                        Size = UDim2.new(0, 0, 0, 12),
                                        Position = UDim2.new(1, -15, 0.5, 0),
                                        AnchorPoint = Vector2.new(1, 0.5),
                                        Font = Enum.Font.Gotham,
                                        TextColor3 = Color3.fromRGB(150, 150, 150),
                                        TextTransparency = 0.2,
                                        AutomaticSize = Enum.AutomaticSize.X
                                    }
                                ),
                                "TextDark"
                            ) or
                            nil,
                        AddThemeObject(
                            SetProps(
                                MakeElement("Label", "", 12),
                                {
                                    Size = UDim2.new(1, -60, 0, 12),
                                    Position = UDim2.new(0, 50, 1, -25),
                                    Visible = not WindowConfig.HidePremium
                                }
                            ),
                            "TextDark"
                        )
                    }
                )
            }
        ),
        "Second"
    )

    local Tabs = {}

    if WindowConfig.SearchBar then
        local SearchBox =
            Create(
            "TextBox",
            {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                PlaceholderColor3 = Color3.fromRGB(210, 210, 210),
                PlaceholderText = "🔎 Search Tab",
                Font = Enum.Font.GothamBold,
                TextWrapped = true,
                Text = "",
                TextXAlignment = Enum.TextXAlignment.Center,
                TextSize = 14,
                ClearTextOnFocus = WindowConfig.SearchBar.ClearTextOnFocus or true
            }
        )

        local TextboxActual = AddThemeObject(SearchBox, "Text")

        local SearchBar =
            AddThemeObject(
            SetChildren(
                SetProps(
                    MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 1, 6),
                    {
                        Parent = WindowStuff,
                        Size = UDim2.new(0, 130, 0, 24),
                        Position = UDim2.new(1.013, -12, 0.075, 0),
                        AnchorPoint = Vector2.new(1, 0.5)
                    }
                ),
                {
                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                    TextboxActual
                }
            ),
            "Main"
        )

        local function SearchHandle()
            local Text = string.lower(SearchBox.Text)

            for i, v in pairs(Tabs) do
                if v:IsA("TextButton") then
                    v.Visible = string.find(string.lower(i), Text) ~= nil
                end
            end
        end

        AddConnection(TextboxActual:GetPropertyChangedSignal("Text"), SearchHandle)
    end

    local WindowName =
        AddThemeObject(
        SetProps(
            MakeElement("Label", WindowConfig.Name, 14),
            {
                Size = UDim2.new(1, -30, 2, 0),
                Position = UDim2.new(0, 25, 0, -24),
                Font = Enum.Font.GothamBlack,
                TextSize = 20
            }
        ),
        "Text"
    )

    local WindowTopBarLine =
        AddThemeObject(
        SetProps(
            MakeElement("Frame"),
            {
                Size = UDim2.new(1, 0, 0, 1),
                Position = UDim2.new(0, 0, 1, -1)
            }
        ),
        "Stroke"
    )

    local MainWindow =
        AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10),
                {
                    Parent = Orion,
                    Position = UDim2.new(0.5, -307, 0.5, -172),
                    Size = UDim2.new(0, 615, 0, 344),
                    ClipsDescendants = true
                }
            ),
            {
                SetChildren(
                    SetProps(
                        MakeElement("TFrame"),
                        {
                            Size = UDim2.new(1, 0, 0, 50),
                            Name = "TopBar"
                        }
                    ),
                    {
                        WindowName,
                        WindowTopBarLine,
                        AddThemeObject(
                            SetChildren(
                                SetProps(
                                    MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 7),
                                    {
                                        Size = UDim2.new(0, 70, 0, 30),
                                        Position = UDim2.new(1, -90, 0, 10)
                                    }
                                ),
                                {
                                    AddThemeObject(MakeElement("Stroke"), "Stroke"),
                                    AddThemeObject(
                                        SetProps(
                                            MakeElement("Frame"),
                                            {
                                                Size = UDim2.new(0, 1, 1, 0),
                                                Position = UDim2.new(0.5, 0, 0, 0)
                                            }
                                        ),
                                        "Stroke"
                                    ),
                                    CloseBtn,
                                    MinimizeBtn
                                }
                            ),
                            "Second"
                        )
                    }
                ),
                DragPoint,
                WindowStuff
            }
        ),
        "Main"
    )

    if WindowConfig.ShowIcon then
        WindowName.Position = UDim2.new(0, 50, 0, -24)
        local WindowIcon =
            SetProps(
            MakeElement("Image", WindowConfig.Icon),
            {
                Size = UDim2.new(0, 20, 0, 20),
                Position = UDim2.new(0, 25, 0, 15)
            }
        )
        WindowIcon.Parent = MainWindow.TopBar
    end

    MakeDraggable(DragPoint, MainWindow)

    local _currentKey = Enum.KeyCode.RightShift
    local isMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
    local MobileIcon =
        SetChildren(
        SetProps(
            MakeElement("ImageButton", "http://www.roblox.com/asset/?id=72792666168943"),
            {
                Position = UDim2.new(0.25, 0, 0.1, 0),
                Size = UDim2.new(0, 32, 0, 33),
                Parent = Orion,
                Visible = false
            }
        ),
        {MakeElement("Corner", 1, 0)}
    )

    MakeDraggable(MobileIcon, MobileIcon)

    AddConnection(
        MobileIcon.MouseButton1Click,
        function()
            MainWindow.Visible = true
            MobileIcon.Visible = false
        end
    )

    AddConnection(
        CloseBtn.MouseButton1Up,
        function()
            MainWindow.Visible = false
            UIHidden = true

            if UserInputService.TouchEnabled then
                MobileIcon.Visible = true
            end

            local content =
                string.format(
                "Click on the <b>Icon</b> or press the <b>%s</b> key to open the GUI again!",
                _currentKey.Name
            )

            OrionLib:MakeNotification(
                {
                    Name = "Interface Closed",
                    Content = content,
                    Time = 5
                }
            )

            if OrionLib.MinimizeGUI and OrionLib.MinimizeGUI.Parent then
                OrionLib.MinimizeGUI:Destroy()
                OrionLib.MinimizeGUI = nil
            end
        end
    )

    AddConnection(
        UserInputService.InputBegan,
        function(Input)
            if Input.KeyCode == _currentKey then
                MobileIcon.Visible = false
                MainWindow.Visible = not MainWindow.Visible
            end
        end
    )

    AddConnection(
        MinimizeBtn.MouseButton1Up,
        function()
            if Minimized then
                TweenService:Create(
                    MainWindow,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, 615, 0, 344)}
                ):Play()
                MinimizeBtn.Ico.Image = "rbxassetid://7072719338"
                wait(.02)
                MainWindow.ClipsDescendants = false
                WindowStuff.Visible = true
                WindowTopBarLine.Visible = true
            else
                MainWindow.ClipsDescendants = true
                WindowTopBarLine.Visible = false
                MinimizeBtn.Ico.Image = "rbxassetid://7072720870"

                TweenService:Create(
                    MainWindow,
                    TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, WindowName.TextBounds.X + 140, 0, 50)}
                ):Play()
                wait(0.1)
                WindowStuff.Visible = false
            end
            Minimized = not Minimized
        end
    )

    local function LoadSequence()
        MainWindow.Visible = false
        local LoadSequenceLogo =
            SetProps(
            MakeElement("Image", WindowConfig.IntroIcon),
            {
                Parent = Orion,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.4, 0),
                Size = UDim2.new(0, 28, 0, 28),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 1
            }
        )

        local LoadSequenceText =
            SetProps(
            MakeElement("Label", WindowConfig.IntroText, 14),
            {
                Parent = Orion,
                Size = UDim2.new(1, 0, 1, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 19, 0.5, 0),
                TextXAlignment = Enum.TextXAlignment.Center,
                Font = Enum.Font.GothamBold,
                TextTransparency = 1
            }
        )

        TweenService:Create(
            LoadSequenceLogo,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}
        ):Play()
        wait(0.8)
        TweenService:Create(
            LoadSequenceLogo,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0.5, -(LoadSequenceText.TextBounds.X / 2), 0.5, 0)}
        ):Play()
        wait(0.3)
        TweenService:Create(
            LoadSequenceText,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 0}
        ):Play()
        wait(2)
        TweenService:Create(
            LoadSequenceText,
            TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {TextTransparency = 1}
        ):Play()
        MainWindow.Visible = true
        LoadSequenceLogo:Destroy()
        LoadSequenceText:Destroy()
    end

    if WindowConfig.IntroEnabled then
        LoadSequence()
    end

    local Functions = {}

    function Functions:MakeTab(TabConfig)
        TabConfig = TabConfig or {}
        TabConfig.Name = TabConfig.Name or "Tab"
        TabConfig.Icon = TabConfig.Icon or ""
        TabConfig.PremiumOnly = TabConfig.PremiumOnly or false

        local TabFrame =
            SetChildren(
            SetProps(
                MakeElement("Button"),
                {
                    Size = UDim2.new(1, 0, 0, 30),
                    Parent = TabHolder
                }
            ),
            {
                AddThemeObject(
                    SetProps(
                        MakeElement("Image", TabConfig.Icon),
                        {
                            AnchorPoint = Vector2.new(0, 0.5),
                            Size = UDim2.new(0, 18, 0, 18),
                            Position = UDim2.new(0, 10, 0.5, 0),
                            ImageTransparency = 0.4,
                            Name = "Ico"
                        }
                    ),
                    "Text"
                ),
                AddThemeObject(
                    SetProps(
                        MakeElement("Label", TabConfig.Name, 14),
                        {
                            Size = UDim2.new(1, -35, 1, 0),
                            Position = UDim2.new(0, 35, 0, 0),
                            Font = Enum.Font.GothamSemibold,
                            TextTransparency = 0.4,
                            Name = "Title"
                        }
                    ),
                    "Text"
                )
            }
        )

        AddItemTable(Tabs, TabConfig.Name, TabFrame)

        if GetIcon(TabConfig.Icon) ~= nil then
            TabFrame.Ico.Image = GetIcon(TabConfig.Icon)
        end

        local Container =
            AddThemeObject(
            SetChildren(
                SetProps(
                    MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 5),
                    {
                        Size = UDim2.new(1, -150, 1, -50),
                        Position = UDim2.new(0, 150, 0, 50),
                        Parent = MainWindow,
                        Visible = false,
                        Name = "ItemContainer"
                    }
                ),
                {
                    MakeElement("List", 0, 6),
                    MakeElement("Padding", 15, 10, 10, 15)
                }
            ),
            "Divider"
        )

        AddConnection(
            Container.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
            function()
                Container.CanvasSize = UDim2.new(0, 0, 0, Container.UIListLayout.AbsoluteContentSize.Y + 30)
            end
        )

        if FirstTab then
            FirstTab = false
            TabFrame.Ico.ImageTransparency = 0
            TabFrame.Title.TextTransparency = 0
            TabFrame.Title.Font = Enum.Font.GothamBlack
            Container.Visible = true
        end

        AddConnection(
            TabFrame.MouseButton1Click,
            function()
                for _, Tab in next, TabHolder:GetChildren() do
                    if Tab:IsA("TextButton") then
                        Tab.Title.Font = Enum.Font.GothamSemibold
                        TweenService:Create(
                            Tab.Ico,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {ImageTransparency = 0.4}
                        ):Play()
                        TweenService:Create(
                            Tab.Title,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {TextTransparency = 0.4}
                        ):Play()
                    end
                end
                for _, ItemContainer in next, MainWindow:GetChildren() do
                    if ItemContainer.Name == "ItemContainer" then
                        ItemContainer.Visible = false
                    end
                end
                TweenService:Create(
                    TabFrame.Ico,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {ImageTransparency = 0}
                ):Play()
                TweenService:Create(
                    TabFrame.Title,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
                TabFrame.Title.Font = Enum.Font.GothamBlack
                Container.Visible = true
            end
        )

        local function GetElements(ItemParent)
            local ElementFunction = {}
            function ElementFunction:AddLog(Text)
                local Label = MakeElement("Label", Text, 15)
                local LogFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 1, 0),
                                BackgroundTransparency = 0.7,
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    Label,
                                    {
                                        Size = UDim2.new(1, -12, 1, 0),
                                        Position = UDim2.new(0, 12, 0, 0),
                                        TextXAlignment = Enum.TextXAlignment.Center,
                                        TextSize = 19,
                                        TextWrapped = true,
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Second"
                )

                local LogFunction = {}
                function LogFunction:Set(ToChange)
                    LogFrame.Content.Text = ToChange
                end
                return LogFunction
            end
            function ElementFunction:AddLabel(Text)
                local LabelFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 30),
                                BackgroundTransparency = 0.7,
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", Text, 15),
                                    {
                                        Size = UDim2.new(1, -12, 1, 0),
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Second"
                )

                local LabelFunction = {}
                function LabelFunction:Set(ToChange)
                    LabelFrame.Content.Text = ToChange
                end
                return LabelFunction
            end
            function ElementFunction:AddParagraph(Config)
                Config = Config or {}
                Config.Title = Config.Title or "Paragraph"
                Config.Content = Config.Content or ""
                Config.FontSize = Config.FontSize or 13
                Config.Scrollable = Config.Scrollable or false
                Config.MaxHeight = Config.MaxHeight or 150

                local Container =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 0),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", Config.Title, 15),
                                    {
                                        Size = UDim2.new(1, -12, 0, 16),
                                        Position = UDim2.new(0, 12, 0, 10),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Title"
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", "", Config.FontSize),
                                    {
                                        Size = UDim2.new(1, -24, 0, 0),
                                        Position = UDim2.new(0, 12, 0, 32),
                                        Font = Enum.Font.Gotham,
                                        Name = "Content",
                                        RichText = true,
                                        TextWrapped = true,
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                        AutomaticSize = Enum.AutomaticSize.Y
                                    }
                                ),
                                "TextDark"
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Second"
                )

                local contentLabel = Container.Content
                local maxHeight = Config.MaxHeight

                if Config.Scrollable then
                    local scrollFrame =
                        Create(
                        "ScrollingFrame",
                        {
                            Size = UDim2.new(1, -24, 0, maxHeight),
                            Position = UDim2.new(0, 12, 0, 32),
                            BackgroundTransparency = 1,
                            BorderSizePixel = 0,
                            ScrollBarThickness = 4,
                            ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100),
                            CanvasSize = UDim2.new(0, 0, 0, 0)
                        }
                    )

                    contentLabel.Parent = scrollFrame
                    contentLabel.Size = UDim2.new(1, -10, 0, 0)
                    contentLabel.Position = UDim2.new(0, 5, 0, 5)
                    contentLabel.AutomaticSize = Enum.AutomaticSize.Y

                    scrollFrame.Parent = Container
                    Container.Content = nil
                    Container.ScrollFrame = scrollFrame

                    AddConnection(
                        contentLabel:GetPropertyChangedSignal("Text"),
                        function()
                            scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentLabel.AbsoluteSize.Y + 10)
                        end
                    )

                    local function updateContainerHeight()
                        local height = 32 + contentLabel.AbsoluteSize.Y + 20
                        if height < maxHeight + 45 then
                            Container.Size = UDim2.new(1, 0, 0, height)
                        else
                            Container.Size = UDim2.new(1, 0, 0, maxHeight + 45)
                        end
                    end

                    AddConnection(contentLabel:GetPropertyChangedSignal("AbsoluteSize"), updateContainerHeight)
                    updateContainerHeight()
                else
                    local function updateHeight()
                        Container.Size = UDim2.new(1, 0, 0, contentLabel.AbsoluteSize.Y + 45)
                    end
                    AddConnection(contentLabel:GetPropertyChangedSignal("AbsoluteSize"), updateHeight)
                    updateHeight()
                end

                function contentLabel:SetText(NewText)
                    self.Text = NewText
                end

                return contentLabel
            end
            function ElementFunction:AddButton(ButtonConfig)
                ButtonConfig = ButtonConfig or {}
                ButtonConfig.Name = ButtonConfig.Name or "Button"
                ButtonConfig.Callback = ButtonConfig.Callback or function()
                    end
                ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://3944703587"
                ButtonConfig.Description = ButtonConfig.Description or nil
                ButtonConfig.Confirmation = ButtonConfig.Confirmation or false
                ButtonConfig.ConfirmMessage = ButtonConfig.ConfirmMessage or "Are you sure?"
                ButtonConfig.ConfirmText = ButtonConfig.ConfirmText or "Yes"
                ButtonConfig.CancelText = ButtonConfig.CancelText or "No"

                local hasDesc = ButtonConfig.Description and ButtonConfig.Description ~= ""
                local frameHeight = hasDesc and 52 or 33

                local Button = {}
                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local DescLabel = nil
                if hasDesc then
                    DescLabel =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", ButtonConfig.Description, 11),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 22),
                                Font = Enum.Font.Gotham,
                                TextColor3 = Color3.fromRGB(170, 170, 170),
                                TextTransparency = 0.2,
                                Name = "Description"
                            }
                        ),
                        "TextDark"
                    )
                end

                local ButtonFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, frameHeight),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", ButtonConfig.Name, 15),
                                    {
                                        Size = UDim2.new(1, -12, 0, 16),
                                        Position = UDim2.new(0, 12, 0, hasDesc and 6 or 9),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            hasDesc and DescLabel or nil,
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Image", ButtonConfig.Icon),
                                    {
                                        Size = UDim2.new(0, 20, 0, 20),
                                        Position = UDim2.new(1, -30, 0.5, 0),
                                        AnchorPoint = Vector2.new(0, 0.5)
                                    }
                                ),
                                "TextDark"
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            Click
                        }
                    ),
                    "Second"
                )

                local function ShowConfirm(callback)
                    local overlay = Instance.new("Frame")
                    overlay.Size = UDim2.new(1, 0, 1, 0)
                    overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                    overlay.BackgroundTransparency = 0.5
                    overlay.BorderSizePixel = 0
                    overlay.ZIndex = 10
                    overlay.Parent = Orion

                    local modal = Instance.new("Frame")
                    modal.Size = UDim2.new(0, 300, 0, 150)
                    modal.Position = UDim2.new(0.5, -150, 0.5, -75)
                    modal.AnchorPoint = Vector2.new(0.5, 0.5)
                    modal.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
                    modal.BorderSizePixel = 0
                    modal.ZIndex = 11
                    modal.Parent = overlay

                    local corner = Instance.new("UICorner")
                    corner.CornerRadius = UDim.new(0, 8)
                    corner.Parent = modal

                    local stroke = Instance.new("UIStroke")
                    stroke.Color = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
                    stroke.Thickness = 1
                    stroke.Parent = modal

                    local message = Instance.new("TextLabel")
                    message.Size = UDim2.new(1, -20, 0, 50)
                    message.Position = UDim2.new(0, 10, 0, 20)
                    message.BackgroundTransparency = 1
                    message.Text = ButtonConfig.ConfirmMessage
                    message.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text
                    message.TextSize = 14
                    message.Font = Enum.Font.GothamBold
                    message.TextWrapped = true
                    message.TextXAlignment = Enum.TextXAlignment.Center
                    message.Parent = modal

                    local yesBtn = Instance.new("TextButton")
                    yesBtn.Size = UDim2.new(0, 100, 0, 30)
                    yesBtn.Position = UDim2.new(0.5, -105, 1, -45)
                    yesBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                    yesBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    yesBtn.Text = ButtonConfig.ConfirmText
                    yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    yesBtn.Font = Enum.Font.GothamBold
                    yesBtn.TextSize = 14
                    yesBtn.AutoButtonColor = false
                    yesBtn.Parent = modal
                    local yesCorner = Instance.new("UICorner")
                    yesCorner.CornerRadius = UDim.new(0, 4)
                    yesCorner.Parent = yesBtn

                    local noBtn = Instance.new("TextButton")
                    noBtn.Size = UDim2.new(0, 100, 0, 30)
                    noBtn.Position = UDim2.new(0.5, 105, 1, -45)
                    noBtn.AnchorPoint = Vector2.new(0.5, 0.5)
                    noBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    noBtn.Text = ButtonConfig.CancelText
                    noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                    noBtn.Font = Enum.Font.GothamBold
                    noBtn.TextSize = 14
                    noBtn.AutoButtonColor = false
                    noBtn.Parent = modal
                    local noCorner = Instance.new("UICorner")
                    noCorner.CornerRadius = UDim.new(0, 4)
                    noCorner.Parent = noBtn

                    local function onHover(btn)
                        btn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
                    end
                    local function onLeave(btn)
                        btn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                    end
                    yesBtn.MouseEnter:Connect(
                        function()
                            onHover(yesBtn)
                        end
                    )
                    yesBtn.MouseLeave:Connect(
                        function()
                            onLeave(yesBtn)
                        end
                    )
                    noBtn.MouseEnter:Connect(
                        function()
                            onHover(noBtn)
                        end
                    )
                    noBtn.MouseLeave:Connect(
                        function()
                            onLeave(noBtn)
                        end
                    )

                    modal.BackgroundTransparency = 0
                    modal.Size = UDim2.new(0, 0, 0, 0)
                    modal.TweenSize(UDim2.new(0, 300, 0, 150), "Out", "Quint", 0.3, true)

                    local function close(confirmed)
                        modal:TweenSize(UDim2.new(0, 0, 0, 0), "In", "Quint", 0.2, true)
                        task.wait(0.2)
                        overlay:Destroy()
                        if confirmed then
                            callback()
                        end
                    end

                    yesBtn.MouseButton1Click:Connect(
                        function()
                            close(true)
                        end
                    )
                    noBtn.MouseButton1Click:Connect(
                        function()
                            close(false)
                        end
                    )

                    overlay.InputBegan:Connect(
                        function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                close(false)
                            end
                        end
                    )
                    modal.InputBegan:Connect(
                        function(input)
                            input:StopPropagation()
                        end
                    )
                end

                AddConnection(
                    Click.MouseEnter,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseLeave,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                        if ButtonConfig.Confirmation then
                            ShowConfirm(ButtonConfig.Callback)
                        else
                            spawn(ButtonConfig.Callback)
                        end
                    end
                )

                AddConnection(
                    Click.MouseButton1Down,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6
                                )
                            }
                        ):Play()
                    end
                )

                function Button:Set(ButtonText)
                    ButtonFrame.Content.Text = ButtonText
                end

                return Button
            end

            function ElementFunction:AddToggle(ToggleConfig)
                ToggleConfig = ToggleConfig or {}
                ToggleConfig.Name = ToggleConfig.Name or "Toggle"
                ToggleConfig.Default = ToggleConfig.Default or false
                ToggleConfig.Callback = ToggleConfig.Callback or function()
                    end
                ToggleConfig.Color = ToggleConfig.Color or Color3.fromRGB(9, 99, 195)
                ToggleConfig.Flag = ToggleConfig.Flag or nil
                ToggleConfig.Save = ToggleConfig.Save or false
                ToggleConfig.Description = ToggleConfig.Description or nil

                local Toggle = {Value = ToggleConfig.Default, Save = ToggleConfig.Save}
                local hasDesc = ToggleConfig.Description and ToggleConfig.Description ~= ""
                local frameHeight = hasDesc and 52 or 38

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local ToggleBox =
                    SetChildren(
                    SetProps(
                        MakeElement("RoundFrame", ToggleConfig.Color, 0, 4),
                        {
                            Size = UDim2.new(0, 24, 0, 24),
                            Position = UDim2.new(1, -24, 0.5, 0),
                            AnchorPoint = Vector2.new(0.5, 0.5)
                        }
                    ),
                    {
                        SetProps(
                            MakeElement("Stroke"),
                            {Color = ToggleConfig.Color, Name = "Stroke", Transparency = 0.5}
                        ),
                        SetProps(
                            MakeElement("Image", "rbxassetid://3944680095"),
                            {
                                Size = UDim2.new(0, 20, 0, 20),
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.new(0.5, 0, 0.5, 0),
                                ImageColor3 = Color3.fromRGB(255, 255, 255),
                                Name = "Ico"
                            }
                        )
                    }
                )

                local DescLabel = nil
                if hasDesc then
                    DescLabel =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", ToggleConfig.Description, 11),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 20),
                                Font = Enum.Font.Gotham,
                                TextColor3 = Color3.fromRGB(170, 170, 170),
                                TextTransparency = 0.2,
                                Name = "Description"
                            }
                        ),
                        "TextDark"
                    )
                end

                local ToggleFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, frameHeight),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", ToggleConfig.Name, 15),
                                    {
                                        Size = UDim2.new(1, -12, 0, 16),
                                        Position = UDim2.new(0, 12, 0, hasDesc and 8 or 11),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            hasDesc and DescLabel or nil,
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            ToggleBox,
                            Click
                        }
                    ),
                    "Second"
                )

                function Toggle:Set(Value)
                    Toggle.Value = Value
                    TweenService:Create(
                        ToggleBox,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                        {
                            BackgroundColor3 = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Divider
                        }
                    ):Play()
                    TweenService:Create(
                        ToggleBox.Stroke,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                        {
                            Color = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Stroke
                        }
                    ):Play()
                    TweenService:Create(
                        ToggleBox.Ico,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quint),
                        {
                            ImageTransparency = Toggle.Value and 0 or 1,
                            Size = Toggle.Value and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 8, 0, 8)
                        }
                    ):Play()
                    ToggleConfig.Callback(Toggle.Value)
                end

                Toggle:Set(Toggle.Value)

                AddConnection(
                    Click.MouseEnter,
                    function()
                        TweenService:Create(
                            ToggleFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseLeave,
                    function()
                        TweenService:Create(
                            ToggleFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            ToggleFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                        SaveCfg(game.GameId)
                        Toggle:Set(not Toggle.Value)
                    end
                )

                AddConnection(
                    Click.MouseButton1Down,
                    function()
                        TweenService:Create(
                            ToggleFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6
                                )
                            }
                        ):Play()
                    end
                )

                if ToggleConfig.Flag then
                    OrionLib.Flags[ToggleConfig.Flag] = Toggle
                end
                return Toggle
            end
            function ElementFunction:AddSlider(SliderConfig)
                SliderConfig = SliderConfig or {}
                SliderConfig.Name = SliderConfig.Name or "Slider"
                SliderConfig.Min = SliderConfig.Min or 0
                SliderConfig.Max = SliderConfig.Max or 100
                SliderConfig.Increment = SliderConfig.Increment or 1
                SliderConfig.Default = SliderConfig.Default or 50
                SliderConfig.Callback = SliderConfig.Callback or function()
                    end
                SliderConfig.ValueName = SliderConfig.ValueName or ""
                SliderConfig.Color = SliderConfig.Color or Color3.fromRGB(9, 149, 98)
                SliderConfig.Flag = SliderConfig.Flag or nil
                SliderConfig.Save = SliderConfig.Save or false
                SliderConfig.Description = SliderConfig.Description or nil
                SliderConfig.EditableThumb = (SliderConfig.EditableThumb == nil) and true or SliderConfig.EditableThumb

                local Slider = {Value = SliderConfig.Default, Save = SliderConfig.Save}
                local hasDesc = SliderConfig.Description and SliderConfig.Description ~= ""
                local frameHeight = hasDesc and 85 or 65

                local ValueBox = nil
                if SliderConfig.EditableThumb then
                    ValueBox =
                        AddThemeObject(
                        Create(
                            "TextBox",
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 6),
                                BackgroundTransparency = 1,
                                TextColor3 = Color3.fromRGB(240, 240, 240),
                                PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
                                PlaceholderText = "0",
                                Font = Enum.Font.GothamBold,
                                TextSize = 13,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ClearTextOnFocus = false
                            }
                        ),
                        "Text"
                    )
                else
                    ValueBox =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", "value", 13),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 6),
                                Font = Enum.Font.GothamBold,
                                Name = "Value",
                                TextTransparency = 0
                            }
                        ),
                        "Text"
                    )
                end

                local SliderDrag =
                    SetChildren(
                    SetProps(
                        MakeElement("RoundFrame", SliderConfig.Color, 0, 5),
                        {
                            Size = UDim2.new(0, 0, 1, 0),
                            BackgroundTransparency = 0.3,
                            ClipsDescendants = true
                        }
                    ),
                    {ValueBox}
                )

                local SliderBar =
                    SetChildren(
                    SetProps(
                        MakeElement("RoundFrame", SliderConfig.Color, 0, 5),
                        {
                            Size = UDim2.new(1, -24, 0, 26),
                            Position = UDim2.new(0, 12, 0, hasDesc and 48 or 30),
                            BackgroundTransparency = 0.9
                        }
                    ),
                    {
                        SetProps(MakeElement("Stroke"), {Color = SliderConfig.Color}),
                        SliderDrag
                    }
                )

                local DescLabel = nil
                if hasDesc then
                    DescLabel =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", SliderConfig.Description, 11),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 28),
                                Font = Enum.Font.Gotham,
                                TextColor3 = Color3.fromRGB(170, 170, 170),
                                TextTransparency = 0.2,
                                Name = "Description"
                            }
                        ),
                        "TextDark"
                    )
                end

                local SliderFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4),
                            {
                                Size = UDim2.new(1, 0, 0, frameHeight),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", SliderConfig.Name, 15),
                                    {
                                        Size = UDim2.new(1, -12, 0, 14),
                                        Position = UDim2.new(0, 12, 0, 10),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            hasDesc and DescLabel or nil,
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            SliderBar
                        }
                    ),
                    "Second"
                )

                local function UpdateDisplay(value)
                    local displayValue = tostring(value) .. " " .. SliderConfig.ValueName
                    if ValueBox:IsA("TextBox") then
                        ValueBox.Text = tostring(value)
                    else
                        ValueBox.Text = displayValue
                    end
                end

                local Dragging = false

                SliderBar.InputBegan:Connect(
                    function(Input)
                        if
                            Input.UserInputType == Enum.UserInputType.MouseButton1 or
                                Input.UserInputType == Enum.UserInputType.Touch
                         then
                            Dragging = true
                        end
                    end
                )

                SliderBar.InputEnded:Connect(
                    function(Input)
                        if
                            Input.UserInputType == Enum.UserInputType.MouseButton1 or
                                Input.UserInputType == Enum.UserInputType.Touch
                         then
                            Dragging = false
                        end
                    end
                )

                UserInputService.InputChanged:Connect(
                    function(Input)
                        if Dragging then
                            local InputPosition
                            if Input.UserInputType == Enum.UserInputType.MouseMovement then
                                InputPosition = Input.Position
                            elseif Input.UserInputType == Enum.UserInputType.Touch then
                                InputPosition = Input.Position
                            end

                            if InputPosition then
                                local SizeScale =
                                    math.clamp(
                                    (InputPosition.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X,
                                    0,
                                    1
                                )
                                Slider:Set(SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale))
                                SaveCfg(game.GameId)
                            end
                        end
                    end
                )

                function Slider:Set(Value)
                    local newValue =
                        math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
                    self.Value = newValue
                    local scale = (newValue - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min)
                    TweenService:Create(
                        SliderDrag,
                        TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = UDim2.fromScale(scale, 1)}
                    ):Play()
                    UpdateDisplay(newValue)
                    SliderConfig.Callback(newValue)
                end

                if SliderConfig.EditableThumb and ValueBox:IsA("TextBox") then
                    AddConnection(
                        ValueBox.FocusLost,
                        function(enterPressed)
                            local text = ValueBox.Text:gsub("[^%d%-%.]", "")
                            local num = tonumber(text)
                            if num then
                                num = math.clamp(num, SliderConfig.Min, SliderConfig.Max)
                                num = Round(num, SliderConfig.Increment)
                                if num ~= Slider.Value then
                                    Slider:Set(num)
                                    SaveCfg(game.GameId)
                                else
                                    UpdateDisplay(Slider.Value)
                                end
                            else
                                UpdateDisplay(Slider.Value)
                            end
                        end
                    )
                end

                Slider:Set(Slider.Value)
                if SliderConfig.Flag then
                    OrionLib.Flags[SliderConfig.Flag] = Slider
                end
                return Slider
            end
            function ElementFunction:AddDropdown(DropdownConfig)
                DropdownConfig = DropdownConfig or {}
                DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
                DropdownConfig.Options = DropdownConfig.Options or {}
                DropdownConfig.Default = DropdownConfig.Default or ""
                DropdownConfig.Callback = DropdownConfig.Callback or function()
                    end
                DropdownConfig.Flag = DropdownConfig.Flag or nil
                DropdownConfig.Save = DropdownConfig.Save or false
                DropdownConfig.Searchable = DropdownConfig.Searchable or false
                DropdownConfig.MultiSelect = DropdownConfig.MultiSelect or false

                local Dropdown = {
                    Value = DropdownConfig.Default,
                    Options = DropdownConfig.Options,
                    Buttons = {},
                    Toggled = false,
                    Type = DropdownConfig.MultiSelect and "MultiDropdown" or "Dropdown",
                    Save = DropdownConfig.Save,
                    FilteredOptions = {},
                    Selected = {}
                }

                local MaxElements = 5
                local SearchHeight = 30

                if not DropdownConfig.MultiSelect then
                    if not table.find(Dropdown.Options, Dropdown.Value) then
                        Dropdown.Value = "..."
                    end
                else
                    Dropdown.Selected = {}
                    local defaults = type(DropdownConfig.Default) == "table" and DropdownConfig.Default or {}
                    for _, opt in ipairs(Dropdown.Options) do
                        local optName = type(opt) == "table" and opt.value or opt
                        if table.find(defaults, optName) then
                            Dropdown.Selected[optName] = true
                        end
                    end
                end

                local OptionsList = MakeElement("List")
                local OptionsContainer =
                    AddThemeObject(
                    SetProps(
                        SetChildren(MakeElement("ScrollFrame", Color3.fromRGB(40, 40, 40), 4), {OptionsList}),
                        {
                            Parent = ItemParent,
                            Position = UDim2.new(0, 0, 0, 38 + (DropdownConfig.Searchable and SearchHeight or 0)),
                            Size = UDim2.new(1, 0, 1, -38 - (DropdownConfig.Searchable and SearchHeight or 0)),
                            ClipsDescendants = true
                        }
                    ),
                    "Divider"
                )

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local SearchContainer = nil
                local SearchBox = nil
                if DropdownConfig.Searchable then
                    SearchBox =
                        Create(
                        "TextBox",
                        {
                            Size = UDim2.new(1, -12, 0, 24),
                            Position = UDim2.new(0, 6, 0, 6),
                            BackgroundColor3 = Color3.fromRGB(50, 50, 50),
                            BackgroundTransparency = 0,
                            TextColor3 = Color3.fromRGB(240, 240, 240),
                            PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
                            PlaceholderText = "Search...",
                            Font = Enum.Font.Gotham,
                            TextSize = 13,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            ClearTextOnFocus = false
                        }
                    )
                    local searchCorner = Create("UICorner", {CornerRadius = UDim.new(0, 4)})
                    searchCorner.Parent = SearchBox

                    SearchContainer =
                        Create(
                        "Frame",
                        {
                            Size = UDim2.new(1, 0, 0, SearchHeight),
                            BackgroundTransparency = 1,
                            Visible = false
                        },
                        {
                            SearchBox,
                            MakeElement("Stroke", Color3.fromRGB(80, 80, 80), 1)
                        }
                    )
                end

                local DropdownFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 38),
                                Parent = ItemParent,
                                ClipsDescendants = true
                            }
                        ),
                        {
                            OptionsContainer,
                            SetProps(
                                SetChildren(
                                    MakeElement("TFrame"),
                                    {
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", DropdownConfig.Name, 15),
                                                {
                                                    Size = UDim2.new(1, -12, 1, 0),
                                                    Position = UDim2.new(0, 12, 0, 0),
                                                    Font = Enum.Font.GothamBold,
                                                    Name = "Content"
                                                }
                                            ),
                                            "Text"
                                        ),
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Image", "rbxassetid://7072706796"),
                                                {
                                                    Size = UDim2.new(0, 20, 0, 20),
                                                    AnchorPoint = Vector2.new(0, 0.5),
                                                    Position = UDim2.new(1, -30, 0.5, 0),
                                                    ImageColor3 = Color3.fromRGB(240, 240, 240),
                                                    Name = "Ico"
                                                }
                                            ),
                                            "TextDark"
                                        ),
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", "Selected", 13),
                                                {
                                                    Size = UDim2.new(1, -40, 1, 0),
                                                    Font = Enum.Font.Gotham,
                                                    Name = "Selected",
                                                    TextXAlignment = Enum.TextXAlignment.Right,
                                                    TextColor3 = Color3.fromRGB(230, 230, 230)
                                                }
                                            ),
                                            "TextDark"
                                        ),
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Frame"),
                                                {
                                                    Size = UDim2.new(1, 0, 0, 1),
                                                    Position = UDim2.new(0, 0, 1, -1),
                                                    Name = "Line",
                                                    Visible = false
                                                }
                                            ),
                                            "Stroke"
                                        ),
                                        Click
                                    }
                                ),
                                {Size = UDim2.new(1, 0, 0, 38), ClipsDescendants = true, Name = "F"}
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            MakeElement("Corner")
                        }
                    ),
                    "Second"
                )

                if DropdownConfig.Searchable and SearchContainer then
                    SearchContainer.Parent = OptionsContainer.Parent
                    SearchContainer.Position = UDim2.new(0, 0, 0, 38)
                end

                AddConnection(
                    OptionsList:GetPropertyChangedSignal("AbsoluteContentSize"),
                    function()
                        OptionsContainer.CanvasSize = UDim2.new(0, 0, 0, OptionsList.AbsoluteContentSize.Y)
                    end
                )

                local function UpdateSelectedText()
                    if not DropdownConfig.MultiSelect then
                        DropdownFrame.F.Selected.Text = Dropdown.Value == "..." and "..." or Dropdown.Value
                        return
                    end

                    local selectedList = {}
                    for opt, sel in pairs(Dropdown.Selected) do
                        if sel then
                            table.insert(selectedList, opt)
                        end
                    end
                    local count = #selectedList
                    if count == 0 then
                        DropdownFrame.F.Selected.Text = "None"
                    elseif count == 1 then
                        DropdownFrame.F.Selected.Text = selectedList[1]
                    elseif count <= 3 then
                        DropdownFrame.F.Selected.Text = table.concat(selectedList, ", ")
                    else
                        DropdownFrame.F.Selected.Text = count .. " selected"
                    end
                end

                local function FilterOptions(searchText)
                    searchText = searchText:lower()
                    local filtered = {}
                    local i = 1
                    while i <= #Dropdown.Options do
                        local opt = Dropdown.Options[i]
                        if type(opt) == "table" then
                            opt = opt.value
                        end
                        if opt:sub(1, 3) == "---" then
                            local hasMatch = false
                            for j = i + 1, #Dropdown.Options do
                                local subOpt = Dropdown.Options[j]
                                if type(subOpt) == "table" then
                                    subOpt = subOpt.value
                                end
                                if subOpt:sub(1, 3) ~= "---" and subOpt:lower():find(searchText) then
                                    hasMatch = true
                                    break
                                end
                            end
                            if hasMatch then
                                table.insert(filtered, opt)
                            end
                            i = i + 1
                        else
                            if searchText == "" or opt:lower():find(searchText) then
                                table.insert(filtered, opt)
                            end
                            i = i + 1
                        end
                    end
                    return filtered
                end

                local function UpdateVisibleOptions()
                    local searchText = ""
                    if DropdownConfig.Searchable and SearchBox then
                        searchText = SearchBox.Text
                    end
                    local optionsToShow = (searchText == "") and Dropdown.Options or FilterOptions(searchText)
                    Dropdown.FilteredOptions = optionsToShow

                    for _, v in pairs(Dropdown.Buttons) do
                        v:Destroy()
                    end
                    Dropdown.Buttons = {}

                    for _, Option in ipairs(optionsToShow) do
                        local isSeparator = Option:sub(1, 3) == "---"
                        local text = isSeparator and Option:sub(4) or Option

                        if not DropdownConfig.MultiSelect then
                            local OptionBtn = Instance.new("TextButton")
                            OptionBtn.Name = "OptionBtn"
                            OptionBtn.Size = UDim2.new(1, 0, 0, 28)
                            OptionBtn.BackgroundColor3 =
                                isSeparator and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(60, 60, 60)
                            OptionBtn.Text = ""
                            OptionBtn.ClipsDescendants = true
                            OptionBtn.Parent = OptionsContainer

                            local Label = Instance.new("TextLabel")
                            Label.Text = text
                            Label.Font = isSeparator and Enum.Font.GothamBold or Enum.Font.Gotham
                            Label.TextSize = isSeparator and 14 or 13
                            Label.TextColor3 = Color3.fromRGB(240, 240, 240)
                            Label.TextXAlignment = Enum.TextXAlignment.Left
                            Label.TextWrapped = true
                            Label.Size = UDim2.new(1, -16, 1, 0)
                            Label.Position = UDim2.new(0, 8, 0, 0)
                            Label.BackgroundTransparency = 1
                            Label.Parent = OptionBtn

                            if not isSeparator then
                                OptionBtn.MouseButton1Click:Connect(
                                    function()
                                        Dropdown:Set(Option)
                                        SaveCfg(game.GameId)
                                    end
                                )
                            end

                            Dropdown.Buttons[Option] = OptionBtn
                        else
                            local isSelected = Dropdown.Selected[text] or false

                            local Item =
                                Create(
                                "Frame",
                                {
                                    Size = UDim2.new(1, 0, 0, 28),
                                    BackgroundTransparency = 1,
                                    ClipsDescendants = true
                                }
                            )

                            local Checkbox =
                                SetChildren(
                                SetProps(
                                    MakeElement(
                                        "RoundFrame",
                                        isSelected and DropdownConfig.Color or Color3.fromRGB(60, 60, 60),
                                        0,
                                        4
                                    ),
                                    {
                                        Size = UDim2.new(0, 16, 0, 16),
                                        Position = UDim2.new(0, 8, 0.5, 0),
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        BackgroundTransparency = 0,
                                        Name = "Checkbox"
                                    }
                                ),
                                {
                                    isSelected and
                                        SetProps(
                                            MakeElement("Image", "rbxassetid://3944680095"),
                                            {
                                                Size = UDim2.new(0, 12, 0, 12),
                                                AnchorPoint = Vector2.new(0.5, 0.5),
                                                Position = UDim2.new(0.5, 0, 0.5, 0),
                                                ImageColor3 = Color3.fromRGB(255, 255, 255),
                                                Name = "CheckMark"
                                            }
                                        ) or
                                        nil
                                }
                            )
                            if not isSelected then
                                local stroke =
                                    SetProps(MakeElement("Stroke"), {Color = Color3.fromRGB(80, 80, 80), Thickness = 1})
                                stroke.Parent = Checkbox
                            end

                            local Label =
                                AddThemeObject(
                                SetProps(
                                    MakeElement("Label", text, 13),
                                    {
                                        Size = UDim2.new(1, -40, 1, 0),
                                        Position = UDim2.new(0, 30, 0, 0),
                                        TextXAlignment = Enum.TextXAlignment.Left,
                                        Font = Enum.Font.Gotham,
                                        TextColor3 = Color3.fromRGB(240, 240, 240)
                                    }
                                ),
                                "Text"
                            )
                            Label.Parent = Item

                            local itemClick =
                                SetProps(
                                MakeElement("Button"),
                                {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1}
                            )
                            itemClick.Parent = Item
                            itemClick.MouseButton1Click:Connect(
                                function()
                                    Dropdown.Selected[text] = not Dropdown.Selected[text]
                                    UpdateVisibleOptions()
                                    UpdateSelectedText()
                                    DropdownConfig.Callback(Dropdown.Selected)
                                    SaveCfg(game.GameId)
                                end
                            )

                            Item.Parent = OptionsContainer
                            Dropdown.Buttons[text] = Item
                        end
                    end

                    local visibleCount = 0
                    for _, opt in ipairs(optionsToShow) do
                        if opt:sub(1, 3) ~= "---" then
                            visibleCount = visibleCount + 1
                        end
                    end
                    if Dropdown.Toggled then
                        local newSize =
                            math.min(visibleCount, MaxElements) * 28 + 38 +
                            (DropdownConfig.Searchable and SearchHeight or 0)
                        TweenService:Create(
                            DropdownFrame,
                            TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(1, 0, 0, newSize)}
                        ):Play()
                    end

                    if not DropdownConfig.MultiSelect then
                        if table.find(optionsToShow, Dropdown.Value) then
                            local btn = Dropdown.Buttons[Dropdown.Value]
                            if btn then
                                btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                                local label = btn:FindFirstChildOfClass("TextLabel")
                                if label then
                                    label.TextTransparency = 0
                                end
                            end
                        end
                    end
                end

                if DropdownConfig.Searchable and SearchBox then
                    AddConnection(
                        SearchBox:GetPropertyChangedSignal("Text"),
                        function()
                            UpdateVisibleOptions()
                        end
                    )
                end

                function Dropdown:Refresh(Options, Delete)
                    if Delete then
                        for _, v in pairs(Dropdown.Buttons) do
                            v:Destroy()
                        end
                        table.clear(Dropdown.Options)
                        table.clear(Dropdown.Buttons)
                        if DropdownConfig.MultiSelect then
                            table.clear(Dropdown.Selected)
                        end
                    end
                    Dropdown.Options = Options or {}
                    if not DropdownConfig.MultiSelect then
                        if not table.find(Dropdown.Options, Dropdown.Value) then
                            Dropdown.Value = "..."
                        end
                    else
                        for k in pairs(Dropdown.Selected) do
                            local found = false
                            for _, opt in ipairs(Options) do
                                local optName = type(opt) == "table" and opt.value or opt
                                if optName == k then
                                    found = true
                                    break
                                end
                            end
                            if not found then
                                Dropdown.Selected[k] = nil
                            end
                        end
                    end
                    UpdateVisibleOptions()
                    UpdateSelectedText()
                end

                function Dropdown:Set(Value)
                    if DropdownConfig.MultiSelect then
                        if type(Value) == "table" then
                            for k in pairs(Dropdown.Selected) do
                                Dropdown.Selected[k] = false
                            end
                            for _, v in ipairs(Value) do
                                Dropdown.Selected[v] = true
                            end
                            UpdateVisibleOptions()
                            UpdateSelectedText()
                            DropdownConfig.Callback(Dropdown.Selected)
                            SaveCfg(game.GameId)
                        else
                            if Dropdown.Selected[Value] then
                                Dropdown.Selected[Value] = false
                            else
                                Dropdown.Selected[Value] = true
                            end
                            UpdateVisibleOptions()
                            UpdateSelectedText()
                            DropdownConfig.Callback(Dropdown.Selected)
                            SaveCfg(game.GameId)
                        end
                    else
                        if not table.find(Dropdown.Options, Value) then
                            Dropdown.Value = "..."
                            DropdownFrame.F.Selected.Text = Dropdown.Value
                            for _, v in pairs(Dropdown.Buttons) do
                                TweenService:Create(
                                    v,
                                    TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundTransparency = 1}
                                ):Play()
                                local label = v:FindFirstChildOfClass("TextLabel")
                                if label then
                                    TweenService:Create(
                                        label,
                                        TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {TextTransparency = 0.4}
                                    ):Play()
                                end
                            end
                            return
                        end

                        Dropdown.Value = Value
                        DropdownFrame.F.Selected.Text = Dropdown.Value

                        for _, v in pairs(Dropdown.Buttons) do
                            TweenService:Create(
                                v,
                                TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {BackgroundTransparency = 1}
                            ):Play()
                            local label = v:FindFirstChildOfClass("TextLabel")
                            if label then
                                TweenService:Create(
                                    label,
                                    TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextTransparency = 0.4}
                                ):Play()
                            end
                        end

                        local btn = Dropdown.Buttons[Value]
                        if btn then
                            btn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                            local label = btn:FindFirstChildOfClass("TextLabel")
                            if label then
                                label.TextTransparency = 0
                            end
                        end
                        DropdownConfig.Callback(Dropdown.Value)
                        SaveCfg(game.GameId)
                    end
                end

                if DropdownConfig.MultiSelect then
                    function Dropdown:GetSelected()
                        local result = {}
                        for opt, sel in pairs(Dropdown.Selected) do
                            if sel then
                                table.insert(result, opt)
                            end
                        end
                        return result
                    end

                    function Dropdown:Clear()
                        for k in pairs(Dropdown.Selected) do
                            Dropdown.Selected[k] = false
                        end
                        UpdateVisibleOptions()
                        UpdateSelectedText()
                        DropdownConfig.Callback(Dropdown.Selected)
                        SaveCfg(game.GameId)
                    end

                    function Dropdown:SelectAll()
                        for _, opt in ipairs(Dropdown.Options) do
                            local optName = type(opt) == "table" and opt.value or opt
                            if optName:sub(1, 3) ~= "---" then
                                Dropdown.Selected[optName] = true
                            end
                        end
                        UpdateVisibleOptions()
                        UpdateSelectedText()
                        DropdownConfig.Callback(Dropdown.Selected)
                        SaveCfg(game.GameId)
                    end
                end

                AddConnection(
                    Click.MouseButton1Click,
                    function()
                        Dropdown.Toggled = not Dropdown.Toggled
                        DropdownFrame.F.Line.Visible = Dropdown.Toggled
                        TweenService:Create(
                            DropdownFrame.F.Ico,
                            TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = Dropdown.Toggled and 180 or 0}
                        ):Play()
                        if DropdownConfig.Searchable and SearchContainer then
                            SearchContainer.Visible = Dropdown.Toggled
                        end
                        if Dropdown.Toggled then
                            UpdateVisibleOptions()
                        else
                            TweenService:Create(
                                DropdownFrame,
                                TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {Size = UDim2.new(1, 0, 0, 38)}
                            ):Play()
                        end
                    end
                )

                UpdateVisibleOptions()
                UpdateSelectedText()
                if not DropdownConfig.MultiSelect then
                    Dropdown:Set(Dropdown.Value)
                end

                if DropdownConfig.Flag then
                    OrionLib.Flags[DropdownConfig.Flag] = Dropdown
                end

                return Dropdown
            end
            function ElementFunction:ChooseTheme(config)
                config = config or {}

                local DropdownOptions = {}
                for category, themeList in pairs(OrionLib.Categories or {}) do
                    table.insert(DropdownOptions, "--- " .. category)
                    for _, themeName in ipairs(themeList) do
                        if OrionLib.Themes[themeName] then
                            table.insert(DropdownOptions, themeName)
                        end
                    end
                end

                return self:AddDropdown(
                    {
                        Name = config.Name or "Choose Theme",
                        Options = DropdownOptions,
                        Default = OrionLib.SelectedTheme,
                        Flag = config.Flag or "ThemeSelect",
                        Save = true,
                        Callback = function(value)
                            if value:sub(1, 3) == "---" then
                                return
                            end
                            OrionLib.SelectedTheme = value
                            OrionLib:SetTheme()
                            local dropdown = OrionLib.Flags[config.Flag or "ThemeSelect"]
                            if dropdown and dropdown.Buttons then
                                for option, btn in pairs(dropdown.Buttons) do
                                    local label = btn:FindFirstChildOfClass("TextLabel")
                                    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
                                    if label then
                                        label.TextTransparency = 0.4
                                    end
                                end
                                local selectedBtn = dropdown.Buttons[value]
                                if selectedBtn then
                                    selectedBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
                                    local label = selectedBtn:FindFirstChildOfClass("TextLabel")
                                    if label then
                                        label.TextTransparency = 0
                                    end
                                end
                            end
                        end
                    }
                )
            end
            function ElementFunction:ThemeTransparency(config)
                config = config or {}
                local mainFactor = config.Main or 0.5
                local secondFactor = config.Second or 0.55
                local useSlider = config.Slider == true
                local sliderValue = mainFactor
                local isEnabled = config.Default or false

                OrionLib.Flags["ThemeTransparencyEnabled"] = isEnabled
                OrionLib.Flags["ThemeTransparencyValue"] = sliderValue

                local function applyTransparency()
                    for typeName, objects in pairs(OrionLib.ThemeObjects) do
                        for _, obj in ipairs(objects) do
                            if obj and obj.Parent then
                                local transparency = 0
                                if isEnabled then
                                    if typeName == "Main" then
                                        transparency = sliderValue
                                    elseif typeName == "Second" then
                                        transparency = sliderValue
                                    end
                                end
                                if obj:IsA("Frame") then
                                    obj.BackgroundTransparency = transparency
                                elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                                    obj.ImageTransparency = transparency
                                end
                            end
                        end
                    end
                end

                local toggle =
                    self:AddToggle(
                    {
                        Name = config.Name or "UI Transparency",
                        Description = config.Description or nil,
                        Default = isEnabled,
                        Flag = config.Flag or "ThemeTransparency",
                        Save = true,
                        Callback = function(enabled)
                            isEnabled = enabled
                            OrionLib.Flags["ThemeTransparencyEnabled"] = enabled
                            applyTransparency()
                            if useSlider and config.Callback then
                                config.Callback(isEnabled, sliderValue)
                            end
                        end
                    }
                )

                local sliderControl = nil
                if useSlider then
                    sliderControl =
                        self:AddSlider(
                        {
                            Name = config.SliderName or "Transparency Level",
                            Description = config.SliderDescription or nil,
                            Min = 0,
                            Max = 100,
                            Increment = 1,
                            Default = math.floor(sliderValue * 100),
                            Flag = config.SliderFlag or (config.Flag and config.Flag .. "Value") or "TransparencyValue",
                            Save = true,
                            ValueName = "%",
                            Callback = function(value)
                                sliderValue = value / 100
                                OrionLib.Flags["ThemeTransparencyValue"] = sliderValue
                                if isEnabled then
                                    applyTransparency()
                                end
                                if config.Callback then
                                    config.Callback(isEnabled, sliderValue)
                                end
                            end
                        }
                    )
                end

                applyTransparency()

                if useSlider then
                    return {
                        Toggle = toggle,
                        Slider = sliderControl,
                        SetTransparency = function(enabled, value)
                            if enabled ~= nil then
                                toggle:Set(enabled)
                            end
                            if value ~= nil then
                                sliderControl:Set(math.clamp(value, 0, 100))
                            end
                        end
                    }
                else
                    return toggle
                end
            end
            function ElementFunction:AddBind(BindConfig)
                BindConfig.Name = BindConfig.Name or "Bind"
                BindConfig.Default = BindConfig.Default or Enum.KeyCode.Unknown
                BindConfig.Hold = BindConfig.Hold or false
                BindConfig.Callback = BindConfig.Callback or function()
                    end
                BindConfig.Flag = BindConfig.Flag or nil
                BindConfig.Save = BindConfig.Save or false

                local Bind = {Value, Binding = false, Type = "Bind", Save = BindConfig.Save}
                local Holding = false

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local BindBox =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4),
                            {
                                Size = UDim2.new(0, 24, 0, 24),
                                Position = UDim2.new(1, -12, 0.5, 0),
                                AnchorPoint = Vector2.new(1, 0.5)
                            }
                        ),
                        {
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", BindConfig.Name, 14),
                                    {
                                        Size = UDim2.new(1, 0, 1, 0),
                                        Font = Enum.Font.GothamBold,
                                        TextXAlignment = Enum.TextXAlignment.Center,
                                        Name = "Value"
                                    }
                                ),
                                "Text"
                            )
                        }
                    ),
                    "Main"
                )

                local BindFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 38),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", BindConfig.Name, 15),
                                    {
                                        Size = UDim2.new(1, -12, 1, 0),
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            BindBox,
                            Click
                        }
                    ),
                    "Second"
                )

                AddConnection(
                    BindBox.Value:GetPropertyChangedSignal("Text"),
                    function()
                        TweenService:Create(
                            BindBox,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                Size = UDim2.new(0, BindBox.Value.TextBounds.X + 16, 0, 24)
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.InputEnded,
                    function(Input)
                        if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if Bind.Binding then
                                return
                            end
                            Bind.Binding = true
                            BindBox.Value.Text = ""
                        end
                    end
                )

                AddConnection(
                    UserInputService.InputBegan,
                    function(Input)
                        if UserInputService:GetFocusedTextBox() then
                            return
                        end
                        if
                            (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and
                                not Bind.Binding
                         then
                            if BindConfig.Hold then
                                Holding = true
                                BindConfig.Callback(Holding)
                            else
                                BindConfig.Callback(Input)
                            end
                        elseif Bind.Binding then
                            local Key
                            pcall(
                                function()
                                    if not CheckKey(BlacklistedKeys, Input.KeyCode) then
                                        Key = Input.KeyCode
                                    end
                                end
                            )
                            pcall(
                                function()
                                    if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
                                        Key = Input.UserInputType
                                    end
                                end
                            )
                            Key = Key or Bind.Value
                            Bind:Set(Key)
                            SaveCfg(game.GameId)
                        end
                    end
                )

                AddConnection(
                    UserInputService.InputEnded,
                    function(Input)
                        if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
                            if BindConfig.Hold and Holding then
                                Holding = false
                                BindConfig.Callback(Holding)
                            end
                        end
                    end
                )

                AddConnection(
                    Click.MouseEnter,
                    function()
                        TweenService:Create(
                            BindFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseLeave,
                    function()
                        TweenService:Create(
                            BindFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            BindFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Down,
                    function()
                        TweenService:Create(
                            BindFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6
                                )
                            }
                        ):Play()
                    end
                )

                function Bind:Set(Key)
                    Bind.Binding = false
                    Bind.Value = Key or Bind.Value
                    Bind.Value = Bind.Value.Name or Bind.Value
                    BindBox.Value.Text = Bind.Value
                end

                Bind:Set(BindConfig.Default)
                if BindConfig.Flag then
                    OrionLib.Flags[BindConfig.Flag] = Bind
                end
                return Bind
            end
            function ElementFunction:AddTextbox(TextboxConfig)
                TextboxConfig = TextboxConfig or {}
                TextboxConfig.Name = TextboxConfig.Name or "Textbox"
                TextboxConfig.Default = TextboxConfig.Default or ""
                TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
                TextboxConfig.Callback = TextboxConfig.Callback or function()
                    end
                TextboxConfig.Description = TextboxConfig.Description or nil

                local hasDesc = TextboxConfig.Description and TextboxConfig.Description ~= ""
                local frameHeight = hasDesc and 52 or 38

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local TextboxActual =
                    AddThemeObject(
                    Create(
                        "TextBox",
                        {
                            Size = UDim2.new(1, 0, 1, 0),
                            BackgroundTransparency = 1,
                            TextColor3 = Color3.fromRGB(255, 255, 255),
                            PlaceholderColor3 = Color3.fromRGB(210, 210, 210),
                            PlaceholderText = "Input",
                            Font = Enum.Font.GothamSemibold,
                            TextXAlignment = Enum.TextXAlignment.Center,
                            TextSize = 14,
                            ClearTextOnFocus = false
                        }
                    ),
                    "Text"
                )

                local TextContainer =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4),
                            {
                                Size = UDim2.new(0, 24, 0, 24),
                                Position = UDim2.new(1, -12, 0.5, 0),
                                AnchorPoint = Vector2.new(1, 0.5)
                            }
                        ),
                        {
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            TextboxActual
                        }
                    ),
                    "Main"
                )

                local DescLabel = nil
                if hasDesc then
                    DescLabel =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", TextboxConfig.Description, 11),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 20),
                                Font = Enum.Font.Gotham,
                                TextColor3 = Color3.fromRGB(170, 170, 170),
                                TextTransparency = 0.2,
                                Name = "Description"
                            }
                        ),
                        "TextDark"
                    )
                end

                local TextboxFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, frameHeight),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", TextboxConfig.Name, 15),
                                    {
                                        Size = UDim2.new(1, -12, 0, 16),
                                        Position = UDim2.new(0, 12, 0, hasDesc and 8 or 11),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content"
                                    }
                                ),
                                "Text"
                            ),
                            hasDesc and DescLabel or nil,
                            AddThemeObject(MakeElement("Stroke"), "Stroke"),
                            TextContainer,
                            Click
                        }
                    ),
                    "Second"
                )

                AddConnection(
                    TextboxActual:GetPropertyChangedSignal("Text"),
                    function()
                        TweenService:Create(
                            TextContainer,
                            TweenInfo.new(0.45, Enum.EasingStyle.Quint),
                            {
                                Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    TextboxActual.FocusLost,
                    function()
                        TextboxConfig.Callback(TextboxActual.Text)
                        if TextboxConfig.TextDisappear then
                            TextboxActual.Text = ""
                        end
                    end
                )

                TextboxActual.Text = TextboxConfig.Default

                AddConnection(
                    Click.MouseEnter,
                    function()
                        TweenService:Create(
                            TextboxFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseLeave,
                    function()
                        TweenService:Create(
                            TextboxFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
                            }
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            TextboxFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                        TextboxActual:CaptureFocus()
                    end
                )

                AddConnection(
                    Click.MouseButton1Down,
                    function()
                        TweenService:Create(
                            TextboxFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6
                                )
                            }
                        ):Play()
                    end
                )
            end
            function ElementFunction:AddColorpicker(ColorpickerConfig)
                ColorpickerConfig = ColorpickerConfig or {}
                ColorpickerConfig.Name = ColorpickerConfig.Name or "Colorpicker"
                ColorpickerConfig.Default = ColorpickerConfig.Default or Color3.fromRGB(255, 255, 255)
                ColorpickerConfig.Callback = ColorpickerConfig.Callback or function()
                    end
                ColorpickerConfig.Flag = ColorpickerConfig.Flag or nil
                ColorpickerConfig.Save = ColorpickerConfig.Save or false
                ColorpickerConfig.Description = ColorpickerConfig.Description or nil
                ColorpickerConfig.Palette = ColorpickerConfig.Palette or true

                local hasDesc = ColorpickerConfig.Description and ColorpickerConfig.Description ~= ""
                local baseHeight = 38
                local expandedHeight = ColorpickerConfig.Palette and 220 or 148
                local frameHeight = baseHeight

                local ColorH, ColorS, ColorV = 1, 1, 1
                local Colorpicker = {
                    Value = ColorpickerConfig.Default,
                    Toggled = false,
                    Type = "Colorpicker",
                    Save = ColorpickerConfig.Save
                }

                local presetColors = {
                    Color3.fromRGB(255, 255, 255),
                    Color3.fromRGB(0, 0, 0),
                    Color3.fromRGB(255, 0, 0),
                    Color3.fromRGB(0, 255, 0),
                    Color3.fromRGB(0, 0, 255),
                    Color3.fromRGB(255, 255, 0),
                    Color3.fromRGB(0, 255, 255),
                    Color3.fromRGB(255, 0, 255),
                    Color3.fromRGB(128, 128, 128),
                    Color3.fromRGB(255, 128, 0),
                    Color3.fromRGB(128, 0, 255),
                    Color3.fromRGB(0, 128, 128),
                    Color3.fromRGB(128, 64, 0),
                    Color3.fromRGB(255, 128, 128),
                    Color3.fromRGB(128, 255, 128),
                    Color3.fromRGB(128, 128, 255)
                }

                local ColorSelection =
                    Create(
                    "ImageLabel",
                    {
                        Size = UDim2.new(0, 18, 0, 18),
                        Position = UDim2.new(select(3, Color3.toHSV(Colorpicker.Value))),
                        ScaleType = Enum.ScaleType.Fit,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Image = "http://www.roblox.com/asset/?id=4805639000"
                    }
                )

                local HueSelection =
                    Create(
                    "ImageLabel",
                    {
                        Size = UDim2.new(0, 18, 0, 18),
                        Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(Colorpicker.Value))),
                        ScaleType = Enum.ScaleType.Fit,
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        BackgroundTransparency = 1,
                        Image = "http://www.roblox.com/asset/?id=4805639000"
                    }
                )

                local Color =
                    Create(
                    "ImageLabel",
                    {
                        Size = UDim2.new(1, -25, 1, 0),
                        Visible = false,
                        Image = "rbxassetid://4155801252"
                    },
                    {
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        ColorSelection
                    }
                )

                local Hue =
                    Create(
                    "Frame",
                    {
                        Size = UDim2.new(0, 20, 1, 0),
                        Position = UDim2.new(1, -20, 0, 0),
                        Visible = false
                    },
                    {
                        Create(
                            "UIGradient",
                            {
                                Rotation = 270,
                                Color = ColorSequence.new {
                                    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                                    ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                                    ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                                    ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                                    ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                                    ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                                    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
                                }
                            }
                        ),
                        Create("UICorner", {CornerRadius = UDim.new(0, 5)}),
                        HueSelection
                    }
                )

                local PaletteFrame = nil
                if ColorpickerConfig.Palette then
                    PaletteFrame =
                        Create(
                        "Frame",
                        {
                            Size = UDim2.new(1, -24, 0, 0),
                            Position = UDim2.new(0, 12, 0, 118),
                            BackgroundTransparency = 1,
                            Visible = false
                        }
                    )
                    local paletteGrid =
                        Create(
                        "UIListLayout",
                        {
                            FillDirection = Enum.FillDirection.Horizontal,
                            HorizontalAlignment = Enum.HorizontalAlignment.Center,
                            SortOrder = Enum.SortOrder.LayoutOrder,
                            Padding = UDim.new(0, 4)
                        }
                    )
                    paletteGrid.Parent = PaletteFrame

                    for _, color in ipairs(presetColors) do
                        local swatch =
                            Create(
                            "Frame",
                            {
                                Size = UDim2.new(0, 20, 0, 20),
                                BackgroundColor3 = color,
                                BorderSizePixel = 0
                            },
                            {
                                Create("UICorner", {CornerRadius = UDim.new(0, 4)}),
                                Create("UIStroke", {Color = Color3.fromRGB(80, 80, 80), Thickness = 1})
                            }
                        )
                        local btn =
                            Create(
                            "TextButton",
                            {
                                Size = UDim2.new(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                Text = ""
                            }
                        )
                        btn.Parent = swatch
                        btn.MouseButton1Click:Connect(
                            function()
                                local h, s, v = Color3.toHSV(color)
                                ColorH = h
                                ColorS = s
                                ColorV = v
                                ColorSelection.Position = UDim2.new(s, 0, 1 - v, 0)
                                HueSelection.Position = UDim2.new(0.5, 0, 1 - h, 0)
                                UpdateColorPicker()
                            end
                        )
                        swatch.Parent = PaletteFrame
                    end
                end

                local ColorpickerContainer =
                    Create(
                    "Frame",
                    {
                        Position = UDim2.new(0, 0, 0, 32),
                        Size = UDim2.new(1, 0, 1, -32),
                        BackgroundTransparency = 1,
                        ClipsDescendants = true
                    },
                    {
                        Hue,
                        Color,
                        Create(
                            "UIPadding",
                            {
                                PaddingLeft = UDim.new(0, 35),
                                PaddingRight = UDim.new(0, 35),
                                PaddingBottom = UDim.new(0, 10),
                                PaddingTop = UDim.new(0, 17)
                            }
                        ),
                        (ColorpickerConfig.Palette and PaletteFrame) or nil
                    }
                )

                local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

                local ColorpickerBox =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4),
                            {
                                Size = UDim2.new(0, 24, 0, 24),
                                Position = UDim2.new(1, -12, 0.5, 0),
                                AnchorPoint = Vector2.new(1, 0.5)
                            }
                        ),
                        {AddThemeObject(MakeElement("Stroke"), "Stroke")}
                    ),
                    "Main"
                )

                local DescLabel = nil
                if hasDesc then
                    DescLabel =
                        AddThemeObject(
                        SetProps(
                            MakeElement("Label", ColorpickerConfig.Description, 11),
                            {
                                Size = UDim2.new(1, -12, 0, 14),
                                Position = UDim2.new(0, 12, 0, 20),
                                Font = Enum.Font.Gotham,
                                TextColor3 = Color3.fromRGB(170, 170, 170),
                                TextTransparency = 0.2,
                                Name = "Description"
                            }
                        ),
                        "TextDark"
                    )
                    frameHeight = 52
                end

                local ColorpickerFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, frameHeight),
                                Parent = ItemParent
                            }
                        ),
                        {
                            SetProps(
                                SetChildren(
                                    MakeElement("TFrame"),
                                    {
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", ColorpickerConfig.Name, 15),
                                                {
                                                    Size = UDim2.new(1, -12, 0, 16),
                                                    Position = UDim2.new(0, 12, 0, hasDesc and 8 or 11),
                                                    Font = Enum.Font.GothamBold,
                                                    Name = "Content"
                                                }
                                            ),
                                            "Text"
                                        ),
                                        ColorpickerBox,
                                        Click,
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Frame"),
                                                {
                                                    Size = UDim2.new(1, 0, 0, 1),
                                                    Position = UDim2.new(0, 0, 1, -1),
                                                    Name = "Line",
                                                    Visible = false
                                                }
                                            ),
                                            "Stroke"
                                        ),
                                        hasDesc and DescLabel or nil
                                    }
                                ),
                                {Size = UDim2.new(1, 0, 0, frameHeight), ClipsDescendants = true, Name = "F"}
                            ),
                            ColorpickerContainer,
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Second"
                )

                AddConnection(
                    Click.MouseButton1Click,
                    function()
                        Colorpicker.Toggled = not Colorpicker.Toggled
                        local newSize = Colorpicker.Toggled and expandedHeight or frameHeight
                        TweenService:Create(
                            ColorpickerFrame,
                            TweenInfo.new(.15, Enum.EasingStyle.Quad),
                            {
                                Size = UDim2.new(1, 0, 0, newSize)
                            }
                        ):Play()
                        Color.Visible = Colorpicker.Toggled
                        Hue.Visible = Colorpicker.Toggled
                        if ColorpickerConfig.Palette and PaletteFrame then
                            PaletteFrame.Visible = Colorpicker.Toggled
                        end
                        ColorpickerFrame.F.Line.Visible = Colorpicker.Toggled
                    end
                )

                local function UpdateColorPicker()
                    ColorpickerBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                    Colorpicker:Set(ColorpickerBox.BackgroundColor3)
                    ColorpickerConfig.Callback(ColorpickerBox.BackgroundColor3)
                    SaveCfg(game.GameId)
                end

                ColorH =
                    1 -
                    (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                        Hue.AbsoluteSize.Y)
                ColorS =
                    (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                    Color.AbsoluteSize.X)
                ColorV =
                    1 -
                    (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                        Color.AbsoluteSize.Y)

                AddConnection(
                    Color.InputBegan,
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                            ColorInput =
                                AddConnection(
                                RunService.RenderStepped,
                                function()
                                    local ColorX =
                                        math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                        Color.AbsoluteSize.X
                                    local ColorY =
                                        math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                        Color.AbsoluteSize.Y
                                    ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
                                    ColorS = ColorX
                                    ColorV = 1 - ColorY
                                    UpdateColorPicker()
                                end
                            )
                        end
                    end
                )

                AddConnection(
                    Color.InputEnded,
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if ColorInput then
                                ColorInput:Disconnect()
                            end
                        end
                    end
                )

                AddConnection(
                    Hue.InputBegan,
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                            HueInput =
                                AddConnection(
                                RunService.RenderStepped,
                                function()
                                    local HueY =
                                        math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                        Hue.AbsoluteSize.Y
                                    HueSelection.Position = UDim2.new(0.5, 0, HueY, 0)
                                    ColorH = 1 - HueY
                                    UpdateColorPicker()
                                end
                            )
                        end
                    end
                )

                AddConnection(
                    Hue.InputEnded,
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if HueInput then
                                HueInput:Disconnect()
                            end
                        end
                    end
                )

                function Colorpicker:Set(Value)
                    Colorpicker.Value = Value
                    ColorpickerBox.BackgroundColor3 = Colorpicker.Value
                    ColorpickerConfig.Callback(Colorpicker.Value)
                end

                Colorpicker:Set(Colorpicker.Value)
                if ColorpickerConfig.Flag then
                    OrionLib.Flags[ColorpickerConfig.Flag] = Colorpicker
                end
                return Colorpicker
            end
            return ElementFunction
        end

        local ElementFunction = {}

        function ElementFunction:AddSection(SectionConfig)
            SectionConfig = SectionConfig or {}
            SectionConfig.Name = SectionConfig.Name or "Section"
            SectionConfig.Collapsible = SectionConfig.Collapsible or false
            SectionConfig.DefaultCollapsed = SectionConfig.DefaultCollapsed or false

            local collapsed = SectionConfig.DefaultCollapsed
            local headerHeight = 26
            local holderOffset = 23
            local sectionFrameHeight = headerHeight

            local SectionFrame =
                SetChildren(
                SetProps(
                    MakeElement("TFrame"),
                    {
                        Size = UDim2.new(1, 0, 0, headerHeight),
                        Parent = Container,
                        AutomaticSize = Enum.AutomaticSize.None
                    }
                ),
                {
                    AddThemeObject(
                        SetProps(
                            MakeElement("Label", SectionConfig.Name, 14),
                            {
                                Size = UDim2.new(1, -12, 0, 16),
                                Position = UDim2.new(0, 0, 0, 3),
                                Font = Enum.Font.GothamSemibold
                            }
                        ),
                        "TextDark"
                    ),
                    SetChildren(
                        SetProps(
                            MakeElement("TFrame"),
                            {
                                AnchorPoint = Vector2.new(0, 0),
                                Size = UDim2.new(1, 0, 1, -24),
                                Position = UDim2.new(0, 0, 0, holderOffset),
                                Name = "Holder",
                                Visible = not collapsed
                            }
                        ),
                        {
                            MakeElement("List", 0, 6)
                        }
                    )
                }
            )

            if SectionConfig.Collapsible then
                local toggleBtn =
                    SetProps(
                    MakeElement("Button"),
                    {
                        Size = UDim2.new(0, 20, 0, 20),
                        Position = UDim2.new(1, -25, 0, 4),
                        BackgroundTransparency = 1,
                        Name = "CollapseToggle"
                    }
                )
                local arrowImg =
                    AddThemeObject(
                    SetProps(
                        MakeElement("Image", "rbxassetid://7072706796"),
                        {
                            Size = UDim2.new(1, 0, 1, 0),
                            ImageColor3 = Color3.fromRGB(240, 240, 240)
                        }
                    ),
                    "TextDark"
                )
                arrowImg.Parent = toggleBtn
                toggleBtn.Parent = SectionFrame

                local function updateArrow()
                    arrowImg.Rotation = collapsed and -90 or 0
                end
                updateArrow()

                toggleBtn.MouseButton1Click:Connect(
                    function()
                        collapsed = not collapsed
                        local holder = SectionFrame.Holder
                        if collapsed then
                            holder.Visible = false
                            SectionFrame.Size = UDim2.new(1, 0, 0, headerHeight)
                        else
                            holder.Visible = true
                            local contentHeight = holder.UIListLayout.AbsoluteContentSize.Y
                            SectionFrame.Size = UDim2.new(1, 0, 0, contentHeight + holderOffset + 8)
                        end
                        updateArrow()
                        local container = SectionFrame.Parent
                        if container and container.Parent and container.Parent:IsA("ScrollingFrame") then
                            container.CanvasSize = UDim2.new(0, 0, 0, container.UIListLayout.AbsoluteContentSize.Y + 16)
                        end
                    end
                )
            end

            AddConnection(
                SectionFrame.Holder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"),
                function()
                    if not collapsed then
                        local contentHeight = SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y
                        SectionFrame.Size = UDim2.new(1, 0, 0, contentHeight + holderOffset + 8)
                        SectionFrame.Holder.Size = UDim2.new(1, 0, 0, contentHeight)
                    end
                end
            )

            if not collapsed then
                local contentHeight = SectionFrame.Holder.UIListLayout.AbsoluteContentSize.Y
                SectionFrame.Size = UDim2.new(1, 0, 0, contentHeight + holderOffset + 8)
                SectionFrame.Holder.Size = UDim2.new(1, 0, 0, contentHeight)
            end

            local SectionFunction = {}
            for i, v in next, GetElements(SectionFrame.Holder) do
                SectionFunction[i] = v
            end
            return SectionFunction
        end

        for i, v in next, GetElements(Container) do
            ElementFunction[i] = v
        end

        if TabConfig.PremiumOnly then
            for i, v in next, ElementFunction do
                ElementFunction[i] = function()
                end
            end
            Container:FindFirstChild("UIListLayout"):Destroy()
            Container:FindFirstChild("UIPadding"):Destroy()
            SetChildren(
                SetProps(
                    MakeElement("TFrame"),
                    {
                        Size = UDim2.new(1, 0, 1, 0),
                        Parent = ItemParent
                    }
                ),
                {
                    AddThemeObject(
                        SetProps(
                            MakeElement("Image", "rbxassetid://3610239960"),
                            {
                                Size = UDim2.new(0, 18, 0, 18),
                                Position = UDim2.new(0, 15, 0, 15),
                                ImageTransparency = 0.4
                            }
                        ),
                        "Text"
                    ),
                    AddThemeObject(
                        SetProps(
                            MakeElement("Label", "Unauthorised Access", 14),
                            {
                                Size = UDim2.new(1, -38, 0, 14),
                                Position = UDim2.new(0, 38, 0, 18),
                                TextTransparency = 0.4
                            }
                        ),
                        "Text"
                    ),
                    AddThemeObject(
                        SetProps(
                            MakeElement("Image", "rbxassetid://4483345875"),
                            {
                                Size = UDim2.new(0, 56, 0, 56),
                                Position = UDim2.new(0, 84, 0, 110)
                            }
                        ),
                        "Text"
                    ),
                    AddThemeObject(
                        SetProps(
                            MakeElement("Label", "Premium Features", 14),
                            {
                                Size = UDim2.new(1, -150, 0, 14),
                                Position = UDim2.new(0, 150, 0, 112),
                                Font = Enum.Font.GothamBold
                            }
                        ),
                        "Text"
                    ),
                    AddThemeObject(
                        SetProps(
                            MakeElement(
                                "Label",
                                "This part of the script is locked to Sirius Premium users. Purchase Premium in the Discord server (discord.gg/sirius)",
                                12
                            ),
                            {
                                Size = UDim2.new(1, -200, 0, 14),
                                Position = UDim2.new(0, 150, 0, 138),
                                TextWrapped = true,
                                TextTransparency = 0.4
                            }
                        ),
                        "Text"
                    )
                }
            )
        end
        return ElementFunction
    end

    function Functions.ChangeKey(Keybind)
        _currentKey = Keybind
    end

    function Functions:Destroy()
        for _, Connection in next, OrionLib.Connections do
            if Connection then
                Connection:Disconnect()
            end
        end

        if MainWindow then
            MainWindow:Destroy()
        end
        if MobileIcon then
            MobileIcon:Destroy()
        end
    end

    return Functions
end

function OrionLib:BtnMinimize(config)
    local buttonConfig = config.Button or {}
    local cornerConfig = config.Corner or {}
    local strokeConfig = config.Stroke or {}

    if OrionLib.MinimizeGUI then
        OrionLib.MinimizeGUI:Destroy()
    end

    local MinimizeGUI = Instance.new("ScreenGui")
    MinimizeGUI.Name = "ToggleGUI"
    MinimizeGUI.ResetOnSpawn = false
    MinimizeGUI.Parent = game:GetService("CoreGui")

    local ToggleButton = Instance.new("ImageButton")
    ToggleButton.Size = buttonConfig.Size or UDim2.new(0, 60, 0, 60)
    ToggleButton.Position = buttonConfig.Position or UDim2.new(0, 10, 1, -160)
    ToggleButton.Image = buttonConfig.Image or "rbxassetid://18503887946"
    ToggleButton.BackgroundColor3 = buttonConfig.BackgroundColor3 or Color3.fromRGB(30, 30, 30)
    ToggleButton.BackgroundTransparency = buttonConfig.BackgroundTransparency or 0.2
    ToggleButton.Active = true
    ToggleButton.Draggable = false
    ToggleButton.Parent = MinimizeGUI

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = cornerConfig.CornerRadius or UDim.new(0.1, 0)
    UICorner.Parent = ToggleButton

    if strokeConfig.Color then
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Color = strokeConfig.Color
        UIStroke.Thickness = strokeConfig.Thickness or 2
        UIStroke.Parent = ToggleButton
    end

    local UIS = game:GetService("UserInputService")

    local dragging = false
    local dragInput, dragStart, startPos

    local function update(input)
        local delta = input.Position - dragStart
        ToggleButton.Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    ToggleButton.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = ToggleButton.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end
                )
            end
        end
    )

    ToggleButton.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch
             then
                dragInput = input
            end
        end
    )

    UIS.InputChanged:Connect(
        function(input)
            if dragging and input == dragInput then
                update(input)
            end
        end
    )

    ToggleButton.MouseButton1Click:Connect(
        function()
            if OrionLib.Window then
                OrionLib.Window.Enabled = not OrionLib.Window.Enabled
            elseif Orion then
                Orion.Enabled = not Orion.Enabled
            end
        end
    )

    OrionLib.MinimizeGUI = MinimizeGUI
end

function OrionLib:Destroy()
    if Orion then
        Orion:Destroy()
    end
    if OrionLib.MinimizeGUI and OrionLib.MinimizeGUI.Parent then
        OrionLib.MinimizeGUI:Destroy()
        OrionLib.MinimizeGUI = nil
    end
end

return OrionLib
