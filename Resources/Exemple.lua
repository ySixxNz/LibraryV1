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
	warn("Check:", swift_internal_correct and "Swift Issue" or gethui and "Normal" or game:GetService("CoreGui") and "Normal ²")
	warn("[ DEBUG END ]")
end

local PARENT = swift_internal_correct and game:GetService("CoreGui") or gethui and gethui() or game:GetService("CoreGui")

local OrionLib = {
	Elements = {},
	ThemeObjects = {},
	Connections = {},
	Flags = {},
	Themes = {
		Default = {
			Main = Color3.new(0, 0, 0),
			Second = Color3.new(0.059, 0.059, 0.059),
			Stroke = Color3.new(0.275, 0.275, 0.275),
			Divider = Color3.new(0.235, 0.235, 0.235),
			Text = Color3.new(0.941, 0.941, 0.941),
			TextDark = Color3.new(0.667, 0.667, 0.667)
		},
		Abyss = {
			Main = Color3.new(0.02, 0.02, 0.059),
			Second = Color3.new(0.059, 0.059, 0.137),
			Stroke = Color3.new(0.314, 0.314, 0.51),
			Divider = Color3.new(0.216, 0.216, 0.373),
			Text = Color3.new(0.824, 0.824, 0.98),
			TextDark = Color3.new(0.549, 0.549, 0.784)
		},
		Arctic = {
			Main = Color3.new(0.098, 0.157, 0.216),
			Second = Color3.new(0.176, 0.275, 0.353),
			Stroke = Color3.new(0.549, 0.824, 0.98),
			Divider = Color3.new(0.353, 0.588, 0.784),
			Text = Color3.new(0.902, 0.98, 1),
			TextDark = Color3.new(0.627, 0.784, 0.902)
		},
		Ash = {
			Main = Color3.new(0.118, 0.118, 0.137),
			Second = Color3.new(0.196, 0.196, 0.235),
			Stroke = Color3.new(0.51, 0.51, 0.588),
			Divider = Color3.new(0.353, 0.353, 0.431),
			Text = Color3.new(0.902, 0.902, 0.941),
			TextDark = Color3.new(0.627, 0.627, 0.706)
		},
		Azure = {
			Main = Color3.new(0, 0.078, 0.176),
			Second = Color3.new(0, 0.157, 0.294),
			Stroke = Color3.new(0, 0.588, 0.902),
			Divider = Color3.new(0, 0.392, 0.706),
			Text = Color3.new(0.824, 0.922, 1),
			TextDark = Color3.new(0.471, 0.667, 0.902)
		},
		Blaze = {
			Main = Color3.new(0.235, 0.078, 0),
			Second = Color3.new(0.392, 0.137, 0.02),
			Stroke = Color3.new(1, 0.471, 0.118),
			Divider = Color3.new(0.824, 0.314, 0.078),
			Text = Color3.new(1, 0.902, 0.784),
			TextDark = Color3.new(0.824, 0.588, 0.392)
		},
		Bloodmoon = {
			Main = Color3.new(0.176, 0.02, 0.039),
			Second = Color3.new(0.314, 0.059, 0.098),
			Stroke = Color3.new(0.863, 0.196, 0.275),
			Divider = Color3.new(0.667, 0.137, 0.216),
			Text = Color3.new(1, 0.863, 0.863),
			TextDark = Color3.new(0.784, 0.471, 0.51)
		},
		Blueberry = {
			Main = Color3.new(0.098, 0.078, 0.235),
			Second = Color3.new(0.176, 0.137, 0.373),
			Stroke = Color3.new(0.471, 0.392, 0.824),
			Divider = Color3.new(0.314, 0.255, 0.627),
			Text = Color3.new(0.863, 0.863, 1),
			TextDark = Color3.new(0.588, 0.549, 0.824)
		},
		Breeze = {
			Main = Color3.new(0.078, 0.176, 0.216),
			Second = Color3.new(0.157, 0.294, 0.333),
			Stroke = Color3.new(0.51, 0.784, 0.902),
			Divider = Color3.new(0.314, 0.588, 0.706),
			Text = Color3.new(0.922, 0.98, 1),
			TextDark = Color3.new(0.588, 0.745, 0.863)
		},
		Candy = {
			Main = Color3.new(0.275, 0.078, 0.176),
			Second = Color3.new(0.431, 0.157, 0.294),
			Stroke = Color3.new(1, 0.471, 0.706),
			Divider = Color3.new(0.824, 0.314, 0.549),
			Text = Color3.new(1, 0.902, 0.961),
			TextDark = Color3.new(0.824, 0.588, 0.745)
		},
		Caramel = {
			Main = Color3.new(0.196, 0.137, 0.078),
			Second = Color3.new(0.333, 0.235, 0.137),
			Stroke = Color3.new(0.902, 0.667, 0.314),
			Divider = Color3.new(0.745, 0.51, 0.235),
			Text = Color3.new(1, 0.961, 0.863),
			TextDark = Color3.new(0.784, 0.667, 0.51)
		},
		Celestial = {
			Main = Color3.new(0.039, 0.031, 0.176),
			Second = Color3.new(0.098, 0.078, 0.294),
			Stroke = Color3.new(0.549, 0.431, 0.902),
			Divider = Color3.new(0.353, 0.275, 0.706),
			Text = Color3.new(0.902, 0.882, 1),
			TextDark = Color3.new(0.627, 0.549, 0.824)
		},
		Charcoal = {
			Main = Color3.new(0.098, 0.098, 0.118),
			Second = Color3.new(0.176, 0.176, 0.216),
			Stroke = Color3.new(0.431, 0.431, 0.51),
			Divider = Color3.new(0.294, 0.294, 0.373),
			Text = Color3.new(0.922, 0.922, 0.961),
			TextDark = Color3.new(0.647, 0.647, 0.706)
		},
		Cinnamon = {
			Main = Color3.new(0.216, 0.118, 0.059),
			Second = Color3.new(0.353, 0.196, 0.098),
			Stroke = Color3.new(0.824, 0.51, 0.275),
			Divider = Color3.new(0.667, 0.392, 0.196),
			Text = Color3.new(1, 0.941, 0.843),
			TextDark = Color3.new(0.784, 0.627, 0.471)
		},
		Cloud = {
			Main = Color3.new(0.176, 0.176, 0.216),
			Second = Color3.new(0.275, 0.275, 0.333),
			Stroke = Color3.new(0.588, 0.588, 0.706),
			Divider = Color3.new(0.431, 0.431, 0.529),
			Text = Color3.new(0.98, 0.98, 1),
			TextDark = Color3.new(0.706, 0.706, 0.824)
		},
		Cocoa = {
			Main = Color3.new(0.176, 0.118, 0.078),
			Second = Color3.new(0.294, 0.196, 0.137),
			Stroke = Color3.new(0.667, 0.471, 0.314),
			Divider = Color3.new(0.51, 0.333, 0.216),
			Text = Color3.new(0.98, 0.941, 0.882),
			TextDark = Color3.new(0.745, 0.627, 0.51)
		},
		Coffee = {
			Main = Color3.new(0.157, 0.098, 0.059),
			Second = Color3.new(0.275, 0.176, 0.118),
			Stroke = Color3.new(0.588, 0.392, 0.275),
			Divider = Color3.new(0.431, 0.275, 0.196),
			Text = Color3.new(0.961, 0.922, 0.863),
			TextDark = Color3.new(0.706, 0.588, 0.471)
		},
		Cotton = {
			Main = Color3.new(0.196, 0.176, 0.216),
			Second = Color3.new(0.314, 0.294, 0.333),
			Stroke = Color3.new(0.667, 0.627, 0.745),
			Divider = Color3.new(0.49, 0.471, 0.569),
			Text = Color3.new(1, 0.98, 0.98),
			TextDark = Color3.new(0.745, 0.725, 0.824)
		},
		Cream = {
			Main = Color3.new(0.216, 0.196, 0.157),
			Second = Color3.new(0.353, 0.333, 0.275),
			Stroke = Color3.new(0.784, 0.706, 0.51),
			Divider = Color3.new(0.588, 0.51, 0.373),
			Text = Color3.new(1, 1, 0.941),
			TextDark = Color3.new(0.784, 0.745, 0.627)
		},
		Crimson = {
			Main = Color3.new(0.216, 0.039, 0.059),
			Second = Color3.new(0.373, 0.078, 0.118),
			Stroke = Color3.new(0.863, 0.235, 0.314),
			Divider = Color3.new(0.667, 0.157, 0.235),
			Text = Color3.new(1, 0.863, 0.863),
			TextDark = Color3.new(0.784, 0.51, 0.549)
		},
		Crystal = {
			Main = Color3.new(0.137, 0.176, 0.255),
			Second = Color3.new(0.235, 0.294, 0.392),
			Stroke = Color3.new(0.549, 0.667, 0.863),
			Divider = Color3.new(0.392, 0.49, 0.667),
			Text = Color3.new(0.941, 0.961, 1),
			TextDark = Color3.new(0.667, 0.745, 0.863)
		},
		Dawn = {
			Main = Color3.new(0.216, 0.137, 0.098),
			Second = Color3.new(0.353, 0.235, 0.176),
			Stroke = Color3.new(0.941, 0.706, 0.392),
			Divider = Color3.new(0.784, 0.549, 0.294),
			Text = Color3.new(1, 0.961, 0.882),
			TextDark = Color3.new(0.824, 0.667, 0.51)
		},
		Desert = {
			Main = Color3.new(0.255, 0.196, 0.118),
			Second = Color3.new(0.392, 0.314, 0.196),
			Stroke = Color3.new(0.824, 0.667, 0.353),
			Divider = Color3.new(0.667, 0.51, 0.275),
			Text = Color3.new(1, 0.98, 0.863),
			TextDark = Color3.new(0.784, 0.667, 0.51)
		},
		Dusk = {
			Main = Color3.new(0.137, 0.078, 0.196),
			Second = Color3.new(0.235, 0.137, 0.314),
			Stroke = Color3.new(0.588, 0.392, 0.784),
			Divider = Color3.new(0.431, 0.275, 0.588),
			Text = Color3.new(0.941, 0.863, 1),
			TextDark = Color3.new(0.667, 0.51, 0.824)
		},
		Earth = {
			Main = Color3.new(0.137, 0.157, 0.078),
			Second = Color3.new(0.235, 0.275, 0.157),
			Stroke = Color3.new(0.51, 0.588, 0.314),
			Divider = Color3.new(0.373, 0.451, 0.235),
			Text = Color3.new(0.922, 0.98, 0.843),
			TextDark = Color3.new(0.627, 0.706, 0.471)
		},
		Eclipse = {
			Main = Color3.new(0.039, 0.02, 0.078),
			Second = Color3.new(0.098, 0.059, 0.176),
			Stroke = Color3.new(0.392, 0.314, 0.588),
			Divider = Color3.new(0.255, 0.196, 0.431),
			Text = Color3.new(0.863, 0.824, 0.961),
			TextDark = Color3.new(0.549, 0.471, 0.706)
		},
		Electric = {
			Main = Color3.new(0, 0.078, 0.157),
			Second = Color3.new(0, 0.176, 0.294),
			Stroke = Color3.new(0, 0.784, 1),
			Divider = Color3.new(0, 0.588, 0.824),
			Text = Color3.new(0.784, 0.941, 1),
			TextDark = Color3.new(0.392, 0.706, 0.902)
		},
		Envy = {
			Main = Color3.new(0.078, 0.176, 0.078),
			Second = Color3.new(0.157, 0.314, 0.157),
			Stroke = Color3.new(0.392, 0.824, 0.392),
			Divider = Color3.new(0.275, 0.627, 0.275),
			Text = Color3.new(0.863, 1, 0.863),
			TextDark = Color3.new(0.51, 0.784, 0.51)
		},
		Fantasy = {
			Main = Color3.new(0.176, 0.078, 0.216),
			Second = Color3.new(0.294, 0.137, 0.333),
			Stroke = Color3.new(0.784, 0.51, 0.902),
			Divider = Color3.new(0.588, 0.353, 0.706),
			Text = Color3.new(0.98, 0.922, 1),
			TextDark = Color3.new(0.745, 0.588, 0.863)
		},
		Flamingo = {
			Main = Color3.new(0.275, 0.137, 0.176),
			Second = Color3.new(0.431, 0.235, 0.294),
			Stroke = Color3.new(1, 0.588, 0.706),
			Divider = Color3.new(0.824, 0.431, 0.549),
			Text = Color3.new(1, 0.922, 0.941),
			TextDark = Color3.new(0.824, 0.627, 0.706)
		},
		Frost = {
			Main = Color3.new(0.157, 0.216, 0.255),
			Second = Color3.new(0.275, 0.353, 0.392),
			Stroke = Color3.new(0.588, 0.824, 0.941),
			Divider = Color3.new(0.392, 0.627, 0.745),
			Text = Color3.new(0.941, 0.98, 1),
			TextDark = Color3.new(0.667, 0.784, 0.863)
		},
		Galaxy = {
			Main = Color3.new(0.031, 0.02, 0.118),
			Second = Color3.new(0.078, 0.059, 0.216),
			Stroke = Color3.new(0.51, 0.392, 0.824),
			Divider = Color3.new(0.314, 0.235, 0.627),
			Text = Color3.new(0.863, 0.824, 0.98),
			TextDark = Color3.new(0.549, 0.471, 0.745)
		},
		Glacier = {
			Main = Color3.new(0.137, 0.235, 0.275),
			Second = Color3.new(0.235, 0.373, 0.412),
			Stroke = Color3.new(0.549, 0.824, 0.902),
			Divider = Color3.new(0.353, 0.627, 0.706),
			Text = Color3.new(0.922, 0.98, 1),
			TextDark = Color3.new(0.588, 0.745, 0.824)
		},
		Grape = {
			Main = Color3.new(0.176, 0.078, 0.235),
			Second = Color3.new(0.294, 0.137, 0.373),
			Stroke = Color3.new(0.667, 0.392, 0.824),
			Divider = Color3.new(0.51, 0.275, 0.627),
			Text = Color3.new(0.961, 0.882, 1),
			TextDark = Color3.new(0.706, 0.51, 0.824)
		},
		Graphite = {
			Main = Color3.new(0.098, 0.098, 0.118),
			Second = Color3.new(0.176, 0.176, 0.216),
			Stroke = Color3.new(0.431, 0.431, 0.51),
			Divider = Color3.new(0.294, 0.294, 0.373),
			Text = Color3.new(0.922, 0.922, 0.961),
			TextDark = Color3.new(0.627, 0.627, 0.706)
		},
		Haze = {
			Main = Color3.new(0.196, 0.196, 0.216),
			Second = Color3.new(0.314, 0.314, 0.333),
			Stroke = Color3.new(0.588, 0.588, 0.667),
			Divider = Color3.new(0.431, 0.431, 0.49),
			Text = Color3.new(0.98, 0.98, 1),
			TextDark = Color3.new(0.706, 0.706, 0.784)
		},
		Horizon = {
			Main = Color3.new(0.216, 0.137, 0.098),
			Second = Color3.new(0.353, 0.235, 0.176),
			Stroke = Color3.new(0.941, 0.667, 0.392),
			Divider = Color3.new(0.784, 0.51, 0.294),
			Text = Color3.new(1, 0.961, 0.882),
			TextDark = Color3.new(0.824, 0.667, 0.51)
		},
		Indigo = {
			Main = Color3.new(0.118, 0.059, 0.216),
			Second = Color3.new(0.216, 0.118, 0.353),
			Stroke = Color3.new(0.431, 0.314, 0.784),
			Divider = Color3.new(0.294, 0.216, 0.588),
			Text = Color3.new(0.902, 0.843, 1),
			TextDark = Color3.new(0.588, 0.471, 0.784)
		},
		Ivory = {
			Main = Color3.new(0.235, 0.235, 0.196),
			Second = Color3.new(0.373, 0.373, 0.314),
			Stroke = Color3.new(0.784, 0.784, 0.588),
			Divider = Color3.new(0.588, 0.588, 0.431),
			Text = Color3.new(1, 1, 0.961),
			TextDark = Color3.new(0.784, 0.784, 0.667)
		},
		Jade = {
			Main = Color3.new(0.078, 0.216, 0.157),
			Second = Color3.new(0.137, 0.353, 0.255),
			Stroke = Color3.new(0.275, 0.824, 0.549),
			Divider = Color3.new(0.196, 0.627, 0.392),
			Text = Color3.new(0.863, 1, 0.922),
			TextDark = Color3.new(0.471, 0.784, 0.588)
		},
		Jungle = {
			Main = Color3.new(0.078, 0.176, 0.098),
			Second = Color3.new(0.157, 0.294, 0.176),
			Stroke = Color3.new(0.314, 0.706, 0.353),
			Divider = Color3.new(0.235, 0.549, 0.275),
			Text = Color3.new(0.863, 0.98, 0.863),
			TextDark = Color3.new(0.51, 0.745, 0.51)
		},
		Kiwi = {
			Main = Color3.new(0.137, 0.216, 0.098),
			Second = Color3.new(0.235, 0.353, 0.176),
			Stroke = Color3.new(0.471, 0.784, 0.314),
			Divider = Color3.new(0.333, 0.588, 0.235),
			Text = Color3.new(0.922, 1, 0.843),
			TextDark = Color3.new(0.588, 0.745, 0.431)
		},
		Lagoon = {
			Main = Color3.new(0, 0.176, 0.216),
			Second = Color3.new(0, 0.294, 0.353),
			Stroke = Color3.new(0, 0.706, 0.784),
			Divider = Color3.new(0, 0.51, 0.588),
			Text = Color3.new(0.784, 0.961, 1),
			TextDark = Color3.new(0.392, 0.667, 0.745)
		},
		Lemon = {
			Main = Color3.new(0.216, 0.216, 0.059),
			Second = Color3.new(0.353, 0.353, 0.098),
			Stroke = Color3.new(0.863, 0.863, 0.196),
			Divider = Color3.new(0.667, 0.667, 0.137),
			Text = Color3.new(1, 1, 0.824),
			TextDark = Color3.new(0.784, 0.784, 0.431)
		},
		Lilac = {
			Main = Color3.new(0.235, 0.137, 0.275),
			Second = Color3.new(0.373, 0.235, 0.412),
			Stroke = Color3.new(0.784, 0.588, 0.902),
			Divider = Color3.new(0.588, 0.392, 0.706),
			Text = Color3.new(0.98, 0.922, 1),
			TextDark = Color3.new(0.745, 0.588, 0.824)
		},
		Lime = {
			Main = Color3.new(0.176, 0.235, 0.078),
			Second = Color3.new(0.294, 0.392, 0.137),
			Stroke = Color3.new(0.588, 0.824, 0.235),
			Divider = Color3.new(0.431, 0.627, 0.157),
			Text = Color3.new(0.941, 1, 0.824),
			TextDark = Color3.new(0.627, 0.784, 0.392)
		},
		Magma = {
			Main = Color3.new(0.216, 0.059, 0.02),
			Second = Color3.new(0.373, 0.098, 0.039),
			Stroke = Color3.new(1, 0.353, 0.157),
			Divider = Color3.new(0.824, 0.235, 0.118),
			Text = Color3.new(1, 0.902, 0.824),
			TextDark = Color3.new(0.824, 0.549, 0.392)
		},
		Mahogany = {
			Main = Color3.new(0.216, 0.098, 0.059),
			Second = Color3.new(0.353, 0.176, 0.118),
			Stroke = Color3.new(0.706, 0.392, 0.275),
			Divider = Color3.new(0.549, 0.294, 0.196),
			Text = Color3.new(1, 0.941, 0.863),
			TextDark = Color3.new(0.784, 0.588, 0.471)
		},
		Mango = {
			Main = Color3.new(0.275, 0.196, 0.078),
			Second = Color3.new(0.451, 0.333, 0.137),
			Stroke = Color3.new(1, 0.706, 0.275),
			Divider = Color3.new(0.824, 0.549, 0.216),
			Text = Color3.new(1, 0.98, 0.824),
			TextDark = Color3.new(0.824, 0.706, 0.431)
		},
		Maple = {
			Main = Color3.new(0.235, 0.118, 0.039),
			Second = Color3.new(0.392, 0.216, 0.078),
			Stroke = Color3.new(0.863, 0.51, 0.196),
			Divider = Color3.new(0.667, 0.373, 0.137),
			Text = Color3.new(1, 0.961, 0.824),
			TextDark = Color3.new(0.784, 0.627, 0.392)
		},
		Marine = {
			Main = Color3.new(0, 0.157, 0.216),
			Second = Color3.new(0, 0.275, 0.353),
			Stroke = Color3.new(0.196, 0.667, 0.824),
			Divider = Color3.new(0.118, 0.471, 0.627),
			Text = Color3.new(0.784, 0.941, 1),
			TextDark = Color3.new(0.392, 0.667, 0.784)
		},
		Mars = {
			Main = Color3.new(0.275, 0.098, 0.039),
			Second = Color3.new(0.451, 0.176, 0.078),
			Stroke = Color3.new(1, 0.431, 0.196),
			Divider = Color3.new(0.824, 0.314, 0.157),
			Text = Color3.new(1, 0.922, 0.824),
			TextDark = Color3.new(0.824, 0.588, 0.392)
		},
		Meadow = {
			Main = Color3.new(0.137, 0.255, 0.137),
			Second = Color3.new(0.235, 0.412, 0.235),
			Stroke = Color3.new(0.471, 0.824, 0.471),
			Divider = Color3.new(0.333, 0.627, 0.333),
			Text = Color3.new(0.922, 1, 0.922),
			TextDark = Color3.new(0.588, 0.784, 0.588)
		},
		Melon = {
			Main = Color3.new(0.275, 0.216, 0.137),
			Second = Color3.new(0.451, 0.353, 0.235),
			Stroke = Color3.new(0.941, 0.706, 0.431),
			Divider = Color3.new(0.784, 0.549, 0.314),
			Text = Color3.new(1, 0.98, 0.882),
			TextDark = Color3.new(0.824, 0.706, 0.549)
		},
		Merlot = {
			Main = Color3.new(0.216, 0.078, 0.137),
			Second = Color3.new(0.353, 0.137, 0.235),
			Stroke = Color3.new(0.706, 0.314, 0.471),
			Divider = Color3.new(0.549, 0.216, 0.353),
			Text = Color3.new(1, 0.882, 0.922),
			TextDark = Color3.new(0.784, 0.51, 0.627)
		},
		Mist = {
			Main = Color3.new(0.216, 0.216, 0.255),
			Second = Color3.new(0.333, 0.333, 0.392),
			Stroke = Color3.new(0.627, 0.627, 0.745),
			Divider = Color3.new(0.451, 0.451, 0.549),
			Text = Color3.new(0.98, 0.98, 1),
			TextDark = Color3.new(0.706, 0.706, 0.824)
		},
		Moonlight = {
			Main = Color3.new(0.137, 0.137, 0.216),
			Second = Color3.new(0.235, 0.235, 0.333),
			Stroke = Color3.new(0.588, 0.588, 0.784),
			Divider = Color3.new(0.392, 0.392, 0.588),
			Text = Color3.new(0.941, 0.941, 1),
			TextDark = Color3.new(0.627, 0.627, 0.824)
		},
		Moss = {
			Main = Color3.new(0.157, 0.216, 0.118),
			Second = Color3.new(0.275, 0.353, 0.196),
			Stroke = Color3.new(0.51, 0.667, 0.392),
			Divider = Color3.new(0.353, 0.49, 0.275),
			Text = Color3.new(0.922, 0.98, 0.863),
			TextDark = Color3.new(0.588, 0.706, 0.471)
		},
		Nebula = {
			Main = Color3.new(0.059, 0.031, 0.157),
			Second = Color3.new(0.118, 0.078, 0.275),
			Stroke = Color3.new(0.471, 0.353, 0.784),
			Divider = Color3.new(0.314, 0.216, 0.588),
			Text = Color3.new(0.882, 0.824, 0.961),
			TextDark = Color3.new(0.588, 0.471, 0.745)
		},
		Nickel = {
			Main = Color3.new(0.176, 0.176, 0.196),
			Second = Color3.new(0.294, 0.294, 0.314),
			Stroke = Color3.new(0.549, 0.549, 0.588),
			Divider = Color3.new(0.392, 0.392, 0.431),
			Text = Color3.new(0.961, 0.961, 0.98),
			TextDark = Color3.new(0.686, 0.686, 0.725)
		},
		Nightfall = {
			Main = Color3.new(0.047, 0.031, 0.118),
			Second = Color3.new(0.11, 0.078, 0.216),
			Stroke = Color3.new(0.392, 0.314, 0.588),
			Divider = Color3.new(0.255, 0.196, 0.431),
			Text = Color3.new(0.863, 0.824, 0.961),
			TextDark = Color3.new(0.549, 0.471, 0.706)
		},
		Noir = {
			Main = Color3.new(0.059, 0.059, 0.078),
			Second = Color3.new(0.137, 0.137, 0.176),
			Stroke = Color3.new(0.353, 0.353, 0.431),
			Divider = Color3.new(0.235, 0.235, 0.294),
			Text = Color3.new(0.902, 0.902, 0.941),
			TextDark = Color3.new(0.588, 0.588, 0.667)
		},
		Nutmeg = {
			Main = Color3.new(0.216, 0.157, 0.098),
			Second = Color3.new(0.353, 0.275, 0.176),
			Stroke = Color3.new(0.706, 0.549, 0.353),
			Divider = Color3.new(0.549, 0.412, 0.255),
			Text = Color3.new(1, 0.961, 0.863),
			TextDark = Color3.new(0.784, 0.667, 0.51)
		},
		Obsidian = {
			Main = Color3.new(0.039, 0.039, 0.059),
			Second = Color3.new(0.118, 0.118, 0.157),
			Stroke = Color3.new(0.314, 0.314, 0.392),
			Divider = Color3.new(0.196, 0.196, 0.275),
			Text = Color3.new(0.902, 0.902, 0.941),
			TextDark = Color3.new(0.588, 0.588, 0.667)
		},
		Olive = {
			Main = Color3.new(0.176, 0.216, 0.118),
			Second = Color3.new(0.294, 0.353, 0.196),
			Stroke = Color3.new(0.549, 0.667, 0.353),
			Divider = Color3.new(0.392, 0.49, 0.255),
			Text = Color3.new(0.941, 0.98, 0.863),
			TextDark = Color3.new(0.627, 0.706, 0.471)
		},
		Onyx = {
			Main = Color3.new(0.059, 0.059, 0.078),
			Second = Color3.new(0.137, 0.137, 0.176),
			Stroke = Color3.new(0.353, 0.353, 0.431),
			Divider = Color3.new(0.235, 0.235, 0.294),
			Text = Color3.new(0.902, 0.902, 0.941),
			TextDark = Color3.new(0.588, 0.588, 0.667)
		},
		Orchid = {
			Main = Color3.new(0.255, 0.137, 0.275),
			Second = Color3.new(0.392, 0.235, 0.412),
			Stroke = Color3.new(0.824, 0.51, 0.863),
			Divider = Color3.new(0.627, 0.353, 0.667),
			Text = Color3.new(1, 0.922, 0.98),
			TextDark = Color3.new(0.784, 0.549, 0.784)
		},
		Palm = {
			Main = Color3.new(0.137, 0.235, 0.137),
			Second = Color3.new(0.235, 0.373, 0.235),
			Stroke = Color3.new(0.431, 0.745, 0.431),
			Divider = Color3.new(0.294, 0.569, 0.294),
			Text = Color3.new(0.902, 1, 0.902),
			TextDark = Color3.new(0.549, 0.745, 0.549)
		},
		Papaya = {
			Main = Color3.new(0.294, 0.216, 0.137),
			Second = Color3.new(0.471, 0.353, 0.235),
			Stroke = Color3.new(0.98, 0.745, 0.392),
			Divider = Color3.new(0.824, 0.588, 0.294),
			Text = Color3.new(1, 0.98, 0.882),
			TextDark = Color3.new(0.824, 0.706, 0.51)
		},
		Pearl = {
			Main = Color3.new(0.275, 0.255, 0.314),
			Second = Color3.new(0.412, 0.392, 0.451),
			Stroke = Color3.new(0.745, 0.706, 0.824),
			Divider = Color3.new(0.569, 0.529, 0.627),
			Text = Color3.new(1, 0.98, 1),
			TextDark = Color3.new(0.765, 0.725, 0.824)
		},
		Pine = {
			Main = Color3.new(0.078, 0.176, 0.098),
			Second = Color3.new(0.137, 0.294, 0.176),
			Stroke = Color3.new(0.275, 0.627, 0.314),
			Divider = Color3.new(0.196, 0.471, 0.235),
			Text = Color3.new(0.843, 0.961, 0.843),
			TextDark = Color3.new(0.471, 0.706, 0.471)
		},
		Plum = {
			Main = Color3.new(0.216, 0.098, 0.216),
			Second = Color3.new(0.353, 0.176, 0.353),
			Stroke = Color3.new(0.667, 0.353, 0.667),
			Divider = Color3.new(0.51, 0.255, 0.51),
			Text = Color3.new(0.98, 0.882, 0.98),
			TextDark = Color3.new(0.745, 0.51, 0.745)
		},
		Polar = {
			Main = Color3.new(0.176, 0.216, 0.275),
			Second = Color3.new(0.294, 0.353, 0.431),
			Stroke = Color3.new(0.588, 0.706, 0.863),
			Divider = Color3.new(0.392, 0.51, 0.667),
			Text = Color3.new(0.941, 0.961, 1),
			TextDark = Color3.new(0.627, 0.706, 0.824)
		},
		Quartz = {
			Main = Color3.new(0.196, 0.196, 0.255),
			Second = Color3.new(0.314, 0.314, 0.392),
			Stroke = Color3.new(0.588, 0.588, 0.706),
			Divider = Color3.new(0.431, 0.431, 0.529),
			Text = Color3.new(0.98, 0.98, 1),
			TextDark = Color3.new(0.706, 0.706, 0.824)
		},
		Rainforest = {
			Main = Color3.new(0.078, 0.216, 0.137),
			Second = Color3.new(0.137, 0.353, 0.235),
			Stroke = Color3.new(0.275, 0.784, 0.431),
			Divider = Color3.new(0.196, 0.588, 0.314),
			Text = Color3.new(0.843, 1, 0.882),
			TextDark = Color3.new(0.471, 0.784, 0.549)
		},
		Raspberry = {
			Main = Color3.new(0.275, 0.098, 0.176),
			Second = Color3.new(0.451, 0.176, 0.294),
			Stroke = Color3.new(0.902, 0.353, 0.51),
			Divider = Color3.new(0.706, 0.255, 0.392),
			Text = Color3.new(1, 0.882, 0.922),
			TextDark = Color3.new(0.824, 0.51, 0.627)
		},
		Rose = {
			Main = Color3.new(0.294, 0.137, 0.216),
			Second = Color3.new(0.451, 0.235, 0.353),
			Stroke = Color3.new(0.941, 0.471, 0.627),
			Divider = Color3.new(0.745, 0.333, 0.471),
			Text = Color3.new(1, 0.922, 0.941),
			TextDark = Color3.new(0.824, 0.588, 0.706)
		},
		Ruby = {
			Main = Color3.new(0.275, 0.059, 0.098),
			Second = Color3.new(0.451, 0.118, 0.176),
			Stroke = Color3.new(0.902, 0.235, 0.314),
			Divider = Color3.new(0.706, 0.157, 0.235),
			Text = Color3.new(1, 0.863, 0.863),
			TextDark = Color3.new(0.824, 0.471, 0.51)
		},
		Rust = {
			Main = Color3.new(0.255, 0.137, 0.059),
			Second = Color3.new(0.412, 0.235, 0.118),
			Stroke = Color3.new(0.863, 0.51, 0.235),
			Divider = Color3.new(0.667, 0.373, 0.176),
			Text = Color3.new(1, 0.941, 0.824),
			TextDark = Color3.new(0.784, 0.627, 0.392)
		},
		Saffron = {
			Main = Color3.new(0.333, 0.255, 0.078),
			Second = Color3.new(0.529, 0.412, 0.137),
			Stroke = Color3.new(1, 0.784, 0.275),
			Divider = Color3.new(0.824, 0.627, 0.216),
			Text = Color3.new(1, 0.98, 0.824),
			TextDark = Color3.new(0.824, 0.706, 0.431)
		},
		Sand = {
			Main = Color3.new(0.255, 0.216, 0.157),
			Second = Color3.new(0.392, 0.333, 0.255),
			Stroke = Color3.new(0.745, 0.627, 0.431),
			Divider = Color3.new(0.569, 0.471, 0.314),
			Text = Color3.new(1, 0.98, 0.922),
			TextDark = Color3.new(0.784, 0.706, 0.588)
		},
		Sapphire = {
			Main = Color3.new(0, 0.098, 0.255),
			Second = Color3.new(0, 0.176, 0.392),
			Stroke = Color3.new(0.196, 0.51, 0.824),
			Divider = Color3.new(0.118, 0.373, 0.627),
			Text = Color3.new(0.784, 0.882, 0.98),
			TextDark = Color3.new(0.392, 0.588, 0.784)
		},
		Seafoam = {
			Main = Color3.new(0.118, 0.275, 0.255),
			Second = Color3.new(0.196, 0.412, 0.392),
			Stroke = Color3.new(0.392, 0.784, 0.706),
			Divider = Color3.new(0.275, 0.588, 0.529),
			Text = Color3.new(0.863, 1, 0.961),
			TextDark = Color3.new(0.51, 0.745, 0.667)
		},
		Shadow = {
			Main = Color3.new(0.078, 0.078, 0.098),
			Second = Color3.new(0.157, 0.157, 0.196),
			Stroke = Color3.new(0.353, 0.353, 0.431),
			Divider = Color3.new(0.235, 0.235, 0.294),
			Text = Color3.new(0.922, 0.922, 0.961),
			TextDark = Color3.new(0.608, 0.608, 0.667)
		},
		Silver = {
			Main = Color3.new(0.216, 0.216, 0.255),
			Second = Color3.new(0.333, 0.333, 0.392),
			Stroke = Color3.new(0.627, 0.627, 0.706),
			Divider = Color3.new(0.451, 0.451, 0.529),
			Text = Color3.new(0.98, 0.98, 1),
			TextDark = Color3.new(0.706, 0.706, 0.784)
		},
		Smoke = {
			Main = Color3.new(0.157, 0.157, 0.176),
			Second = Color3.new(0.275, 0.275, 0.314),
			Stroke = Color3.new(0.471, 0.471, 0.549),
			Divider = Color3.new(0.333, 0.333, 0.392),
			Text = Color3.new(0.961, 0.961, 0.98),
			TextDark = Color3.new(0.667, 0.667, 0.725)
		},
		Snow = {
			Main = Color3.new(0.275, 0.275, 0.314),
			Second = Color3.new(0.412, 0.412, 0.451),
			Stroke = Color3.new(0.745, 0.745, 0.824),
			Divider = Color3.new(0.549, 0.549, 0.627),
			Text = Color3.new(1, 1, 1),
			TextDark = Color3.new(0.784, 0.784, 0.863)
		},
		Spice = {
			Main = Color3.new(0.255, 0.157, 0.078),
			Second = Color3.new(0.412, 0.275, 0.157),
			Stroke = Color3.new(0.902, 0.588, 0.275),
			Divider = Color3.new(0.706, 0.431, 0.196),
			Text = Color3.new(1, 0.961, 0.863),
			TextDark = Color3.new(0.824, 0.667, 0.471)
		},
		Steel = {
			Main = Color3.new(0.137, 0.176, 0.235),
			Second = Color3.new(0.235, 0.294, 0.373),
			Stroke = Color3.new(0.431, 0.549, 0.706),
			Divider = Color3.new(0.294, 0.392, 0.529),
			Text = Color3.new(0.902, 0.941, 1),
			TextDark = Color3.new(0.588, 0.667, 0.784)
		},
		Storm = {
			Main = Color3.new(0.137, 0.137, 0.196),
			Second = Color3.new(0.235, 0.235, 0.314),
			Stroke = Color3.new(0.431, 0.431, 0.588),
			Divider = Color3.new(0.294, 0.294, 0.431),
			Text = Color3.new(0.922, 0.922, 0.98),
			TextDark = Color3.new(0.608, 0.608, 0.706)
		},
		Strawberry = {
			Main = Color3.new(0.314, 0.118, 0.137),
			Second = Color3.new(0.49, 0.216, 0.255),
			Stroke = Color3.new(0.98, 0.431, 0.471),
			Divider = Color3.new(0.784, 0.314, 0.353),
			Text = Color3.new(1, 0.922, 0.902),
			TextDark = Color3.new(0.863, 0.588, 0.588)
		},
		Sunrise = {
			Main = Color3.new(0.314, 0.196, 0.078),
			Second = Color3.new(0.49, 0.333, 0.157),
			Stroke = Color3.new(1, 0.706, 0.275),
			Divider = Color3.new(0.824, 0.549, 0.216),
			Text = Color3.new(1, 0.98, 0.843),
			TextDark = Color3.new(0.824, 0.706, 0.431)
		},
		Sunset = {
			Main = Color3.new(0.314, 0.157, 0.078),
			Second = Color3.new(0.49, 0.275, 0.157),
			Stroke = Color3.new(1, 0.51, 0.275),
			Divider = Color3.new(0.824, 0.392, 0.196),
			Text = Color3.new(1, 0.941, 0.843),
			TextDark = Color3.new(0.824, 0.627, 0.431)
		},
		Tangerine = {
			Main = Color3.new(0.314, 0.216, 0.059),
			Second = Color3.new(0.49, 0.353, 0.118),
			Stroke = Color3.new(1, 0.706, 0.196),
			Divider = Color3.new(0.824, 0.549, 0.157),
			Text = Color3.new(1, 0.98, 0.824),
			TextDark = Color3.new(0.824, 0.706, 0.392)
		},
		Teal = {
			Main = Color3.new(0, 0.216, 0.216),
			Second = Color3.new(0, 0.353, 0.353),
			Stroke = Color3.new(0, 0.706, 0.706),
			Divider = Color3.new(0, 0.529, 0.529),
			Text = Color3.new(0.784, 0.98, 0.98),
			TextDark = Color3.new(0.392, 0.706, 0.706)
		},
		Thunder = {
			Main = Color3.new(0.137, 0.118, 0.216),
			Second = Color3.new(0.235, 0.196, 0.333),
			Stroke = Color3.new(0.471, 0.392, 0.706),
			Divider = Color3.new(0.333, 0.275, 0.51),
			Text = Color3.new(0.922, 0.882, 1),
			TextDark = Color3.new(0.608, 0.529, 0.745)
		},
		Topaz = {
			Main = Color3.new(0.333, 0.255, 0.137),
			Second = Color3.new(0.51, 0.392, 0.235),
			Stroke = Color3.new(0.902, 0.706, 0.392),
			Divider = Color3.new(0.706, 0.529, 0.294),
			Text = Color3.new(1, 0.98, 0.902),
			TextDark = Color3.new(0.824, 0.706, 0.549)
		},
		Turquoise = {
			Main = Color3.new(0, 0.275, 0.275),
			Second = Color3.new(0, 0.431, 0.431),
			Stroke = Color3.new(0, 0.824, 0.824),
			Divider = Color3.new(0, 0.627, 0.627),
			Text = Color3.new(0.824, 1, 1),
			TextDark = Color3.new(0.431, 0.745, 0.745)
		},
		Violet = {
			Main = Color3.new(0.235, 0.098, 0.314),
			Second = Color3.new(0.373, 0.176, 0.471),
			Stroke = Color3.new(0.667, 0.392, 0.863),
			Divider = Color3.new(0.49, 0.275, 0.667),
			Text = Color3.new(0.98, 0.882, 1),
			TextDark = Color3.new(0.706, 0.51, 0.824)
		},
		Walnut = {
			Main = Color3.new(0.216, 0.137, 0.078),
			Second = Color3.new(0.353, 0.235, 0.137),
			Stroke = Color3.new(0.627, 0.471, 0.275),
			Divider = Color3.new(0.471, 0.333, 0.196),
			Text = Color3.new(1, 0.961, 0.863),
			TextDark = Color3.new(0.784, 0.667, 0.51)
		}
	},
	Categories = {
		Default = {
			"Default"
		},
		Dark = {
			"Abyss",
			"Ash",
			"Charcoal",
			"Eclipse",
			"Graphite",
			"Nightfall",
			"Noir",
			"Obsidian",
			"Onyx",
			"Shadow",
			"Smoke",
			"Storm",
			"Thunder"
		},
		Light = {
			"Arctic",
			"Breeze",
			"Cloud",
			"Cotton",
			"Cream",
			"Frost",
			"Glacier",
			"Haze",
			"Ivory",
			"Mist",
			"Pearl",
			"Polar",
			"Quartz",
			"Silver",
			"Snow"
		},
		Warm = {
			"Blaze",
			"Bloodmoon",
			"Caramel",
			"Cinnamon",
			"Cocoa",
			"Coffee",
			"Crimson",
			"Dawn",
			"Desert",
			"Magma",
			"Mahogany",
			"Mango",
			"Maple",
			"Mars",
			"Melon",
			"Merlot",
			"Nutmeg",
			"Papaya",
			"Rust",
			"Saffron",
			"Sand",
			"Spice",
			"Strawberry",
			"Sunrise",
			"Sunset",
			"Tangerine",
			"Topaz",
			"Walnut"
		},
		Cool = {
			"Azure",
			"Crystal",
			"Electric",
			"Indigo",
			"Lagoon",
			"Marine",
			"Sapphire",
			"Seafoam",
			"Steel",
			"Teal",
			"Turquoise"
		},
		Nature = {
			"Earth",
			"Envy",
			"Jade",
			"Jungle",
			"Kiwi",
			"Lime",
			"Meadow",
			"Moss",
			"Olive",
			"Palm",
			"Pine",
			"Rainforest"
		},
		Vibrant = {
			"Candy",
			"Celestial",
			"Fantasy",
			"Flamingo",
			"Galaxy",
			"Grape",
			"Lemon",
			"Lilac",
			"Orchid",
			"Plum",
			"Raspberry",
			"Rose",
			"Ruby",
			"Violet"
		},
		Pastel = {
			"Cream",
			"Crystal",
			"Rose",
			"Strawberry"
		},
		Misc = {
			"Nebula"
		}
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
	local success, response = pcall(function()
		if isfile and readfile then
			local cachePath = OrionLib.Folder .. "/icons_cache.json"
			if isfile(cachePath) then
				return readfile(cachePath)
			end
		end
		return game:HttpGet(ICONS_URLS[version])
	end)
	if success then
		local decoded = HttpService:JSONDecode(response)
		Icons = decoded.icons or {}
		SelectedIconsVersion = version
		if writefile and OrionLib.Folder then
			pcall(function()
				writefile(OrionLib.Folder .. "/icons_cache.json", response)
			end)
		end
	else
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
end)

local function MakeDraggable(DragPoint, Main)
	pcall(
        function()
		local Dragging, DragInput, MousePos, FramePos = false
		AddConnection(
                DragPoint.InputBegan, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position
				Input.Changed:Connect(
                            function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		AddConnection(
                DragPoint.InputChanged, function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
				DragInput = Input
			end
		end)
		AddConnection(
                UserInputService.InputChanged, function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				Main.Position = UDim2.new(
                            FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
			end
		end)
	end)
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
        Props, function(Property, Value)
		Element[Property] = Value
	end)
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
        Children, function(_, Child)
		Child.Parent = Element
	end)
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
	self:UpdateNotificationsTheme()
	if writefile then
		pcall(
            function()
			writefile("theme.txt", OrionLib.SelectedTheme)
		end)
	end
end

function OrionLib:UpdateNotificationsTheme()
	if not OrionLib.ActiveNotifications then
		return
	end
	for _, notification in ipairs(OrionLib.ActiveNotifications) do
		if notification and notification.Parent then
			notification.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
			local stroke = notification:FindFirstChildOfClass("UIStroke")
			if stroke then
				stroke.Color = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
			end
			local title = notification:FindFirstChild("Title")
			if title then
				title.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text
			end
			local content = notification:FindFirstChild("Content")
			if content then
				content.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].TextDark
			end
			local accentBar = notification:FindFirstChild("AccentBar")
			if accentBar then
				accentBar.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
			end
			local icon = notification:FindFirstChild("Icon")
			if icon then
				icon.ImageColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
			end
		end
	end
end

local function PackColor(Color)
	return {
		R = Color.R * 255,
		G = Color.G * 255,
		B = Color.B * 255
	}
end

local function UnpackColor(Color)
	return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadCfg(Config)
	local Data = HttpService:JSONDecode(Config)
	table.foreach(
        Data, function(a, b)
		if OrionLib.Flags[a] then
			spawn(
                    function()
				if OrionLib.Flags[a].Type == "Colorpicker" then
					OrionLib.Flags[a]:Set(UnpackColor(b))
				else
					OrionLib.Flags[a]:Set(b)
				end
			end)
		else
			warn("Orion Library Config Loader - Could not find ", a, b)
		end
	end)
end

local function SaveCfg(Name)
	local Data = {}
	for i, v in pairs(OrionLib.Flags) do
		if type(v) == "table" and v.Save then
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

CreateElement("Corner", function(Scale, Offset)
	local Corner = Create("UICorner", {
		CornerRadius = UDim.new(Scale or 0, Offset or 10)
	})
	return Corner
end)

CreateElement("Stroke", function(Color, Thickness)
	local Stroke = Create("UIStroke", {
		Color = Color or Color3.fromRGB(255, 255, 255),
		Thickness = Thickness or 1
	})
	return Stroke
end)

CreateElement("List", function(Scale, Offset)
	local List = Create("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		Padding = UDim.new(Scale or 0, Offset or 0)
	})
	return List
end)

