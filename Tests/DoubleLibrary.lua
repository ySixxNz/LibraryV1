local SixLib = {}
SixLib.__index = SixLib

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function Tween(obj, info, props)
	local tw = TweenService:Create(obj, info, props)
	tw:Play()
	return tw
end

local function MakeDraggable(topbar, frame)
	local dragging, dragInput, dragStart, startPos

	local function update(input)
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	topbar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	topbar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

local function Create(class, props, children)
	local inst = Instance.new(class)
	for i, v in pairs(props or {}) do
		inst[i] = v
	end
	for _, c in pairs(children or {}) do
		c.Parent = inst
	end
	return inst
end

local function Corner(radius)
	return Create("UICorner", {CornerRadius = UDim.new(0, radius or 6)})
end

local function Stroke(color, thickness, transparency)
	return Create("UIStroke", {
		Color = color or Color3.fromRGB(255,255,255),
		Thickness = thickness or 1,
		Transparency = transparency or 0.85,
	})
end

local Icons = {
	Home = "rbxassetid://10723407389",
	Visual = "rbxassetid://10723346959",
	Player = "rbxassetid://10747373176",
	Game = "rbxassetid://15885360708",
	Other = "rbxassetid://10734930886",
	Settings = "rbxassetid://10723374641",
	Credits = "rbxassetid://10723415903",
	Minimize = "rbxassetid://15352332625",
	Close = "rbxassetid://10747384394",
	Search = "rbxassetid://10747373176",
}

local Themes = {
	Default = {
		Main = Color3.fromRGB(30, 30, 30),
		Secondary = Color3.fromRGB(37, 37, 37),
		Stroke = Color3.fromRGB(255, 255, 255),
		Accent = Color3.fromRGB(90, 130, 255),
		Text = Color3.fromRGB(255, 255, 255),
		SubText = Color3.fromRGB(180, 180, 180),
		ElementBG = Color3.fromRGB(42, 42, 42),
	},
}