CreateElement("Padding", function(Bottom, Left, Right, Top)
	local Padding = Create("UIPadding", {
		PaddingBottom = UDim.new(0, Bottom or 4),
		PaddingLeft = UDim.new(0, Left or 4),
		PaddingRight = UDim.new(0, Right or 4),
		PaddingTop = UDim.new(0, Top or 4)
	})
	return Padding
end)

CreateElement("TFrame", function()
	local TFrame = Create("Frame", {
		BackgroundTransparency = 1
	})
	return TFrame
end)

CreateElement("Frame", function(Color)
	local Frame = Create("Frame", {
		BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	})
	return Frame
end)

CreateElement("RoundFrame", function(Color, Scale, Offset, Shadow)
	local Frame = Create("Frame", {
		BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
		BorderSizePixel = 0
	}, {
		Create("UICorner", {
			CornerRadius = UDim.new(Scale, Offset)
		})
	})
	if Shadow then
		local shadow = Instance.new("UIShadow")
		shadow.Color = Color3.fromRGB(0, 0, 0)
		shadow.Transparency = 0.3
		shadow.Radius = 8
		shadow.Parent = Frame
	end
	return Frame
end)
CreateElement("Button", function()
	local Button = Create("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0
	})
	return Button
end)

CreateElement("ScrollFrame", function(Color, Width)
	local ScrollFrame = Create("ScrollingFrame", {
		BackgroundTransparency = 1,
		MidImage = "rbxassetid://7445543667",
		BottomImage = "rbxassetid://7445543667",
		TopImage = "rbxassetid://7445543667",
		ScrollBarImageColor3 = Color,
		BorderSizePixel = 0,
		ScrollBarThickness = Width,
		CanvasSize = UDim2.new(0, 0, 0, 0)
	})
	return ScrollFrame
end)

CreateElement("Image", function(ImageID)
	local ImageNew = Create("ImageLabel", {
		Image = ImageID,
		BackgroundTransparency = 1
	})
	if GetIcon(ImageID) ~= nil then
		ImageNew.Image = GetIcon(ImageID)
	end
	return ImageNew
end)

CreateElement("ImageButton", function(ImageID)
	local Image = Create("ImageButton", {
		Image = ImageID,
		BackgroundTransparency = 1
	})
	return Image
end)

CreateElement("Label", function(Text, TextSize, Transparency)
	local Label = Create("TextLabel", {
		Text = Text or "",
		TextColor3 = Color3.fromRGB(240, 240, 240),
		TextTransparency = Transparency or 0,
		TextSize = TextSize or 15,
		Font = Enum.Font.Gotham,
		RichText = true,
		BackgroundTransparency = 1,
		TextXAlignment = Enum.TextXAlignment.Left
	})
	return Label
end)

local NotificationHolder = SetProps(
    SetChildren(
        MakeElement("TFrame"), {
	SetProps(
                MakeElement("List"), {
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		VerticalAlignment = Enum.VerticalAlignment.Bottom,
		Padding = UDim.new(0, 5)
	})
}), {
	Position = UDim2.new(1, - 25, 1, - 25),
	Size = UDim2.new(0, 300, 1, - 25),
	AnchorPoint = Vector2.new(1, 1),
	Parent = Orion
})