function SixLib:CreateWindow(config)
	config = config or {}
	local WindowName = config.Name or "Six Menu"
	local GameName = config.GameName or "Game"
	local Theme = Themes.Default
	local ConfigFolder = config.ConfigFolder or "SixLib"

	local Window = setmetatable({}, self)
	Window.Tabs = {}
	Window.CurrentTab = nil
	Window.Flags = {}
	Window.Theme = Theme
	Window.Minimized = false

	local ScreenGui = Create("ScreenGui", {
		Name = "SixLib",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = (gethui and gethui()) or game:GetService("CoreGui"),
	})
	Window.ScreenGui = ScreenGui

	local Main = Create("Frame", {
		Name = "Main",
		Parent = ScreenGui,
		BackgroundColor3 = Theme.Main,
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, -280, 0.5, -160),
		Size = UDim2.new(0, 560, 0, 340),
		ClipsDescendants = true,
	}, {Corner(10), Stroke(Theme.Stroke, 1, 0.85)})

	local TopBar = Create("Frame", {
		Name = "TopBar",
		Parent = Main,
		BackgroundColor3 = Theme.Secondary,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 50),
	}, {Corner(10)})

	Create("Frame", {
		Parent = TopBar,
		BackgroundColor3 = Theme.Secondary,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 1, -10),
		Size = UDim2.new(1, 0, 0, 10),
	})

	local Logo = Create("ImageLabel", {
		Name = "Logo",
		Parent = TopBar,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 15, 0.5, -14),
		Size = UDim2.new(0, 28, 0, 28),
		Image = "rbxassetid://18503600329",
	})

	local Title = Create("TextLabel", {
		Name = "Title",
		Parent = TopBar,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 52, 0, 6),
		Size = UDim2.new(0, 300, 0, 20),
		Font = Enum.Font.GothamBold,
		Text = WindowName,
		TextColor3 = Theme.Text,
		TextSize = 16,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local SubTitle = Create("TextLabel", {
		Name = "SubTitle",
		Parent = TopBar,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 52, 0, 25),
		Size = UDim2.new(0, 300, 0, 16),
		Font = Enum.Font.Gotham,
		Text = GameName,
		TextColor3 = Theme.SubText,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local CloseBtn = Create("TextButton", {
		Name = "CloseBtn",
		Parent = TopBar,
		BackgroundColor3 = Color3.fromRGB(60, 40, 40),
		Position = UDim2.new(1, -38, 0.5, -14),
		Size = UDim2.new(0, 28, 0, 28),
		Text = "X",
		Font = Enum.Font.GothamBold,
		TextColor3 = Color3.fromRGB(255, 120, 120),
		TextSize = 14,
	}, {Corner(6)})

	local MinBtn = Create("TextButton", {
		Name = "MinBtn",
		Parent = TopBar,
		BackgroundColor3 = Theme.ElementBG,
		Position = UDim2.new(1, -72, 0.5, -14),
		Size = UDim2.new(0, 28, 0, 28),
		Text = "_",
		Font = Enum.Font.GothamBold,
		TextColor3 = Theme.Text,
		TextSize = 14,
	}, {Corner(6)})

	MakeDraggable(TopBar, Main)

	local TabList = Create("Frame", {
		Name = "TabList",
		Parent = Main,
		BackgroundColor3 = Theme.Secondary,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 50),
		Size = UDim2.new(0, 130, 1, -50),
	})

	local TabListLayout = Create("UIListLayout", {
		Parent = TabList,
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	Create("UIPadding", {
		Parent = TabList,
		PaddingTop = UDim.new(0, 10),
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
	})

	local Divider = Create("Frame", {
		Parent = Main,
		BackgroundColor3 = Theme.Stroke,
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 130, 0, 50),
		Size = UDim2.new(0, 1, 1, -50),
	})

	local ContentHolder = Create("Frame", {
		Name = "ContentHolder",
		Parent = Main,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 131, 0, 50),
		Size = UDim2.new(1, -261, 1, -50),
	})

	local SideDivider = Create("Frame", {
		Parent = Main,
		BackgroundColor3 = Theme.Stroke,
		BackgroundTransparency = 0.9,
		BorderSizePixel = 0,
		Position = UDim2.new(1, -130, 0, 50),
		Size = UDim2.new(0, 1, 1, -50),
	})

	local SidePanel = Create("Frame", {
		Name = "SidePanel",
		Parent = Main,
		BackgroundColor3 = Theme.Secondary,
		BorderSizePixel = 0,
		Position = UDim2.new(1, -129, 0, 50),
		Size = UDim2.new(0, 129, 1, -50),
	})
	Window.SidePanel = SidePanel

	local SidePanelTitle = Create("TextLabel", {
		Parent = SidePanel,
		BackgroundTransparency = 1,
		Position = UDim2.new(0, 10, 0, 8),
		Size = UDim2.new(1, -20, 0, 20),
		Font = Enum.Font.GothamBold,
		Text = "Lista",
		TextColor3 = Theme.Text,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	})

	local SideScroll = Create("ScrollingFrame", {
		Name = "SideScroll",
		Parent = SidePanel,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 6, 0, 32),
		Size = UDim2.new(1, -12, 1, -40),
		CanvasSize = UDim2.new(0, 0, 0, 0),
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		ScrollBarThickness = 3,
		ScrollBarImageColor3 = Theme.Accent,
	})
	local SideLayout = Create("UIListLayout", {
		Parent = SideScroll,
		Padding = UDim.new(0, 4),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	Window.SideScroll = SideScroll

	function Window:SetSideTitle(text)
		SidePanelTitle.Text = text
	end

	function Window:AddSideEntry(text, subtext)
		local Entry = Create("Frame", {
			Parent = SideScroll,
			BackgroundColor3 = Theme.ElementBG,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, subtext and 40 or 26),
		}, {Corner(5)})

		Create("TextLabel", {
			Parent = Entry,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 8, 0, 2),
			Size = UDim2.new(1, -16, 0, 16),
			Font = Enum.Font.GothamBold,
			Text = text,
			TextColor3 = Theme.Text,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.AtEnd,
		})

		if subtext then
			Create("TextLabel", {
				Parent = Entry,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 8, 0, 18),
				Size = UDim2.new(1, -16, 0, 16),
				Font = Enum.Font.Gotham,
				Text = subtext,
				TextColor3 = Theme.SubText,
				TextSize = 11,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextTruncate = Enum.TextTruncate.AtEnd,
			})
		end

		return Entry
	end

	function Window:ClearSideEntries()
		for _, c in pairs(SideScroll:GetChildren()) do
			if c:IsA("Frame") then
				c:Destroy()
			end
		end
	end

	function Window:PopulatePlayers()
		Window:ClearSideEntries()
		Window:SetSideTitle("Players")
		for _, plr in pairs(Players:GetPlayers()) do
			Window:AddSideEntry(plr.Name, "@" .. plr.Name)
		end
		Players.PlayerAdded:Connect(function(plr)
			Window:AddSideEntry(plr.Name, "@" .. plr.Name)
		end)
	end

	local Toggled = true
	local function ToggleMain()
		Toggled = not Toggled
		Main.Visible = Toggled
	end
	CloseBtn.MouseButton1Click:Connect(function()
		Tween(Main, TweenInfo.new(0.25), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)})
		task.wait(0.25)
		ScreenGui:Destroy()
	end)

	local MinimizedState = false
	local FullSize = Main.Size
	MinBtn.MouseButton1Click:Connect(function()
		MinimizedState = not MinimizedState
		if MinimizedState then
			Tween(Main, TweenInfo.new(0.25), {Size = UDim2.new(0, 560, 0, 50)})
			ContentHolder.Visible = false
			TabList.Visible = false
			SidePanel.Visible = false
			Divider.Visible = false
			SideDivider.Visible = false
		else
			Tween(Main, TweenInfo.new(0.25), {Size = FullSize})
			task.wait(0.1)
			ContentHolder.Visible = true
			TabList.Visible = true
			SidePanel.Visible = true
			Divider.Visible = true
			SideDivider.Visible = true
		end
	end)

	UserInputService.InputBegan:Connect(function(input, gpe)
		if gpe then return end
		if input.KeyCode == Enum.KeyCode.RightControl then
			Main.Visible = not Main.Visible
		end
	end)

	function Window:CreateTab(name, icon)
		local Tab = {}
		Tab.Elements = {}

		local TabButton = Create("TextButton", {
			Name = name .. "Button",
			Parent = TabList,
			BackgroundColor3 = Theme.ElementBG,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 34),
			Text = "",
			AutoButtonColor = false,
			LayoutOrder = #Window.Tabs + 1,
		}, {Corner(6)})

		local Indicator = Create("Frame", {
			Parent = TabButton,
			BackgroundColor3 = Theme.Accent,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0.2, 0),
			Size = UDim2.new(0, 3, 0.6, 0),
			Visible = false,
		}, {Corner(2)})

		if icon then
			Create("ImageLabel", {
				Parent = TabButton,
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 10, 0.5, -9),
				Size = UDim2.new(0, 18, 0, 18),
				Image = icon,
				ImageColor3 = Theme.SubText,
			})
		end

		local TabLabel = Create("TextLabel", {
			Parent = TabButton,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, icon and 34 or 12, 0, 0),
			Size = UDim2.new(1, -40, 1, 0),
			Font = Enum.Font.Gotham,
			Text = name,
			TextColor3 = Theme.SubText,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		local Page = Create("ScrollingFrame", {
			Name = name .. "Page",
			Parent = ContentHolder,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollBarThickness = 3,
			ScrollBarImageColor3 = Theme.Accent,
			Visible = false,
		})
		Create("UIPadding", {
			Parent = Page,
			PaddingTop = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10),
		})
		local PageLayout = Create("UIListLayout", {
			Parent = Page,
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		Tab.Button = TabButton
		Tab.Page = Page
		Tab.Indicator = Indicator
		Tab.Label = TabLabel

		local function SelectTab()
			for _, t in pairs(Window.Tabs) do
				t.Page.Visible = false
				t.Indicator.Visible = false
				Tween(t.Label, TweenInfo.new(0.15), {TextColor3 = Theme.SubText})
				Tween(t.Button, TweenInfo.new(0.15), {BackgroundTransparency = 1})
			end
			Page.Visible = true
			Indicator.Visible = true
			Tween(TabLabel, TweenInfo.new(0.15), {TextColor3 = Theme.Text})
			Tween(TabButton, TweenInfo.new(0.15), {BackgroundTransparency = 0.9})
			Window.CurrentTab = Tab
		end

		TabButton.MouseButton1Click:Connect(SelectTab)

		if #Window.Tabs == 0 then
			SelectTab()
		end

		table.insert(Window.Tabs, Tab)

		local function AddSectionFrame(order)
			local Section = Create("Frame", {
				Parent = Page,
				BackgroundColor3 = Theme.ElementBG,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = order,
			}, {Corner(6)})
			local Layout = Create("UIListLayout", {
				Parent = Section,
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			Create("UIPadding", {
				Parent = Section,
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8),
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			})
			return Section
		end

		function Tab:CreateSection(name)
			local order = #Page:GetChildren()
			local Holder = Create("Frame", {
				Parent = Page,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				LayoutOrder = order,
			})
			local HolderLayout = Create("UIListLayout", {
				Parent = Holder,
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})

			Create("TextLabel", {
				Parent = Holder,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 18),
				Font = Enum.Font.GothamBold,
				Text = name,
				TextColor3 = Theme.Accent,
				TextSize = 13,
				TextXAlignment = Enum.TextXAlignment.Left,
			})

			local Section = {}
			local Body = Create("Frame", {
				Parent = Holder,
				BackgroundColor3 = Theme.ElementBG,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
			}, {Corner(6)})
			local BodyLayout = Create("UIListLayout", {
				Parent = Body,
				Padding = UDim.new(0, 6),
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
			Create("UIPadding", {
				Parent = Body,
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8),
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			})

			Section.Container = Body

			function Section:CreateButton(cfg)
				return Window.Internal.CreateButton(Body, cfg)
			end
			function Section:CreateToggle(cfg)
				return Window.Internal.CreateToggle(Body, cfg, Window)
			end
			function Section:CreateSlider(cfg)
				return Window.Internal.CreateSlider(Body, cfg, Window)
			end
			function Section:CreateDropdown(cfg)
				return Window.Internal.CreateDropdown(Body, cfg, Window)
			end
			function Section:CreateTextbox(cfg)
				return Window.Internal.CreateTextbox(Body, cfg, Window)
			end
			function Section:CreateLabel(text)
				return Window.Internal.CreateLabel(Body, text)
			end

			return Section
		end

		function Tab:CreateButton(cfg)
			return Window.Internal.CreateButton(Page, cfg)
		end
		function Tab:CreateToggle(cfg)
			return Window.Internal.CreateToggle(Page, cfg, Window)
		end
		function Tab:CreateSlider(cfg)
			return Window.Internal.CreateSlider(Page, cfg, Window)
		end
		function Tab:CreateDropdown(cfg)
			return Window.Internal.CreateDropdown(Page, cfg, Window)
		end
		function Tab:CreateTextbox(cfg)
			return Window.Internal.CreateTextbox(Page, cfg, Window)
		end
		function Tab:CreateLabel(text)
			return Window.Internal.CreateLabel(Page, text)
		end

		return Tab
	end

	Window.Internal = {}

	function Window.Internal.CreateLabel(parent, text)
		return Create("TextLabel", {
			Parent = parent,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			Font = Enum.Font.Gotham,
			Text = text,
			TextColor3 = Theme.SubText,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextWrapped = true,
		})
	end

	function Window.Internal.CreateButton(parent, cfg)
		cfg = cfg or {}
		local Name = cfg.Name or "Button"
		local Callback = cfg.Callback or function() end

		local Btn = Create("TextButton", {
			Parent = parent,
			BackgroundColor3 = Theme.Main,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 34),
			Text = "",
			AutoButtonColor = false,
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.9)})

		Create("TextLabel", {
			Parent = Btn,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(1, -20, 1, 0),
			Font = Enum.Font.Gotham,
			Text = Name,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		Btn.MouseEnter:Connect(function()
			Tween(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Theme.ElementBG})
		end)
		Btn.MouseLeave:Connect(function()
			Tween(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Theme.Main})
		end)
		Btn.MouseButton1Click:Connect(function()
			Tween(Btn, TweenInfo.new(0.1), {BackgroundColor3 = Theme.Accent})
			task.wait(0.1)
			Tween(Btn, TweenInfo.new(0.15), {BackgroundColor3 = Theme.ElementBG})
			local ok, err = pcall(Callback)
			if not ok then
				warn("[SixLib] Button callback error: " .. tostring(err))
			end
		end)

		return Btn
	end

	function Window.Internal.CreateToggle(parent, cfg, Win)
		cfg = cfg or {}
		local Name = cfg.Name or "Toggle"
		local Default = cfg.Default or false
		local Flag = cfg.Flag
		local Callback = cfg.Callback or function() end

		local Holder = Create("Frame", {
			Parent = parent,
			BackgroundColor3 = Theme.Main,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 34),
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.9)})

		Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(1, -60, 1, 0),
			Font = Enum.Font.Gotham,
			Text = Name,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		local Switch = Create("Frame", {
			Parent = Holder,
			BackgroundColor3 = Default and Theme.Accent or Color3.fromRGB(70, 70, 70),
			BorderSizePixel = 0,
			Position = UDim2.new(1, -46, 0.5, -10),
			Size = UDim2.new(0, 36, 0, 20),
		}, {Corner(10)})

		local Dot = Create("Frame", {
			Parent = Switch,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BorderSizePixel = 0,
			Position = Default and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8),
			Size = UDim2.new(0, 16, 0, 16),
		}, {Corner(8)})

		local Click = Create("TextButton", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
		})

		local State = Default

		local ToggleObj = {}
		function ToggleObj:Set(value)
			State = value
			if State then
				Tween(Switch, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent})
				Tween(Dot, TweenInfo.new(0.2), {Position = UDim2.new(1, -18, 0.5, -8)})
			else
				Tween(Switch, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70)})
				Tween(Dot, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0.5, -8)})
			end
			if Flag then Win.Flags[Flag] = State end
			local ok, err = pcall(Callback, State)
			if not ok then warn("[SixLib] Toggle callback error: " .. tostring(err)) end
		end
		function ToggleObj:Get()
			return State
		end

		Click.MouseButton1Click:Connect(function()
			ToggleObj:Set(not State)
		end)

		if Flag then Win.Flags[Flag] = State end
		if Default then
			pcall(Callback, State)
		end

		return ToggleObj
	end

	function Window.Internal.CreateSlider(parent, cfg, Win)
		cfg = cfg or {}
		local Name = cfg.Name or "Slider"
		local Min = cfg.Min or 0
		local Max = cfg.Max or 100
		local Default = math.clamp(cfg.Default or Min, Min, Max)
		local Increment = cfg.Increment or 1
		local Flag = cfg.Flag
		local Callback = cfg.Callback or function() end

		local Holder = Create("Frame", {
			Parent = parent,
			BackgroundColor3 = Theme.Main,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 46),
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.9)})

		Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 4),
			Size = UDim2.new(1, -70, 0, 18),
			Font = Enum.Font.Gotham,
			Text = Name,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		local ValueLabel = Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -60, 0, 4),
			Size = UDim2.new(0, 50, 0, 18),
			Font = Enum.Font.GothamBold,
			Text = tostring(Default),
			TextColor3 = Theme.Accent,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Right,
		})

		local Bar = Create("Frame", {
			Parent = Holder,
			BackgroundColor3 = Color3.fromRGB(60, 60, 60),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 10, 0, 28),
			Size = UDim2.new(1, -20, 0, 8),
		}, {Corner(4)})

		local Fill = Create("Frame", {
			Parent = Bar,
			BackgroundColor3 = Theme.Accent,
			BorderSizePixel = 0,
			Size = UDim2.new((Default - Min) / (Max - Min), 0, 1, 0),
		}, {Corner(4)})

		local Dragging = false
		local Value = Default

		local SliderObj = {}
		function SliderObj:Set(v)
			v = math.clamp(v, Min, Max)
			v = math.floor(v / Increment + 0.5) * Increment
			Value = v
			local pct = (Value - Min) / (Max - Min)
			Fill.Size = UDim2.new(pct, 0, 1, 0)
			ValueLabel.Text = tostring(Value)
			if Flag then Win.Flags[Flag] = Value end
			local ok, err = pcall(Callback, Value)
			if not ok then warn("[SixLib] Slider callback error: " .. tostring(err)) end
		end
		function SliderObj:Get()
			return Value
		end

		local function UpdateFromInput(input)
			local pct = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
			SliderObj:Set(Min + (Max - Min) * pct)
		end

		Bar.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				UpdateFromInput(input)
			end
		end)
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = false
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if Dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				UpdateFromInput(input)
			end
		end)

		if Flag then Win.Flags[Flag] = Value end

		return SliderObj
	end

	function Window.Internal.CreateDropdown(parent, cfg, Win)
		cfg = cfg or {}
		local Name = cfg.Name or "Dropdown"
		local Options = cfg.Options or {}
		local Default = cfg.Default
		local Multi = cfg.Multi or false
		local Flag = cfg.Flag
		local Callback = cfg.Callback or function() end

		local Holder = Create("Frame", {
			Parent = parent,
			BackgroundColor3 = Theme.Main,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 34),
			ClipsDescendants = true,
			ZIndex = 2,
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.9)})

		Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(1, -90, 0, 34),
			Font = Enum.Font.Gotham,
			Text = Name,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 2,
		})

		local SelectedLabel = Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -110, 0, 0),
			Size = UDim2.new(0, 80, 0, 34),
			Font = Enum.Font.Gotham,
			Text = Default and (type(Default) == "table" and table.concat(Default, ", ") or tostring(Default)) or "Nenhum",
			TextColor3 = Theme.SubText,
			TextSize = 12,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextTruncate = Enum.TextTruncate.AtEnd,
			ZIndex = 2,
		})

		local Arrow = Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -26, 0, 0),
			Size = UDim2.new(0, 20, 0, 34),
			Font = Enum.Font.GothamBold,
			Text = "v",
			TextColor3 = Theme.SubText,
			TextSize = 12,
			ZIndex = 2,
		})

		local Click = Create("TextButton", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 34),
			Text = "",
			ZIndex = 3,
		})

		local OptionsHolder = Create("Frame", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 0, 0, 36),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
		})
		local OptionsLayout = Create("UIListLayout", {
			Parent = OptionsHolder,
			Padding = UDim.new(0, 4),
			SortOrder = Enum.SortOrder.LayoutOrder,
		})

		local Selected = {}
		if Default then
			if type(Default) == "table" then
				for _, v in pairs(Default) do Selected[v] = true end
			else
				Selected[Default] = true
			end
		end

		local Open = false
		local DropObj = {}
		local OptionButtons = {}

		local function Refresh()
			local names = {}
			for k, v in pairs(Selected) do
				if v then table.insert(names, k) end
			end
			SelectedLabel.Text = #names > 0 and table.concat(names, ", ") or "Nenhum"
			for opt, btn in pairs(OptionButtons) do
				if Selected[opt] then
					btn.BackgroundColor3 = Theme.Accent
				else
					btn.BackgroundColor3 = Theme.ElementBG
				end
			end
		end

		function DropObj:SetOptions(newOptions)
			for _, c in pairs(OptionsHolder:GetChildren()) do
				if c:IsA("TextButton") then c:Destroy() end
			end
			OptionButtons = {}
			Options = newOptions
			for i, opt in pairs(Options) do
				local OptBtn = Create("TextButton", {
					Parent = OptionsHolder,
					BackgroundColor3 = Selected[opt] and Theme.Accent or Theme.ElementBG,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 26),
					Text = tostring(opt),
					Font = Enum.Font.Gotham,
					TextColor3 = Theme.Text,
					TextSize = 12,
					AutoButtonColor = false,
				}, {Corner(5)})
				OptionButtons[opt] = OptBtn

				OptBtn.MouseButton1Click:Connect(function()
					if Multi then
						Selected[opt] = not Selected[opt]
					else
						for k in pairs(Selected) do Selected[k] = false end
						Selected[opt] = true
					end
					Refresh()
					local names = {}
					for k, v in pairs(Selected) do
						if v then table.insert(names, k) end
					end
					local result = Multi and names or names[1]
					if Flag then Win.Flags[Flag] = result end
					local ok, err = pcall(Callback, result)
					if not ok then warn("[SixLib] Dropdown callback error: " .. tostring(err)) end
					if not Multi then
						Open = false
						Tween(Holder, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 34)})
						Tween(Arrow, TweenInfo.new(0.2), {Rotation = 0})
					end
				end)
			end
		end

		DropObj:SetOptions(Options)
		Refresh()

		Click.MouseButton1Click:Connect(function()
			Open = not Open
			if Open then
				local h = 36 + (#Options * 30)
				Tween(Holder, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, h)})
				Tween(Arrow, TweenInfo.new(0.2), {Rotation = 180})
			else
				Tween(Holder, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 34)})
				Tween(Arrow, TweenInfo.new(0.2), {Rotation = 0})
			end
		end)

		function DropObj:Get()
			local names = {}
			for k, v in pairs(Selected) do
				if v then table.insert(names, k) end
			end
			return Multi and names or names[1]
		end

		if Flag then Win.Flags[Flag] = DropObj:Get() end

		return DropObj
	end

	function Window.Internal.CreateTextbox(parent, cfg, Win)
		cfg = cfg or {}
		local Name = cfg.Name or "Textbox"
		local Default = cfg.Default or ""
		local Placeholder = cfg.Placeholder or "Digite aqui..."
		local Flag = cfg.Flag
		local Callback = cfg.Callback or function() end
		local ClearOnFocus = cfg.ClearOnFocus

		local Holder = Create("Frame", {
			Parent = parent,
			BackgroundColor3 = Theme.Main,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 34),
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.9)})

		Create("TextLabel", {
			Parent = Holder,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 0),
			Size = UDim2.new(0, 90, 1, 0),
			Font = Enum.Font.Gotham,
			Text = Name,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		local Box = Create("TextBox", {
			Parent = Holder,
			BackgroundColor3 = Theme.ElementBG,
			BorderSizePixel = 0,
			Position = UDim2.new(0, 100, 0.5, -12),
			Size = UDim2.new(1, -110, 0, 24),
			Font = Enum.Font.Gotham,
			PlaceholderText = Placeholder,
			Text = Default,
			TextColor3 = Theme.Text,
			PlaceholderColor3 = Theme.SubText,
			TextSize = 12,
			ClearTextOnFocus = ClearOnFocus or false,
		}, {Corner(5)})
		Create("UIPadding", {Parent = Box, PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)})

		local BoxObj = {}
		function BoxObj:Set(text)
			Box.Text = text
			if Flag then Win.Flags[Flag] = text end
		end
		function BoxObj:Get()
			return Box.Text
		end

		Box.FocusLost:Connect(function(enterPressed)
			if Flag then Win.Flags[Flag] = Box.Text end
			local ok, err = pcall(Callback, Box.Text, enterPressed)
			if not ok then warn("[SixLib] Textbox callback error: " .. tostring(err)) end
		end)

		if Flag then Win.Flags[Flag] = Default end

		return BoxObj
	end

	function Window:Notify(cfg)
		cfg = cfg or {}
		local Title = cfg.Title or "Notificação"
		local Content = cfg.Content or ""
		local Duration = cfg.Duration or 4

		local NotifHolder = ScreenGui:FindFirstChild("NotifHolder")
		if not NotifHolder then
			NotifHolder = Create("Frame", {
				Name = "NotifHolder",
				Parent = ScreenGui,
				BackgroundTransparency = 1,
				Position = UDim2.new(1, -270, 1, -20),
				Size = UDim2.new(0, 260, 1, -20),
				AnchorPoint = Vector2.new(0, 1),
			})
			Create("UIListLayout", {
				Parent = NotifHolder,
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Bottom,
				SortOrder = Enum.SortOrder.LayoutOrder,
			})
		end

		local Notif = Create("Frame", {
			Parent = NotifHolder,
			BackgroundColor3 = Theme.Secondary,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ClipsDescendants = true,
			BackgroundTransparency = 1,
		}, {Corner(6), Stroke(Theme.Stroke, 1, 0.85)})

		Create("TextLabel", {
			Parent = Notif,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 6),
			Size = UDim2.new(1, -20, 0, 18),
			Font = Enum.Font.GothamBold,
			Text = Title,
			TextColor3 = Theme.Text,
			TextSize = 13,
			TextXAlignment = Enum.TextXAlignment.Left,
		})

		Create("TextLabel", {
			Parent = Notif,
			BackgroundTransparency = 1,
			Position = UDim2.new(0, 10, 0, 24),
			Size = UDim2.new(1, -20, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Font = Enum.Font.Gotham,
			Text = Content,
			TextColor3 = Theme.SubText,
			TextSize = 12,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			Position2 = nil,
		})
		Create("UIPadding", {Parent = Notif, PaddingBottom = UDim.new(0, 8)})

		Tween(Notif, TweenInfo.new(0.25), {BackgroundTransparency = 0})
		task.delay(Duration, function()
			if Notif and Notif.Parent then
				Tween(Notif, TweenInfo.new(0.25), {BackgroundTransparency = 1})
				task.wait(0.25)
				Notif:Destroy()
			end
		end)
	end

	return Window
end

return SixLib