function OrionLib:MakeNotification(NotificationConfig)
	spawn(
        function()
		NotificationConfig.Name = NotificationConfig.Name or "Notification"
		NotificationConfig.Content = NotificationConfig.Content or "Test"
		NotificationConfig.Image = NotificationConfig.Image or "rbxassetid://4384403532"
		NotificationConfig.Time = NotificationConfig.Time or 15
		NotificationConfig.Closable = (NotificationConfig.Closable == nil) and true or NotificationConfig.Closable
		NotificationConfig.Accent = NotificationConfig.Accent or OrionLib.Themes[OrionLib.SelectedTheme].Stroke
		local NotificationParent = SetProps(
                MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = NotificationHolder
		})
		local NotificationFrame = SetChildren(
                SetProps(
                    MakeElement("RoundFrame", OrionLib.Themes[OrionLib.SelectedTheme].Second, 0, 12), {
			Parent = NotificationParent,
			Size = UDim2.new(1, 0, 0, 0),
			Position = UDim2.new(1, - 55, 0, 0),
			BackgroundTransparency = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			Name = "NotificationFrame"
		}), {
			MakeElement("Stroke", OrionLib.Themes[OrionLib.SelectedTheme].Stroke, 1),
			MakeElement("Padding", 15, 10, 10, 15),
			SetProps(
                        MakeElement("Image", NotificationConfig.Image), {
				Size = UDim2.new(0, 24, 0, 24),
				ImageColor3 = NotificationConfig.Accent,
				Name = "Icon"
			}),
			SetProps(
                        MakeElement("Label", NotificationConfig.Name, 14), {
				Size = UDim2.new(1, - 40, 0, 20),
				Position = UDim2.new(0, 34, 0, 0),
				Font = Enum.Font.GothamBold,
				TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text,
				Name = "Title"
			}),
			SetProps(
                        MakeElement("Label", NotificationConfig.Content, 13), {
				Size = UDim2.new(1, - 12, 0, 0),
				Position = UDim2.new(0, 0, 0, 28),
				Font = Enum.Font.Gotham,
				Name = "Content",
				RichText = true,
				AutomaticSize = Enum.AutomaticSize.Y,
				TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].TextDark,
				TextWrapped = true
			}),
			(NotificationConfig.Closable) and SetChildren(
                            SetProps(
                                MakeElement("Button"), {
				Size = UDim2.new(0, 24, 0, 24),
				Position = UDim2.new(1, - 8, 0, 6),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Name = "CloseBtn"
			}), {
				SetProps(
                                    MakeElement("Image", "rbxassetid://7072725342"), {
					Size = UDim2.new(0, 14, 0, 14),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageColor3 = Color3.fromRGB(150, 150, 150)
				})
			}) or nil
		})
		if not OrionLib.ActiveNotifications then
			OrionLib.ActiveNotifications = {}
		end
		table.insert(OrionLib.ActiveNotifications, NotificationFrame)
		if NotificationFrame then
			TweenService:Create(
                    NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Position = UDim2.new(0, 0, 0, 0)
			}):Play()
			local closeRequested = false
			local function CloseNotification()
				if closeRequested then
					return
				end
				closeRequested = true
				for i, v in ipairs(OrionLib.ActiveNotifications) do
					if v == NotificationFrame then
						table.remove(OrionLib.ActiveNotifications, i)
						break
					end
				end
				TweenService:Create(
                        NotificationFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					Position = UDim2.new(1, 20, 0, 0)
				}):Play()
				TweenService:Create(
                        NotificationFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quint), {
					BackgroundTransparency = 0.6
				}):Play()
				wait(0.3)
				NotificationFrame:Destroy()
			end
			if NotificationConfig.Closable then
				local closeBtn = NotificationFrame:FindFirstChild("CloseBtn")
				if closeBtn then
					AddConnection(closeBtn.MouseButton1Click, CloseNotification)
					AddConnection(
                            closeBtn.MouseEnter, function()
						local img = closeBtn:FindFirstChildOfClass("ImageLabel")
						if img then
							TweenService:Create(
                                        img, TweenInfo.new(0.2), {
								ImageColor3 = Color3.fromRGB(255, 100, 100)
							}):Play()
						end
					end)
					AddConnection(
                            closeBtn.MouseLeave, function()
						local img = closeBtn:FindFirstChildOfClass("ImageLabel")
						if img then
							TweenService:Create(
                                        img, TweenInfo.new(0.2), {
								ImageColor3 = Color3.fromRGB(150, 150, 150)
							}):Play()
						end
					end)
				end
			end
			if NotificationConfig.Time > 0 then
				task.wait(NotificationConfig.Time - 0.5)
				if not closeRequested then
					CloseNotification()
				end
			end
		end
	end)
end

local notificationName = "Configuration"
local userContent = "Auto-loaded configuration for the game"

function OrionLib:Init()
	if not OrionLib.SaveCfg then
		return
	end
	local folder = OrionLib.Folder
	if not folder or folder == "" then
		return
	end
	local filePath = folder .. "/" .. game.GameId .. ".txt"
	pcall(function()
		if isfile and readfile then
			local content = readfile(filePath)
			if content then
				LoadCfg(content)
				OrionLib:MakeNotification({
					Name = notificationName,
					Content = userContent .. " " .. game.GameId .. ".",
					Time = 5
				})
			end
		end
	end)
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
	OrionLib.Folder = WindowConfig.ConfigFolder
	OrionLib.SaveCfg = WindowConfig.SaveConfig
	if WindowConfig.SaveConfig then
		pcall(function()
			if not isfolder(WindowConfig.ConfigFolder) then
				makefolder(WindowConfig.ConfigFolder)
			end
		end)
	end
	local TabHolder = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 4), WindowConfig.SearchBar and {
		Size = UDim2.new(1, 0, 1, - 90),
		Position = UDim2.new(0, 0, 0, 40)
	} or {
		Size = UDim2.new(1, 0, 1, - 50)
	}), {
		MakeElement("List"),
		MakeElement("Padding", 8, 0, 0, 8)
	}), "Divider")
	AddConnection(
        TabHolder.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
		TabHolder.CanvasSize = UDim2.new(0, 0, 0, TabHolder.UIListLayout.AbsoluteContentSize.Y + 16)
	end)
	local CloseBtn = SetChildren(
        SetProps(
            MakeElement("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		Position = UDim2.new(0.5, 0, 0, 0),
		BackgroundTransparency = 1
	}), {
		AddThemeObject(
                SetProps(
                    MakeElement("Image", "rbxassetid://7072725342"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18)
		}), "Text")
	})
	local MinimizeBtn = SetChildren(
        SetProps(
            MakeElement("Button"), {
		Size = UDim2.new(0.5, 0, 1, 0),
		BackgroundTransparency = 1
	}), {
		AddThemeObject(
                SetProps(
                    MakeElement("Image", "rbxassetid://7072719338"), {
			Position = UDim2.new(0, 9, 0, 6),
			Size = UDim2.new(0, 18, 0, 18),
			Name = "Ico"
		}), "Text")
	})
	local DragPoint = SetProps(
        MakeElement("TFrame"), {
		Size = UDim2.new(1, 0, 0, 50)
	})
	local WindowStuff = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Size = UDim2.new(0, 150, 1, - 50),
		Position = UDim2.new(0, 0, 0, 50)
	}), {
		AddThemeObject(
                    SetProps(
                        MakeElement("Frame"), {
			Size = UDim2.new(1, 0, 0, 10),
			Position = UDim2.new(0, 0, 0, 0)
		}), "Second"),
		AddThemeObject(
                    SetProps(
                        MakeElement("Frame"), {
			Size = UDim2.new(0, 10, 1, 0),
			Position = UDim2.new(1, - 10, 0, 0)
		}), "Second"),
		AddThemeObject(
                    SetProps(
                        MakeElement("Frame"), {
			Size = UDim2.new(0, 1, 1, 0),
			Position = UDim2.new(1, - 1, 0, 0)
		}), "Stroke"),
		TabHolder,
		SetChildren(
                    SetProps(
                        MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Position = UDim2.new(0, 0, 1, - 50)
		}), {
			AddThemeObject(
                            SetProps(
                                MakeElement("Frame"), {
				Size = UDim2.new(1, 0, 0, 1)
			}), "Stroke"),
			AddThemeObject(
                            SetChildren(
                                SetProps(
                                    MakeElement("Frame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				SetProps(
                                        MakeElement("Image", "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"), {
					Size = UDim2.new(1, 0, 1, 0)
				}),
				AddThemeObject(
                                        SetProps(
                                            MakeElement("Image", "rbxassetid://4031889928"), {
					Size = UDim2.new(1, 0, 1, 0)
				}), "Second"),
				MakeElement("Corner", 1)
			}), "Divider"),
			SetChildren(
                            SetProps(
                                MakeElement("TFrame"), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(0, 10, 0.5, 0)
			}), {
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				MakeElement("Corner", 1)
			}),
			AddThemeObject(
                            SetProps(
                                MakeElement("Label", LocalPlayer.DisplayName, WindowConfig.HidePremium and 14 or 13), {
				Size = UDim2.new(1, - 60, 0, 13),
				Position = WindowConfig.HidePremium and UDim2.new(0, 50, 0, 19) or UDim2.new(0, 50, 0, 12),
				Font = Enum.Font.GothamBold,
				ClipsDescendants = true
			}), "Text"),
			AddThemeObject(
                            SetProps(
                                MakeElement("Label", "", 12), {
				Size = UDim2.new(1, - 60, 0, 12),
				Position = UDim2.new(0, 50, 1, - 25),
				Visible = not WindowConfig.HidePremium
			}), "TextDark")
		})
	}), "Second")

    -- @ SearchBar (-- @ UI Visible & Mobile Icon Handle (Zv-yz/github);/github);
	local Tabs = {}
	if WindowConfig.SearchBar then
		local clearOnFocus = true
		if type(WindowConfig.SearchBar) == "table" then
			clearOnFocus = WindowConfig.SearchBar.ClearTextOnFocus
			if clearOnFocus == nil then
				clearOnFocus = true
			end
		end
		local SearchBox = Create("TextBox", {
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
			ClearTextOnFocus = clearOnFocus
		})
		local TextboxActual = AddThemeObject(SearchBox, "Text")
		local SearchBar = AddThemeObject(
            SetChildren(
                SetProps(
                    MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 1, 6), {
			Parent = WindowStuff,
			Size = UDim2.new(0, 130, 0, 24),
			Position = UDim2.new(1.013, - 12, 0.075, 0),
			AnchorPoint = Vector2.new(1, 0.5)
		}), {
			AddThemeObject(MakeElement("Stroke"), "Stroke"),
			TextboxActual
		}), "Main")
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
	local WindowName = AddThemeObject(
        SetProps(
            MakeElement("Label", WindowConfig.Name, 14), {
		Size = UDim2.new(1, - 30, 2, 0),
		Position = UDim2.new(0, 25, 0, - 24),
		Font = Enum.Font.GothamBlack,
		TextSize = 20
	}), "Text")
	local WindowTopBarLine = AddThemeObject(
        SetProps(
            MakeElement("Frame"), {
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.new(0, 0, 1, - 1)
	}), "Stroke")
	local MainWindow = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
		Parent = Orion,
		Position = UDim2.new(0.5, - 307, 0.5, - 172),
		Size = UDim2.new(0, 615, 0, 344),
		ClipsDescendants = true
	}), {
		SetChildren(
                    SetProps(
                        MakeElement("TFrame"), {
			Size = UDim2.new(1, 0, 0, 50),
			Name = "TopBar"
		}), {
			WindowName,
			WindowTopBarLine,
			AddThemeObject(
                            SetChildren(
                                SetProps(
                                    MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 7), {
				Size = UDim2.new(0, 70, 0, 30),
				Position = UDim2.new(1, - 90, 0, 10)
			}), {
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				AddThemeObject(
                                        SetProps(
                                            MakeElement("Frame"), {
					Size = UDim2.new(0, 1, 1, 0),
					Position = UDim2.new(0.5, 0, 0, 0)
				}), "Stroke"),
				CloseBtn,
				MinimizeBtn
			}), "Second")
		}),
		DragPoint,
		WindowStuff
	}), "Main")
	OrionLib.MainWindow = MainWindow
	if WindowConfig.ShowIcon then
		WindowName.Position = UDim2.new(0, 50, 0, - 24)
		local WindowIcon = SetProps(
            MakeElement("Image", WindowConfig.Icon), {
			Size = UDim2.new(0, 20, 0, 20),
			Position = UDim2.new(0, 25, 0, 15)
		})
		WindowIcon.Parent = MainWindow.TopBar
	end
	MakeDraggable(DragPoint, MainWindow)
	local _currentKey = Enum.KeyCode.RightShift
	local isMobile = table.find({
		Enum.Platform.IOS,
		Enum.Platform.Android
	}, UserInputService:GetPlatform())
	local MobileIcon = SetChildren(
        SetProps(
            MakeElement("ImageButton", "http://www.roblox.com/asset/?id=72792666168943"), {
		Position = UDim2.new(0.25, 0, 0.1, 0),
		Size = UDim2.new(0, 32, 0, 33),
		Parent = Orion,
		Visible = false
	}), {
		MakeElement("Corner", 1, 0)
	})
	MakeDraggable(MobileIcon, MobileIcon)
	AddConnection(
        MobileIcon.MouseButton1Click, function()
		MainWindow.Visible = true
		MobileIcon.Visible = false
	end)
	AddConnection(
        CloseBtn.MouseButton1Up, function()
		MainWindow.Visible = false
		UIHidden = true
		if UserInputService.TouchEnabled then
			MobileIcon.Visible = true
		end
		local content = string.format("Click on the <b>Icon</b> or press the <b>%s</b> key to open the GUI again!", _currentKey.Name)
		OrionLib:MakeNotification(
                {
			Name = "Interface Closed",
			Content = content,
			Time = 5
		})
		if OrionLib.MinimizeGUI and OrionLib.MinimizeGUI.Parent then
			OrionLib.MinimizeGUI:Destroy()
			OrionLib.MinimizeGUI = nil
		end
	end)
	AddConnection(
        UserInputService.InputBegan, function(Input)
		if Input.KeyCode == _currentKey then
			MobileIcon.Visible = false
			MainWindow.Visible = not MainWindow.Visible
		end
	end)
	AddConnection(
        MinimizeBtn.MouseButton1Up, function()
		if Minimized then
			TweenService:Create(
                    MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 615, 0, 344)
			}):Play()
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
                    MainWindow, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, WindowName.TextBounds.X + 140, 0, 50)
			}):Play()
			wait(0.1)
			WindowStuff.Visible = false
		end
		Minimized = not Minimized
	end)
	local function LoadSequence()
		MainWindow.Visible = false
		local LoadSequenceLogo = SetProps(
            MakeElement("Image", WindowConfig.IntroIcon), {
			Parent = Orion,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.4, 0),
			Size = UDim2.new(0, 28, 0, 28),
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			ImageTransparency = 1
		})
		local LoadSequenceText = SetProps(
            MakeElement("Label", WindowConfig.IntroText, 14), {
			Parent = Orion,
			Size = UDim2.new(1, 0, 1, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 19, 0.5, 0),
			TextXAlignment = Enum.TextXAlignment.Center,
			Font = Enum.Font.GothamBold,
			TextTransparency = 1
		})
		TweenService:Create(
            LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			ImageTransparency = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}):Play()
		wait(0.8)
		TweenService:Create(
            LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.5, - (LoadSequenceText.TextBounds.X / 2), 0.5, 0)
		}):Play()
		wait(0.3)
		TweenService:Create(
            LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 0
		}):Play()
		wait(2)
		TweenService:Create(
            LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			TextTransparency = 1
		}):Play()
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
		local TabFrame = SetChildren(
            SetProps(
                MakeElement("Button"), {
			Size = UDim2.new(1, 0, 0, 30),
			Parent = TabHolder
		}), {
			AddThemeObject(
                    SetProps(
                        MakeElement("Image", TabConfig.Icon), {
				AnchorPoint = Vector2.new(0, 0.5),
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(0, 10, 0.5, 0),
				ImageTransparency = 0.4,
				Name = "Ico"
			}), "Text"),
			AddThemeObject(
                    SetProps(
                        MakeElement("Label", TabConfig.Name, 14), {
				Size = UDim2.new(1, - 35, 1, 0),
				Position = UDim2.new(0, 35, 0, 0),
				Font = Enum.Font.GothamSemibold,
				TextTransparency = 0.4,
				Name = "Title"
			}), "Text")
		})
		AddItemTable(Tabs, TabConfig.Name, TabFrame)
		if GetIcon(TabConfig.Icon) ~= nil then
			TabFrame.Ico.Image = GetIcon(TabConfig.Icon)
		end
		local Container = AddThemeObject(
            SetChildren(
                SetProps(
                    MakeElement("ScrollFrame", Color3.fromRGB(255, 255, 255), 5), {
			Size = UDim2.new(1, - 150, 1, - 50),
			Position = UDim2.new(0, 150, 0, 50),
			Parent = MainWindow,
			Visible = false,
			Name = "ItemContainer",
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			CanvasSize = UDim2.new(0, 0, 0, 0)
		}), {
			MakeElement("List", 0, 6),
			MakeElement("Padding", 10, 10, 10, 10)
		}), "Divider")
		if FirstTab then
			FirstTab = false
			TabFrame.Ico.ImageTransparency = 0
			TabFrame.Title.TextTransparency = 0
			TabFrame.Title.Font = Enum.Font.GothamBlack
			Container.Visible = true
		end
		AddConnection(
            TabFrame.MouseButton1Click, function()
			for _, Tab in next, TabHolder:GetChildren() do
				if Tab:IsA("TextButton") then
					Tab.Title.Font = Enum.Font.GothamSemibold
					TweenService:Create(
                            Tab.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						ImageTransparency = 0.4
					}):Play()
					TweenService:Create(
                            Tab.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						TextTransparency = 0.4
					}):Play()
				end
			end
			for _, ItemContainer in next, MainWindow:GetChildren() do
				if ItemContainer.Name == "ItemContainer" then
					ItemContainer.Visible = false
				end
			end
			TweenService:Create(
                    TabFrame.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				ImageTransparency = 0
			}):Play()
			TweenService:Create(
                    TabFrame.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				TextTransparency = 0
			}):Play()
			TabFrame.Title.Font = Enum.Font.GothamBlack
			Container.Visible = true
		end)
		local function GetElements(ItemParent)
			local ElementFunction = {}

            --> Element Log <--
			function ElementFunction:AddLog(Text)
				local Label = MakeElement("Label", Text, 15)
				local LogFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 0.7,
					Parent = ItemParent
				}), {
					AddThemeObject(
                                SetProps(
                                    Label, {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						TextXAlignment = Enum.TextXAlignment.Center,
						TextSize = 19,
						TextWrapped = true,
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")
				local LogFunction = {}
				function LogFunction:Set(ToChange)
					LogFrame.Content.Text = ToChange
				end
				return LogFunction
			end

            --> Elememt Label <--
			function ElementFunction:AddLabel(Text)
				local LabelFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 30),
					BackgroundTransparency = 0.7,
					Parent = ItemParent,
					ClipsDescendants = true,
					AutomaticSize = Enum.AutomaticSize.Y
				}), {
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", Text, 15), {
						Size = UDim2.new(1, - 12, 0, 0),
						Position = UDim2.new(0, 12, 0, 8),
						Font = Enum.Font.GothamBold,
						Name = "Content",
						RichText = true,
						TextWrapped = true,
						TextYAlignment = Enum.TextYAlignment.Top,
						AutomaticSize = Enum.AutomaticSize.Y
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")
				local function updateHeight()
					local textHeight = LabelFrame.Content.AbsoluteSize.Y
					LabelFrame.Size = UDim2.new(1, 0, 0, textHeight + 16)
					LabelFrame.Content.Position = UDim2.new(0, 12, 0, 8)
				end
				AddConnection(LabelFrame.Content:GetPropertyChangedSignal("AbsoluteSize"), updateHeight)
				updateHeight()
				local LabelFunction = {}
				function LabelFunction:Set(ToChange)
					LabelFrame.Content.Text = ToChange
				end
				return LabelFunction
			end

            --> Element Paragraph <--
			function ElementFunction:AddParagraph(Title, Content)
				Title = Title or "Paragraph"
				Content = Content or ""
				local Container = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Parent = ItemParent,
					ClipsDescendants = true
				}), {
					SetChildren(
                                SetProps(
                                    MakeElement("TFrame"), {
						Size = UDim2.new(1, - 12, 0, 0),
						Position = UDim2.new(0, 12, 0, 12),
						BackgroundTransparency = 1,
						Name = "ContentArea",
						AutomaticSize = Enum.AutomaticSize.Y
					}), {
						AddThemeObject(
                                        SetProps(
                                            MakeElement("Label", Title, 15), {
							Size = UDim2.new(1, 0, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Title",
							RichText = true,
							TextWrapped = true,
							TextYAlignment = Enum.TextYAlignment.Top,
							AutomaticSize = Enum.AutomaticSize.Y
						}), "Text"),
						AddThemeObject(
                                        SetProps(
                                            MakeElement("Label", Content, 13), {
							Size = UDim2.new(1, 0, 0, 0),
							Position = UDim2.new(0, 0, 0, 0),
							Font = Enum.Font.Gotham,
							Name = "Content",
							RichText = true,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							AutomaticSize = Enum.AutomaticSize.Y
						}), "TextDark")
					}),
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")
				local titleLabel = Container.ContentArea.Title
				local contentLabel = Container.ContentArea.Content
				local function updateLayout()
					local titleHeight = titleLabel.AbsoluteSize.Y
					local contentHeight = contentLabel.AbsoluteSize.Y
					local totalHeight = titleHeight + contentHeight + 8
					Container.ContentArea.Size = UDim2.new(1, - 12, 0, totalHeight)
					contentLabel.Position = UDim2.new(0, 0, 0, titleHeight + 4)
					Container.Size = UDim2.new(1, 0, 0, totalHeight + 24)
				end
				AddConnection(titleLabel:GetPropertyChangedSignal("AbsoluteSize"), updateLayout)
				AddConnection(contentLabel:GetPropertyChangedSignal("AbsoluteSize"), updateLayout)
				updateLayout()
				return contentLabel
			end

            --> Element Button <--
			function ElementFunction:AddButton(ButtonConfig)
				ButtonConfig = ButtonConfig or {}
				ButtonConfig.Name = ButtonConfig.Name or "Button"
				ButtonConfig.Callback = ButtonConfig.Callback or function()
				end
				ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://3944703587"
				local Button = {}
				local Click = SetProps(
                    MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local ButtonFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 33),
					Parent = ItemParent
				}), {
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", ButtonConfig.Name, 15), {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(
                                SetProps(
                                    MakeElement("Image", ButtonConfig.Icon), {
						Size = UDim2.new(0, 20, 0, 20),
						Position = UDim2.new(1, - 30, 0, 7)
					}), "TextDark"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					Click
				}), "Second")
				AddConnection(
                    Click.MouseEnter, function()
					TweenService:Create(
                            ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)
				AddConnection(
                    Click.MouseLeave, function()
					TweenService:Create(
                            ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
					}):Play()
				end)
				AddConnection(
                    Click.MouseButton1Up, function()
					TweenService:Create(
                            ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					spawn(
                            function()
						ButtonConfig.Callback()
					end)
				end)
				AddConnection(
                    Click.MouseButton1Down, function()
					TweenService:Create(
                            ButtonFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)
				function Button:Set(ButtonText)
					ButtonFrame.Content.Text = ButtonText
				end
				return Button
			end

            --> Element Toggle <--
			function ElementFunction:AddToggle(ToggleConfig)
				ToggleConfig = ToggleConfig or {}
				ToggleConfig.Name = ToggleConfig.Name or "Toggle"
				ToggleConfig.Default = ToggleConfig.Default or false
				ToggleConfig.Callback = ToggleConfig.Callback or function()
				end
				ToggleConfig.Color = ToggleConfig.Color or Color3.fromRGB(9, 99, 195)
				ToggleConfig.Flag = ToggleConfig.Flag or nil
				ToggleConfig.Save = ToggleConfig.Save or false
				local Toggle = {
					Value = ToggleConfig.Default,
					Save = ToggleConfig.Save
				}
				local Click = SetProps(
                    MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local ToggleBox = SetChildren(
                    SetProps(
                        MakeElement("RoundFrame", ToggleConfig.Color, 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, - 24, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}), {
					SetProps(
                            MakeElement("Stroke"), {
						Color = ToggleConfig.Color,
						Name = "Stroke",
						Transparency = 0.5
					}),
					SetProps(
                            MakeElement("Image", "rbxassetid://3944680095"), {
						Size = UDim2.new(0, 20, 0, 20),
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						ImageColor3 = Color3.fromRGB(255, 255, 255),
						Name = "Ico"
					})
				})
				local ToggleFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", ToggleConfig.Name, 15), {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					ToggleBox,
					Click
				}), "Second")
				function Toggle:Set(Value)
					Toggle.Value = Value
					TweenService:Create(
                        ToggleBox, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Divider
					}):Play()
					TweenService:Create(
                        ToggleBox.Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Color = Toggle.Value and ToggleConfig.Color or OrionLib.Themes.Default.Stroke
					}):Play()
					TweenService:Create(
                        ToggleBox.Ico, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						ImageTransparency = Toggle.Value and 0 or 1,
						Size = Toggle.Value and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 8, 0, 8)
					}):Play()
					ToggleConfig.Callback(Toggle.Value)
				end
				Toggle:Set(Toggle.Value)
				AddConnection(
                    Click.MouseEnter, function()
					TweenService:Create(
                            ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)
				AddConnection(
                    Click.MouseLeave, function()
					TweenService:Create(
                            ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
					}):Play()
				end)
				AddConnection(
                    Click.MouseButton1Up, function()
					TweenService:Create(
                            ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					SaveCfg(game.GameId)
					Toggle:Set(not Toggle.Value)
				end)
				AddConnection(
                    Click.MouseButton1Down, function()
					TweenService:Create(
                            ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)
				if ToggleConfig.Flag then
					OrionLib.Flags[ToggleConfig.Flag] = Toggle
				end
				return Toggle
			end

            --> Element Slider <--
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
				SliderConfig.Color = SliderConfig.Color or OrionLib.Themes[OrionLib.SelectedTheme].Stroke
				SliderConfig.Flag = SliderConfig.Flag or nil
				SliderConfig.Save = SliderConfig.Save or false
				local Slider = {
					Value = SliderConfig.Default,
					Save = SliderConfig.Save
				}
				local Dragging = false
				local ValueBox = AddThemeObject(
        Create("TextBox", {
					Size = UDim2.new(1, - 12, 0, 14),
					Position = UDim2.new(0, 12, 0, 6),
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(240, 240, 240),
					PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
					PlaceholderText = "0",
					Font = Enum.Font.GothamBold,
					TextSize = 13,
					TextXAlignment = Enum.TextXAlignment.Left,
					ClearTextOnFocus = false
				}), "Text")
				local SliderDrag = SetChildren(
        SetProps(
            MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
					Size = UDim2.new(0, 0, 1, 0),
					BackgroundTransparency = 0.3,
					ClipsDescendants = true
				}), {
					ValueBox
				})
				local BackgroundValue = AddThemeObject(
        SetProps(
            MakeElement("Label", "value", 13), {
					Size = UDim2.new(1, - 12, 0, 14),
					Position = UDim2.new(0, 12, 0, 6),
					Font = Enum.Font.GothamBold,
					Name = "Value",
					TextTransparency = 0.8
				}), "Text")
				local SliderBar = SetChildren(
        SetProps(
            MakeElement("RoundFrame", SliderConfig.Color, 0, 5), {
					Size = UDim2.new(1, - 24, 0, 26),
					Position = UDim2.new(0, 12, 0, 30),
					BackgroundTransparency = 0.9
				}), {
					SetProps(MakeElement("Stroke"), {
						Color = SliderConfig.Color
					}),
					BackgroundValue,
					SliderDrag
				})
				local SliderFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(1, 0, 0, 65),
					Parent = ItemParent
				}), {
					AddThemeObject(
                    SetProps(
                        MakeElement("Label", SliderConfig.Name, 15), {
						Size = UDim2.new(1, - 12, 0, 14),
						Position = UDim2.new(0, 12, 0, 10),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					SliderBar
				}), "Second")
				local function UpdateDisplay(value)
					local display = tostring(value) .. " " .. SliderConfig.ValueName
					ValueBox.Text = tostring(value)
					BackgroundValue.Text = display
				end
				SliderBar.InputBegan:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						Dragging = true
					end
				end)
				SliderBar.InputEnded:Connect(function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
						Dragging = false
					end
				end)
				UserInputService.InputChanged:Connect(function(Input)
					if Dragging then
						local InputPosition
						if Input.UserInputType == Enum.UserInputType.MouseMovement then
							InputPosition = Input.Position
						elseif Input.UserInputType == Enum.UserInputType.Touch then
							InputPosition = Input.Position
						end
						if InputPosition then
							local SizeScale = math.clamp((InputPosition.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
							local newValue = SliderConfig.Min + ((SliderConfig.Max - SliderConfig.Min) * SizeScale)
							Slider:Set(newValue)
							SaveCfg(game.GameId)
						end
					end
				end)
				ValueBox.FocusLost:Connect(function()
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
				end)
				function Slider:Set(Value)
					local newValue = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
					self.Value = newValue
					local scale = (newValue - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min)
					TweenService:Create(SliderDrag, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = UDim2.fromScale(scale, 1)
					}):Play()
					UpdateDisplay(newValue)
					SliderConfig.Callback(newValue)
				end
				Slider:Set(Slider.Value)
				if SliderConfig.Flag then
					OrionLib.Flags[SliderConfig.Flag] = Slider
				end
				return Slider
			end

            --> Element TextBox <--
			function ElementFunction:AddTextbox(TextboxConfig)
				TextboxConfig = TextboxConfig or {}
				TextboxConfig.Name = TextboxConfig.Name or "Textbox"
				TextboxConfig.Default = TextboxConfig.Default or ""
				TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
				TextboxConfig.Callback = TextboxConfig.Callback or function()
				end
				local Click = SetProps(
                    MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local TextboxActual = AddThemeObject(
                    Create("TextBox", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					TextColor3 = Color3.fromRGB(255, 255, 255),
					PlaceholderColor3 = Color3.fromRGB(210, 210, 210),
					PlaceholderText = "Input",
					Font = Enum.Font.GothamSemibold,
					TextXAlignment = Enum.TextXAlignment.Center,
					TextSize = 14,
					ClearTextOnFocus = false
				}), "Text")
				local TextContainer = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, - 12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					TextboxActual
				}), "Main")
				local TextboxFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", TextboxConfig.Name, 15), {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					TextContainer,
					Click
				}), "Second")
				AddConnection(
                    TextboxActual:GetPropertyChangedSignal("Text"), function()
                        --TextContainer.Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)
					TweenService:Create(
                            TextContainer, TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)
					}):Play()
				end)
				AddConnection(
                    TextboxActual.FocusLost, function()
					TextboxConfig.Callback(TextboxActual.Text)
					if TextboxConfig.TextDisappear then
						TextboxActual.Text = ""
					end
				end)
				TextboxActual.Text = TextboxConfig.Default
				AddConnection(
                    Click.MouseEnter, function()
					TweenService:Create(
                            TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)
				AddConnection(
                    Click.MouseLeave, function()
					TweenService:Create(
                            TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
					}):Play()
				end)
				AddConnection(
                    Click.MouseButton1Up, function()
					TweenService:Create(
                            TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
					TextboxActual:CaptureFocus()
				end)
				AddConnection(
                    Click.MouseButton1Down, function()
					TweenService:Create(
                            TextboxFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)
			end

            --> Element DropDown <--
			function ElementFunction:AddDropdown(DropdownConfig)
				DropdownConfig = DropdownConfig or {}
				DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
				DropdownConfig.Options = DropdownConfig.Options or {}
				DropdownConfig.Default = DropdownConfig.Default or ""
				DropdownConfig.Callback = DropdownConfig.Callback or function()
				end
				DropdownConfig.Flag = DropdownConfig.Flag or nil
				DropdownConfig.Save = DropdownConfig.Save or false
				local Dropdown = {
					Value = DropdownConfig.Default,
					Options = DropdownConfig.Options,
					Buttons = {},
					Toggled = false,
					Type = "Dropdown",
					Save = DropdownConfig.Save
				}
				local MaxElements = 5
				if not table.find(Dropdown.Options, Dropdown.Value) then
					Dropdown.Value = "..."
				end
				local DropdownList = MakeElement("List")
				local DropdownContainer = AddThemeObject(
                    SetProps(
                        SetChildren(
                            MakeElement("ScrollFrame", Color3.fromRGB(40, 40, 40), 4), {
					DropdownList
				}), {
					Parent = ItemParent,
					Position = UDim2.new(0, 0, 0, 38),
					Size = UDim2.new(1, 0, 1, - 38),
					ClipsDescendants = true
				}), "Divider")
				local Click = SetProps(
                    MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local DropdownFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent,
					ClipsDescendants = true
				}), {
					DropdownContainer,
					SetProps(
                                SetChildren(
                                    MakeElement("TFrame"), {
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", DropdownConfig.Name, 15), {
							Size = UDim2.new(1, - 12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Image", "rbxassetid://7072706796"), {
							Size = UDim2.new(0, 20, 0, 20),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(1, - 30, 0.5, 0),
							ImageColor3 = Color3.fromRGB(240, 240, 240),
							Name = "Ico"
						}), "TextDark"),
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", "Selected", 13), {
							Size = UDim2.new(1, - 40, 1, 0),
							Font = Enum.Font.Gotham,
							Name = "Selected",
							TextXAlignment = Enum.TextXAlignment.Right
						}), "TextDark"),
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, - 1),
							Name = "Line",
							Visible = false
						}), "Stroke"),
						Click
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					MakeElement("Corner")
				}), "Second")
				AddConnection(
                    DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"), function()
					DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
				end)
				local function AddOptions(Options)
					for _, v in pairs(Dropdown.Buttons) do
						v:Destroy()
					end
					Dropdown.Buttons = {}
					for _, Option in ipairs(Options) do
						local isSeparator = Option:sub(1, 3) == "---"
						local text = isSeparator and Option:sub(4) or Option
						local OptionBtn
						if isSeparator then
							OptionBtn = Instance.new("TextButton")
							OptionBtn.Size = UDim2.new(1, 0, 0, 28)
							OptionBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
							OptionBtn.BackgroundTransparency = 0.7
							OptionBtn.Text = ""
							OptionBtn.ClipsDescendants = true
							OptionBtn.Parent = DropdownContainer
							local Label = Instance.new("TextLabel")
							Label.Text = text
							Label.Font = Enum.Font.GothamBold
							Label.TextSize = 14
							Label.TextColor3 = Color3.fromRGB(240, 240, 240)
							Label.TextTransparency = 0.2
							Label.TextXAlignment = Enum.TextXAlignment.Left
							Label.TextWrapped = true
							Label.Size = UDim2.new(1, - 16, 1, 0)
							Label.Position = UDim2.new(0, 8, 0, 0)
							Label.BackgroundTransparency = 1
							Label.Parent = OptionBtn
						else
							OptionBtn = AddThemeObject(
                                SetProps(
                                    SetChildren(
                                        MakeElement("Button", Color3.fromRGB(40, 40, 40)), {
								MakeElement("Corner", 0, 6),
								AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", text, 13, 0.4), {
									Position = UDim2.new(0, 8, 0, 0),
									Size = UDim2.new(1, - 8, 1, 0),
									Name = "Title"
								}), "Text")
							}), {
								Parent = DropdownContainer,
								Size = UDim2.new(1, 0, 0, 28),
								BackgroundTransparency = 1,
								ClipsDescendants = true
							}), "Divider")
							AddConnection(
                                OptionBtn.MouseButton1Click, function()
								Dropdown:Set(Option)
								SaveCfg(game.GameId)
							end)
							Dropdown.Buttons[Option] = OptionBtn
						end
					end
				end
				function Dropdown:Refresh(Options, Delete)
					if Delete then
						for _, v in pairs(Dropdown.Buttons) do
							v:Destroy()
						end
						table.clear(Dropdown.Options)
						table.clear(Dropdown.Buttons)
					end
					Dropdown.Options = Options or {}
					AddOptions(Dropdown.Options)
				end
				function Dropdown:Set(Value)
					if not table.find(Dropdown.Options, Value) then
						Dropdown.Value = "..."
						DropdownFrame.F.Selected.Text = Dropdown.Value
						for _, v in pairs(Dropdown.Buttons) do
							TweenService:Create(
                                v, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								BackgroundTransparency = 1
							}):Play()
							TweenService:Create(
                                v.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								TextTransparency = 0.4
							}):Play()
						end
						return
					end
					Dropdown.Value = Value
					DropdownFrame.F.Selected.Text = Dropdown.Value
					for _, v in pairs(Dropdown.Buttons) do
						TweenService:Create(
                            v, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							BackgroundTransparency = 1
						}):Play()
						TweenService:Create(
                            v.Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
							TextTransparency = 0.4
						}):Play()
					end
					TweenService:Create(
                        Dropdown.Buttons[Value], TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						BackgroundTransparency = 0
					}):Play()
					TweenService:Create(
                        Dropdown.Buttons[Value].Title, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						TextTransparency = 0
					}):Play()
					return DropdownConfig.Callback(Dropdown.Value)
				end
				AddConnection(
                    Click.MouseButton1Click, function()
					Dropdown.Toggled = not Dropdown.Toggled
					DropdownFrame.F.Line.Visible = Dropdown.Toggled
					TweenService:Create(
                            DropdownFrame.F.Ico, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Rotation = Dropdown.Toggled and 180 or 0
					}):Play()
					TweenService:Create(
                            DropdownFrame, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = Dropdown.Toggled and UDim2.new(1, 0, 0, math.min(DropdownList.AbsoluteContentSize.Y + 38, 38 + (MaxElements * 28))) or UDim2.new(1, 0, 0, 38)
					}):Play()
				end)
				Dropdown:Refresh(Dropdown.Options, false)
				Dropdown:Set(Dropdown.Value)
				if DropdownConfig.Flag then
					OrionLib.Flags[DropdownConfig.Flag] = Dropdown
				end
				return Dropdown
			end

            --> Element Choose Theme <--
			function ElementFunction:ChooseTheme(config)
				config = config or {}
				local existingThemes = {}
				for theme, _ in pairs(OrionLib.Themes) do
					existingThemes[theme] = true
				end
				local DropdownOptions = {}
				local categories = OrionLib.Categories or {}
				for category, themeList in pairs(categories) do
					local validThemes = {}
					for _, themeName in ipairs(themeList) do
						if existingThemes[themeName] then
							table.insert(validThemes, themeName)
						end
					end
					if # validThemes > 0 then
						table.insert(DropdownOptions, "--- " .. category)
						for _, themeName in ipairs(validThemes) do
							table.insert(DropdownOptions, themeName)
						end
					end
				end
				local uncategorized = {}
				for theme, _ in pairs(existingThemes) do
					local found = false
					for _, themeList in pairs(categories) do
						for _, t in ipairs(themeList) do
							if t == theme then
								found = true
								break
							end
						end
						if found then
							break
						end
					end
					if not found then
						table.insert(uncategorized, theme)
					end
				end
				if # uncategorized > 0 then
					table.sort(uncategorized)
					table.insert(DropdownOptions, "--- Others")
					for _, themeName in ipairs(uncategorized) do
						table.insert(DropdownOptions, themeName)
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
					end
				})
			end

            --> Element Discord Invite <--
			function ElementFunction:AddDiscordInvite(Config)
				Config = Config or {}
				Config.ServerName = Config.ServerName or "Discord Server"
				Config.InviteLink = Config.InviteLink or "https://discord.gg/example"
				Config.Icon = Config.Icon or "rbxassetid://15841490359"
				Config.Description = Config.Description or ""
				local Container = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Parent = ItemParent,
					ClipsDescendants = true,
					BackgroundTransparency = 0
				}), {
					SetChildren(
                                SetProps(
                                    MakeElement("TFrame"), {
						Size = UDim2.new(1, - 24, 0, 0),
						Position = UDim2.new(0, 12, 0, 12),
						BackgroundTransparency = 1,
						Name = "ContentArea",
						AutomaticSize = Enum.AutomaticSize.Y
					}), {
						SetProps(
                                        MakeElement("Image", Config.Icon), {
							Size = UDim2.new(0, 56, 0, 56),
							Position = UDim2.new(0, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							Name = "ServerIcon"
						}),
						SetChildren(
                                        SetProps(
                                            MakeElement("TFrame"), {
							Size = UDim2.new(1, - 200, 0, 0),
							Position = UDim2.new(0, 70, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							Name = "TextArea",
							AutomaticSize = Enum.AutomaticSize.Y
						}), {
							MakeElement("List", 0, 2),
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.ServerName, 18), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.GothamBold,
								TextXAlignment = Enum.TextXAlignment.Left,
								Name = "Title"
							}), "Text"),
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.Description, 13), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.Gotham,
								TextWrapped = true,
								TextXAlignment = Enum.TextXAlignment.Left,
								Name = "Description"
							}), "TextDark"),
							SetProps(
                                                MakeElement("Label", Config.InviteLink, 12), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.Gotham,
								TextColor3 = Color3.fromRGB(0, 170, 255),
								TextXAlignment = Enum.TextXAlignment.Left,
								TextStrokeTransparency = 1,
								RichText = true,
								Name = "Link"
							})
						}),
						SetChildren(
                                        SetProps(
                                            MakeElement("RoundFrame", Color3.fromRGB(88, 101, 242), 0, 12), {
							Size = UDim2.new(0, 110, 0, 40),
							Position = UDim2.new(1, - 5, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Name = "JoinBtnFrame",
							BackgroundTransparency = 0,
							ClipsDescendants = true
						}), {
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", "Join", 16), {
								Size = UDim2.new(1, 0, 1, 0),
								Font = Enum.Font.GothamBold,
								TextColor3 = Color3.fromRGB(255, 255, 255),
								TextXAlignment = Enum.TextXAlignment.Center,
								Name = "JoinLabel"
							}), "Text"),
							SetProps(
                                                MakeElement("Button"), {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = 1,
								Name = "JoinClick"
							})
						})
					}),
					AddThemeObject(MakeElement("Stroke", Color3.fromRGB(80, 80, 80), 1), "Stroke"),
					SetProps(MakeElement("Padding", 12, 12, 12, 12), {
						Name = "MainPadding"
					})
				}), "Second")
				local function updateLayout()
					local contentArea = Container:FindFirstChild("ContentArea")
					if not contentArea then
						return
					end
					local textArea = contentArea:FindFirstChild("TextArea")
					local joinFrame = contentArea:FindFirstChild("JoinBtnFrame")
					if textArea and joinFrame then
						local h = math.max(56, textArea.AbsoluteSize.Y)
						contentArea.Size = UDim2.new(1, - 24, 0, h)
					end
				end
				local textArea = Container:FindFirstChild("ContentArea"):FindFirstChild("TextArea")
				if textArea then
					AddConnection(textArea:GetPropertyChangedSignal("AbsoluteSize"), updateLayout)
				end
				updateLayout()
				local joinBtnFrame = Container:FindFirstChild("ContentArea"):FindFirstChild("JoinBtnFrame")
				if joinBtnFrame then
					local joinClick = joinBtnFrame:FindFirstChild("JoinClick")
					local label = joinBtnFrame:FindFirstChild("JoinLabel")
					local originalSize = joinBtnFrame.Size
					joinClick.MouseEnter:Connect(
                        function()
						TweenService:Create(
                                joinBtnFrame, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(114, 137, 218),
							Size = UDim2.new(0, 120, 0, 44)
						}):Play()
					end)
					joinClick.MouseLeave:Connect(
                        function()
						TweenService:Create(
                                joinBtnFrame, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(88, 101, 242),
							Size = originalSize
						}):Play()
					end)
					joinClick.MouseButton1Click:Connect(
                        function()
						setclipboard(Config.InviteLink)
						label.Text = "Copied!"
						task.wait(1)
						label.Text = "Join"
					end)
				end
				return Container
			end
            
           --> Element Player List <--
			function ElementFunction:AddPlayerDropdown(Config)
				Config = Config or {}
				Config.Name = Config.Name or "Select Player"
				Config.Placeholder = Config.Placeholder or "Select a player"
				Config.Callback = Config.Callback or function(player)
				end
				Config.Flag = Config.Flag or nil
				Config.Save = Config.Save or false
				local Dropdown = {
					Value = nil,
					Player = nil,
					Toggled = false,
					Type = "PlayerDropdown",
					Save = Config.Save
				}
				local MaxElements = 5
				local DropdownList = MakeElement("List")
				local DropdownContainer = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("ScrollFrame", Color3.fromRGB(40, 40, 40), 4), {
					DropdownList
				}), {
					Parent = ItemParent,
					Position = UDim2.new(0, 0, 0, 38),
					Size = UDim2.new(1, 0, 1, - 38),
					ClipsDescendants = true,
					BackgroundTransparency = 1
				}), "Divider")
				local Header = SetChildren(
        SetProps(
            MakeElement("Button"), {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundTransparency = 1,
					Name = "Header"
				}), {
					AddThemeObject(
                SetProps(
                    MakeElement("Label", Config.Name, 15), {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(
                SetProps(
                    MakeElement("Image", "rbxassetid://7072706796"), {
						Size = UDim2.new(0, 20, 0, 20),
						AnchorPoint = Vector2.new(0, 0.5),
						Position = UDim2.new(1, - 30, 0.5, 0),
						ImageColor3 = Color3.fromRGB(240, 240, 240),
						Name = "Arrow"
					}), "TextDark"),
					AddThemeObject(
                SetProps(
                    MakeElement("Label", Config.Placeholder, 13), {
						Size = UDim2.new(1, - 40, 1, 0),
						Font = Enum.Font.Gotham,
						Name = "SelectedLabel",
						TextXAlignment = Enum.TextXAlignment.Right
					}), "TextDark"),
					AddThemeObject(
                SetProps(
                    MakeElement("Frame"), {
						Size = UDim2.new(1, 0, 0, 1),
						Position = UDim2.new(0, 0, 1, - 1),
						Name = "Line",
						Visible = false
					}), "Stroke")
				})
				local DropdownFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent,
					ClipsDescendants = true
				}), {
					DropdownContainer,
					Header,
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					MakeElement("Corner")
				}), "Second")
				local function refreshPlayerList()
					for _, v in pairs(DropdownContainer:GetChildren()) do
						if v:IsA("TextButton") then
							v:Destroy()
						end
					end
					local players = game.Players:GetPlayers()
					table.sort(players, function(a, b)
						return a.DisplayName:lower() < b.DisplayName:lower()
					end)
					for _, player in ipairs(players) do
						local item = AddThemeObject(
                SetChildren(
                    SetProps(
                        MakeElement("Button"), {
							Size = UDim2.new(1, 0, 0, 48),
							BackgroundTransparency = 1,
							Parent = DropdownContainer,
							ClipsDescendants = true
						}), {
							MakeElement("Corner", 0, 6),
							SetChildren(
                            SetProps(
                                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 1, 24), {
								Size = UDim2.new(0, 36, 0, 36),
								Position = UDim2.new(0, 8, 0.5, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								Name = "AvatarFrame"
							}), {
								SetProps(
                                    MakeElement("Image", "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=48&height=48&format=png"), {
									Size = UDim2.new(1, 0, 1, 0),
									Name = "Avatar"
								}),
								MakeElement("Corner", 1, 24)
							}),
							AddThemeObject(
                            SetProps(
                                MakeElement("Label", "", 14), {
								Size = UDim2.new(1, - 60, 1, 0),
								Position = UDim2.new(0, 52, 0, 0),
								Font = Enum.Font.GothamSemibold,
								Name = "PlayerName",
								RichText = true
							}), "Text")
						}), "Divider")
						local nameColor = Color3.fromRGB(255, 255, 255)
						local stats = player:FindFirstChild("TempPlayerStatsModule")
						if stats and stats:FindFirstChild("IsBeast") and stats.IsBeast.Value then
							nameColor = Color3.fromRGB(255, 100, 100)
						elseif player.Team then
							nameColor = player.Team.TeamColor.Color
						end
						item.PlayerName.Text = string.format("<b><font color='rgb(%d,%d,%d)'>%s</font></b> <font color='#aaaaaa' size='11'>@%s</font>", nameColor.R * 255, nameColor.G * 255, nameColor.B * 255, player.DisplayName, player.Name)
						item.MouseButton1Click:Connect(function()
							Dropdown:Set(player)
							Dropdown.Toggled = false
							DropdownFrame.Header.Line.Visible = false
							TweenService:Create(DropdownFrame.Header.Arrow, TweenInfo.new(0.15), {
								Rotation = 0
							}):Play()
							TweenService:Create(DropdownFrame, TweenInfo.new(0.15), {
								Size = UDim2.new(1, 0, 0, 38)
							}):Play()
						end)
						item.MouseEnter:Connect(function()
							TweenService:Create(item, TweenInfo.new(0.15), {
								BackgroundTransparency = 0.9
							}):Play()
						end)
						item.MouseLeave:Connect(function()
							TweenService:Create(item, TweenInfo.new(0.15), {
								BackgroundTransparency = 1
							}):Play()
						end)
					end
					DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
				end
				local function updateSelectedDisplay()
					if Dropdown.Player then
						local text = string.format("<b>%s</b> <font size='11'>@%s</font>", Dropdown.Player.DisplayName, Dropdown.Player.Name)
						DropdownFrame.Header.SelectedLabel.Text = text
						DropdownFrame.Header.SelectedLabel.RichText = true
					else
						DropdownFrame.Header.SelectedLabel.Text = Config.Placeholder
						DropdownFrame.Header.SelectedLabel.RichText = false
					end
				end
				function Dropdown:Set(player)
					if not player or not player:IsA("Player") then
						return
					end
					self.Player = player
					self.Value = player.Name
					updateSelectedDisplay()
					Config.Callback(player)
					if Config.Flag then
						OrionLib.Flags[Config.Flag] = self
					end
					if self.Save then
						SaveCfg(game.GameId)
					end
				end
				Header.MouseButton1Click:Connect(function()
					Dropdown.Toggled = not Dropdown.Toggled
					DropdownFrame.Header.Line.Visible = Dropdown.Toggled
					TweenService:Create(DropdownFrame.Header.Arrow, TweenInfo.new(0.15), {
						Rotation = Dropdown.Toggled and 180 or 0
					}):Play()
					TweenService:Create(DropdownFrame, TweenInfo.new(0.15), {
						Size = Dropdown.Toggled and UDim2.new(1, 0, 0, math.min(DropdownList.AbsoluteContentSize.Y + 38, 38 + (MaxElements * 48))) or UDim2.new(1, 0, 0, 38)
					}):Play()
				end)
				refreshPlayerList()
				local function onPlayerAdded()
					refreshPlayerList()
				end
				local function onPlayerRemoved()
					if Dropdown.Player and not Dropdown.Player.Parent then
						Dropdown:Set(nil)
					end
					refreshPlayerList()
				end
				game.Players.PlayerAdded:Connect(onPlayerAdded)
				game.Players.PlayerRemoving:Connect(onPlayerRemoved)
				if Config.Flag then
					OrionLib.Flags[Config.Flag] = Dropdown
				end
				return Dropdown
			end

            --> Element Divider Line <--
			function ElementFunction:AddDivider(Config)
				Config = Config or {}
				Config.Thickness = Config.Thickness or 1
				Config.Color = Config.Color or OrionLib.Themes[OrionLib.SelectedTheme].Divider
				Config.Margin = Config.Margin or 10
				local Divider = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 0), {
					Size = UDim2.new(1, - Config.Margin * 2, 0, Config.Thickness),
					BackgroundColor3 = Config.Color,
					BackgroundTransparency = 0,
					Parent = ItemParent,
					Name = "Divider"
				}), {
					MakeElement("Corner", 0, 0)
				}), "Divider")
				return Divider
			end

            --> Element Links <--
			function ElementFunction:AddLinks(Config)
				Config = Config or {}
				Config.ServerName = Config.ServerName or "Social"
				Config.InviteLink = Config.InviteLink or "https://example.com"
				Config.Icon = Config.Icon or "rbxassetid://15841490359"
				Config.Description = Config.Description or ""
				local Container = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10), {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Parent = ItemParent,
					ClipsDescendants = true,
					BackgroundTransparency = 0
				}), {
					SetChildren(
                                SetProps(
                                    MakeElement("TFrame"), {
						Size = UDim2.new(1, - 24, 0, 0),
						Position = UDim2.new(0, 12, 0, 12),
						BackgroundTransparency = 1,
						Name = "ContentArea",
						AutomaticSize = Enum.AutomaticSize.Y
					}), {
						SetProps(
                                        MakeElement("Image", Config.Icon), {
							Size = UDim2.new(0, 56, 0, 56),
							Position = UDim2.new(0, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							Name = "Icon"
						}),
						SetChildren(
                                        SetProps(
                                            MakeElement("TFrame"), {
							Size = UDim2.new(1, - 200, 0, 0),
							Position = UDim2.new(0, 70, 0.5, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							Name = "TextArea",
							AutomaticSize = Enum.AutomaticSize.Y
						}), {
							MakeElement("List", 0, 2),
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.ServerName, 18), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.GothamBold,
								TextXAlignment = Enum.TextXAlignment.Left,
								Name = "Title"
							}), "Text"),
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.Description, 13), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.Gotham,
								TextWrapped = true,
								TextXAlignment = Enum.TextXAlignment.Left,
								Name = "Description"
							}), "TextDark"),
							SetProps(
                                                MakeElement("Label", Config.InviteLink, 12), {
								Size = UDim2.new(1, 0, 0, 0),
								AutomaticSize = Enum.AutomaticSize.Y,
								Font = Enum.Font.Gotham,
								TextColor3 = Color3.fromRGB(0, 170, 255),
								TextXAlignment = Enum.TextXAlignment.Left,
								TextStrokeTransparency = 1,
								RichText = true,
								Name = "Link"
							})
						}),
						SetChildren(
                                        SetProps(
                                            MakeElement("RoundFrame", Color3.fromRGB(0, 170, 255), 0, 12), {
							Size = UDim2.new(0, 110, 0, 40),
							Position = UDim2.new(1, - 5, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Name = "CopyBtnFrame",
							BackgroundTransparency = 0,
							ClipsDescendants = true
						}), {
							AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", "Copy", 16), {
								Size = UDim2.new(1, 0, 1, 0),
								Font = Enum.Font.GothamBold,
								TextColor3 = Color3.fromRGB(255, 255, 255),
								TextXAlignment = Enum.TextXAlignment.Center,
								Name = "CopyLabel"
							}), "Text"),
							SetProps(
                                                MakeElement("Button"), {
								Size = UDim2.new(1, 0, 1, 0),
								BackgroundTransparency = 1,
								Name = "CopyClick"
							})
						})
					}),
					AddThemeObject(MakeElement("Stroke", Color3.fromRGB(80, 80, 80), 1), "Stroke"),
					SetProps(MakeElement("Padding", 12, 12, 12, 12), {
						Name = "MainPadding"
					})
				}), "Second")
				local function updateLayout()
					local contentArea = Container:FindFirstChild("ContentArea")
					if not contentArea then
						return
					end
					local textArea = contentArea:FindFirstChild("TextArea")
					local btnFrame = contentArea:FindFirstChild("CopyBtnFrame")
					if textArea and btnFrame then
						local h = math.max(56, textArea.AbsoluteSize.Y)
						contentArea.Size = UDim2.new(1, - 24, 0, h)
					end
				end
				local textArea = Container:FindFirstChild("ContentArea"):FindFirstChild("TextArea")
				if textArea then
					AddConnection(textArea:GetPropertyChangedSignal("AbsoluteSize"), updateLayout)
				end
				updateLayout()
				local btnFrame = Container:FindFirstChild("ContentArea"):FindFirstChild("CopyBtnFrame")
				if btnFrame then
					local click = btnFrame:FindFirstChild("CopyClick")
					local label = btnFrame:FindFirstChild("CopyLabel")
					local originalSize = btnFrame.Size
					click.MouseEnter:Connect(
                        function()
						TweenService:Create(
                                btnFrame, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(0, 200, 255),
							Size = UDim2.new(0, 120, 0, 44)
						}):Play()
					end)
					click.MouseLeave:Connect(
                        function()
						TweenService:Create(
                                btnFrame, TweenInfo.new(0.2), {
							BackgroundColor3 = Color3.fromRGB(0, 170, 255),
							Size = originalSize
						}):Play()
					end)
					click.MouseButton1Click:Connect(
                        function()
						setclipboard(Config.InviteLink)
						label.Text = "Copied!"
						task.wait(1)
						label.Text = "Copy"
					end)
				end
				return Container
			end

            --> Element Button Transparency <--
			function ElementFunction:ThemeTransparency(config)
				config = config or {}
				local mainFactor = config.Main or 0.5
				local secondFactor = config.Second or 0.55
				local isEnabled = config.Default or false
				local function applyTransparency()
					for typeName, objects in pairs(OrionLib.ThemeObjects) do
						for _, obj in ipairs(objects) do
							if obj and obj.Parent then
								local transparency = 0
								if isEnabled then
									if typeName == "Main" then
										transparency = mainFactor
									elseif typeName == "Second" then
										transparency = secondFactor
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
				local toggle = self:AddToggle(
                    {
					Name = config.Name or "UI Transparency",
					Description = config.Description or nil,
					Default = isEnabled,
					Flag = config.Flag or "ThemeTransparency",
					Save = true,
					Callback = function(enabled)
						isEnabled = enabled
						applyTransparency()
						if config.Callback then
							config.Callback(isEnabled)
						end
					end
				})
				applyTransparency()
				return toggle
			end

            --> Element Bind <--
			function ElementFunction:AddBind(BindConfig)
				BindConfig.Name = BindConfig.Name or "Bind"
				BindConfig.Default = BindConfig.Default or Enum.KeyCode.Unknown
				BindConfig.Hold = BindConfig.Hold or false
				BindConfig.Callback = BindConfig.Callback or function()
				end
				BindConfig.Flag = BindConfig.Flag or nil
				BindConfig.Save = BindConfig.Save or false
				local Bind = {
					Value,
					Binding = false,
					Type = "Bind",
					Save = BindConfig.Save
				}
				local Holding = false
				local Click = SetProps(MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local BindBox = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, - 12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", BindConfig.Name, 14), {
						Size = UDim2.new(1, 0, 1, 0),
						Font = Enum.Font.GothamBold,
						TextXAlignment = Enum.TextXAlignment.Center,
						Name = "Value"
					}), "Text")
				}), "Main")
				local BindFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", BindConfig.Name, 15), {
						Size = UDim2.new(1, - 12, 1, 0),
						Position = UDim2.new(0, 12, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Content"
					}), "Text"),
					AddThemeObject(MakeElement("Stroke"), "Stroke"),
					BindBox,
					Click
				}), "Second")
				AddConnection(
                    BindBox.Value:GetPropertyChangedSignal("Text"), function()
					TweenService:Create(
                            BindBox, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						Size = UDim2.new(0, BindBox.Value.TextBounds.X + 16, 0, 24)
					}):Play()
				end)
				AddConnection(
                    Click.InputEnded, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if Bind.Binding then
							return
						end
						Bind.Binding = true
						BindBox.Value.Text = ""
					end
				end)
				AddConnection(
                    UserInputService.InputBegan, function(Input)
					if UserInputService:GetFocusedTextBox() then
						return
					end
					if (Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value) and not Bind.Binding then
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
						end)
						pcall(
                                function()
							if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
								Key = Input.UserInputType
							end
						end)
						Key = Key or Bind.Value
						Bind:Set(Key)
						SaveCfg(game.GameId)
					end
				end)
				AddConnection(
                    UserInputService.InputEnded, function(Input)
					if Input.KeyCode.Name == Bind.Value or Input.UserInputType.Name == Bind.Value then
						if BindConfig.Hold and Holding then
							Holding = false
							BindConfig.Callback(Holding)
						end
					end
				end)
				AddConnection(
                    Click.MouseEnter, function()
					TweenService:Create(
                            BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)
				AddConnection(
                    Click.MouseLeave, function()
					TweenService:Create(
                            BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
					}):Play()
				end)
				AddConnection(
                    Click.MouseButton1Up, function()
					TweenService:Create(
                            BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3)
					}):Play()
				end)
				AddConnection(
                    Click.MouseButton1Down, function()
					TweenService:Create(
                            BindFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
						BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6, OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6)
					}):Play()
				end)
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

            --> Element ColorPicker <--
			function ElementFunction:AddColorpicker(ColorpickerConfig)
				ColorpickerConfig = ColorpickerConfig or {}
				ColorpickerConfig.Name = ColorpickerConfig.Name or "Colorpicker"
				ColorpickerConfig.Default = ColorpickerConfig.Default or Color3.fromRGB(255, 255, 255)
				ColorpickerConfig.Callback = ColorpickerConfig.Callback or function()
				end
				ColorpickerConfig.Flag = ColorpickerConfig.Flag or nil
				ColorpickerConfig.Save = ColorpickerConfig.Save or false
				local ColorH, ColorS, ColorV = 1, 1, 1
				local Colorpicker = {
					Value = ColorpickerConfig.Default,
					Toggled = false,
					Type = "Colorpicker",
					Save = ColorpickerConfig.Save
				}
				local ColorSelection = Create("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(select(3, Color3.toHSV(Colorpicker.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})
				local HueSelection = Create("ImageLabel", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0.5, 0, 1 - select(1, Color3.toHSV(Colorpicker.Value))),
					ScaleType = Enum.ScaleType.Fit,
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Image = "http://www.roblox.com/asset/?id=4805639000"
				})
				local Color = Create("ImageLabel", {
					Size = UDim2.new(1, - 25, 1, 0),
					Visible = false,
					Image = "rbxassetid://4155801252"
				}, {
					Create("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}),
					ColorSelection
				})
				local Hue = Create("Frame", {
					Size = UDim2.new(0, 20, 1, 0),
					Position = UDim2.new(1, - 20, 0, 0),
					Visible = false
				}, {
					Create("UIGradient", {
						Rotation = 270,
						Color = ColorSequence.new{
							ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
							ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
							ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
							ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
							ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
							ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
						}
					}),
					Create("UICorner", {
						CornerRadius = UDim.new(0, 5)
					}),
					HueSelection
				})
				local ColorpickerContainer = Create("Frame", {
					Position = UDim2.new(0, 0, 0, 32),
					Size = UDim2.new(1, 0, 1, - 32),
					BackgroundTransparency = 1,
					ClipsDescendants = true
				}, {
					Hue,
					Color,
					Create("UIPadding", {
						PaddingLeft = UDim.new(0, 35),
						PaddingRight = UDim.new(0, 35),
						PaddingBottom = UDim.new(0, 10),
						PaddingTop = UDim.new(0, 17)
					})
				})
				local Click = SetProps(
                    MakeElement("Button"), {
					Size = UDim2.new(1, 0, 1, 0)
				})
				local ColorpickerBox = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4), {
					Size = UDim2.new(0, 24, 0, 24),
					Position = UDim2.new(1, - 12, 0.5, 0),
					AnchorPoint = Vector2.new(1, 0.5)
				}), {
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Main")
				local ColorpickerFrame = AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
					Size = UDim2.new(1, 0, 0, 38),
					Parent = ItemParent
				}), {
					SetProps(
                                SetChildren(
                                    MakeElement("TFrame"), {
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", ColorpickerConfig.Name, 15), {
							Size = UDim2.new(1, - 12, 1, 0),
							Position = UDim2.new(0, 12, 0, 0),
							Font = Enum.Font.GothamBold,
							Name = "Content"
						}), "Text"),
						ColorpickerBox,
						Click,
						AddThemeObject(
                                            SetProps(
                                                MakeElement("Frame"), {
							Size = UDim2.new(1, 0, 0, 1),
							Position = UDim2.new(0, 0, 1, - 1),
							Name = "Line",
							Visible = false
						}), "Stroke")
					}), {
						Size = UDim2.new(1, 0, 0, 38),
						ClipsDescendants = true,
						Name = "F"
					}),
					ColorpickerContainer,
					AddThemeObject(MakeElement("Stroke"), "Stroke")
				}), "Second")
				AddConnection(
                    Click.MouseButton1Click, function()
					Colorpicker.Toggled = not Colorpicker.Toggled
					TweenService:Create(
                            ColorpickerFrame, TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
						Size = Colorpicker.Toggled and UDim2.new(1, 0, 0, 148) or UDim2.new(1, 0, 0, 38)
					}):Play()
					Color.Visible = Colorpicker.Toggled
					Hue.Visible = Colorpicker.Toggled
					ColorpickerFrame.F.Line.Visible = Colorpicker.Toggled
				end)
				local function UpdateColorPicker()
					ColorpickerBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
					Colorpicker:Set(ColorpickerBox.BackgroundColor3)
					ColorpickerConfig.Callback(ColorpickerBox.BackgroundColor3)
					SaveCfg(game.GameId)
				end
				ColorH = 1 - (math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
				ColorS = (math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
				ColorV = 1 - (math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
				AddConnection(
                    Color.InputBegan, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
						ColorInput = AddConnection(
                                RunService.RenderStepped, function()
							local ColorX = (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) / Color.AbsoluteSize.X)
							local ColorY = (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) / Color.AbsoluteSize.Y)
							ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = ColorX
							ColorV = 1 - ColorY
							UpdateColorPicker()
						end)
					end
				end)
				AddConnection(
                    Color.InputEnded, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if ColorInput then
							ColorInput:Disconnect()
						end
					end
				end)
				AddConnection(
                    Hue.InputBegan, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
						HueInput = AddConnection(
                                RunService.RenderStepped, function()
							local HueY = (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) / Hue.AbsoluteSize.Y)
							HueSelection.Position = UDim2.new(0.5, 0, HueY, 0)
							ColorH = 1 - HueY
							UpdateColorPicker()
						end)
					end
				end)
				AddConnection(
                    Hue.InputEnded, function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if HueInput then
							HueInput:Disconnect()
						end
					end
				end)
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

        --> Element Section <--
		function ElementFunction:AddSection(SectionConfig)
			SectionConfig = SectionConfig or {}
			SectionConfig.Name = SectionConfig.Name or "Section"
			SectionConfig.Icon = SectionConfig.Icon or ""
			SectionConfig.Collapsible = SectionConfig.Collapsible == nil and true or SectionConfig.Collapsible
			SectionConfig.DefaultCollapsed = SectionConfig.DefaultCollapsed or false
			local headerHeight = 36
			local collapsible = SectionConfig.Collapsible
			local collapsed = collapsible and SectionConfig.DefaultCollapsed or false
			local contentHeight = 0
			local SectionFrame = SetChildren(
                SetProps(
                    MakeElement("TFrame"), {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				Parent = Container,
				ClipsDescendants = true,
				Name = "SectionFrame"
			}), {
				MakeElement("List", 0, 0),
				SetChildren(
                        SetProps(
                            MakeElement("Button"), {
					Size = UDim2.new(1, 0, 0, headerHeight),
					BackgroundTransparency = 1,
					Name = "Header",
					LayoutOrder = 1,
					AutoButtonColor = false
				}), {
					(SectionConfig.Icon ~= "") and AddThemeObject(
                                    SetProps(
                                        MakeElement("Image", SectionConfig.Icon), {
						Size = UDim2.new(0, 20, 0, 20),
						Position = UDim2.new(0, 10, 0.5, 0),
						AnchorPoint = Vector2.new(0, 0.5),
						Name = "Icon"
					}), "Text") or nil,
					AddThemeObject(
                                SetProps(
                                    MakeElement("Label", SectionConfig.Name, 15), {
						Size = UDim2.new(1, - 50, 1, 0),
						Position = UDim2.new(0, 35, 0, 0),
						Font = Enum.Font.GothamBold,
						Name = "Title"
					}), "Text"),
					collapsible and AddThemeObject(
                                    SetProps(
                                        MakeElement("Image", "rbxassetid://7072706796"), {
						Size = UDim2.new(0, 18, 0, 18),
						Position = UDim2.new(1, - 12, 0.5, 0),
						AnchorPoint = Vector2.new(1, 0.5),
						Rotation = collapsed and 0 or 180,
						Name = "Arrow"
					}), "TextDark") or nil
				}),
				SetProps(
                        MakeElement("Frame"), {
					Size = UDim2.new(1, - 20, 0, 1),
					BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Divider,
					LayoutOrder = 2
				}),
				SetChildren(
                        SetProps(
                            MakeElement("TFrame"), {
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
					Name = "ContentContainer",
					ClipsDescendants = true,
					AutomaticSize = collapsed and Enum.AutomaticSize.None or Enum.AutomaticSize.Y,
					LayoutOrder = 3
				}), {
					SetChildren(
                                SetProps(
                                    MakeElement("TFrame"), {
						Size = UDim2.new(1, 0, 0, 0),
						BackgroundTransparency = 1,
						Name = "Inner",
						AutomaticSize = Enum.AutomaticSize.Y
					}), {
						MakeElement("List", 0, 6),
						MakeElement("Padding", 6, 10, 10, 6)
					})
				})
			})
			local header = SectionFrame.Header
			local arrow = collapsible and header.Arrow
			local contentContainer = SectionFrame.ContentContainer
			local inner = contentContainer.Inner
			local function updateContentHeight()
				contentHeight = inner.UIListLayout.AbsoluteContentSize.Y + 12
			end
			AddConnection(
                inner.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				updateContentHeight()
				if not collapsed and contentContainer.AutomaticSize == Enum.AutomaticSize.Y then
					contentContainer.Size = UDim2.new(1, 0, 0, contentHeight)
				end
			end)
			local function Toggle()
				if not collapsible then
					return
				end
				collapsed = not collapsed
				TweenService:Create(
                    arrow, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
					Rotation = collapsed and 0 or 180
				}):Play()
				updateContentHeight()
				if collapsed then
					contentContainer.AutomaticSize = Enum.AutomaticSize.None
					TweenService:Create(
                        contentContainer, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
						Size = UDim2.new(1, 0, 0, 0)
					}):Play()
				else
					contentContainer.AutomaticSize = Enum.AutomaticSize.None
					contentContainer.Size = UDim2.new(1, 0, 0, 0)
					local tween = TweenService:Create(
                        contentContainer, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
						Size = UDim2.new(1, 0, 0, contentHeight)
					})
					tween:Play()
					tween.Completed:Connect(
                        function()
						contentContainer.AutomaticSize = Enum.AutomaticSize.Y
					end)
				end
			end
			if collapsible then
				AddConnection(header.MouseButton1Click, Toggle)
			end
			if collapsed then
				contentContainer.AutomaticSize = Enum.AutomaticSize.None
				contentContainer.Size = UDim2.new(1, 0, 0, 0)
			else
				task.wait()
				updateContentHeight()
				contentContainer.Size = UDim2.new(1, 0, 0, contentHeight)
				contentContainer.AutomaticSize = Enum.AutomaticSize.Y
			end
			local SectionFunctions = {}
			for name, func in next, GetElements(inner) do
				SectionFunctions[name] = func
			end
			function SectionFunctions:Toggle()
				if collapsible then
					Toggle()
				end
			end
			function SectionFunctions:Expand()
				if collapsible and collapsed then
					Toggle()
				end
			end
			function SectionFunctions:Collapse()
				if collapsible and not collapsed then
					Toggle()
				end
			end
			return SectionFunctions
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
                    MakeElement("TFrame"), {
				Size = UDim2.new(1, 0, 1, 0),
				Parent = ItemParent
			}), {
				AddThemeObject(
                        SetProps(
                            MakeElement("Image", "rbxassetid://3610239960"), {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 15, 0, 15),
					ImageTransparency = 0.4
				}), "Text"),
				AddThemeObject(
                        SetProps(
                            MakeElement("Label", "Unauthorised Access", 14), {
					Size = UDim2.new(1, - 38, 0, 14),
					Position = UDim2.new(0, 38, 0, 18),
					TextTransparency = 0.4
				}), "Text"),
				AddThemeObject(
                        SetProps(
                            MakeElement("Image", "rbxassetid://4483345875"), {
					Size = UDim2.new(0, 56, 0, 56),
					Position = UDim2.new(0, 84, 0, 110)
				}), "Text"),
				AddThemeObject(
                        SetProps(
                            MakeElement("Label", "Premium Features", 14), {
					Size = UDim2.new(1, - 150, 0, 14),
					Position = UDim2.new(0, 150, 0, 112),
					Font = Enum.Font.GothamBold
				}), "Text"),
				AddThemeObject(
                        SetProps(
                            MakeElement("Label", "This part of the script is locked to Sirius Premium users. Purchase Premium in the Discord server (discord.gg/sirius)", 12), {
					Size = UDim2.new(1, - 200, 0, 14),
					Position = UDim2.new(0, 150, 0, 138),
					TextWrapped = true,
					TextTransparency = 0.4
				}), "Text")
			})
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
	ToggleButton.Position = buttonConfig.Position or UDim2.new(0, 10, 1, - 160)
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
		ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
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
			end)
		end
	end)
	ToggleButton.InputChanged:Connect(
        function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	UIS.InputChanged:Connect(
        function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	ToggleButton.MouseButton1Click:Connect(
        function()
		if OrionLib.MainWindow then
			OrionLib.MainWindow.Visible = not OrionLib.MainWindow.Visible
		end
	end)
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