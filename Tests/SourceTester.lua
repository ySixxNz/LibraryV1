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
        Default = {"Default"},
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
        Pastel = {"Cream", "Crystal", "Rose", "Strawberry"},
        Misc = {"Nebula"}
    },
    SelectedTheme = "Default",
    Folder = nil,
    SaveCfg = false
}

-- feather Icons https://github.com/evoincorp/lucideblox/tree/master/src/modules/util - Created by 7kayoh

local SelectedIconsVersion = "v1"

local ICONS_V1 = {
    ["aperture"] = "rbxassetid://7733666258",
    ["bug"] = "rbxassetid://7733701545",
    ["chevrons-down-up"] = "rbxassetid://7733720483",
    ["clock-6"] = "rbxassetid://8997384977",
    ["egg"] = "rbxassetid://8997385940",
    ["external-link"] = "rbxassetid://7743866903",
    ["lightbulb-off"] = "rbxassetid://7733975123",
    ["file-check-2"] = "rbxassetid://7733779610",
    ["settings"] = "rbxassetid://7734053495",
    ["crown"] = "rbxassetid://7733765398",
    ["coins"] = "rbxassetid://7743866529",
    ["battery"] = "rbxassetid://7733674820",
    ["flashlight-off"] = "rbxassetid://7733798799",
    ["camera-off"] = "rbxassetid://7733919260",
    ["function-square"] = "rbxassetid://7733799682",
    ["mountain-snow"] = "rbxassetid://7743870286",
    ["gamepad"] = "rbxassetid://7733799901",
    ["gift"] = "rbxassetid://7733946818",
    ["globe"] = "rbxassetid://7733954760",
    ["option"] = "rbxassetid://7734021300",
    ["hand"] = "rbxassetid://7733955740",
    ["hard-hat"] = "rbxassetid://7733955850",
    ["hash"] = "rbxassetid://7733955906",
    ["server"] = "rbxassetid://7734053426",
    ["align-horizontal-space-around"] = "rbxassetid://8997381738",
    ["highlighter"] = "rbxassetid://7743868648",
    ["bike"] = "rbxassetid://7733678330",
    ["home"] = "rbxassetid://7733960981",
    ["image"] = "rbxassetid://7733964126",
    ["indent"] = "rbxassetid://7733964452",
    ["infinity"] = "rbxassetid://7733964640",
    ["inspect"] = "rbxassetid://7733964808",
    ["alert-triangle"] = "rbxassetid://7733658504",
    ["align-start-horizontal"] = "rbxassetid://8997381965",
    ["figma"] = "rbxassetid://7743867310",
    ["pin"] = "rbxassetid://8997386648",
    ["corner-up-right"] = "rbxassetid://7733764915",
    ["list-x"] = "rbxassetid://7743869517",
    ["monitor-off"] = "rbxassetid://7734000184",
    ["chevron-first"] = "rbxassetid://8997383275",
    ["package-search"] = "rbxassetid://8997386448",
    ["pencil"] = "rbxassetid://7734022107",
    ["cloud-fog"] = "rbxassetid://7733920317",
    ["grip-horizontal"] = "rbxassetid://7733955302",
    ["align-center-vertical"] = "rbxassetid://8997380737",
    ["outdent"] = "rbxassetid://7734021384",
    ["more-vertical"] = "rbxassetid://7734006187",
    ["package-plus"] = "rbxassetid://8997386355",
    ["bluetooth"] = "rbxassetid://7733687147",
    ["pen-tool"] = "rbxassetid://7734022041",
    ["person-standing"] = "rbxassetid://7743871002",
    ["tornado"] = "rbxassetid://7743873633",
    ["phone-incoming"] = "rbxassetid://7743871120",
    ["phone-off"] = "rbxassetid://7734029534",
    ["dribbble"] = "rbxassetid://7733770843",
    ["at-sign"] = "rbxassetid://7733673907",
    ["edit-2"] = "rbxassetid://7733771217",
    ["sheet"] = "rbxassetid://7743871876",
    ["tv"] = "rbxassetid://7743874674",
    ["headphones"] = "rbxassetid://7733956063",
    ["qr-code"] = "rbxassetid://7743871575",
    ["reply"] = "rbxassetid://7734051594",
    ["rewind"] = "rbxassetid://7734051670",
    ["bell-off"] = "rbxassetid://7733675107",
    ["file-check"] = "rbxassetid://7733779668",
    ["quote"] = "rbxassetid://7734045100",
    ["rotate-ccw"] = "rbxassetid://7734051861",
    ["library"] = "rbxassetid://7743869054",
    ["clock-1"] = "rbxassetid://8997383694",
    ["on-charge"] = "rbxassetid://7734021231",
    ["video-off"] = "rbxassetid://7743876466",
    ["save"] = "rbxassetid://7734052335",
    ["arrow-left-circle"] = "rbxassetid://7733673056",
    ["screen-share"] = "rbxassetid://7734052814",
    ["clock-3"] = "rbxassetid://8997384456",
    ["help-circle"] = "rbxassetid://7733956210",
    ["server-crash"] = "rbxassetid://7734053281",
    ["bluetooth-searching"] = "rbxassetid://7733914320",
    ["equal"] = "rbxassetid://7733771811",
    ["shield-close"] = "rbxassetid://7734056470",
    ["phone"] = "rbxassetid://7734032056",
    ["type"] = "rbxassetid://7743874740",
    ["file-x-2"] = "rbxassetid://7743867554",
    ["sidebar"] = "rbxassetid://7734058260",
    ["sigma"] = "rbxassetid://7734058345",
    ["smartphone-charging"] = "rbxassetid://7734058894",
    ["arrow-left"] = "rbxassetid://7733673136",
    ["framer"] = "rbxassetid://7733799486",
    ["currency"] = "rbxassetid://7733765592",
    ["star"] = "rbxassetid://7734068321",
    ["stretch-horizontal"] = "rbxassetid://8997387754",
    ["smile"] = "rbxassetid://7734059095",
    ["subscript"] = "rbxassetid://8997387937",
    ["sun"] = "rbxassetid://7734068495",
    ["switch-camera"] = "rbxassetid://7743872492",
    ["table"] = "rbxassetid://7734073253",
    ["tag"] = "rbxassetid://7734075797",
    ["cross"] = "rbxassetid://7733765224",
    ["gem"] = "rbxassetid://7733942651",
    ["link"] = "rbxassetid://7733978098",
    ["terminal"] = "rbxassetid://7743872929",
    ["thermometer-sun"] = "rbxassetid://7734084018",
    ["share-2"] = "rbxassetid://7734053595",
    ["timer-off"] = "rbxassetid://8997388325",
    ["megaphone"] = "rbxassetid://7733993049",
    ["timer-reset"] = "rbxassetid://7743873336",
    ["phone-forwarded"] = "rbxassetid://7734027345",
    ["unlock"] = "rbxassetid://7743875263",
    ["trello"] = "rbxassetid://7743873996",
    ["camera"] = "rbxassetid://7733708692",
    ["triangle"] = "rbxassetid://7743874367",
    ["truck"] = "rbxassetid://7743874482",
    ["file-output"] = "rbxassetid://7733788742",
    ["gamepad-2"] = "rbxassetid://7733799795",
    ["network"] = "rbxassetid://7734021047",
    ["users"] = "rbxassetid://7743876054",
    ["electricity-off"] = "rbxassetid://7733771563",
    ["book"] = "rbxassetid://7733914390",
    ["clock-9"] = "rbxassetid://8997385485",
    ["corner-down-left"] = "rbxassetid://7733764327",
    ["locate-fixed"] = "rbxassetid://7733992424",
    ["bar-chart"] = "rbxassetid://7733674319",
    ["shield-check"] = "rbxassetid://7734056411",
    ["signal-low"] = "rbxassetid://8997387189",
    ["reply-all"] = "rbxassetid://7734051524",
    ["zoom-in"] = "rbxassetid://7743878977",
    ["grip-vertical"] = "rbxassetid://7733955410",
    ["ticket"] = "rbxassetid://7734086558",
    ["smartphone"] = "rbxassetid://7734058979",
    ["arrow-big-right"] = "rbxassetid://7733671493",
    ["tv-2"] = "rbxassetid://7743874599",
    ["flashlight"] = "rbxassetid://7733798851",
    ["database"] = "rbxassetid://7743866778",
    ["plus-square"] = "rbxassetid://7734040369",
    ["align-justify"] = "rbxassetid://7733661326",
    ["clipboard-list"] = "rbxassetid://7733920117",
    ["github"] = "rbxassetid://7733954058",
    ["columns"] = "rbxassetid://7733757178",
    ["arrow-big-down"] = "rbxassetid://7733668653",
    ["cloud-off"] = "rbxassetid://7733745572",
    ["target"] = "rbxassetid://7743872758",
    ["skip-back"] = "rbxassetid://7734058404",
    ["x-circle"] = "rbxassetid://7743878496",
    ["clock-10"] = "rbxassetid://8997383876",
    ["align-right"] = "rbxassetid://7733663582",
    ["clock-5"] = "rbxassetid://8997384798",
    ["bell-plus"] = "rbxassetid://7733675181",
    ["battery-medium"] = "rbxassetid://7733674731",
    ["arrow-down"] = "rbxassetid://7733672933",
    ["inbox"] = "rbxassetid://7733964370",
    ["cast"] = "rbxassetid://7733919326",
    ["gift-card"] = "rbxassetid://7733945018",
    ["webcam"] = "rbxassetid://7743877896",
    ["folder-minus"] = "rbxassetid://7733799022",
    ["scan-line"] = "rbxassetid://8997386772",
    ["shovel"] = "rbxassetid://7734056878",
    ["download-cloud"] = "rbxassetid://7733770689",
    ["list-checks"] = "rbxassetid://7743869317",
    ["file-text"] = "rbxassetid://7733789088",
    ["codesandbox"] = "rbxassetid://7733752575",
    ["laptop-2"] = "rbxassetid://7733965313",
    ["podcast"] = "rbxassetid://7734042234",
    ["log-out"] = "rbxassetid://7733992677",
    ["thumbs-up"] = "rbxassetid://7743873212",
    ["timer"] = "rbxassetid://7743873443",
    ["text-cursor"] = "rbxassetid://8997388195",
    ["file-search"] = "rbxassetid://7733788966",
    ["thermometer"] = "rbxassetid://7734084149",
    ["bluetooth-off"] = "rbxassetid://7733914252",
    ["refresh-cw"] = "rbxassetid://7734051052",
    ["clipboard-check"] = "rbxassetid://7733919947",
    ["languages"] = "rbxassetid://7733965249",
    ["asterisk"] = "rbxassetid://7733673800",
    ["superscript"] = "rbxassetid://8997388036",
    ["user-check"] = "rbxassetid://7743875503",
    ["move-diagonal"] = "rbxassetid://7743870505",
    ["copy"] = "rbxassetid://7733764083",
    ["bot"] = "rbxassetid://7733916988",
    ["alarm-minus"] = "rbxassetid://7733656164",
    ["log-in"] = "rbxassetid://7733992604",
    ["maximize"] = "rbxassetid://7733992982",
    ["align-horizontal-space-between"] = "rbxassetid://8997381854",
    ["brush"] = "rbxassetid://7733701455",
    ["equal-not"] = "rbxassetid://7733771726",
    ["upload"] = "rbxassetid://7743875428",
    ["minus-circle"] = "rbxassetid://7733998053",
    ["graduation-cap"] = "rbxassetid://7733955058",
    ["edit-3"] = "rbxassetid://7733771361",
    ["check"] = "rbxassetid://7733715400",
    ["scissors"] = "rbxassetid://7734052570",
    ["info"] = "rbxassetid://7733964719",
    ["book-open"] = "rbxassetid://7733687281",
    ["divide-circle"] = "rbxassetid://7733769152",
    ["file"] = "rbxassetid://7733793319",
    ["clock-2"] = "rbxassetid://8997384295",
    ["corner-right-up"] = "rbxassetid://7733764680",
    ["clover"] = "rbxassetid://7733747233",
    ["expand"] = "rbxassetid://7733771982",
    ["gauge"] = "rbxassetid://7733799969",
    ["phone-outgoing"] = "rbxassetid://7743871253",
    ["shield-alert"] = "rbxassetid://7734056326",
    ["paperclip"] = "rbxassetid://7734021680",
    ["arrow-big-left"] = "rbxassetid://7733911731",
    ["album"] = "rbxassetid://7733658133",
    ["bookmark"] = "rbxassetid://7733692043",
    ["check-circle-2"] = "rbxassetid://7733710700",
    ["list-ordered"] = "rbxassetid://7743869411",
    ["delete"] = "rbxassetid://7733768142",
    ["axe"] = "rbxassetid://7733674079",
    ["radio"] = "rbxassetid://7743871662",
    ["octagon"] = "rbxassetid://7734021165",
    ["git-commit"] = "rbxassetid://7743868360",
    ["shirt"] = "rbxassetid://7734056672",
    ["corner-right-down"] = "rbxassetid://7733764605",
    ["trending-down"] = "rbxassetid://7743874143",
    ["airplay"] = "rbxassetid://7733655834",
    ["repeat"] = "rbxassetid://7734051454",
    ["layers"] = "rbxassetid://7743868936",
    ["chevron-right"] = "rbxassetid://7733717755",
    ["chevrons-right"] = "rbxassetid://7733919682",
    ["folder-plus"] = "rbxassetid://7733799092",
    ["alarm-check"] = "rbxassetid://7733655912",
    ["arrow-up-right"] = "rbxassetid://7733673646",
    ["user-plus"] = "rbxassetid://7743875759",
    ["file-minus"] = "rbxassetid://7733936115",
    ["cloud-drizzle"] = "rbxassetid://7733920226",
    ["stretch-vertical"] = "rbxassetid://8997387862",
    ["unlink"] = "rbxassetid://7743875149",
    ["wand"] = "rbxassetid://8997388430",
    ["regex"] = "rbxassetid://7734051188",
    ["command"] = "rbxassetid://7733924046",
    ["haze"] = "rbxassetid://7733955969",
    ["trash"] = "rbxassetid://7743873871",
    ["battery-full"] = "rbxassetid://7733674503",
    ["flag-triangle-left"] = "rbxassetid://7733798509",
    ["server-off"] = "rbxassetid://7734053361",
    ["loader-2"] = "rbxassetid://7733989869",
    ["monitor-speaker"] = "rbxassetid://7743869988",
    ["shuffle"] = "rbxassetid://7734057059",
    ["tablet"] = "rbxassetid://7743872620",
    ["cloud-moon"] = "rbxassetid://7733920519",
    ["clipboard-x"] = "rbxassetid://7733734668",
    ["pocket"] = "rbxassetid://7734042139",
    ["watch"] = "rbxassetid://7743877668",
    ["file-plus"] = "rbxassetid://7733788885",
    ["locate"] = "rbxassetid://7733992469",
    ["share"] = "rbxassetid://7734053697",
    ["thermometer-snowflake"] = "rbxassetid://7743873074",
    ["volume-1"] = "rbxassetid://7743877081",
    ["coffee"] = "rbxassetid://7733752630",
    ["cloud-hail"] = "rbxassetid://7733920444",
    ["alarm-clock-off"] = "rbxassetid://7733656003",
    ["pound-sterling"] = "rbxassetid://7734042354",
    ["tent"] = "rbxassetid://7734078943",
    ["toggle-left"] = "rbxassetid://7734091286",
    ["dollar-sign"] = "rbxassetid://7733770599",
    ["sunrise"] = "rbxassetid://7743872365",
    ["sunset"] = "rbxassetid://7734070982",
    ["code"] = "rbxassetid://7733749837",
    ["thumbs-down"] = "rbxassetid://7734084236",
    ["trending-up"] = "rbxassetid://7743874262",
    ["clock-12"] = "rbxassetid://8997384150",
    ["rocking-chair"] = "rbxassetid://7734051769",
    ["check-square"] = "rbxassetid://7733919526",
    ["cpu"] = "rbxassetid://7733765045",
    ["palette"] = "rbxassetid://7734021595",
    ["minimize-2"] = "rbxassetid://7733997870",
    ["cloud-sun"] = "rbxassetid://7733746880",
    ["copyleft"] = "rbxassetid://7733764196",
    ["archive"] = "rbxassetid://7733911621",
    ["building"] = "rbxassetid://7733701625",
    ["image-minus"] = "rbxassetid://7733963797",
    ["italic"] = "rbxassetid://7733964917",
    ["link-2-off"] = "rbxassetid://7733975283",
    ["sort-asc"] = "rbxassetid://7734060715",
    ["underline"] = "rbxassetid://7743874904",
    ["gitlab"] = "rbxassetid://7733954246",
    ["file-minus-2"] = "rbxassetid://7733936010",
    ["play-circle"] = "rbxassetid://7734037784",
    ["clock-8"] = "rbxassetid://8997385352",
    ["file-input"] = "rbxassetid://7733935917",
    ["beaker"] = "rbxassetid://7733674922",
    ["shopping-bag"] = "rbxassetid://7734056747",
    ["navigation"] = "rbxassetid://7734020989",
    ["moon"] = "rbxassetid://7743870134",
    ["glasses"] = "rbxassetid://7733954403",
    ["clipboard-copy"] = "rbxassetid://7733920037",
    ["feather"] = "rbxassetid://7733777166",
    ["skip-forward"] = "rbxassetid://7734058495",
    ["wind"] = "rbxassetid://7743878264",
    ["frown"] = "rbxassetid://7733799591",
    ["move-vertical"] = "rbxassetid://7743870608",
    ["umbrella"] = "rbxassetid://7743874820",
    ["package"] = "rbxassetid://7734021469",
    ["chevrons-up"] = "rbxassetid://7733723433",
    ["download"] = "rbxassetid://7733770755",
    ["eye"] = "rbxassetid://7733774602",
    ["files"] = "rbxassetid://7743867811",
    ["arrow-down-right"] = "rbxassetid://7733672831",
    ["code-2"] = "rbxassetid://7733920644",
    ["file-digit"] = "rbxassetid://7733935829",
    ["x-square"] = "rbxassetid://7743878737",
    ["clipboard"] = "rbxassetid://7733734762",
    ["maximize-2"] = "rbxassetid://7733992901",
    ["send"] = "rbxassetid://7734053039",
    ["alarm-clock"] = "rbxassetid://7733656100",
    ["sliders"] = "rbxassetid://7734058803",
    ["refresh-ccw"] = "rbxassetid://7734050715",
    ["music"] = "rbxassetid://7734020554",
    ["banknote"] = "rbxassetid://7733674153",
    ["hard-drive"] = "rbxassetid://7733955793",
    ["search"] = "rbxassetid://7734052925",
    ["layout-list"] = "rbxassetid://7733970442",
    ["edit"] = "rbxassetid://7733771472",
    ["contrast"] = "rbxassetid://7733764005",
    ["wifi"] = "rbxassetid://7743878148",
    ["ghost"] = "rbxassetid://7743868000",
    ["laptop"] = "rbxassetid://7733965386",
    ["clock-4"] = "rbxassetid://8997384603",
    ["layout-dashboard"] = "rbxassetid://7733970318",
    ["circle"] = "rbxassetid://7733919881",
    ["file-x"] = "rbxassetid://7733938136",
    ["award"] = "rbxassetid://7733673987",
    ["corner-left-down"] = "rbxassetid://7733764448",
    ["arrow-up-left"] = "rbxassetid://7733673539",
    ["globe-2"] = "rbxassetid://7733954611",
    ["compass"] = "rbxassetid://7733924216",
    ["git-branch"] = "rbxassetid://7733949149",
    ["vibrate"] = "rbxassetid://7743876302",
    ["pause-circle"] = "rbxassetid://7734021767",
    ["minus-square"] = "rbxassetid://7743869899",
    ["mic-off"] = "rbxassetid://7743869714",
    ["arrow-down-circle"] = "rbxassetid://7733671763",
    ["move-horizontal"] = "rbxassetid://7734016210",
    ["chrome"] = "rbxassetid://7733919783",
    ["radio-receiver"] = "rbxassetid://7734045155",
    ["shield"] = "rbxassetid://7734056608",
    ["image-plus"] = "rbxassetid://7733964016",
    ["more-horizontal"] = "rbxassetid://7734006080",
    ["divide"] = "rbxassetid://7733769365",
    ["view"] = "rbxassetid://7743876754",
    ["list"] = "rbxassetid://7743869612",
    ["printer"] = "rbxassetid://7734042580",
    ["corner-left-up"] = "rbxassetid://7733764536",
    ["meh"] = "rbxassetid://7733993147",
    ["copyright"] = "rbxassetid://7733764275",
    ["heart"] = "rbxassetid://7733956134",
    ["lock"] = "rbxassetid://7733992528",
    ["align-center"] = "rbxassetid://7733909776",
    ["signal-high"] = "rbxassetid://8997387110",
    ["upload-cloud"] = "rbxassetid://7743875358",
    ["arrow-up-circle"] = "rbxassetid://7733673466",
    ["git-branch-plus"] = "rbxassetid://7743868200",
    ["screen-share-off"] = "rbxassetid://7734052653",
    ["git-pull-request"] = "rbxassetid://7733952287",
    ["flag"] = "rbxassetid://7733798691",
    ["star-half"] = "rbxassetid://7734068258",
    ["minus"] = "rbxassetid://7734000129",
    ["mountain"] = "rbxassetid://7734008868",
    ["volume"] = "rbxassetid://7743877487",
    ["mouse-pointer-2"] = "rbxassetid://7734010405",
    ["indian-rupee"] = "rbxassetid://7733964536",
    ["speaker"] = "rbxassetid://7734063416",
    ["flame"] = "rbxassetid://7733798747",
    ["crop"] = "rbxassetid://7733765140",
    ["clock-11"] = "rbxassetid://8997384034",
    ["stop-circle"] = "rbxassetid://7734068379",
    ["power-off"] = "rbxassetid://7734042423",
    ["bell-minus"] = "rbxassetid://7733675028",
    ["undo"] = "rbxassetid://7743874974",
    ["link-2"] = "rbxassetid://7743869163",
    ["lightbulb"] = "rbxassetid://7733975185",
    ["shrink"] = "rbxassetid://7734056971",
    ["mail"] = "rbxassetid://7733992732",
    ["pause"] = "rbxassetid://7734021897",
    ["bold"] = "rbxassetid://7733687211",
    ["calendar"] = "rbxassetid://7733919198",
    ["x-octagon"] = "rbxassetid://7743878618",
    ["file-code"] = "rbxassetid://7733779730",
    ["life-buoy"] = "rbxassetid://7733973479",
    ["import"] = "rbxassetid://7733964240",
    ["video"] = "rbxassetid://7743876610",
    ["clock-7"] = "rbxassetid://8997385147",
    ["bell"] = "rbxassetid://7733911828",
    ["move-diagonal-2"] = "rbxassetid://7734013178",
    ["message-circle"] = "rbxassetid://7733993311",
    ["skull"] = "rbxassetid://7734058599",
    ["battery-charging"] = "rbxassetid://7733674402",
    ["ruler"] = "rbxassetid://7734052157",
    ["binary"] = "rbxassetid://7733678388",
    ["cloud-rain-wind"] = "rbxassetid://7733746456",
    ["briefcase"] = "rbxassetid://7733919017",
    ["terminal-square"] = "rbxassetid://7734079055",
    ["scale"] = "rbxassetid://7734052454",
    ["lasso"] = "rbxassetid://7733967892",
    ["piggy-bank"] = "rbxassetid://7734034513",
    ["battery-low"] = "rbxassetid://7733674589",
    ["arrow-up"] = "rbxassetid://7733673717",
    ["list-plus"] = "rbxassetid://7733984995",
    ["bookmark-plus"] = "rbxassetid://7734111084",
    ["box-select"] = "rbxassetid://7733696665",
    ["filter"] = "rbxassetid://7733798407",
    ["play"] = "rbxassetid://7743871480",
    ["calculator"] = "rbxassetid://7733919105",
    ["bell-ring"] = "rbxassetid://7733675275",
    ["plane"] = "rbxassetid://7734037723",
    ["plus-circle"] = "rbxassetid://7734040271",
    ["power"] = "rbxassetid://7734042493",
    ["phone-missed"] = "rbxassetid://7734029465",
    ["percent"] = "rbxassetid://7743870852",
    ["mouse-pointer"] = "rbxassetid://7743870392",
    ["box"] = "rbxassetid://7733917120",
    ["snowflake"] = "rbxassetid://7734059180",
    ["sort-desc"] = "rbxassetid://7743871973",
    ["flag-triangle-right"] = "rbxassetid://7733798634",
    ["bar-chart-2"] = "rbxassetid://7733674239",
    ["hand-metal"] = "rbxassetid://7733955664",
    ["map"] = "rbxassetid://7733992829",
    ["eye-off"] = "rbxassetid://7733774495",
    ["cloud-rain"] = "rbxassetid://7733746651",
    ["contact"] = "rbxassetid://7743866666",
    ["signal"] = "rbxassetid://8997387546",
    ["mouse-pointer-click"] = "rbxassetid://7734010488",
    ["sidebar-open"] = "rbxassetid://7734058165",
    ["pause-octagon"] = "rbxassetid://7734021827",
    ["user-minus"] = "rbxassetid://7743875629",
    ["cloud"] = "rbxassetid://7733746980",
    ["arrow-right-circle"] = "rbxassetid://7733673229",
    ["fast-forward"] = "rbxassetid://7743867090",
    ["volume-2"] = "rbxassetid://7743877250",
    ["grab"] = "rbxassetid://7733954884",
    ["arrow-right"] = "rbxassetid://7733673345",
    ["chevron-down"] = "rbxassetid://7733717447",
    ["volume-x"] = "rbxassetid://7743877381",
    ["cloud-snow"] = "rbxassetid://7733746798",
    ["car"] = "rbxassetid://7733708835",
    ["message-square"] = "rbxassetid://7733993369",
    ["repeat-1"] = "rbxassetid://7734051342",
    ["codepen"] = "rbxassetid://7733920768",
    ["voicemail"] = "rbxassetid://7743876916",
    ["shopping-cart"] = "rbxassetid://7734056813",
    ["corner-down-right"] = "rbxassetid://7733764385",
    ["layout-grid"] = "rbxassetid://7733970390",
    ["clock"] = "rbxassetid://7733734848",
    ["corner-up-left"] = "rbxassetid://7733764800",
    ["git-merge"] = "rbxassetid://7733952195",
    ["verified"] = "rbxassetid://7743876142",
    ["redo"] = "rbxassetid://7743871739",
    ["hexagon"] = "rbxassetid://7743868527",
    ["square"] = "rbxassetid://7743872181",
    ["chevrons-up-down"] = "rbxassetid://7733723321",
    ["bus"] = "rbxassetid://7733701715",
    ["file-plus-2"] = "rbxassetid://7733788816",
    ["alarm-plus"] = "rbxassetid://7733658066",
    ["divide-square"] = "rbxassetid://7733769261",
    ["pie-chart"] = "rbxassetid://7734034378",
    ["hammer"] = "rbxassetid://7733955511",
    ["history"] = "rbxassetid://7733960880",
    ["flask-round"] = "rbxassetid://7733798957",
    ["wifi-off"] = "rbxassetid://7743878056",
    ["zoom-out"] = "rbxassetid://7743879082",
    ["toggle-right"] = "rbxassetid://7743873539",
    ["monitor"] = "rbxassetid://7734002839",
    ["x"] = "rbxassetid://7743878857",
    ["user"] = "rbxassetid://7743875962",
    ["sprout"] = "rbxassetid://7743872071",
    ["move"] = "rbxassetid://7743870731",
    ["gavel"] = "rbxassetid://7733800044",
    ["forward"] = "rbxassetid://7733799371",
    ["sidebar-close"] = "rbxassetid://7734058092",
    ["electricity"] = "rbxassetid://7733771628",
    ["plus"] = "rbxassetid://7734042071",
    ["pipette"] = "rbxassetid://7743871384",
    ["cloud-lightning"] = "rbxassetid://7733741741",
    ["lasso-select"] = "rbxassetid://7743868832",
    ["phone-call"] = "rbxassetid://7734027264",
    ["droplet"] = "rbxassetid://7733770982",
    ["key"] = "rbxassetid://7733965118",
    ["map-pin"] = "rbxassetid://7733992789",
    ["navigation-2"] = "rbxassetid://7734020942",
    ["list-minus"] = "rbxassetid://7733980795",
    ["chevron-up"] = "rbxassetid://7733919605",
    ["no_entry"] = "rbxassetid://7734021118",
    ["arrow-big-up"] = "rbxassetid://7733671663",
    ["bookmark-minus"] = "rbxassetid://7733689754",
    ["activity"] = "rbxassetid://7733655755",
    ["grid"] = "rbxassetid://7733955179",
    ["user-x"] = "rbxassetid://7743875879",
    ["alert-circle"] = "rbxassetid://7733658271",
    ["menu"] = "rbxassetid://7733993211",
    ["form-input"] = "rbxassetid://7733799275",
    ["rss"] = "rbxassetid://7734052075",
    ["loader"] = "rbxassetid://7733992358",
    ["strikethrough"] = "rbxassetid://7734068425",
    ["mic"] = "rbxassetid://7743869805",
    ["landmark"] = "rbxassetid://7733965184",
    ["crosshair"] = "rbxassetid://7733765307",
    ["alert-octagon"] = "rbxassetid://7733658335",
    ["anchor"] = "rbxassetid://7733911490",
    ["chevron-left"] = "rbxassetid://7733717651",
    ["flask-conical"] = "rbxassetid://7733798901",
    ["wallet"] = "rbxassetid://7743877573",
    ["euro"] = "rbxassetid://7733771891",
    ["trash-2"] = "rbxassetid://7743873772",
    ["check-circle"] = "rbxassetid://7733919427",
    ["layout"] = "rbxassetid://7733970543",
    ["droplets"] = "rbxassetid://7733771078",
    ["rotate-cw"] = "rbxassetid://7734051957",
    ["minimize"] = "rbxassetid://7733997941",
    ["arrow-down-left"] = "rbxassetid://7733672282",
    ["image-off"] = "rbxassetid://7733963907",
    ["cloudy"] = "rbxassetid://7733747106",
    ["align-left"] = "rbxassetid://7733911357",
    ["film"] = "rbxassetid://7733942579",
    ["chevrons-down"] = "rbxassetid://7733720604",
    ["pointer"] = "rbxassetid://7734042307",
    ["folder"] = "rbxassetid://7733799185",
    ["chevrons-left"] = "rbxassetid://7733720701",
    ["shield-off"] = "rbxassetid://7734056540",
    ["wrench"] = "rbxassetid://7743878358",
}

local ICONS_V2 = {
    ["accessibility"] = "rbxassetid://10709751939",
    ["activity"] = "rbxassetid://10709752035",
    ["air-vent"] = "rbxassetid://10709752131",
    ["airplay"] = "rbxassetid://10709752254",
    ["alarm-check"] = "rbxassetid://10709752405",
    ["alarm-clock"] = "rbxassetid://10709752630",
    ["alarm-clock-off"] = "rbxassetid://10709752508",
    ["alarm-minus"] = "rbxassetid://10709752732",
    ["alarm-plus"] = "rbxassetid://10709752825",
    ["album"] = "rbxassetid://10709752906",
    ["alert-circle"] = "rbxassetid://10709752996",
    ["alert-octagon"] = "rbxassetid://10709753064",
    ["alert-triangle"] = "rbxassetid://10709753149",
    ["align-center"] = "rbxassetid://10709753570",
    ["align-center-horizontal"] = "rbxassetid://10709753272",
    ["align-center-vertical"] = "rbxassetid://10709753421",
    ["align-end-horizontal"] = "rbxassetid://10709753692",
    ["align-end-vertical"] = "rbxassetid://10709753808",
    ["align-horizontal-distribute-center"] = "rbxassetid://10747779791",
    ["align-horizontal-distribute-end"] = "rbxassetid://10747784534",
    ["align-horizontal-distribute-start"] = "rbxassetid://10709754118",
    ["align-horizontal-justify-center"] = "rbxassetid://10709754204",
    ["align-horizontal-justify-end"] = "rbxassetid://10709754317",
    ["align-horizontal-justify-start"] = "rbxassetid://10709754436",
    ["align-horizontal-space-around"] = "rbxassetid://10709754590",
    ["align-horizontal-space-between"] = "rbxassetid://10709754749",
    ["align-justify"] = "rbxassetid://10709759610",
    ["align-left"] = "rbxassetid://10709759764",
    ["align-right"] = "rbxassetid://10709759895",
    ["align-start-horizontal"] = "rbxassetid://10709760051",
    ["align-start-vertical"] = "rbxassetid://10709760244",
    ["align-vertical-distribute-center"] = "rbxassetid://10709760351",
    ["align-vertical-distribute-end"] = "rbxassetid://10709760434",
    ["align-vertical-distribute-start"] = "rbxassetid://10709760612",
    ["align-vertical-justify-center"] = "rbxassetid://10709760814",
    ["align-vertical-justify-end"] = "rbxassetid://10709761003",
    ["align-vertical-justify-start"] = "rbxassetid://10709761176",
    ["align-vertical-space-around"] = "rbxassetid://10709761324",
    ["align-vertical-space-between"] = "rbxassetid://10709761434",
    ["anchor"] = "rbxassetid://10709761530",
    ["angry"] = "rbxassetid://10709761629",
    ["annoyed"] = "rbxassetid://10709761722",
    ["aperture"] = "rbxassetid://10709761813",
    ["apple"] = "rbxassetid://10709761889",
    ["archive"] = "rbxassetid://10709762233",
    ["archive-restore"] = "rbxassetid://10709762058",
    ["armchair"] = "rbxassetid://10709762327",
    ["arrow-big-down"] = "rbxassetid://10747796644",
    ["arrow-big-left"] = "rbxassetid://10709762574",
    ["arrow-big-right"] = "rbxassetid://10709762727",
    ["arrow-big-up"] = "rbxassetid://10709762879",
    ["arrow-down"] = "rbxassetid://10709767827",
    ["arrow-down-circle"] = "rbxassetid://10709763034",
    ["arrow-down-left"] = "rbxassetid://10709767656",
    ["arrow-down-right"] = "rbxassetid://10709767750",
    ["arrow-left"] = "rbxassetid://10709768114",
    ["arrow-left-circle"] = "rbxassetid://10709767936",
    ["arrow-left-right"] = "rbxassetid://10709768019",
    ["arrow-right"] = "rbxassetid://10709768347",
    ["arrow-right-circle"] = "rbxassetid://10709768226",
    ["arrow-up"] = "rbxassetid://10709768939",
    ["arrow-up-circle"] = "rbxassetid://10709768432",
    ["arrow-up-down"] = "rbxassetid://10709768538",
    ["arrow-up-left"] = "rbxassetid://10709768661",
    ["arrow-up-right"] = "rbxassetid://10709768787",
    ["asterisk"] = "rbxassetid://10709769095",
    ["at-sign"] = "rbxassetid://10709769286",
    ["award"] = "rbxassetid://10709769406",
    ["axe"] = "rbxassetid://10709769508",
    ["axis-3d"] = "rbxassetid://10709769598",
    ["baby"] = "rbxassetid://10709769732",
    ["backpack"] = "rbxassetid://10709769841",
    ["baggage-claim"] = "rbxassetid://10709769935",
    ["banana"] = "rbxassetid://10709770005",
    ["banknote"] = "rbxassetid://10709770178",
    ["bar-chart"] = "rbxassetid://10709773755",
    ["bar-chart-2"] = "rbxassetid://10709770317",
    ["bar-chart-3"] = "rbxassetid://10709770431",
    ["bar-chart-4"] = "rbxassetid://10709770560",
    ["bar-chart-horizontal"] = "rbxassetid://10709773669",
    ["barcode"] = "rbxassetid://10747360675",
    ["baseline"] = "rbxassetid://10709773863",
    ["bath"] = "rbxassetid://10709773963",
    ["battery"] = "rbxassetid://10709774640",
    ["battery-charging"] = "rbxassetid://10709774068",
    ["battery-full"] = "rbxassetid://10709774206",
    ["battery-low"] = "rbxassetid://10709774370",
    ["battery-medium"] = "rbxassetid://10709774513",
    ["beaker"] = "rbxassetid://10709774756",
    ["bed"] = "rbxassetid://10709775036",
    ["bed-double"] = "rbxassetid://10709774864",
    ["bed-single"] = "rbxassetid://10709774968",
    ["beer"] = "rbxassetid://10709775167",
    ["bell"] = "rbxassetid://10709775704",
    ["bell-minus"] = "rbxassetid://10709775241",
    ["bell-off"] = "rbxassetid://10709775320",
    ["bell-plus"] = "rbxassetid://10709775448",
    ["bell-ring"] = "rbxassetid://10709775560",
    ["bike"] = "rbxassetid://10709775894",
    ["binary"] = "rbxassetid://10709776050",
    ["bitcoin"] = "rbxassetid://10709776126",
    ["bluetooth"] = "rbxassetid://10709776655",
    ["bluetooth-connected"] = "rbxassetid://10709776240",
    ["bluetooth-off"] = "rbxassetid://10709776344",
    ["bluetooth-searching"] = "rbxassetid://10709776501",
    ["bold"] = "rbxassetid://10747813908",
    ["bomb"] = "rbxassetid://10709781460",
    ["bone"] = "rbxassetid://10709781605",
    ["book"] = "rbxassetid://10709781824",
    ["book-open"] = "rbxassetid://10709781717",
    ["bookmark"] = "rbxassetid://10709782154",
    ["bookmark-minus"] = "rbxassetid://10709781919",
    ["bookmark-plus"] = "rbxassetid://10709782044",
    ["bot"] = "rbxassetid://10709782230",
    ["box"] = "rbxassetid://10709782497",
    ["box-select"] = "rbxassetid://10709782342",
    ["boxes"] = "rbxassetid://10709782582",
    ["briefcase"] = "rbxassetid://10709782662",
    ["brush"] = "rbxassetid://10709782758",
    ["bug"] = "rbxassetid://10709782845",
    ["building"] = "rbxassetid://10709783051",
    ["building-2"] = "rbxassetid://10709782939",
    ["bus"] = "rbxassetid://10709783137",
    ["chevron-down"] = "rbxassetid://10709790948",
}

local Icons = ICONS_V1

local function NormalizeVersion(v)
    v = tostring(v):lower()
    if v == "v2" then return "v2" end
    return "v1"
end

function SetIconsVersion(v)
    SelectedIconsVersion = NormalizeVersion(v)
    Icons = SelectedIconsVersion == "v2" and ICONS_V2 or ICONS_V1
end

function GetIcon(name)
    if not name or name == "" then return nil end
    local clean = name:lower():gsub("^lucide%-", "")
    return Icons[clean]
end

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
    return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
end

local function UnpackColor(Color)
    return Color3.fromRGB(Color.R, Color.G, Color.B)
end

local function LoadCfg(Config)
    local success, Data = pcall(function()
        return HttpService:JSONDecode(Config)
    end)
    if not success or type(Data) ~= "table" then return end
    for flagName, value in pairs(Data) do
        local flag = OrionLib.Flags[flagName]
        if flag and type(flag) == "table" and flag.Type then
            pcall(function()
                if flag.Type == "Colorpicker" then
                    if type(value) == "table" and value.R then
                        flag:Set(UnpackColor(value))
                    end
                elseif flag.Type == "Slider" then
                    local n = tonumber(value)
                    if n then flag:Set(n) end
                elseif flag.Type == "Toggle" then
                    flag:Set(value == true or value == "true")
                elseif flag.Type == "Dropdown" then
                    flag:Set(tostring(value))
                elseif flag.Type == "MultiDropdown" then
                    local list = {}
                    if type(value) == "table" then
                        for k, v in pairs(value) do
                            if type(k) == "number" then
                                table.insert(list, tostring(v))
                            elseif v == true then
                                table.insert(list, tostring(k))
                            end
                        end
                    end
                    flag:Set(list)
                elseif flag.Type == "Bind" then
                    local keyStr = tostring(value)
                    local key = Enum.KeyCode[keyStr] or Enum.UserInputType[keyStr]
                    if key then flag:Set(key) end
                end
            end)
        end
    end
end

local function SaveCfg(Name)
    if not OrionLib.SaveCfg then return end
    local folder = OrionLib.Folder
    if not folder or folder == "" then return end

    local Data = {}
    for i, v in pairs(OrionLib.Flags) do
        if type(v) == "table" and v.Save then
            pcall(function()
                if v.Type == "Colorpicker" then
                    Data[i] = PackColor(v.Value)
                elseif v.Type == "Slider" then
                    Data[i] = v.Value
                elseif v.Type == "Toggle" then
                    Data[i] = v.Value
                elseif v.Type == "Dropdown" then
                    Data[i] = v.Value
                elseif v.Type == "MultiDropdown" then
                    local selected = {}
                    for k, val in pairs(v.Value) do
                        if val then table.insert(selected, k) end
                    end
                    Data[i] = selected
                elseif v.Type == "Bind" then
                    Data[i] = tostring(v.Value)
                end
            end)
        end
    end

    pcall(function()
        if not isfolder(folder) then
            makefolder(folder)
        end
        writefile(folder .. "/" .. tostring(Name) .. ".txt", HttpService:JSONEncode(Data))
    end)
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
    function(Color, Scale, Offset, Shadow)
        local Frame =
            Create(
            "Frame",
            {
                BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255),
                BorderSizePixel = 0
            },
            {
                Create("UICorner", {CornerRadius = UDim.new(Scale, Offset)})
            }
        )
        if Shadow then
            local shadow = Instance.new("UIShadow")
            shadow.Color = Color3.fromRGB(0, 0, 0)
            shadow.Transparency = 0.3
            shadow.Radius = 8
            shadow.Parent = Frame
        end
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

local CoreGui = game:GetService("CoreGui")
local NotificationRoot = swift_internal_correct and CoreGui or gethui and gethui() or CoreGui

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
        Parent = NotificationRoot
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
            NotificationConfig.Accent = NotificationConfig.Accent or OrionLib.Themes[OrionLib.SelectedTheme].Stroke

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
                SetProps(                    MakeElement("RoundFrame", OrionLib.Themes[OrionLib.SelectedTheme].Second, 0, 12),
                    {
                        Parent = NotificationParent,
                        Size = UDim2.new(1, 0, 0, 0),
                        Position = UDim2.new(1, -55, 0, 0),
                        BackgroundTransparency = 0,
                        AutomaticSize = Enum.AutomaticSize.Y,
                        Name = "NotificationFrame"
                    }
                ),
                {
                    MakeElement("Stroke", OrionLib.Themes[OrionLib.SelectedTheme].Stroke, 1),
                    MakeElement("Padding", 15, 10, 10, 15),
                    SetProps(
                        MakeElement("Image", NotificationConfig.Image),
                        {
                            Size = UDim2.new(0, 24, 0, 24),
                            ImageColor3 = NotificationConfig.Accent,
                            Name = "Icon"
                        }
                    ),
                    SetProps(
                        MakeElement("Label", NotificationConfig.Name, 14),
                        {
                            Size = UDim2.new(1, -40, 0, 20),
                            Position = UDim2.new(0, 34, 0, 0),
                            Font = Enum.Font.GothamBold,
                            TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text,
                            Name = "Title"
                        }
                    ),
                    SetProps(
                        MakeElement("Label", NotificationConfig.Content, 13),
                        {
                            Size = UDim2.new(1, -12, 0, 0),
                            Position = UDim2.new(0, 0, 0, 28),
                            Font = Enum.Font.Gotham,
                            Name = "Content",
                            RichText = true,
                            AutomaticSize = Enum.AutomaticSize.Y,
                            TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].TextDark,
                            TextWrapped = true
                        }
                    ),
                    (NotificationConfig.Closable) and
                        SetChildren(
                            SetProps(
                                MakeElement("Button"),
                                {
                                    Size = UDim2.new(0, 24, 0, 24),
                                    Position = UDim2.new(1, -8, 0, 6),
                                    AnchorPoint = Vector2.new(1, 0),
                                    BackgroundTransparency = 1,
                                    Name = "CloseBtn"
                                }
                            ),
                            {
                                SetProps(
                                    MakeElement("Image", "rbxassetid://7072725342"),
                                    {
                                        Size = UDim2.new(0, 14, 0, 14),
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

            if not OrionLib.ActiveNotifications then
                OrionLib.ActiveNotifications = {}
            end
            table.insert(OrionLib.ActiveNotifications, NotificationFrame)

            if NotificationFrame then
                TweenService:Create(
                    NotificationFrame,
                    TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 0, 0, 0)}
                ):Play()

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
                        NotificationFrame,
                        TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
                        {Position = UDim2.new(1, 20, 0, 0)}
                    ):Play()
                    TweenService:Create(
                        NotificationFrame,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quint),
                        {BackgroundTransparency = 0.6}
                    ):Play()
                    wait(0.3)
                    NotificationFrame:Destroy()
                end

                if NotificationConfig.Closable then
                    local closeBtn = NotificationFrame:FindFirstChild("CloseBtn")
                    if closeBtn then
                        AddConnection(closeBtn.MouseButton1Click, CloseNotification)
                        AddConnection(
                            closeBtn.MouseEnter,
                            function()
                                local img = closeBtn:FindFirstChildOfClass("ImageLabel")
                                if img then
                                    TweenService:Create(
                                        img,
                                        TweenInfo.new(0.2),
                                        {ImageColor3 = Color3.fromRGB(255, 100, 100)}
                                    ):Play()
                                end
                            end
                        )
                        AddConnection(
                            closeBtn.MouseLeave,
                            function()
                                local img = closeBtn:FindFirstChildOfClass("ImageLabel")
                                if img then
                                    TweenService:Create(
                                        img,
                                        TweenInfo.new(0.2),
                                        {ImageColor3 = Color3.fromRGB(150, 150, 150)}
                                    ):Play()
                                end
                            end
                        )
                    end
                end

                if NotificationConfig.Time > 0 then
                    task.wait(NotificationConfig.Time - 0.5)
                    if not closeRequested then
                        CloseNotification()
                    end
                end
            end
        end
    )
end

local notificationName = "Configuration"
local userContent = "Auto-loaded configuration for the game"

function OrionLib:SetTheme()
    for Name, Type in pairs(OrionLib.ThemeObjects) do
        for _, Object in pairs(Type) do
            Object[ReturnProperty(Object)] = OrionLib.Themes[OrionLib.SelectedTheme][Name]
        end
    end

    self:UpdateNotificationsTheme()

    pcall(function()
        if not (writefile and isfolder and makefolder) then return end
        local folder = OrionLib.Folder
        if not folder or folder == "" then return end
        if not isfolder(folder) then makefolder(folder) end
        writefile(folder .. "/theme.txt", OrionLib.SelectedTheme)
    end)
end

function OrionLib:Init()
    if not OrionLib.SaveCfg then return end
    local folder = OrionLib.Folder
    if not folder or folder == "" then return end

    task.delay(1, function()
        pcall(function()
            if not (isfile and readfile) then return end
            local themePath = folder .. "/theme.txt"
            if isfile(themePath) then
                local savedTheme = readfile(themePath)
                if savedTheme and OrionLib.Themes[savedTheme] then
                    OrionLib.SelectedTheme = savedTheme
                    OrionLib:SetTheme()
                end
            end
        end)
    end)

    task.delay(0.5, function()
        pcall(function()
            if not (isfile and readfile) then return end
            local filePath = folder .. "/" .. tostring(game.PlaceId) .. ".txt"
            if not isfile(filePath) then return end
            local content = readfile(filePath)
            if not content or content == "" then return end

            local success, Data = pcall(function()
                return HttpService:JSONDecode(content)
            end)
            if not success or type(Data) ~= "table" then return end

            local pending = {}
            for flagName, value in pairs(Data) do
                pending[flagName] = value
            end

            local function applyAll()
                local remaining = {}
                for flagName, value in pairs(pending) do
                    local flag = OrionLib.Flags[flagName]
                    if flag and type(flag) == "table" and flag.Type then
                        pcall(function()
                            if flag.Type == "Colorpicker" then
                                if type(value) == "table" and value.R then
                                    flag:Set(UnpackColor(value))
                                end
                            elseif flag.Type == "Slider" then
                                local n = tonumber(value)
                                if n then flag:Set(n) end
                            elseif flag.Type == "Toggle" then
                                flag:Set(value == true or value == "true")
                            elseif flag.Type == "Dropdown" then
                                flag:Set(tostring(value))
                            elseif flag.Type == "MultiDropdown" then
                                local list = {}
                                if type(value) == "table" then
                                    for k, v in pairs(value) do
                                        if type(k) == "number" then
                                            table.insert(list, tostring(v))
                                        elseif v == true then
                                            table.insert(list, tostring(k))
                                        end
                                    end
                                end
                                flag:Set(list)
                            elseif flag.Type == "Bind" then
                                local keyStr = tostring(value)
                                local key = Enum.KeyCode[keyStr] or Enum.UserInputType[keyStr]
                                if key then flag:Set(key) end
                            end
                        end)
                    else
                        remaining[flagName] = value
                    end
                end
                pending = remaining
            end

            applyAll()

            if next(pending) then
                task.delay(1, function()
                    applyAll()
                    if next(pending) then
                        task.delay(2, function()
                            applyAll()
                            if next(pending) then
                                task.delay(3, applyAll)
                            end
                        end)
                    end
                end)
            end

            OrionLib:MakeNotification({
                Name    = "Configuration",
                Content = "Config loaded successfully.",
                Time    = 4
            })
        end)
    end)
end

function OrionLib:MakeWindow(WindowConfig)
    local FirstTab = true
    local Minimized = false
    local Loaded = false
    local UIHidden = false
    local TabAnimIndex = 0

    WindowConfig = WindowConfig or {}
    WindowConfig.ConfigFolder = WindowConfig.ConfigFolder or WindowConfig.Name
    WindowConfig.SaveConfig = WindowConfig.SaveConfig or false
    WindowConfig.HidePremium = WindowConfig.HidePremium or false
    if WindowConfig.IntroEnabled == nil then
        WindowConfig.IntroEnabled = true
    end
    WindowConfig.IntroText = WindowConfig.IntroText or "Welcome"
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
        if makefolder then
            if not (isfolder and isfolder(WindowConfig.ConfigFolder)) then
                makefolder(WindowConfig.ConfigFolder)
            end
        end
    end)
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
                ClearTextOnFocus = clearOnFocus
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

    OrionLib.MainWindow = MainWindow

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
            if OrionLib.ConfirmDialogOpen then return end
            OrionLib.ConfirmDialogOpen = true

            if Minimized then
                Minimized = false
                MainWindow.ClipsDescendants = false
                WindowTopBarLine.Visible = true
                MinimizeBtn.Ico.Image = "rbxassetid://7072719338"
                WindowStuff.Visible = true
                TweenService:Create(MainWindow, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 615, 0, 344)
                }):Play()
                task.wait(0.25)
            end

            local Overlay = Instance.new("Frame")
            Overlay.Name = "ConfirmDialog"
            Overlay.Size = UDim2.new(1, 0, 1, 0)
            Overlay.Position = UDim2.new(0, 0, 0, 0)
            Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Overlay.BackgroundTransparency = 1
            Overlay.BorderSizePixel = 0
            Overlay.ZIndex = 20
            Overlay.Parent = MainWindow

            local Card = Instance.new("Frame")
            Card.Name = "Card"
            Card.Size = UDim2.new(0, 260, 0, 138)
            Card.Position = UDim2.new(0.5, 0, 0.5, 0)
            Card.AnchorPoint = Vector2.new(0.5, 0.5)
            Card.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
            Card.BackgroundTransparency = 1
            Card.BorderSizePixel = 0
            Card.ZIndex = 21
            Card.ClipsDescendants = false
            Card.Parent = Overlay
            Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 14)

            local CardStroke = Instance.new("UIStroke")
            CardStroke.Color = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
            CardStroke.Thickness = 1.2
            CardStroke.Transparency = 1
            CardStroke.Parent = Card

            local Icon = Instance.new("ImageLabel")
            Icon.Size = UDim2.new(0, 20, 0, 20)
            Icon.Position = UDim2.new(0, 16, 0, 16)
            Icon.BackgroundTransparency = 1
            Icon.Image = "rbxassetid://7072725342"
            Icon.ImageColor3 = Color3.fromRGB(210, 70, 70)
            Icon.ImageTransparency = 1
            Icon.ZIndex = 22
            Icon.Parent = Card

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(1, -52, 0, 20)
            Title.Position = UDim2.new(0, 44, 0, 15)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.TextSize = 15
            Title.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text
            Title.TextTransparency = 1
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Text = "Close Interface"
            Title.ZIndex = 22
            Title.Parent = Card

            local Divider = Instance.new("Frame")
            Divider.Size = UDim2.new(1, -32, 0, 1)
            Divider.Position = UDim2.new(0, 16, 0, 44)
            Divider.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Divider
            Divider.BackgroundTransparency = 1
            Divider.BorderSizePixel = 0
            Divider.ZIndex = 22
            Divider.Parent = Card

            local Desc = Instance.new("TextLabel")
            Desc.Size = UDim2.new(1, -32, 0, 30)
            Desc.Position = UDim2.new(0, 16, 0, 52)
            Desc.BackgroundTransparency = 1
            Desc.Font = Enum.Font.Gotham
            Desc.TextSize = 12
            Desc.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].TextDark
            Desc.TextTransparency = 1
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.TextWrapped = true
            Desc.Text = "Are you sure you want to close the interface?"
            Desc.ZIndex = 22
            Desc.Parent = Card

            local BtnClose = Instance.new("Frame")
            BtnClose.Name = "BtnClose"
            BtnClose.Size = UDim2.new(0.5, -20, 0, 32)
            BtnClose.Position = UDim2.new(0, 12, 1, -44)
            BtnClose.BackgroundColor3 = Color3.fromRGB(190, 45, 45)
            BtnClose.BackgroundTransparency = 1
            BtnClose.BorderSizePixel = 0
            BtnClose.ZIndex = 22
            BtnClose.Parent = Card
            Instance.new("UICorner", BtnClose).CornerRadius = UDim.new(0, 8)

            local BtnCloseLbl = Instance.new("TextLabel")
            BtnCloseLbl.Size = UDim2.new(1, 0, 1, 0)
            BtnCloseLbl.BackgroundTransparency = 1
            BtnCloseLbl.Font = Enum.Font.GothamBold
            BtnCloseLbl.TextSize = 13
            BtnCloseLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnCloseLbl.TextTransparency = 1
            BtnCloseLbl.Text = "Close"
            BtnCloseLbl.ZIndex = 23
            BtnCloseLbl.Parent = BtnClose

            local BtnCloseClick = Instance.new("TextButton")
            BtnCloseClick.Size = UDim2.new(1, 0, 1, 0)
            BtnCloseClick.BackgroundTransparency = 1
            BtnCloseClick.Text = ""
            BtnCloseClick.ZIndex = 24
            BtnCloseClick.Parent = BtnClose

            local BtnCancel = Instance.new("Frame")
            BtnCancel.Name = "BtnCancel"
            BtnCancel.Size = UDim2.new(0.5, -20, 0, 32)
            BtnCancel.Position = UDim2.new(0.5, 8, 1, -44)
            BtnCancel.BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Main
            BtnCancel.BackgroundTransparency = 1
            BtnCancel.BorderSizePixel = 0
            BtnCancel.ZIndex = 22
            BtnCancel.Parent = Card
            Instance.new("UICorner", BtnCancel).CornerRadius = UDim.new(0, 8)

            local BtnCancelStroke = Instance.new("UIStroke")
            BtnCancelStroke.Color = OrionLib.Themes[OrionLib.SelectedTheme].Stroke
            BtnCancelStroke.Thickness = 1.2
            BtnCancelStroke.Transparency = 1
            BtnCancelStroke.Parent = BtnCancel

            local BtnCancelLbl = Instance.new("TextLabel")
            BtnCancelLbl.Size = UDim2.new(1, 0, 1, 0)
            BtnCancelLbl.BackgroundTransparency = 1
            BtnCancelLbl.Font = Enum.Font.GothamBold
            BtnCancelLbl.TextSize = 13
            BtnCancelLbl.TextColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Text
            BtnCancelLbl.TextTransparency = 1
            BtnCancelLbl.Text = "Cancel"
            BtnCancelLbl.ZIndex = 23
            BtnCancelLbl.Parent = BtnCancel

            local BtnCancelClick = Instance.new("TextButton")
            BtnCancelClick.Size = UDim2.new(1, 0, 1, 0)
            BtnCancelClick.BackgroundTransparency = 1
            BtnCancelClick.Text = ""
            BtnCancelClick.ZIndex = 24
            BtnCancelClick.Parent = BtnCancel

            local function playOpen()
                local easeOut = TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                local fade    = TweenInfo.new(0.2,  Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

                TweenService:Create(Overlay, fade, { BackgroundTransparency = 0.52 }):Play()
                Card.Size = UDim2.new(0, 230, 0, 120)
                TweenService:Create(Card, easeOut, { Size = UDim2.new(0, 260, 0, 138), BackgroundTransparency = 0 }):Play()
                TweenService:Create(CardStroke, fade, { Transparency = 0 }):Play()

                task.delay(0.1, function()
                    TweenService:Create(Icon,    fade, { ImageTransparency = 0 }):Play()
                    TweenService:Create(Title,   fade, { TextTransparency = 0 }):Play()
                    TweenService:Create(Divider, fade, { BackgroundTransparency = 0.4 }):Play()
                    TweenService:Create(Desc,    fade, { TextTransparency = 0 }):Play()
                    TweenService:Create(BtnClose,  easeOut, { BackgroundTransparency = 0 }):Play()
                    TweenService:Create(BtnCloseLbl, fade,  { TextTransparency = 0 }):Play()
                    TweenService:Create(BtnCancel,   easeOut, { BackgroundTransparency = 0 }):Play()
                    TweenService:Create(BtnCancelStroke, fade, { Transparency = 0 }):Play()
                    TweenService:Create(BtnCancelLbl, fade,   { TextTransparency = 0 }):Play()
                end)
            end

            local function playClose()
                local easeIn = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
                local fade   = TweenInfo.new(0.12)

                TweenService:Create(Overlay,  easeIn, { BackgroundTransparency = 1 }):Play()
                TweenService:Create(Card,     easeIn, { Size = UDim2.new(0, 230, 0, 120), BackgroundTransparency = 1 }):Play()
                TweenService:Create(CardStroke,      fade, { Transparency = 1 }):Play()
                TweenService:Create(Icon,            fade, { ImageTransparency = 1 }):Play()
                TweenService:Create(Title,           fade, { TextTransparency = 1 }):Play()
                TweenService:Create(Divider,         fade, { BackgroundTransparency = 1 }):Play()
                TweenService:Create(Desc,            fade, { TextTransparency = 1 }):Play()
                TweenService:Create(BtnClose,        fade, { BackgroundTransparency = 1 }):Play()
                TweenService:Create(BtnCloseLbl,     fade, { TextTransparency = 1 }):Play()
                TweenService:Create(BtnCancel,       fade, { BackgroundTransparency = 1 }):Play()
                TweenService:Create(BtnCancelStroke, fade, { Transparency = 1 }):Play()
                TweenService:Create(BtnCancelLbl,    fade, { TextTransparency = 1 }):Play()

                task.delay(0.2, function()
                    Overlay:Destroy()
                    OrionLib.ConfirmDialogOpen = false
                end)
            end

            BtnCloseClick.MouseEnter:Connect(function()
                TweenService:Create(BtnClose, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(215, 55, 55) }):Play()
            end)
            BtnCloseClick.MouseLeave:Connect(function()
                TweenService:Create(BtnClose, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(190, 45, 45) }):Play()
            end)
            BtnCloseClick.MouseButton1Down:Connect(function()
                TweenService:Create(BtnClose, TweenInfo.new(0.08), { BackgroundColor3 = Color3.fromRGB(160, 35, 35) }):Play()
            end)
            BtnCloseClick.MouseButton1Click:Connect(function()
                playClose()
                task.delay(0.2, function()
                    UIHidden = true
                    TweenService:Create(MainWindow, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                        Size = UDim2.new(0, 0, 0, 0),
                        BackgroundTransparency = 1
                    }):Play()
                    task.delay(0.4, function()
                        MainWindow.Visible = false
                        MainWindow.Size = UDim2.new(0, 615, 0, 344)
                        MainWindow.BackgroundTransparency = 0
                        if UserInputService.TouchEnabled then
                            MobileIcon.Visible = true
                        end
                        OrionLib:MakeNotification({
                            Name    = "Interface Closed",
                            Content = string.format("Press <b>%s</b> or tap the icon to reopen.", _currentKey.Name),
                            Time    = 5
                        })
                        if OrionLib.MinimizeGUI and OrionLib.MinimizeGUI.Parent then
                            OrionLib.MinimizeGUI:Destroy()
                            OrionLib.MinimizeGUI = nil
                        end
                        WindowConfig.CloseCallback()
                    end)
                end)
            end)

            BtnCancelClick.MouseEnter:Connect(function()
                TweenService:Create(BtnCancel, TweenInfo.new(0.15), { BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second }):Play()
            end)
            BtnCancelClick.MouseLeave:Connect(function()
                TweenService:Create(BtnCancel, TweenInfo.new(0.15), { BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Main }):Play()
            end)
            BtnCancelClick.MouseButton1Down:Connect(function()
                TweenService:Create(BtnCancel, TweenInfo.new(0.08), { BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Divider }):Play()
            end)
            BtnCancelClick.MouseButton1Click:Connect(function()
                playClose()
            end)

            playOpen()
        end
    )

    AddConnection(
    UserInputService.InputBegan,
    function(Input)
        if Input.KeyCode == _currentKey then
            MobileIcon.Visible = false
            MainWindow.Visible = not MainWindow.Visible
            if MainWindow.Visible then
                MainWindow.Position = UDim2.new(0.5, -307, 0.5, -172)
                MainWindow.AnchorPoint = Vector2.new(0, 0)
            end
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
wait(0.3)
LoadSequenceLogo:Destroy()
LoadSequenceText:Destroy()

MainWindow.Size = UDim2.new(0, 400, 0, 200)
MainWindow.Position = UDim2.new(0.5, 0, 0.5, 0)
MainWindow.AnchorPoint = Vector2.new(0.5, 0.5)
MainWindow.BackgroundTransparency = 1
MainWindow.Visible = true

-- Animacao abrir library

TweenService:Create(
    MainWindow,
    TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0, 0.15),
    {
        Size = UDim2.new(0, 615, 0, 344),
        BackgroundTransparency = 0
    }
):Play()

task.wait(0.1)

------------

for _, child in ipairs(MainWindow:GetChildren()) do
    if child:IsA("GuiObject") then
        local origT = child.BackgroundTransparency
        child.BackgroundTransparency = 1
        TweenService:Create(child, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundTransparency = origT
        }):Play()
    end
end
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

--[[

-- animacao aparicao das tabelas na lista

TabAnimIndex = TabAnimIndex + 1
local myIndex = TabAnimIndex
local isFirstTab = (myIndex == 1)
local currentId = tick()
TabFrame:SetAttribute("AnimId", currentId)

TabFrame.Ico.ImageTransparency = 1
TabFrame.Title.TextTransparency = 1
TabFrame.Ico.Position = UDim2.new(0, 4, 0.5, 0)
TabFrame.Title.Position = UDim2.new(0, 29, 0, 0)

task.spawn(function()
    local introWait = WindowConfig.IntroEnabled and 2.5 or 0
    task.wait(introWait + (myIndex - 1) * 0.015)

    if not TabFrame or not TabFrame.Parent then return end
    if TabFrame:GetAttribute("AnimId") ~= currentId then return end

    local ico = TabFrame:FindFirstChild("Ico")
    local title = TabFrame:FindFirstChild("Title")
    if not ico or not title then return end

    local targetIco   = isFirstTab and 0 or 0.4
    local targetTitle = isFirstTab and 0 or 0.4

    local tweenInfo = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

    TweenService:Create(ico, tweenInfo, {
        ImageTransparency = targetIco,
        Position = UDim2.new(0, 10, 0.5, 0)
    }):Play()

    TweenService:Create(title, tweenInfo, {
        TextTransparency = targetTitle,
        Position = UDim2.new(0, 35, 0, 0)
    }):Play()
end)

--]]

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
                        Name = "ItemContainer",
                        AutomaticCanvasSize = Enum.AutomaticSize.Y,
                        CanvasSize = UDim2.new(0, 0, 0, 0)
                    }
                ),
                {
                    MakeElement("List", 0, 6),
                    MakeElement("Padding", 10, 10, 10, 10)
                }
            ),
            "Divider"
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
                TweenService:Create(Tab.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.4}):Play()
                TweenService:Create(Tab.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0.4}):Play()
            end
        end
        for _, ItemContainer in next, MainWindow:GetChildren() do
            if ItemContainer.Name == "ItemContainer" then
                ItemContainer.Visible = false
            end
        end
        TweenService:Create(TabFrame.Ico, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
        TweenService:Create(TabFrame.Title, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        TabFrame.Title.Font = Enum.Font.GothamBlack
        Container.Visible = true

        local children = {}
        for _, child in ipairs(Container:GetChildren()) do
            if child:IsA("GuiObject") and not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
                table.insert(children, child)
            end
        end

        for i, child in ipairs(children) do
            local origBG = child:GetAttribute("OriginalBGTransparency") or child.BackgroundTransparency
            child.BackgroundTransparency = 1

            local subs = {}
            for _, sub in ipairs(child:GetChildren()) do
                if sub:IsA("TextLabel") or sub:IsA("TextButton") then
                    subs[sub] = {prop = "TextTransparency", orig = sub.TextTransparency}
                    sub.TextTransparency = 1
                elseif sub:IsA("ImageLabel") or sub:IsA("ImageButton") then
                    subs[sub] = {prop = "ImageTransparency", orig = sub.ImageTransparency}
                    sub.ImageTransparency = 1
                elseif sub:IsA("UIStroke") then
                    subs[sub] = {prop = "Transparency", orig = sub.Transparency}
                    sub.Transparency = 1
                end
            end

            task.delay((i - 1) * 0.05, function()
                if not child or not child.Parent then return end
                TweenService:Create(child, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    BackgroundTransparency = origBG
                }):Play()
                for sub, data in pairs(subs) do
                    if sub and sub.Parent then
                        TweenService:Create(sub, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                            [data.prop] = data.orig
                        }):Play()
                    end
                end
            end)
        end
    end
)

        local function GetElements(ItemParent)
            local ElementFunction = {}

--> Element Log <--

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

--> Element Label <--

function ElementFunction:AddLabel(Text)
	local LabelFrame = AddThemeObject(
		SetChildren(
			SetProps(
				MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
				{
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 0.7,
					Parent = ItemParent,
					ClipsDescendants = false
				}
			),
			{
				AddThemeObject(
					SetProps(
						MakeElement("Label", Text, 15),
						{
							Size = UDim2.new(1, -24, 0, 0),
							Position = UDim2.new(0, 12, 0, 8),
							Font = Enum.Font.GothamBold,
							Name = "Content",
							RichText = true,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							AutomaticSize = Enum.AutomaticSize.Y
						}
					),
					"Text"
				),
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				Create("UIPadding", {
					PaddingBottom = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 0),
					PaddingLeft = UDim.new(0, 0),
					PaddingRight = UDim.new(0, 0)
				})
			}
		),
		"Second"
	)

	LabelFrame:SetAttribute("OriginalBGTransparency", 0.7)

	local LabelFunction = {}

	function LabelFunction:Set(ToChange)
		LabelFrame.Content.Text = ToChange
	end

	return LabelFunction
end

--> Element Censored Label <--

function ElementFunction:AddCensoredLabel(config)
	config = config or {}
	local name = config.Name or "Label"
	local default = config.Default or false
	local flag = config.Flag or nil
	local callback = config.Callback or function() end

	local Censored = default

	local LabelFrame = AddThemeObject(
		SetChildren(
			SetProps(
				MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
				{
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundTransparency = 0.7,
					Parent = ItemParent,
					ClipsDescendants = false
				}
			),
			{
				AddThemeObject(
					SetProps(
						MakeElement("Label", "", 15),
						{
							Size = UDim2.new(1, -50, 0, 0),
							Position = UDim2.new(0, 12, 0, 8),
							Font = Enum.Font.GothamBold,
							Name = "Content",
							RichText = true,
							TextWrapped = true,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextYAlignment = Enum.TextYAlignment.Top,
							AutomaticSize = Enum.AutomaticSize.Y
						}
					),
					"Text"
				),
				AddThemeObject(MakeElement("Stroke"), "Stroke"),
				Create("UIPadding", {
					PaddingBottom = UDim.new(0, 10),
					PaddingTop = UDim.new(0, 0),
					PaddingLeft = UDim.new(0, 0),
					PaddingRight = UDim.new(0, 0)
				}),
				Create("ImageButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 20, 0, 20),
					Position = UDim2.new(1, -30, 0, 8),
					AnchorPoint = Vector2.new(0, 0),
					Image = "rbxassetid://98532545076990",
					Name = "EyeButton"
				})
			}
		),
		"Second"
	)

	LabelFrame:SetAttribute("OriginalBGTransparency", 0.7)

	local ContentLabel = LabelFrame:FindFirstChild("Content")
	local EyeButton = LabelFrame:FindFirstChild("EyeButton")

	if not ContentLabel or not EyeButton then return {} end

	local function UpdateDisplay()
		if Censored then
			local len = utf8.len(name) or #name
			ContentLabel.Text = string.rep("•", len)
		else
			ContentLabel.Text = name
		end
		EyeButton.Image = Censored
			and "rbxassetid://118874626203509"
			or "rbxassetid://98532545076990"
	end

	EyeButton.MouseButton1Click:Connect(function()
		Censored = not Censored
		UpdateDisplay()
		if flag then OrionLib.Flags[flag] = Censored end
		callback(Censored)
		SaveCfg(game.PlaceId)
	end)

	UpdateDisplay()
	if flag then OrionLib.Flags[flag] = Censored end

	local LabelFunction = {}

	function LabelFunction:Set(ToChange)
		name = ToChange
		UpdateDisplay()
	end

	function LabelFunction:SetCensored(state)
		Censored = state
		UpdateDisplay()
		if flag then OrionLib.Flags[flag] = Censored end
		callback(Censored)
		SaveCfg(game.PlaceId)
	end

	function LabelFunction:GetCensored()
		return Censored
	end

	return LabelFunction
end

--> Element Paragraph <--

function ElementFunction:AddParagraph(Title, Content)
                Title = Title or "Paragraph"
                Content = Content or ""

                local Container =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 0),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Parent = ItemParent,
                                ClipsDescendants = true
                            }
                        ),
                        {
                            SetChildren(
                                SetProps(
                                    MakeElement("TFrame"),
                                    {
                                        Size = UDim2.new(1, -12, 0, 0),
                                        Position = UDim2.new(0, 12, 0, 12),
                                        BackgroundTransparency = 1,
                                        Name = "ContentArea",
                                        AutomaticSize = Enum.AutomaticSize.Y
                                    }
                                ),
                                {
                                    AddThemeObject(
                                        SetProps(
                                            MakeElement("Label", Title, 15),
                                            {
                                                Size = UDim2.new(1, 0, 0, 0),
                                                Font = Enum.Font.GothamBold,
                                                Name = "Title",
                                                RichText = true,
                                                TextWrapped = true,
                                                TextYAlignment = Enum.TextYAlignment.Top,
                                                AutomaticSize = Enum.AutomaticSize.Y
                                            }
                                        ),
                                        "Text"
                                    ),
                                    AddThemeObject(
                                        SetProps(
                                            MakeElement("Label", Content, 13),
                                            {
                                                Size = UDim2.new(1, 0, 0, 0),
                                                Position = UDim2.new(0, 0, 0, 0),
                                                Font = Enum.Font.Gotham,
                                                Name = "Content",
                                                RichText = true,
                                                TextWrapped = true,
                                                TextXAlignment = Enum.TextXAlignment.Left,
                                                TextYAlignment = Enum.TextYAlignment.Top,
                                                AutomaticSize = Enum.AutomaticSize.Y
                                            }
                                        ),
                                        "TextDark"
                                    )
                                }
                            ),
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Second"
                )

                local titleLabel = Container.ContentArea.Title
                local contentLabel = Container.ContentArea.Content

                local function updateLayout()
                    local titleHeight = titleLabel.AbsoluteSize.Y
                    local contentHeight = contentLabel.AbsoluteSize.Y
                    local totalHeight = titleHeight + contentHeight + 8

                    Container.ContentArea.Size = UDim2.new(1, -12, 0, totalHeight)
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

                local Click =
                    SetProps(
                    MakeElement("Button"),
                    {
                        Size = UDim2.new(1, 0, 1, 0)
                    }
                )

                local ButtonFrame =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                            {
                                Size = UDim2.new(1, 0, 0, 33),
                                Parent = ItemParent
                            }
                        ),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", ButtonConfig.Name, 15),
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
                                    MakeElement("Image", ButtonConfig.Icon),
                                    {
                                        Size = UDim2.new(0, 20, 0, 20),
                                        Position = UDim2.new(1, -30, 0, 7)
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

                AddConnection(
                    Click.MouseEnter,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
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
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {
                                BackgroundColor3 = Color3.fromRGB(
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                                    OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
                                )
                            }
                        ):Play()
                        spawn(
                            function()
                                ButtonConfig.Callback()
                            end
                        )
                    end
                )

                AddConnection(
                    Click.MouseButton1Down,
                    function()
                        TweenService:Create(
                            ButtonFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
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

--> Element Toggle <--

function ElementFunction:AddToggle(ToggleConfig)
    ToggleConfig = ToggleConfig or {}
    ToggleConfig.Name = ToggleConfig.Name or "Toggle"
    ToggleConfig.Default = ToggleConfig.Default or false
    ToggleConfig.Callback = ToggleConfig.Callback or function() end
    ToggleConfig.Color = ToggleConfig.Color or Color3.fromRGB(9, 99, 195)
    ToggleConfig.Flag = ToggleConfig.Flag or nil
    ToggleConfig.Save = ToggleConfig.Save or false

    local Toggle = {Value = ToggleConfig.Default, Save = ToggleConfig.Save, Type = "Toggle"}

    local Click = SetProps(MakeElement("Button"), {Size = UDim2.new(1, 0, 1, 0)})

    local ToggleBox = SetChildren(
        SetProps(MakeElement("RoundFrame", ToggleConfig.Color, 0, 4), {
            Size = UDim2.new(0, 24, 0, 24),
            Position = UDim2.new(1, -24, 0.5, 0),
            AnchorPoint = Vector2.new(0.5, 0.5)
        }),
        {
            SetProps(MakeElement("Stroke"), {
                Color = ToggleConfig.Color,
                Name = "Stroke",
                Transparency = 0.5
            }),
            SetProps(MakeElement("Image", "rbxassetid://3944680095"), {
                Size = UDim2.new(0, 20, 0, 20),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Name = "Ico"
            })
        }
    )

    local ToggleFrame = AddThemeObject(
        SetChildren(
            SetProps(MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5), {
                Size = UDim2.new(1, 0, 0, 38),
                Parent = ItemParent
            }),
            {
                AddThemeObject(SetProps(MakeElement("Label", ToggleConfig.Name, 15), {
                    Size = UDim2.new(1, -12, 1, 0),
                    Position = UDim2.new(0, 12, 0, 0),
                    Font = Enum.Font.GothamBold,
                    Name = "Content"
                }), "Text"),
                AddThemeObject(MakeElement("Stroke"), "Stroke"),
                ToggleBox,
                Click
            }
        ),
        "Second"
    )

    function Toggle:Set(Value)
        Toggle.Value = Value
        TweenService:Create(ToggleBox, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = Toggle.Value and ToggleConfig.Color or OrionLib.Themes[OrionLib.SelectedTheme].Divider
        }):Play()
        TweenService:Create(ToggleBox.Stroke, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Color = Toggle.Value and ToggleConfig.Color or OrionLib.Themes[OrionLib.SelectedTheme].Stroke
        }):Play()
        TweenService:Create(ToggleBox.Ico, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            ImageTransparency = Toggle.Value and 0 or 1,
            Size = Toggle.Value and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 8, 0, 8)
        }):Play()
        ToggleConfig.Callback(Toggle.Value)
    end

    Toggle:Set(Toggle.Value)

    AddConnection(Click.MouseEnter, function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(
                OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
            )
        }):Play()
    end)

    AddConnection(Click.MouseLeave, function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second
        }):Play()
    end)

    AddConnection(Click.MouseButton1Up, function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(
                OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 3,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 3,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 3
            )
        }):Play()
        SaveCfg(game.PlaceId)
        Toggle:Set(not Toggle.Value)
    end)

    AddConnection(Click.MouseButton1Down, function()
        TweenService:Create(ToggleFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            BackgroundColor3 = Color3.fromRGB(
                OrionLib.Themes[OrionLib.SelectedTheme].Second.R * 255 + 6,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.G * 255 + 6,
                OrionLib.Themes[OrionLib.SelectedTheme].Second.B * 255 + 6
            )
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
    SliderConfig.Callback = SliderConfig.Callback or function() end
    SliderConfig.ValueName = SliderConfig.ValueName or ""
    SliderConfig.Color = SliderConfig.Color or OrionLib.Themes[OrionLib.SelectedTheme].Stroke
    SliderConfig.Flag = SliderConfig.Flag or nil
    SliderConfig.Save = SliderConfig.Save or false

    local Slider = {Value = SliderConfig.Default, Save = SliderConfig.Save, Type = "Slider"}
    local Dragging = false

    local SliderDrag = SetProps(
        MakeElement("RoundFrame", SliderConfig.Color, 0, 4),
        {
            Size = UDim2.new(0, 0, 1, 0),
            BackgroundTransparency = 0.25,
            ClipsDescendants = true,
            ZIndex = 2
        }
    )

    local SliderBar = SetChildren(
        SetProps(
            MakeElement("RoundFrame", SliderConfig.Color, 0, 4),
            {
                Size = UDim2.new(1, -24, 0, 20),
                Position = UDim2.new(0, 12, 0, 40),
                BackgroundTransparency = 0.85
            }
        ),
        {
            SetProps(MakeElement("Stroke"), {Color = SliderConfig.Color, Thickness = 1}),
            SliderDrag
        }
    )

    local ValueContainer = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 4),
                {
                    Size = UDim2.new(0, 52, 0, 22),
                    Position = UDim2.new(1, -12, 0, 9),
                    AnchorPoint = Vector2.new(1, 0),
                    BackgroundTransparency = 0.88,
                    ClipsDescendants = true
                }
            ),
            {
                SetProps(MakeElement("Stroke"), {Color = SliderConfig.Color, Thickness = 1}),
                AddThemeObject(
                    SetProps(
                        MakeElement("Label", tostring(SliderConfig.Default) .. " " .. SliderConfig.ValueName, 12),
                        {
                            Size = UDim2.new(1, -6, 1, 0),
                            Position = UDim2.new(0, 3, 0, 0),
                            Font = Enum.Font.GothamBold,
                            Name = "ValueLabel",
                            BackgroundTransparency = 1,
                            TextXAlignment = Enum.TextXAlignment.Center
                        }
                    ),
                    "Text"
                ),
                Create("TextBox", {
                    Size = UDim2.new(1, -6, 1, 0),
                    Position = UDim2.new(0, 3, 0, 0),
                    BackgroundTransparency = 1,
                    TextColor3 = Color3.fromRGB(240, 240, 240),
                    PlaceholderColor3 = Color3.fromRGB(150, 150, 150),
                    PlaceholderText = "0",
                    Font = Enum.Font.GothamBold,
                    TextSize = 12,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    ClearTextOnFocus = false,
                    Visible = false,
                    Name = "ValueBox"
                })
            }
        ),
        "Second"
    )

    local SliderFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 5),
                {
                    Size = UDim2.new(1, 0, 0, 68),
                    Parent = ItemParent
                }
            ),
            {
                AddThemeObject(
                    SetProps(
                        MakeElement("Label", SliderConfig.Name, 14),
                        {
                            Size = UDim2.new(1, -70, 0, 20),
                            Position = UDim2.new(0, 12, 0, 11),
                            Font = Enum.Font.GothamBold,
                            Name = "Content",
                            TextYAlignment = Enum.TextYAlignment.Center
                        }
                    ),
                    "Text"
                ),
                AddThemeObject(MakeElement("Stroke"), "Stroke"),
                SliderBar,
                ValueContainer
            }
        ),
        "Second"
    )

    local ValueLabel = ValueContainer.ValueLabel
    local ValueBox = ValueContainer.ValueBox

    local function UpdateDisplay(value)
        local display = tostring(value) .. (SliderConfig.ValueName ~= "" and " " .. SliderConfig.ValueName or "")
        ValueLabel.Text = display
        ValueBox.Text = tostring(value)
    end

    local function SwapToEdit()
        ValueLabel.Visible = false
        ValueBox.Visible = true
        ValueBox.Text = tostring(Slider.Value)
        ValueBox:CaptureFocus()
    end

    local function SwapToLabel()
        ValueLabel.Visible = true
        ValueBox.Visible = false
    end

    AddConnection(ValueLabel.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            SwapToEdit()
        end
    end)

    AddConnection(ValueBox.FocusLost, function()
        local text = ValueBox.Text:gsub("[^%d%-%.]", "")
        local num = tonumber(text)
        if num then
            num = math.clamp(Round(num, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
            Slider:Set(num)
            SaveCfg(game.PlaceId)
        else
            UpdateDisplay(Slider.Value)
        end
        SwapToLabel()
    end)

    AddConnection(SliderBar.InputBegan, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            local scale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
            Slider:Set(SliderConfig.Min + (SliderConfig.Max - SliderConfig.Min) * scale)
            SaveCfg(game.PlaceId)
            Dragging = true
        end
    end)

    AddConnection(SliderBar.InputEnded, function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Dragging = false
        end
    end)

    AddConnection(UserInputService.InputChanged, function(Input)
        if not Dragging then return end
        if Input.UserInputType ~= Enum.UserInputType.MouseMovement and Input.UserInputType ~= Enum.UserInputType.Touch then return end
        local scale = math.clamp((Input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
        Slider:Set(SliderConfig.Min + (SliderConfig.Max - SliderConfig.Min) * scale)
        SaveCfg(game.PlaceId)
    end)

    function Slider:Set(Value)
        local newValue = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
        self.Value = newValue
        local scale = (newValue - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min)
        TweenService:Create(SliderDrag, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
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

                local Click =
                    SetProps(
                    MakeElement("Button"),
                    {
                        Size = UDim2.new(1, 0, 1, 0)
                    }
                )

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

                local TextboxFrame =
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
                                    MakeElement("Label", TextboxConfig.Name, 15),
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
                            TextContainer,
                            Click
                        }
                    ),
                    "Second"
                )

                AddConnection(
                    TextboxActual:GetPropertyChangedSignal("Text"),
                    function()
                        --TextContainer.Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)
                        TweenService:Create(
                            TextContainer,
                            TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {Size = UDim2.new(0, TextboxActual.TextBounds.X + 16, 0, 24)}
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
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
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
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {BackgroundColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Second}
                        ):Play()
                    end
                )

                AddConnection(
                    Click.MouseButton1Up,
                    function()
                        TweenService:Create(
                            TextboxFrame,
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
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
                            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
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

--> Element DropDown <--

 function ElementFunction:AddDropdown(DropdownConfig)
    DropdownConfig = DropdownConfig or {}
    DropdownConfig.Name = DropdownConfig.Name or "Dropdown"
    DropdownConfig.Options = DropdownConfig.Options or {}
    DropdownConfig.Default = DropdownConfig.Default or ""
    DropdownConfig.Callback = DropdownConfig.Callback or function() end
    DropdownConfig.Flag = DropdownConfig.Flag or nil
    DropdownConfig.Save = DropdownConfig.Save or false

    local Dropdown = {
        Value = DropdownConfig.Default,
        Options = table.clone(DropdownConfig.Options),
        Buttons = {},
        Toggled = false,
        Type = "Dropdown",
        Save = DropdownConfig.Save
    }

    local MaxElements = 5
    local HeaderHeight = 38
    local RowHeight = 32
    local CategoryHeight = 24

    if not table.find(Dropdown.Options, Dropdown.Value) then
        Dropdown.Value = "..."
    end

    local DropdownList = MakeElement("List")
    DropdownList.Padding = UDim.new(0, 4)

    local DropdownContainer = AddThemeObject(
        SetProps(
            SetChildren(
                MakeElement("ScrollFrame"),
                { DropdownList }
            ),
            {
                Parent = ItemParent,
                Position = UDim2.new(0, 0, 0, HeaderHeight),
                Size = UDim2.new(1, 0, 1, -HeaderHeight),
                ClipsDescendants = true,
                BackgroundTransparency = 1,
                ScrollBarThickness = 4,
                BorderSizePixel = 0,
                AutomaticCanvasSize = Enum.AutomaticSize.None
            }
        ),
        "Divider"
    )

    local Click = SetProps(
        MakeElement("Button"),
        { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1 }
    )

    local DropdownFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("Frame"),
                {
                    Size = UDim2.new(1, 0, 0, HeaderHeight),
                    Parent = ItemParent,
                    ClipsDescendants = true
                }
            ),
            {
                DropdownContainer,
                SetProps(
                    SetChildren(
                        MakeElement("TFrame"),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", DropdownConfig.Name, 15),
                                    {
                                        Size = UDim2.new(0.6, -12, 1, 0),
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content",
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", "...", 13),
                                    {
                                        Size = UDim2.new(0.4, -40, 1, 0),
                                        Position = UDim2.new(0.6, 0, 0, 0),
                                        Font = Enum.Font.Gotham,
                                        Name = "Selected",
                                        TextXAlignment = Enum.TextXAlignment.Right,
                                        TextTruncate = Enum.TextTruncate.AtEnd
                                    }
                                ),
                                "TextDark"
                            ),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Image", "rbxassetid://7072706796"),
                                    {
                                        Size = UDim2.new(0, 20, 0, 20),
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        Position = UDim2.new(1, -30, 0.5, 0),
                                        Name = "Ico"
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
                    {
                        Size = UDim2.new(1, 0, 0, HeaderHeight),
                        ClipsDescendants = true,
                        Name = "Header"
                    }
                ),
                MakeElement("Corner", 0, 6),
                AddThemeObject(MakeElement("Stroke"), "Stroke")
            }
        ),
        "Second"
    )

    AddConnection(
        DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"),
        function()
            DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
        end
    )

    local function GetCategoryDisplayText(option)
        if type(option) ~= "string" then return option end
        local stripped = string.match(option, "^%-%-%-(.*)$")
        if stripped then
            return stripped:match("^%s*(.-)%s*$")
        end
        return option
    end

    local function IsCategory(option)
        return type(option) == "string" and string.sub(option, 1, 3) == "---"
    end

    local function ClearButtons()
        for _, v in pairs(Dropdown.Buttons) do
            if v then v:Destroy() end
        end
        table.clear(Dropdown.Buttons)
    end

    local function SetRowVisual(btn, label, isSelected, isHovered)
        local bgTarget = 1
        if isSelected then
            bgTarget = 0.7
        elseif isHovered then
            bgTarget = 0.85
        end
        local textTarget = isSelected and 0 or 0.4
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = bgTarget}):Play()
        if label then
            TweenService:Create(label, TweenInfo.new(0.15), {TextTransparency = textTarget}):Play()
        end
    end

    local function AddOptions(Options)
        for _, Option in ipairs(Options) do
            local isCat = IsCategory(Option)
            local displayText = isCat and GetCategoryDisplayText(Option) or Option

            local OptionBtn = AddThemeObject(
                SetProps(
                    SetChildren(
                        MakeElement("Button"),
                        {
                            MakeElement("Corner", 0, 6),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", displayText, 13),
                                    {
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Size = UDim2.new(1, -12, 1, 0),
                                        Name = "Title",
                                        Font = isCat and Enum.Font.GothamBold or Enum.Font.Gotham,
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    }
                                ),
                                "Text"
                            )
                        }
                    ),
                    {
                        Parent = DropdownContainer,
                        Size = UDim2.new(1, 0, 0, isCat and CategoryHeight or RowHeight),
                        BackgroundTransparency = 1,
                        AutoButtonColor = false,
                        ClipsDescendants = true
                    }
                ),
                "Divider"
            )

            local label = OptionBtn.Title

            if isCat then
                OptionBtn.Selectable = false
                SetRowVisual(OptionBtn, label, false, false)
                OptionBtn.MouseEnter:Connect(function()
                    SetRowVisual(OptionBtn, label, false, true)
                end)
                OptionBtn.MouseLeave:Connect(function()
                    SetRowVisual(OptionBtn, label, false, false)
                end)
            else
                local function updateVisual()
                    local isSelected = (Dropdown.Value == Option)
                    SetRowVisual(OptionBtn, label, isSelected, false)
                end
                updateVisual()

                OptionBtn.MouseEnter:Connect(function()
                    if Dropdown.Value ~= Option then
                        SetRowVisual(OptionBtn, label, false, true)
                    end
                end)
                OptionBtn.MouseLeave:Connect(function()
                    if Dropdown.Value ~= Option then
                        SetRowVisual(OptionBtn, label, false, false)
                    end
                end)
                AddConnection(
                    OptionBtn.MouseButton1Click,
                    function()
                        Dropdown:Set(Option)
                    end
                )
            end

            Dropdown.Buttons[Option] = OptionBtn
        end
    end

    function Dropdown:Refresh(Options, Delete)
        if Delete then
            ClearButtons()
            table.clear(Dropdown.Options)
        else
            ClearButtons()
        end
        Dropdown.Options = table.clone(Options or {})
        AddOptions(Dropdown.Options)
        Dropdown:Set(Dropdown.Value)
    end

    function Dropdown:Set(Value)
        if IsCategory(Value) then return end

        if not table.find(Dropdown.Options, Value) then
            Dropdown.Value = "..."
            DropdownFrame.Header.Selected.Text = Dropdown.Value
            for opt, btn in pairs(Dropdown.Buttons) do
                local label = btn:FindFirstChild("Title")
                SetRowVisual(btn, label, false, false)
            end
            return
        end

        Dropdown.Value = Value
        DropdownFrame.Header.Selected.Text = Value

        for opt, btn in pairs(Dropdown.Buttons) do
            local label = btn:FindFirstChild("Title")
            local isSelected = (opt == Value)
            SetRowVisual(btn, label, isSelected, false)
        end

        DropdownConfig.Callback(Dropdown.Value)

        if DropdownConfig.Flag then
            OrionLib.Flags[DropdownConfig.Flag] = Dropdown
        end

        if Dropdown.Save then
            SaveCfg(game.PlaceId)
        end
    end

    AddConnection(
        Click.MouseButton1Click,
        function()
            Dropdown.Toggled = not Dropdown.Toggled
            DropdownFrame.Header.Line.Visible = Dropdown.Toggled
            TweenService:Create(DropdownFrame.Header.Ico, TweenInfo.new(0.15), { Rotation = Dropdown.Toggled and 180 or 0 }):Play()

            local totalHeight = HeaderHeight
            if Dropdown.Toggled then
                local contentHeight = DropdownList.AbsoluteContentSize.Y
                if #Dropdown.Options > MaxElements then
                    totalHeight = HeaderHeight + (MaxElements * RowHeight)
                else
                    totalHeight = HeaderHeight + contentHeight
                end
            end
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, totalHeight) }):Play()
        end
    )

    Dropdown:Refresh(Dropdown.Options, false)
    Dropdown:Set(Dropdown.Value)

    if DropdownConfig.Flag then
        OrionLib.Flags[DropdownConfig.Flag] = Dropdown
    end

    return Dropdown
end

--> Element Multi Dropdown <--

function ElementFunction:AddMultiDropdown(DropdownConfig)
    DropdownConfig = DropdownConfig or {}
    DropdownConfig.Name = DropdownConfig.Name or "MultiDropdown"
    DropdownConfig.Options = DropdownConfig.Options or {}
    DropdownConfig.Default = DropdownConfig.Default or {}
    DropdownConfig.MaxSelections = DropdownConfig.MaxSelections or 0
    DropdownConfig.Callback = DropdownConfig.Callback or function() end
    DropdownConfig.Flag = DropdownConfig.Flag or nil
    DropdownConfig.Save = DropdownConfig.Save or false

    local Dropdown = {
        Value = {},
        Options = table.clone(DropdownConfig.Options),
        Buttons = {},
        Toggled = false,
        Type = "MultiDropdown",
        Save = DropdownConfig.Save
    }

    for _, v in ipairs(DropdownConfig.Default) do
        if table.find(DropdownConfig.Options, v) then
            Dropdown.Value[v] = true
        end
    end

    local MaxElements = 5
    local HeaderHeight = 38
    local RowHeight = 32
    local CategoryHeight = 24

    local DropdownList = MakeElement("List")
    DropdownList.Padding = UDim.new(0, 4)

    local DropdownContainer = AddThemeObject(
        SetProps(
            SetChildren(
                MakeElement("ScrollFrame"),
                { DropdownList }
            ),
            {
                Parent = ItemParent,
                Position = UDim2.new(0, 0, 0, HeaderHeight),
                Size = UDim2.new(1, 0, 1, -HeaderHeight),
                ClipsDescendants = true,
                BackgroundTransparency = 1,
                ScrollBarThickness = 4,
                BorderSizePixel = 0,
                AutomaticCanvasSize = Enum.AutomaticSize.None
            }
        ),
        "Divider"
    )

    local Click = SetProps(
        MakeElement("Button"),
        { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1 }
    )

    local DropdownFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("Frame"),
                {
                    Size = UDim2.new(1, 0, 0, HeaderHeight),
                    Parent = ItemParent,
                    ClipsDescendants = true
                }
            ),
            {
                DropdownContainer,
                SetProps(
                    SetChildren(
                        MakeElement("TFrame"),
                        {
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", DropdownConfig.Name, 15),
                                    {
                                        Size = UDim2.new(0.6, -12, 1, 0),
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Font = Enum.Font.GothamBold,
                                        Name = "Content",
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    }
                                ),
                                "Text"
                            ),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", "...", 13),
                                    {
                                        Size = UDim2.new(0.4, -40, 1, 0),
                                        Position = UDim2.new(0.6, 0, 0, 0),
                                        Font = Enum.Font.Gotham,
                                        Name = "Selected",
                                        TextXAlignment = Enum.TextXAlignment.Right,
                                        TextTruncate = Enum.TextTruncate.AtEnd
                                    }
                                ),
                                "TextDark"
                            ),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Image", "rbxassetid://7072706796"),
                                    {
                                        Size = UDim2.new(0, 20, 0, 20),
                                        AnchorPoint = Vector2.new(0, 0.5),
                                        Position = UDim2.new(1, -30, 0.5, 0),
                                        Name = "Ico"
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
                    {
                        Size = UDim2.new(1, 0, 0, HeaderHeight),
                        ClipsDescendants = true,
                        Name = "Header"
                    }
                ),
                MakeElement("Corner", 0, 6),
                AddThemeObject(MakeElement("Stroke"), "Stroke")
            }
        ),
        "Second"
    )

    AddConnection(
        DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"),
        function()
            DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
        end
    )

    local function IsCategory(option)
        return type(option) == "string" and string.sub(option, 1, 3) == "---"
    end

    local function GetCategoryDisplayText(option)
        if type(option) ~= "string" then return option end
        local stripped = string.match(option, "^%-%-%-(.*)$")
        if stripped then
            return stripped:match("^%s*(.-)%s*$")
        end
        return option
    end

    local function UpdateSelectedLabel()
        local selected = {}
        for k, v in pairs(Dropdown.Value) do
            if v then
                table.insert(selected, k)
            end
        end
        if #selected == 0 then
            DropdownFrame.Header.Selected.Text = "..."
        elseif #selected == 1 then
            DropdownFrame.Header.Selected.Text = selected[1]
        else
            DropdownFrame.Header.Selected.Text = selected[1] .. " (+" .. (#selected - 1) .. ")"
        end
    end

    local function SetRowVisual(btn, label, check, isSelected, isHovered)
        local bgTarget = isSelected and 0.7 or isHovered and 0.85 or 1
        local textTarget = isSelected and 0 or 0.4
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = bgTarget}):Play()
        if label then
            TweenService:Create(label, TweenInfo.new(0.15), {TextTransparency = textTarget}):Play()
        end
        if check then
            check.Visible = isSelected
        end
    end

    local function ClearButtons()
        for _, v in pairs(Dropdown.Buttons) do
            if v then v:Destroy() end
        end
        table.clear(Dropdown.Buttons)
    end

    local function AddOptions(Options)
        for _, Option in ipairs(Options) do
            local isCat = IsCategory(Option)
            local displayText = isCat and GetCategoryDisplayText(Option) or Option

            local checkMark = not isCat and Create("ImageLabel", {
                Size = UDim2.new(0, 14, 0, 14),
                Position = UDim2.new(1, -24, 0.5, 0),
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://3944680095",
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                Visible = Dropdown.Value[Option] == true,
                Name = "Check"
            }) or nil

            local OptionBtn = AddThemeObject(
                SetProps(
                    SetChildren(
                        MakeElement("Button"),
                        {
                            MakeElement("Corner", 0, 6),
                            AddThemeObject(
                                SetProps(
                                    MakeElement("Label", displayText, 13),
                                    {
                                        Position = UDim2.new(0, 12, 0, 0),
                                        Size = UDim2.new(1, isCat and -12 or -36, 1, 0),
                                        Name = "Title",
                                        Font = isCat and Enum.Font.GothamBold or Enum.Font.Gotham,
                                        TextXAlignment = Enum.TextXAlignment.Left
                                    }
                                ),
                                "Text"
                            ),
                            checkMark
                        }
                    ),
                    {
                        Parent = DropdownContainer,
                        Size = UDim2.new(1, 0, 0, isCat and CategoryHeight or RowHeight),
                        BackgroundTransparency = 1,
                        AutoButtonColor = false,
                        ClipsDescendants = true
                    }
                ),
                "Divider"
            )

            local label = OptionBtn.Title

            if isCat then
                OptionBtn.Selectable = false
                OptionBtn.MouseEnter:Connect(function()
                    SetRowVisual(OptionBtn, label, nil, false, true)
                end)
                OptionBtn.MouseLeave:Connect(function()
                    SetRowVisual(OptionBtn, label, nil, false, false)
                end)
            else
                local isSelected = Dropdown.Value[Option] == true
                SetRowVisual(OptionBtn, label, checkMark, isSelected, false)

                OptionBtn.MouseEnter:Connect(function()
                    if not Dropdown.Value[Option] then
                        SetRowVisual(OptionBtn, label, checkMark, false, true)
                    end
                end)
                OptionBtn.MouseLeave:Connect(function()
                    if not Dropdown.Value[Option] then
                        SetRowVisual(OptionBtn, label, checkMark, false, false)
                    end
                end)

                AddConnection(
                    OptionBtn.MouseButton1Click,
                    function()
                        local currentCount = 0
                        for _, v in pairs(Dropdown.Value) do
                            if v then
                                currentCount = currentCount + 1
                            end
                        end

                        if Dropdown.Value[Option] then
                            Dropdown.Value[Option] = nil
                            SetRowVisual(OptionBtn, label, checkMark, false, false)
                        else
                            if DropdownConfig.MaxSelections > 0 and currentCount >= DropdownConfig.MaxSelections then
                                return
                            end
                            Dropdown.Value[Option] = true
                            SetRowVisual(OptionBtn, label, checkMark, true, false)
                        end

                        UpdateSelectedLabel()
                        DropdownConfig.Callback(Dropdown:GetSelected())

                        if DropdownConfig.Flag then
                            OrionLib.Flags[DropdownConfig.Flag] = Dropdown
                        end

                        if Dropdown.Save then
                            SaveCfg(game.PlaceId)
                        end
                    end
                )
            end

            Dropdown.Buttons[Option] = OptionBtn
        end
    end

    function Dropdown:GetSelected()
        local selected = {}
        for k, v in pairs(self.Value) do
            if v then table.insert(selected, k) end
        end
        return selected
    end

    function Dropdown:Set(Values)
        table.clear(Dropdown.Value)
        local count = 0
        for _, v in ipairs(Values) do
            if DropdownConfig.MaxSelections == 0 or count < DropdownConfig.MaxSelections then
                if table.find(Dropdown.Options, v) then
                    Dropdown.Value[v] = true
                    count = count + 1
                end
            end
        end
        for opt, btn in pairs(Dropdown.Buttons) do
            if not IsCategory(opt) then
                local label = btn:FindFirstChild("Title")
                local check = btn:FindFirstChild("Check")
                local isSelected = Dropdown.Value[opt] == true
                SetRowVisual(btn, label, check, isSelected, false)
            end
        end
        UpdateSelectedLabel()
        DropdownConfig.Callback(Dropdown:GetSelected())
        if DropdownConfig.Flag then
            OrionLib.Flags[DropdownConfig.Flag] = Dropdown
        end
        if Dropdown.Save then
            SaveCfg(game.PlaceId)
        end
    end

    function Dropdown:Refresh(Options, Delete)
        if Delete then
            table.clear(Dropdown.Value)
            table.clear(Dropdown.Options)
        end
        ClearButtons()
        Dropdown.Options = table.clone(Options or {})
        AddOptions(Dropdown.Options)
        UpdateSelectedLabel()
    end

    AddConnection(
        Click.MouseButton1Click,
        function()
            Dropdown.Toggled = not Dropdown.Toggled
            DropdownFrame.Header.Line.Visible = Dropdown.Toggled
            TweenService:Create(DropdownFrame.Header.Ico, TweenInfo.new(0.15), { Rotation = Dropdown.Toggled and 180 or 0 }):Play()

            local totalHeight = HeaderHeight
            if Dropdown.Toggled then
                local contentHeight = DropdownList.AbsoluteContentSize.Y
                if #Dropdown.Options > MaxElements then
                    totalHeight = HeaderHeight + (MaxElements * RowHeight)
                else
                    totalHeight = HeaderHeight + contentHeight
                end
            end
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), { Size = UDim2.new(1, 0, 0, totalHeight) }):Play()
        end
    )

    Dropdown:Refresh(Dropdown.Options, false)
    Dropdown:Set(DropdownConfig.Default)

    if DropdownConfig.Flag then
        OrionLib.Flags[DropdownConfig.Flag] = Dropdown
    end

    return Dropdown
end

--> Element DropDown Players <--

function ElementFunction:AddPlayerDropdown(Config)
    Config = Config or {}
    Config.Name = Config.Name or "Select Player"
    Config.Placeholder = Config.Placeholder or "Choose a player"
    Config.Callback = Config.Callback or function() end
    Config.Flag = Config.Flag or nil
    Config.Save = Config.Save or false
    Config.IncludeSelf = Config.IncludeSelf or false
    Config.MultiSelect = Config.MultiSelect or false
    Config.MaxSelections = Config.MaxSelections or 0
    Config.SortBy = Config.SortBy or "DisplayName"

    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer

    local Dropdown = {
        Value = Config.MultiSelect and {} or nil,
        Player = Config.MultiSelect and {} or nil,
        Toggled = false,
        Type = "PlayerDropdown",
        Save = Config.Save,
        MultiSelect = Config.MultiSelect
    }

    local MaxVisibleItems = 6
    local RowHeight = 44
    local HeaderHeight = 40
    local AvatarSize = 30
    local refreshPending = false

    local DropdownList = MakeElement("List")
    DropdownList.Padding = UDim.new(0, 3)

    local DropdownContainer = AddThemeObject(
        SetProps(
            SetChildren(
                MakeElement("ScrollFrame"),
                { DropdownList }
            ),
            {
                Position = UDim2.new(0, 0, 0, HeaderHeight),
                Size = UDim2.new(1, 0, 1, -HeaderHeight),
                ClipsDescendants = true,
                BackgroundTransparency = 1,
                ScrollBarThickness = 3,
                BorderSizePixel = 0,
                AutomaticCanvasSize = Enum.AutomaticSize.None
            }
        ),
        "Divider"
    )

    local ClickArea = SetProps(
        MakeElement("Button"),
        { Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1 }
    )

    local CountBadge = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 8),
                {
                    Size = UDim2.new(0, 18, 0, 18),
                    Position = UDim2.new(1, -52, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = 1,
                    Visible = false,
                    Name = "CountBadge"
                }
            ),
            {
                AddThemeObject(
                    SetProps(MakeElement("Label", "0", 9), {
                        Size = UDim2.new(1, 0, 1, 0),
                        Font = Enum.Font.GothamBold,
                        TextXAlignment = Enum.TextXAlignment.Center,
                        Name = "CountLabel"
                    }),
                    "Text"
                )
            }
        ),
        "Stroke"
    )

    local DropdownFrame = AddThemeObject(
        SetChildren(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 6),
                {
                    Size = UDim2.new(1, 0, 0, HeaderHeight),
                    Parent = ItemParent,
                    ClipsDescendants = true
                }
            ),
            {
                DropdownContainer,
                SetProps(
                    SetChildren(
                        MakeElement("TFrame"),
                        {
                            AddThemeObject(
                                SetProps(MakeElement("Label", Config.Name, 14), {
                                    Size = UDim2.new(0.55, -12, 1, 0),
                                    Position = UDim2.new(0, 12, 0, 0),
                                    Font = Enum.Font.GothamBold,
                                    Name = "Content",
                                    TextXAlignment = Enum.TextXAlignment.Left
                                }),
                                "Text"
                            ),
                            AddThemeObject(
                                SetProps(MakeElement("Label", Config.Placeholder, 12), {
                                    Size = UDim2.new(0.45, -44, 1, 0),
                                    Position = UDim2.new(0.55, 0, 0, 0),
                                    Font = Enum.Font.Gotham,
                                    Name = "Selected",
                                    TextXAlignment = Enum.TextXAlignment.Right,
                                    TextTruncate = Enum.TextTruncate.AtEnd
                                }),
                                "TextDark"
                            ),
                            CountBadge,
                            AddThemeObject(
                                SetProps(MakeElement("Image", "rbxassetid://7072706796"), {
                                    Size = UDim2.new(0, 18, 0, 18),
                                    AnchorPoint = Vector2.new(0, 0.5),
                                    Position = UDim2.new(1, -28, 0.5, 0),
                                    Name = "Ico"
                                }),
                                "TextDark"
                            ),
                            AddThemeObject(
                                SetProps(MakeElement("Frame"), {
                                    Size = UDim2.new(1, 0, 0, 1),
                                    Position = UDim2.new(0, 0, 1, -1),
                                    Name = "Line",
                                    Visible = false
                                }),
                                "Stroke"
                            ),
                            ClickArea
                        }
                    ),
                    {
                        Size = UDim2.new(1, 0, 0, HeaderHeight),
                        ClipsDescendants = true,
                        Name = "Header"
                    }
                ),
                AddThemeObject(MakeElement("Stroke"), "Stroke")
            }
        ),
        "Second"
    )

    local playerButtons = {}

    local function UpdateCanvas()
        DropdownContainer.CanvasSize = UDim2.new(0, 0, 0, DropdownList.AbsoluteContentSize.Y)
    end

    AddConnection(DropdownList:GetPropertyChangedSignal("AbsoluteContentSize"), UpdateCanvas)

    local function IsSelected(player)
        if Config.MultiSelect then
            for _, p in ipairs(Dropdown.Player) do
                if p == player then return true end
            end
            return false
        else
            return Dropdown.Player == player
        end
    end

    local function SetRowVisual(btn, label, check, isSelected, isHovered)
        if not btn or not btn.Parent then return end
        local bgTarget = isSelected and 0.6 or isHovered and 0.82 or 1
        local textTarget = isSelected and 0 or 0.35
        TweenService:Create(btn, TweenInfo.new(0.13), { BackgroundTransparency = bgTarget }):Play()
        if label then
            TweenService:Create(label, TweenInfo.new(0.13), { TextTransparency = textTarget }):Play()
        end
        if check then
            check.Visible = isSelected
        end
    end

    local function UpdateSelectedLabel()
        if Config.MultiSelect then
            local count = #Dropdown.Player
            if count == 0 then
                DropdownFrame.Header.Selected.Text = Config.Placeholder
                CountBadge.Visible = false
            elseif count == 1 then
                DropdownFrame.Header.Selected.Text = Dropdown.Player[1].DisplayName
                CountBadge.Visible = false
            else
                DropdownFrame.Header.Selected.Text = Dropdown.Player[1].DisplayName
                CountBadge.Visible = true
                CountBadge.CountLabel.Text = tostring(count)
            end
        else
            if Dropdown.Player then
                DropdownFrame.Header.Selected.Text = Dropdown.Player.DisplayName .. " @" .. Dropdown.Player.Name
            else
                DropdownFrame.Header.Selected.Text = Config.Placeholder
            end
        end
    end

    local function ClearButtons()
        for _, btn in pairs(playerButtons) do
            if btn and btn.Parent then btn:Destroy() end
        end
        table.clear(playerButtons)
        UpdateCanvas()
    end

    local function GetSortKey(plr)
        if Config.SortBy == "Name" then return plr.Name:lower() end
        return (plr.DisplayName or plr.Name):lower()
    end

    local function CreatePlayerButton(player)
        local thumb = "rbxasset://textures/ui/GuiImagePlaceholder.png"

        local checkMark = Config.MultiSelect and Create("ImageLabel", {
            Size = UDim2.new(0, 14, 0, 14),
            Position = UDim2.new(1, -24, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://3944680095",
            ImageColor3 = OrionLib.Themes[OrionLib.SelectedTheme].Stroke,
            Visible = false,
            Name = "Check"
        }) or nil

        local avatarHolder = Create("Frame", {
            Size = UDim2.new(0, AvatarSize, 0, AvatarSize),
            Position = UDim2.new(0, 8, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Name = "AvatarHolder"
        })
        Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = avatarHolder })

        local avatarImg = Create("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Image = thumb,
            ScaleType = Enum.ScaleType.Crop,
            Name = "Avatar",
            Parent = avatarHolder
        })
        Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = avatarImg })

        local onlineDot = Create("Frame", {
            Size = UDim2.new(0, 8, 0, 8),
            Position = UDim2.new(1, 0, 1, 0),
            AnchorPoint = Vector2.new(1, 1),
            BackgroundColor3 = Color3.fromRGB(87, 242, 135),
            BorderSizePixel = 0,
            Name = "OnlineDot",
            Parent = avatarHolder
        })
        Create("UICorner", { CornerRadius = UDim.new(1, 0), Parent = onlineDot })

        local nameLabel = AddThemeObject(
            SetProps(MakeElement("Label", player.DisplayName, 13), {
                Position = UDim2.new(0, AvatarSize + 16, 0, 6),
                Size = UDim2.new(1, -(AvatarSize + 46), 0, 16),
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Name = "DisplayName"
            }),
            "Text"
        )

        local usernameLabel = AddThemeObject(
            SetProps(MakeElement("Label", "@" .. player.Name, 11), {
                Position = UDim2.new(0, AvatarSize + 16, 0, 24),
                Size = UDim2.new(1, -(AvatarSize + 46), 0, 13),
                Font = Enum.Font.Gotham,
                TextXAlignment = Enum.TextXAlignment.Left,
                TextTruncate = Enum.TextTruncate.AtEnd,
                Name = "Username"
            }),
            "TextDark"
        )

        local btn = AddThemeObject(
            SetProps(
                MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 6),
                {
                    Size = UDim2.new(1, -8, 0, RowHeight),
                    BackgroundTransparency = 1,
                    Name = "PlayerRow_" .. player.UserId
                }
            ),
            "Divider"
        )

        avatarHolder.Parent = btn
        nameLabel.Parent = btn
        usernameLabel.Parent = btn
        if checkMark then checkMark.Parent = btn end

        local clickBtn = Create("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = btn
        })

        SetRowVisual(btn, nameLabel, checkMark, IsSelected(player), false)

        task.spawn(function()
            local ok, result = pcall(function()
                return Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
            end)
            if ok and result and #result > 0 then
                if avatarImg and avatarImg.Parent then
                    avatarImg.Image = result
                end
            end
        end)

        clickBtn.MouseEnter:Connect(function()
            if not IsSelected(player) then
                SetRowVisual(btn, nameLabel, checkMark, false, true)
            end
        end)

        clickBtn.MouseLeave:Connect(function()
            if not IsSelected(player) then
                SetRowVisual(btn, nameLabel, checkMark, false, false)
            end
        end)

        AddConnection(clickBtn.MouseButton1Click, function()
            if Config.MultiSelect then
                local alreadySelected = false
                local indexFound = nil
                for i, p in ipairs(Dropdown.Player) do
                    if p == player then
                        alreadySelected = true
                        indexFound = i
                        break
                    end
                end

                if alreadySelected then
                    table.remove(Dropdown.Player, indexFound)
                    SetRowVisual(btn, nameLabel, checkMark, false, false)
                else
                    if Config.MaxSelections > 0 and #Dropdown.Player >= Config.MaxSelections then return end
                    table.insert(Dropdown.Player, player)
                    SetRowVisual(btn, nameLabel, checkMark, true, false)
                end

                UpdateSelectedLabel()

                local selected = {}
                for _, p in ipairs(Dropdown.Player) do table.insert(selected, p) end
                Config.Callback(selected)

                if Config.Flag then OrionLib.Flags[Config.Flag] = Dropdown end
                if Dropdown.Save then SaveCfg(game.PlaceId) end
            else
                Dropdown:Set(player)
            end
        end)

        return btn
    end

    local function ResortButtons()
        local sorted = {}
        for plr, btn in pairs(playerButtons) do
            table.insert(sorted, { plr = plr, btn = btn, key = GetSortKey(plr) })
        end
        table.sort(sorted, function(a, b) return a.key < b.key end)
        for i, entry in ipairs(sorted) do
            entry.btn.LayoutOrder = i
        end
    end

    local function UpdateDropdownHeight()
        if Dropdown.Toggled then
            local listHeight = math.min(DropdownList.AbsoluteContentSize.Y, MaxVisibleItems * RowHeight)
            TweenService:Create(DropdownFrame, TweenInfo.new(0.15), {
                Size = UDim2.new(1, 0, 0, HeaderHeight + listHeight)
            }):Play()
        end
    end

    local function RefreshPlayerList()
        if refreshPending then return end
        refreshPending = true
        task.defer(function()
            refreshPending = false

            local currentPlayers = {}
            for _, plr in ipairs(Players:GetPlayers()) do
                if Config.IncludeSelf or plr ~= localPlayer then
                    currentPlayers[plr] = true
                end
            end

            for plr, btn in pairs(playerButtons) do
                if not currentPlayers[plr] then
                    if btn and btn.Parent then btn:Destroy() end
                    playerButtons[plr] = nil
                end
            end

            for plr, _ in pairs(currentPlayers) do
                if not playerButtons[plr] then
                    local btn = CreatePlayerButton(plr)
                    btn.Parent = DropdownContainer
                    playerButtons[plr] = btn
                end
            end

            ResortButtons()
            UpdateCanvas()
            UpdateDropdownHeight()
        end)
    end

    function Dropdown:Set(player)
        if Config.MultiSelect then
            table.clear(self.Player)
            if player then
                if type(player) == "table" then
                    for _, p in ipairs(player) do
                        if Config.MaxSelections == 0 or #self.Player < Config.MaxSelections then
                            table.insert(self.Player, p)
                        end
                    end
                else
                    table.insert(self.Player, player)
                end
            end
            for plr, btn in pairs(playerButtons) do
                local nameLabel = btn:FindFirstChild("DisplayName")
                local check = btn:FindFirstChild("Check")
                SetRowVisual(btn, nameLabel, check, IsSelected(plr), false)
            end
            UpdateSelectedLabel()
            local selected = {}
            for _, p in ipairs(self.Player) do table.insert(selected, p) end
            Config.Callback(selected)
        else
            self.Player = player
            self.Value = player and player.Name or nil
            UpdateSelectedLabel()
            for plr, btn in pairs(playerButtons) do
                local nameLabel = btn:FindFirstChild("DisplayName")
                SetRowVisual(btn, nameLabel, nil, plr == player, false)
            end
            Config.Callback(player)
        end

        if Config.Flag then OrionLib.Flags[Config.Flag] = self end
        if self.Save then SaveCfg(game.PlaceId) end
    end

    function Dropdown:GetSelected()
        if Config.MultiSelect then
            local selected = {}
            for _, p in ipairs(self.Player) do table.insert(selected, p) end
            return selected
        else
            return self.Player
        end
    end

    function Dropdown:Refresh()
        ClearButtons()
        RefreshPlayerList()
    end

    local function ToggleDropdown()
        Dropdown.Toggled = not Dropdown.Toggled
        DropdownFrame.Header.Line.Visible = Dropdown.Toggled

        TweenService:Create(DropdownFrame.Header.Ico, TweenInfo.new(0.15), {
            Rotation = Dropdown.Toggled and 180 or 0
        }):Play()

        local targetHeight = HeaderHeight
        if Dropdown.Toggled then
            local listHeight = math.min(DropdownList.AbsoluteContentSize.Y, MaxVisibleItems * RowHeight)
            targetHeight = HeaderHeight + listHeight
        end

        TweenService:Create(DropdownFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(1, 0, 0, targetHeight)
        }):Play()
    end

    AddConnection(ClickArea.MouseButton1Click, ToggleDropdown)

    AddConnection(Players.PlayerAdded, function(player)
        if not Config.IncludeSelf and player == localPlayer then return end
        if playerButtons[player] then return end
        local btn = CreatePlayerButton(player)
        btn.Parent = DropdownContainer
        playerButtons[player] = btn
        ResortButtons()
        UpdateCanvas()
        UpdateDropdownHeight()
    end)

    AddConnection(Players.PlayerRemoving, function(player)
        if Config.MultiSelect then
            for i, p in ipairs(Dropdown.Player) do
                if p == player then
                    table.remove(Dropdown.Player, i)
                    break
                end
            end
            UpdateSelectedLabel()
        else
            if Dropdown.Player == player then
                Dropdown:Set(nil)
            end
        end

        local btn = playerButtons[player]
        if btn and btn.Parent then btn:Destroy() end
        playerButtons[player] = nil

        UpdateCanvas()
        UpdateDropdownHeight()
    end)

    if Config.Flag then OrionLib.Flags[Config.Flag] = Dropdown end

    task.defer(RefreshPlayerList)

    return Dropdown
end

--> Element Multi DropDown Players <--

function ElementFunction:AddMultiPlayerDropdown(Config)
    Config = Config or {}
    Config.MultiSelect = true
    return ElementFunction.AddPlayerDropdown(self, Config)
end

--> Element Choose Theme <--

function ElementFunction:ChooseTheme(config)
    config = config or {}
    local defaultTheme = config.Default or "Default"

    if not OrionLib.Themes[defaultTheme] then
        defaultTheme = "Default"
    end

    local savedTheme = nil
    pcall(function()
        local folder = OrionLib.Folder
        if folder and folder ~= "" and isfile then
            local themePath = folder .. "/theme.txt"
            if isfile(themePath) then
                savedTheme = readfile(themePath)
                if savedTheme and OrionLib.Themes[savedTheme] then
                    defaultTheme = savedTheme
                end
            end
        end
    end)

    OrionLib.SelectedTheme = defaultTheme
    OrionLib:SetTheme()

    local existingThemes = {}
    for theme, _ in pairs(OrionLib.Themes) do
        existingThemes[theme] = true
    end

    local DropdownOptions = {"Default"}
    local categories = OrionLib.Categories or {}

    for category, themeList in pairs(categories) do
        local validThemes = {}
        for _, themeName in ipairs(themeList) do
            if existingThemes[themeName] and themeName ~= "Default" then
                table.insert(validThemes, themeName)
            end
        end
        if #validThemes > 0 then
            table.insert(DropdownOptions, "--- " .. category)
            for _, themeName in ipairs(validThemes) do
                table.insert(DropdownOptions, themeName)
            end
        end
    end

    local uncategorized = {}
    for theme, _ in pairs(existingThemes) do
        if theme ~= "Default" then
            local found = false
            for _, themeList in pairs(categories) do
                for _, t in ipairs(themeList) do
                    if t == theme then
                        found = true
                        break
                    end
                end
                if found then break end
            end
            if not found then
                table.insert(uncategorized, theme)
            end
        end
    end

    if #uncategorized > 0 then
        table.sort(uncategorized)
        table.insert(DropdownOptions, "--- Others")
        for _, themeName in ipairs(uncategorized) do
            table.insert(DropdownOptions, themeName)
        end
    end

    return self:AddDropdown({
        Name = config.Name or "Choose Theme",
        Options = DropdownOptions,
        Default = defaultTheme,
        Flag = config.Flag or "ThemeSelect",
        Save = true,
        Callback = function(value)
            if value:sub(1, 3) == "---" then return end
            OrionLib.SelectedTheme = value
            OrionLib:SetTheme()
            pcall(function()
                local folder = OrionLib.Folder
                if folder and folder ~= "" and writefile then
                    if not isfolder(folder) then makefolder(folder) end
                    writefile(folder .. "/theme.txt", value)
                end
            end)
        end
    })
end
        
--> Element Transparency <--
        
function ElementFunction:AddTransparency(config)
    config = config or {}

    local enabled = false
    local amount  = 0.22

    local function apply()
        for typeName, objects in pairs(OrionLib.ThemeObjects) do
            if typeName == "Main" or typeName == "Second" then
                for _, obj in ipairs(objects) do
                    if obj and obj.Parent then
                        pcall(function()
                            if obj:IsA("Frame") or obj:IsA("TextButton") then
                                obj.BackgroundTransparency = enabled and amount or 0
                            elseif obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                                obj.ImageTransparency = enabled and amount or 0
                            end
                        end)
                    end
                end
            end
        end
    end

    local old = OrionLib.SetTheme
    OrionLib.SetTheme = function(self)
        old(self)
        task.defer(apply)
    end

    local savedEnabled = nil
    local savedAmount = nil
    pcall(function()
        local folder = OrionLib.Folder
        if folder and folder ~= "" and isfile then
            local configPath = folder .. "/" .. tostring(game.PlaceId) .. ".txt"
            if isfile(configPath) then
                local content = readfile(configPath)
                if content and content ~= "" then
                    local data = HttpService:JSONDecode(content)
                    if data then
                        if config.Toggle and config.Toggle.Flag and data[config.Toggle.Flag] ~= nil then
                            savedEnabled = data[config.Toggle.Flag]
                        end
                        if config.Slider and config.Slider.Flag and data[config.Slider.Flag] ~= nil then
                            savedAmount = data[config.Slider.Flag]
                        end
                    end
                end
            end
        end
    end)

    if config.Toggle then
        local t = config.Toggle
        enabled = (savedEnabled ~= nil) and savedEnabled or (t.Default or false)
        self:AddToggle({
            Name     = t.Name     or "UI Transparency",
            Default  = enabled,
            Flag     = t.Flag     or "UITransparencyEnabled",
            Save     = true,
            Callback = function(v)
                enabled = v
                apply()
                if t.Callback then t.Callback(v) end
            end,
        })
    end

    if config.Slider then
        local s = config.Slider
        amount = (savedAmount ~= nil) and savedAmount or (s.Default or 0.22)
        self:AddSlider({
            Name      = s.Name      or "Transparency Amount",
            Min       = s.Min       or 0,
            Max       = s.Max       or 1,
            Increment = s.Increment or 0.01,
            Default   = amount,
            ValueName = s.ValueName or "",
            Flag      = s.Flag      or "UITransparencyAmount",
            Save      = true,
            Callback  = function(v)
                amount = v
                if enabled then apply() end
                if s.Callback then s.Callback(v) end
            end,
        })
    end

    if not config.Toggle and not config.Slider then
        enabled = true
        amount  = config.Amount or 0.22
    end

    task.delay(1, apply)
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
                            SaveCfg(game.PlaceId)
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
                        )
                    }
                )

                local Click =
                    SetProps(
                    MakeElement("Button"),
                    {
                        Size = UDim2.new(1, 0, 1, 0)
                    }
                )

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
                        {
                            AddThemeObject(MakeElement("Stroke"), "Stroke")
                        }
                    ),
                    "Main"
                )

                local ColorpickerFrame =
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
                            SetProps(
                                SetChildren(
                                    MakeElement("TFrame"),
                                    {
                                        AddThemeObject(
                                            SetProps(
                                                MakeElement("Label", ColorpickerConfig.Name, 15),
                                                {
                                                    Size = UDim2.new(1, -12, 1, 0),
                                                    Position = UDim2.new(0, 12, 0, 0),
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
                                        )
                                    }
                                ),
                                {
                                    Size = UDim2.new(1, 0, 0, 38),
                                    ClipsDescendants = true,
                                    Name = "F"
                                }
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
                        TweenService:Create(
                            ColorpickerFrame,
                            TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = Colorpicker.Toggled and UDim2.new(1, 0, 0, 148) or UDim2.new(1, 0, 0, 38)}
                        ):Play()
                        Color.Visible = Colorpicker.Toggled
                        Hue.Visible = Colorpicker.Toggled
                        ColorpickerFrame.F.Line.Visible = Colorpicker.Toggled
                    end
                )

                local function UpdateColorPicker()
                    ColorpickerBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                    Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                    Colorpicker:Set(ColorpickerBox.BackgroundColor3)
                    ColorpickerConfig.Callback(ColorpickerBox.BackgroundColor3)
                    SaveCfg(game.PlaceId)
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
                                        (math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
                                        Color.AbsoluteSize.X)
                                    local ColorY =
                                        (math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
                                        Color.AbsoluteSize.Y)
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
                                        (math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
                                        Hue.AbsoluteSize.Y)

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

--> Element Discord Invite <--
            
function ElementFunction:AddDiscordInvite(Config)
                Config = Config or {}
                Config.ServerName = Config.ServerName or "Discord Server"
                Config.InviteLink = Config.InviteLink or "https://discord.gg/example"
                Config.Icon = Config.Icon or "rbxassetid://15841490359"
                Config.Description = Config.Description or ""

                local Container =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10),
                            {
                                Size = UDim2.new(1, 0, 0, 0),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Parent = ItemParent,
                                ClipsDescendants = true,
                                BackgroundTransparency = 0
                            }
                        ),
                        {
                            SetChildren(
                                SetProps(
                                    MakeElement("TFrame"),
                                    {
                                        Size = UDim2.new(1, -24, 0, 0),
                                        Position = UDim2.new(0, 12, 0, 12),
                                        BackgroundTransparency = 1,
                                        Name = "ContentArea",
                                        AutomaticSize = Enum.AutomaticSize.Y
                                    }
                                ),
                                {
                                    SetProps(
                                        MakeElement("Image", Config.Icon),
                                        {
                                            Size = UDim2.new(0, 56, 0, 56),
                                            Position = UDim2.new(0, 0, 0.5, 0),
                                            AnchorPoint = Vector2.new(0, 0.5),
                                            BackgroundTransparency = 1,
                                            Name = "ServerIcon"
                                        }
                                    ),
                                    SetChildren(
                                        SetProps(
                                            MakeElement("TFrame"),
                                            {
                                                Size = UDim2.new(1, -200, 0, 0),
                                                Position = UDim2.new(0, 70, 0.5, 0),
                                                AnchorPoint = Vector2.new(0, 0.5),
                                                BackgroundTransparency = 1,
                                                Name = "TextArea",
                                                AutomaticSize = Enum.AutomaticSize.Y
                                            }
                                        ),
                                        {
                                            MakeElement("List", 0, 2),
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.ServerName, 18),
                                                    {
                                                        Size = UDim2.new(1, 0, 0, 0),
                                                        AutomaticSize = Enum.AutomaticSize.Y,
                                                        Font = Enum.Font.GothamBold,
                                                        TextXAlignment = Enum.TextXAlignment.Left,
                                                        Name = "Title"
                                                    }
                                                ),
                                                "Text"
                                            ),
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.Description, 13),
                                                    {
                                                        Size = UDim2.new(1, 0, 0, 0),
                                                        AutomaticSize = Enum.AutomaticSize.Y,
                                                        Font = Enum.Font.Gotham,
                                                        TextWrapped = true,
                                                        TextXAlignment = Enum.TextXAlignment.Left,
                                                        Name = "Description"
                                                    }
                                                ),
                                                "TextDark"
                                            ),
                                            SetProps(
                                                MakeElement("Label", Config.InviteLink, 12),
                                                {
                                                    Size = UDim2.new(1, 0, 0, 0),
                                                    AutomaticSize = Enum.AutomaticSize.Y,
                                                    Font = Enum.Font.Gotham,
                                                    TextColor3 = Color3.fromRGB(0, 170, 255),
                                                    TextXAlignment = Enum.TextXAlignment.Left,
                                                    TextStrokeTransparency = 1,
                                                    RichText = true,
                                                    Name = "Link"
                                                }
                                            )
                                        }
                                    ),
                                    SetChildren(
                                        SetProps(
                                            MakeElement("RoundFrame", Color3.fromRGB(88, 101, 242), 0, 12),
                                            {
                                                Size = UDim2.new(0, 110, 0, 40),
                                                Position = UDim2.new(1, -5, 0.5, 0),
                                                AnchorPoint = Vector2.new(1, 0.5),
                                                Name = "JoinBtnFrame",
                                                BackgroundTransparency = 0,
                                                ClipsDescendants = true
                                            }
                                        ),
                                        {
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", "Join", 16),
                                                    {
                                                        Size = UDim2.new(1, 0, 1, 0),
                                                        Font = Enum.Font.GothamBold,
                                                        TextColor3 = Color3.fromRGB(255, 255, 255),
                                                        TextXAlignment = Enum.TextXAlignment.Center,
                                                        Name = "JoinLabel"
                                                    }
                                                ),
                                                "Text"
                                            ),
                                            SetProps(
                                                MakeElement("Button"),
                                                {
                                                    Size = UDim2.new(1, 0, 1, 0),
                                                    BackgroundTransparency = 1,
                                                    Name = "JoinClick"
                                                }
                                            )
                                        }
                                    )
                                }
                            ),
                            AddThemeObject(MakeElement("Stroke", Color3.fromRGB(80, 80, 80), 1), "Stroke"),
                            SetProps(MakeElement("Padding", 12, 12, 12, 12), {Name = "MainPadding"})
                        }
                    ),
                    "Second"
                )

                local function updateLayout()
                    local contentArea = Container:FindFirstChild("ContentArea")
                    if not contentArea then
                        return
                    end
                    local textArea = contentArea:FindFirstChild("TextArea")
                    local joinFrame = contentArea:FindFirstChild("JoinBtnFrame")
                    if textArea and joinFrame then
                        local h = math.max(56, textArea.AbsoluteSize.Y)
                        contentArea.Size = UDim2.new(1, -24, 0, h)
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
                                joinBtnFrame,
                                TweenInfo.new(0.2),
                                {
                                    BackgroundColor3 = Color3.fromRGB(114, 137, 218),
                                    Size = UDim2.new(0, 120, 0, 44)
                                }
                            ):Play()
                        end
                    )

                    joinClick.MouseLeave:Connect(
                        function()
                            TweenService:Create(
                                joinBtnFrame,
                                TweenInfo.new(0.2),
                                {
                                    BackgroundColor3 = Color3.fromRGB(88, 101, 242),
                                    Size = originalSize
                                }
                            ):Play()
                        end
                    )

                    joinClick.MouseButton1Click:Connect(
                        function()
                            setclipboard(Config.InviteLink)
                            label.Text = "Copied!"
                            task.wait(1)
                            label.Text = "Join"
                        end
                    )
                end

                return Container
            end

--> Element Divider Line <--

function ElementFunction:AddDivider(Config)
    Config = Config or {}
    Config.Thickness = Config.Thickness or 1
    Config.Margin = Config.Margin or 10
    Config.Transparency = Config.Transparency or 0.5
    Config.Label = Config.Label or nil
    Config.LabelSize = Config.LabelSize or 11

    local hasLabel = Config.Label and Config.Label ~= ""
    local totalHeight = hasLabel and (Config.LabelSize + 8) or Config.Thickness

    local DividerFrame = SetProps(
        MakeElement("TFrame"),
        {
            Size = UDim2.new(1, 0, 0, totalHeight),
            Parent = ItemParent,
            Name = "DividerFrame"
        }
    )

    if hasLabel then
        local labelWidth = #Config.Label * (Config.LabelSize * 0.55)

        AddThemeObject(
            SetProps(
                MakeElement("Frame"),
                {
                    Size = UDim2.new(0.5, -(labelWidth / 2) - 8, 0, Config.Thickness),
                    Position = UDim2.new(0, Config.Margin, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = Config.Transparency,
                    Parent = DividerFrame
                }
            ),
            "Divider"
        )

        AddThemeObject(
            SetProps(
                MakeElement("Label", Config.Label, Config.LabelSize),
                {
                    Size = UDim2.new(0, labelWidth, 1, 0),
                    Position = UDim2.new(0.5, 0, 0.5, 0),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Font = Enum.Font.GothamBold,
                    TextXAlignment = Enum.TextXAlignment.Center,
                    BackgroundTransparency = 1,
                    Parent = DividerFrame
                }
            ),
            "TextDark"
        )

        AddThemeObject(
            SetProps(
                MakeElement("Frame"),
                {
                    Size = UDim2.new(0.5, -(labelWidth / 2) - 8, 0, Config.Thickness),
                    Position = UDim2.new(0.5, (labelWidth / 2) + 8, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = Config.Transparency,
                    Parent = DividerFrame
                }
            ),
            "Divider"
        )
    else
        AddThemeObject(
            SetProps(
                MakeElement("Frame"),
                {
                    Size = UDim2.new(1, -(Config.Margin * 2), 0, Config.Thickness),
                    Position = UDim2.new(0, Config.Margin, 0.5, 0),
                    AnchorPoint = Vector2.new(0, 0.5),
                    BackgroundTransparency = Config.Transparency,
                    Parent = DividerFrame
                }
            ),
            "Divider"
        )
    end

    return DividerFrame
end

--> Element Links <--

function ElementFunction:AddLinks(Config)
                Config = Config or {}
                Config.ServerName = Config.ServerName or "Social"
                Config.InviteLink = Config.InviteLink or "https://example.com"
                Config.Icon = Config.Icon or "rbxassetid://15841490359"
                Config.Description = Config.Description or ""

                local Container =
                    AddThemeObject(
                    SetChildren(
                        SetProps(
                            MakeElement("RoundFrame", Color3.fromRGB(255, 255, 255), 0, 10),
                            {
                                Size = UDim2.new(1, 0, 0, 0),
                                AutomaticSize = Enum.AutomaticSize.Y,
                                Parent = ItemParent,
                                ClipsDescendants = true,
                                BackgroundTransparency = 0
                            }
                        ),
                        {
                            SetChildren(
                                SetProps(
                                    MakeElement("TFrame"),
                                    {
                                        Size = UDim2.new(1, -24, 0, 0),
                                        Position = UDim2.new(0, 12, 0, 12),
                                        BackgroundTransparency = 1,
                                        Name = "ContentArea",
                                        AutomaticSize = Enum.AutomaticSize.Y
                                    }
                                ),
                                {
                                    SetProps(
                                        MakeElement("Image", Config.Icon),
                                        {
                                            Size = UDim2.new(0, 56, 0, 56),
                                            Position = UDim2.new(0, 0, 0.5, 0),
                                            AnchorPoint = Vector2.new(0, 0.5),
                                            BackgroundTransparency = 1,
                                            Name = "Icon"
                                        }
                                    ),
                                    SetChildren(
                                        SetProps(
                                            MakeElement("TFrame"),
                                            {
                                                Size = UDim2.new(1, -200, 0, 0),
                                                Position = UDim2.new(0, 70, 0.5, 0),
                                                AnchorPoint = Vector2.new(0, 0.5),
                                                BackgroundTransparency = 1,
                                                Name = "TextArea",
                                                AutomaticSize = Enum.AutomaticSize.Y
                                            }
                                        ),
                                        {
                                            MakeElement("List", 0, 2),
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.ServerName, 18),
                                                    {
                                                        Size = UDim2.new(1, 0, 0, 0),
                                                        AutomaticSize = Enum.AutomaticSize.Y,
                                                        Font = Enum.Font.GothamBold,
                                                        TextXAlignment = Enum.TextXAlignment.Left,
                                                        Name = "Title"
                                                    }
                                                ),
                                                "Text"
                                            ),
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", Config.Description, 13),
                                                    {
                                                        Size = UDim2.new(1, 0, 0, 0),
                                                        AutomaticSize = Enum.AutomaticSize.Y,
                                                        Font = Enum.Font.Gotham,
                                                        TextWrapped = true,
                                                        TextXAlignment = Enum.TextXAlignment.Left,
                                                        Name = "Description"
                                                    }
                                                ),
                                                "TextDark"
                                            ),
                                            SetProps(
                                                MakeElement("Label", Config.InviteLink, 12),
                                                {
                                                    Size = UDim2.new(1, 0, 0, 0),
                                                    AutomaticSize = Enum.AutomaticSize.Y,
                                                    Font = Enum.Font.Gotham,
                                                    TextColor3 = Color3.fromRGB(0, 170, 255),
                                                    TextXAlignment = Enum.TextXAlignment.Left,
                                                    TextStrokeTransparency = 1,
                                                    RichText = true,
                                                    Name = "Link"
                                                }
                                            )
                                        }
                                    ),
                                    SetChildren(
                                        SetProps(
                                            MakeElement("RoundFrame", Color3.fromRGB(0, 170, 255), 0, 12),
                                            {
                                                Size = UDim2.new(0, 110, 0, 40),
                                                Position = UDim2.new(1, -5, 0.5, 0),
                                                AnchorPoint = Vector2.new(1, 0.5),
                                                Name = "CopyBtnFrame",
                                                BackgroundTransparency = 0,
                                                ClipsDescendants = true
                                            }
                                        ),
                                        {
                                            AddThemeObject(
                                                SetProps(
                                                    MakeElement("Label", "Copy", 16),
                                                    {
                                                        Size = UDim2.new(1, 0, 1, 0),
                                                        Font = Enum.Font.GothamBold,
                                                        TextColor3 = Color3.fromRGB(255, 255, 255),
                                                        TextXAlignment = Enum.TextXAlignment.Center,
                                                        Name = "CopyLabel"
                                                    }
                                                ),
                                                "Text"
                                            ),
                                            SetProps(
                                                MakeElement("Button"),
                                                {
                                                    Size = UDim2.new(1, 0, 1, 0),
                                                    BackgroundTransparency = 1,
                                                    Name = "CopyClick"
                                                }
                                            )
                                        }
                                    )
                                }
                            ),
                            AddThemeObject(MakeElement("Stroke", Color3.fromRGB(80, 80, 80), 1), "Stroke"),
                            SetProps(MakeElement("Padding", 12, 12, 12, 12), {Name = "MainPadding"})
                        }
                    ),
                    "Second"
                )

                local function updateLayout()
                    local contentArea = Container:FindFirstChild("ContentArea")
                    if not contentArea then
                        return
                    end
                    local textArea = contentArea:FindFirstChild("TextArea")
                    local btnFrame = contentArea:FindFirstChild("CopyBtnFrame")
                    if textArea and btnFrame then
                        local h = math.max(56, textArea.AbsoluteSize.Y)
                        contentArea.Size = UDim2.new(1, -24, 0, h)
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
                                btnFrame,
                                TweenInfo.new(0.2),
                                {
                                    BackgroundColor3 = Color3.fromRGB(0, 200, 255),
                                    Size = UDim2.new(0, 120, 0, 44)
                                }
                            ):Play()
                        end
                    )

                    click.MouseLeave:Connect(
                        function()
                            TweenService:Create(
                                btnFrame,
                                TweenInfo.new(0.2),
                                {
                                    BackgroundColor3 = Color3.fromRGB(0, 170, 255),
                                    Size = originalSize
                                }
                            ):Play()
                        end
                    )

                    click.MouseButton1Click:Connect(
                        function()
                            setclipboard(Config.InviteLink)
                            label.Text = "Copied!"
                            task.wait(1)
                            label.Text = "Copy"
                        end
                    )
                end

                return Container
            end

--> Element Translante <--

function OrionLib:AddTranslation(config)
    config = config or {}

    local LocalizationService = game:GetService("LocalizationService")
    local translations = config.Translations or {}
    local defaultEnabled = config.Default or false
    local saveFlag = config.Save ~= false
    local flagName = config.Flag or "AutoTranslation"

    local languageAliases = {
        ["pt"] = {"pt","ptbr","pt-br","portuguese","portugues","português","brazil","brasil","br"},
        ["en"] = {"en","enus","en-us","engb","en-gb","english","ingles","inglês","us","uk"},
        ["es"] = {"es","eses","es-es","esmx","es-mx","spanish","espanol","español","castelhano"},
        ["fr"] = {"fr","frfr","fr-fr","french","frances","français","francês"},
        ["de"] = {"de","dede","de-de","german","alemao","alemão","deutsch"},
        ["ru"] = {"ru","ruru","ru-ru","russian","russo","русский"},
        ["zh"] = {"zh","zhcn","zh-cn","zhtw","zh-tw","chinese","chines","chinês","mandarin"},
        ["ja"] = {"ja","jajp","ja-jp","japanese","japones","japonês"},
        ["ko"] = {"ko","kokr","ko-kr","korean","coreano"},
        ["it"] = {"it","itit","it-it","italian","italiano"},
        ["tr"] = {"tr","trtr","tr-tr","turkish","turco","türkçe"},
        ["ar"] = {"ar","arsa","ar-sa","arabic","arabe","árabe"},
        ["nl"] = {"nl","nlnl","nl-nl","dutch","holandes","holandês","nederlands"},
        ["pl"] = {"pl","plpl","pl-pl","polish","polones","polonês","polski"},
        ["sv"] = {"sv","svse","sv-se","swedish","sueco","svenska"},
        ["no"] = {"no","nb","nn","norwegian","noruegues","norsk"},
        ["da"] = {"da","dadk","da-dk","danish","dinamarques","dansk"},
        ["fi"] = {"fi","fifi","fi-fi","finnish","finlandes","suomi"},
        ["cs"] = {"cs","cscz","cs-cz","czech","tcheco","čeština"},
        ["hu"] = {"hu","huhu","hu-hu","hungarian","hungaro","magyar"},
        ["ro"] = {"ro","roro","ro-ro","romanian","romeno","română"},
        ["uk"] = {"uk","ukua","uk-ua","ukrainian","ucraniano","українська"},
        ["hi"] = {"hi","hiin","hi-in","hindi","हिन्दी"},
        ["th"] = {"th","thth","th-th","thai","tailandes"},
        ["vi"] = {"vi","vivn","vi-vn","vietnamese","vietnamita"},
        ["id"] = {"id","idid","id-id","indonesian","indonesio","bahasa indonesia"},
        ["ms"] = {"ms","msmy","ms-my","malay","malaio","bahasa melayu"},
        ["el"] = {"el","elgr","el-gr","greek","grego","ελληνικά"},
        ["he"] = {"he","heil","he-il","hebrew","hebraico","עברית"},
        ["fa"] = {"fa","fair","fa-ir","persian","farsi","persa"},
        ["bg"] = {"bg","bgbg","bg-bg","bulgarian","bulgaro","български"},
        ["hr"] = {"hr","hrhr","hr-hr","croatian","croata","hrvatski"},
        ["sk"] = {"sk","sksk","sk-sk","slovak","eslovaco","slovenčina"},
        ["ca"] = {"ca","caes","ca-es","catalan","catalao","català"},
    }

    local function normalize(lang)
        if not lang or lang == "" then return "en" end
        local clean = lang:lower():gsub("[-_%s]", "")
        for code, aliases in pairs(languageAliases) do
            for _, alias in ipairs(aliases) do
                if clean == alias then return code end
            end
        end
        if #clean >= 2 then
            local prefix = clean:sub(1, 2)
            if languageAliases[prefix] then return prefix end
        end
        return clean
    end

    local function detectLocale()
        local sources = {}
        pcall(function()
            local id = LocalizationService.RobloxLocaleId
            if id and id ~= "" then table.insert(sources, {id, 100}) end
        end)
        pcall(function()
            local id = LocalizationService.SystemLocaleId
            if id and id ~= "" then table.insert(sources, {id, 90}) end
        end)
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            if player then
                local ok, locale = pcall(function()
                    return player:GetAttribute("LocaleId") or player:GetAttribute("Locale")
                end)
                if ok and locale and locale ~= "" then
                    table.insert(sources, {locale, 80})
                end
            end
        end)
        table.sort(sources, function(a, b) return a[2] > b[2] end)
        for _, entry in ipairs(sources) do
            local n = normalize(entry[1])
            if n ~= "" then return n end
        end
        return "en"
    end

    local detectedLocale = config.Language and normalize(config.Language) or detectLocale()

    local stripCache = {}
    local function stripRichText(text)
        if stripCache[text] then return stripCache[text] end
        local result = text:gsub("<[^>]+>", "")
        result = result:gsub("&lt;","<"):gsub("&gt;",">"):gsub("&amp;","&"):gsub("&quot;",'"'):gsub("&#39;","'")
        result = result:match("^%s*(.-)%s*$")
        stripCache[text] = result
        return result
    end

    local translationIndex = {}
    for key, val in pairs(translations) do
        local stripped = stripRichText(key)
        translationIndex[key] = val
        if stripped ~= key then
            translationIndex[stripped] = val
        end
        translationIndex[stripped:lower()] = val
    end

    local function findTranslation(text)
        if translationIndex[text] then return translationIndex[text] end
        local stripped = stripRichText(text)
        if translationIndex[stripped] then return translationIndex[stripped] end
        return translationIndex[stripped:lower()]
    end

    local function applyTranslations(lang)
        if not next(translations) then return end
        if not OrionLib.MainWindow then return end
        pcall(function()
            for _, obj in ipairs(OrionLib.MainWindow:GetDescendants()) do
                if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) and obj.Text ~= "" then
                    pcall(function()
                        local orig = obj:GetAttribute("OriginalText") or obj.Text
                        obj:SetAttribute("OriginalText", orig)
                        local t = findTranslation(orig)
                        if t then
                            local translated = t[lang] or t["en"]
                            if translated then
                                obj.Text = translated
                            end
                        end
                    end)
                end
            end
        end)
    end

    local function revert()
        if not OrionLib.MainWindow then return end
        pcall(function()
            for _, obj in ipairs(OrionLib.MainWindow:GetDescendants()) do
                if (obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")) then
                    pcall(function()
                        local orig = obj:GetAttribute("OriginalText")
                        if orig then obj.Text = orig end
                    end)
                end
            end
        end)
    end

    local API = {
        Language = detectedLocale,
        Enabled = defaultEnabled,
    }

    function API:Run()
        pcall(function() applyTranslations(self.Language) end)
    end

    function API:SetLanguage(lang)
        self.Language = normalize(lang)
    end

    function API:Enable()
        self.Enabled = true
        self:Run()
    end

    function API:Disable()
        self.Enabled = false
        revert()
    end

    function API:Refresh()
        if self.Enabled then self:Run() end
    end

    function API:Revert()
        revert()
    end

    function API:DetectedLocale()
        return detectedLocale
    end

    if saveFlag and flagName then
        OrionLib.Flags[flagName] = API
    end

    if defaultEnabled then
        task.defer(function()
            task.wait(0.5)
            pcall(function() API:Run() end)
        end)
    end

    return API
end

--> Element Show Icons <--

function ElementFunction:AddShowIcons()
    local TweenService = game:GetService("TweenService")
    local UIS = game:GetService("UserInputService")

    local CARD_W = 110
    local CARD_H = 118
    local GAP = 14

    local Root = AddThemeObject(
        SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 10), {
            Size = UDim2.new(1, 0, 0, 210),
            Parent = ItemParent,
            ClipsDescendants = true,
        }), "Second"
    )

    AddThemeObject(MakeElement("Stroke"), "Stroke").Parent = Root

    local Top = Create("Frame", {
        Size = UDim2.new(1, -12, 0, 28),
        Position = UDim2.new(0, 6, 0, 6),
        BackgroundTransparency = 1,
        Parent = Root,
    })

    local Tabs = AddThemeObject(
        SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 6), {
            Size = UDim2.new(0, 90, 1, 0),
            Parent = Top,
        }), "Main"
    )

    AddThemeObject(MakeElement("Stroke"), "Stroke").Parent = Tabs

    local Pill = AddThemeObject(
        SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
            Size = UDim2.new(0, 42, 0, 18),
            Position = UDim2.new(0, 3, 0.5, -9),
            Parent = Tabs,
        }), "Stroke"
    )

    local V1Text = AddThemeObject(
        SetProps(MakeElement("Label", "V1", 9), {
            Size = UDim2.new(0, 42, 1, 0),
            Position = UDim2.new(0, 3, 0, 0),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            Parent = Tabs,
        }), "Text"
    )

    local V2Text = AddThemeObject(
        SetProps(MakeElement("Label", "V2", 9), {
            Size = UDim2.new(0, 42, 1, 0),
            Position = UDim2.new(0, 46, 0, 0),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Center,
            Parent = Tabs,
        }), "TextDark"
    )

    local V1 = Create("TextButton", {
        Size = UDim2.new(0, 42, 1, 0),
        Position = UDim2.new(0, 3, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = Tabs,
    })

    local V2 = Create("TextButton", {
        Size = UDim2.new(0, 42, 1, 0),
        Position = UDim2.new(0, 46, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        Parent = Tabs,
    })

    local Count = AddThemeObject(
        SetProps(MakeElement("Label", "", 9), {
            Size = UDim2.new(0, 100, 1, 0),
            Position = UDim2.new(1, -105, 0, 0),
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Right,
            Parent = Top,
        }), "TextDark"
    )

    local View = Create("Frame", {
        Size = UDim2.new(1, -70, 0, 128),
        Position = UDim2.new(0, 35, 0, 38),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent = Root,
    })

    local Holder = Create("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(0, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Parent = View,
    })

    local Dots = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 10),
        Position = UDim2.new(0, 0, 1, -18),
        BackgroundTransparency = 1,
        Parent = Root,
    })

    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        Padding = UDim.new(0, 5),
        Parent = Dots,
    })

    local cards = {}
    local dots = {}
    local current = 1
    local dragging = false
    local dragStart = 0
    local startX = 0
    local currentVersion = "v1"

    local function center()
        return (View.AbsoluteSize.X / 2) - (CARD_W / 2)
    end

    local function updateDots()
        for i, v in ipairs(dots) do
            TweenService:Create(v, TweenInfo.new(0.12), {
                BackgroundTransparency = i == current and 0 or 0.65,
                Size = i == current and UDim2.new(0, 12, 0, 4) or UDim2.new(0, 5, 0, 4)
            }):Play()
        end
    end

    local function updateCards()
        for i, v in ipairs(cards) do
            local active = i == current

            TweenService:Create(v.Frame, TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                Size = active and UDim2.new(0, CARD_W, 0, CARD_H) or UDim2.new(0, CARD_W - 10, 0, CARD_H - 10),
                BackgroundTransparency = active and 0 or 0.3
            }):Play()

            TweenService:Create(v.Icon, TweenInfo.new(0.15), {
                Size = active and UDim2.new(0, 44, 0, 44) or UDim2.new(0, 32, 0, 32),
                ImageTransparency = active and 0 or 0.5
            }):Play()

            TweenService:Create(v.Name, TweenInfo.new(0.15), {
                TextTransparency = active and 0 or 0.55
            }):Play()

            if v.Copy then
                TweenService:Create(v.Copy, TweenInfo.new(0.15), {
                    BackgroundTransparency = active and 0.85 or 0.95
                }):Play()
            end
        end
        updateDots()
    end

    local function snap(index)
        current = math.clamp(index, 1, #cards)
        local target = center() - ((current - 1) * (CARD_W + GAP))

        TweenService:Create(
            Holder,
            TweenInfo.new(0.22, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                Position = UDim2.new(0, target, 0, 0)
            }
        ):Play()

        updateCards()
    end

    local function createCard(name, id, index)
        local frame = AddThemeObject(
            SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 9), {
                Size = UDim2.new(0, CARD_W - 10, 0, CARD_H - 10),
                Position = UDim2.new(
                    0,
                    (index - 1) * (CARD_W + GAP),
                    0,
                    8
                ),
                BackgroundTransparency = 0.3,
                Parent = Holder,
            }), "Main"
        )

        AddThemeObject(MakeElement("Stroke"), "Stroke").Parent = frame

        local icon = Create("ImageLabel", {
            Image = id,
            BackgroundTransparency = 1,
            Size = UDim2.new(0, 32, 0, 32),
            Position = UDim2.new(0.5, 0, 0, 14),
            AnchorPoint = Vector2.new(0.5, 0),
            Parent = frame,
        })

        local nameLabel = AddThemeObject(
            SetProps(MakeElement("Label", name, 9), {
                Size = UDim2.new(1, -8, 0, 22),
                Position = UDim2.new(0, 4, 0, 54),
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                TextTruncate = Enum.TextTruncate.AtEnd,
                TextTransparency = 0.55,
                Parent = frame,
            }), "Text"
        )

        local copy = AddThemeObject(
            SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 5), {
                Size = UDim2.new(0, 60, 0, 18),
                Position = UDim2.new(0.5, -30, 1, -22),
                BackgroundTransparency = 0.85,
                Parent = frame,
            }), "Second"
        )

        AddThemeObject(MakeElement("Stroke"), "Stroke").Parent = copy

        local copyLabel = AddThemeObject(
            SetProps(MakeElement("Label", "copy id", 7), {
                Size = UDim2.new(1, 0, 1, 0),
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Center,
                Parent = copy,
            }), "Text"
        )

        local copyBtn = Create("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = copy,
        })

        copyBtn.MouseButton1Click:Connect(function()
            pcall(function() setclipboard(id) end)

            local orig = copyLabel.Text
            copyLabel.Text = "✓"

            task.delay(0.8, function()
                copyLabel.Text = orig
            end)
        end)

        local select = Create("TextButton", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            Parent = frame,
        })

        select.MouseButton1Click:Connect(function()
            if not dragging then
                snap(index)
            end
        end)

        table.insert(cards, {
            Frame = frame,
            Icon = icon,
            Name = nameLabel,
            Copy = copy
        })
    end

    local function clear()
        for _, v in ipairs(cards) do
            if v.Frame then
                v.Frame:Destroy()
            end
        end

        for _, v in ipairs(dots) do
            if v then
                v:Destroy()
            end
        end

        cards = {}
        dots = {}
        current = 1
    end

    local function load(version)
        clear()

        local source = version == "v2" and ICONS_V2 or ICONS_V1
        local items = {}

        for n, i in pairs(source) do
            table.insert(items, { n, i })
        end

        table.sort(items, function(a, b)
            return a[1] < b[1]
        end)

        local totalWidth =
            (#items * CARD_W) +
            ((#items - 1) * GAP)

        Holder.Size = UDim2.new(0, totalWidth, 1, 0)

        for i, v in ipairs(items) do
            createCard(v[1], v[2], i)
        end

        local maxDots = math.min(7, #items)

        for i = 1, maxDots do
            local dot = AddThemeObject(
                SetProps(MakeElement("RoundFrame", Color3.fromRGB(255,255,255), 0, 2), {
                    Size = UDim2.new(0, 5, 0, 4),
                    BackgroundTransparency = 0.65,
                    Parent = Dots,
                }), "Stroke"
            )

            table.insert(dots, dot)
        end

        Count.Text = #items .. " icons"

        snap(1)
    end

    View.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position.X
            startX = Holder.Position.X.Offset
        end
    end)

    View.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then

            local delta = input.Position.X - dragStart

            Holder.Position = UDim2.new(
                0,
                startX + delta,
                0,
                0
            )

            local nearest = math.round(
                ((center() - Holder.Position.X.Offset) / (CARD_W + GAP)) + 1
            )

            nearest = math.clamp(nearest, 1, #cards)

            if nearest ~= current then
                current = nearest
                updateCards()
            end
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch
        ) then

            dragging = false
            snap(current)
        end
    end)

    local function setVersion(version)
        currentVersion = version

        local v1 = version == "v1"

        TweenService:Create(
            Pill,
            TweenInfo.new(0.15, Enum.EasingStyle.Quad),
            {
                Position = UDim2.new(
                    0,
                    v1 and 3 or 46,
                    0.5,
                    -9
                )
            }
        ):Play()

        V1Text.TextColor3 =
            v1
            and OrionLib.Themes[OrionLib.SelectedTheme].Main
            or OrionLib.Themes[OrionLib.SelectedTheme].TextDark

        V2Text.TextColor3 =
            v1
            and OrionLib.Themes[OrionLib.SelectedTheme].TextDark
            or OrionLib.Themes[OrionLib.SelectedTheme].Main

        load(version)
    end

    V1.MouseButton1Click:Connect(function()
        if currentVersion ~= "v1" then
            setVersion("v1")
        end
    end)

    V2.MouseButton1Click:Connect(function()
        if currentVersion ~= "v2" then
            setVersion("v2")
        end
    end)

    task.defer(function()
        setVersion("v1")
    end)

    return Root
end

            return ElementFunction
        end

        local ElementFunction = {}

        --> Element Section <--

local function CreateSection(SectionConfig, parent)
    SectionConfig = SectionConfig or {}
    SectionConfig.Name = SectionConfig.Name or "Section"
    SectionConfig.Icon = SectionConfig.Icon or ""
    SectionConfig.Collapsible = SectionConfig.Collapsible == nil and true or SectionConfig.Collapsible
    SectionConfig.DefaultCollapsed = SectionConfig.DefaultCollapsed or false
    SectionConfig.ShowCount = SectionConfig.ShowCount == nil and false or SectionConfig.ShowCount
    SectionConfig.AccentBar = SectionConfig.AccentBar == nil and true or SectionConfig.AccentBar
    SectionConfig.AccentColor = SectionConfig.AccentColor or nil
    SectionConfig.TitleColor = SectionConfig.TitleColor or nil
    SectionConfig.HeaderBackground = SectionConfig.HeaderBackground or false
    SectionConfig.HeaderBackgroundColor = SectionConfig.HeaderBackgroundColor or nil
    SectionConfig.HeaderBackgroundTransparency = SectionConfig.HeaderBackgroundTransparency or 0.85
    SectionConfig.ContentBackground = SectionConfig.ContentBackground or false
    SectionConfig.ContentBackgroundColor = SectionConfig.ContentBackgroundColor or nil
    SectionConfig.ContentBackgroundTransparency = SectionConfig.ContentBackgroundTransparency or 0.95
    SectionConfig.AnimateAccentBar = SectionConfig.AnimateAccentBar == nil and true or SectionConfig.AnimateAccentBar
    SectionConfig.HeaderSize = SectionConfig.HeaderSize or "Normal"

    local HEADER_HEIGHT = SectionConfig.HeaderSize == "Large" and 40 or (SectionConfig.HeaderSize == "Small" and 28 or 36)
    local ACCENT_BAR_WIDTH = 3
    local ACCENT_BAR_HEIGHT = 18
    local ICON_SIZE = 18
    local ICON_LEFT_OFFSET = 12
    local TITLE_LEFT_OFFSET = SectionConfig.Icon ~= "" and 38 or 20
    local TITLE_RIGHT_OFFSET = 50
    local TITLE_SIZE = 14
    local COUNT_RIGHT_OFFSET = 36
    local ARROW_RIGHT_OFFSET = 14
    local ARROW_SIZE = 16
    local DIVIDER_LEFT_OFFSET = 8
    local CONTENT_PADDING_V = 7
    local CONTENT_PADDING_H = 8
    local CONTENT_SPACING = 5
    local COLLAPSE_DURATION = 0.25
    local OPEN_DURATION = 0.28

    local theme = OrionLib.Themes[OrionLib.SelectedTheme]
    local COLLAPSED_TITLE_COLOR = Color3.fromRGB(175, 175, 192)
    local OPEN_TITLE_COLOR = SectionConfig.TitleColor or theme.Text or Color3.fromRGB(232, 232, 248)
    local COLLAPSED_ICON_COLOR = Color3.fromRGB(160, 160, 178)
    local OPEN_ICON_COLOR = Color3.fromRGB(215, 215, 232)
    local COLLAPSED_ARROW_COLOR = Color3.fromRGB(155, 155, 172)
    local OPEN_ARROW_COLOR = Color3.fromRGB(205, 205, 222)

    local collapsible = SectionConfig.Collapsible
    local collapsed = collapsible and SectionConfig.DefaultCollapsed or false
    local contentHeight = 0
    local tweening = false
    local itemCount = 0
    local accentColor = SectionConfig.AccentColor or theme.Stroke

    local activeTweens = {}

    local function tween(obj, info, props)
        if not obj or not obj.Parent then return end
        local key = tostring(obj)
        if activeTweens[key] then
            pcall(function() activeTweens[key]:Cancel() end)
            activeTweens[key] = nil
        end
        local t = TweenService:Create(obj, info, props)
        activeTweens[key] = t
        t:Play()
        return t
    end

    local fastOut = TweenInfo.new(OPEN_DURATION, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local fastIn = TweenInfo.new(COLLAPSE_DURATION, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
    local backOut = TweenInfo.new(OPEN_DURATION, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    local quick = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
    local superQuick = TweenInfo.new(0.12, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

    local SectionFrame = SetChildren(
        SetProps(MakeElement("TFrame"), {
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Parent = parent,
            ClipsDescendants = false,
            Name = "SectionFrame"
        }),
        { MakeElement("List", 0, 6) }
    )

    local HeaderFrame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, HEADER_HEIGHT),
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        Name = "Header",
        LayoutOrder = 1,
        ClipsDescendants = false,
        Parent = SectionFrame
    })
    Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = HeaderFrame })

    local HeaderBG
    if SectionConfig.HeaderBackground then
        HeaderBG = Create("Frame", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundColor3 = SectionConfig.HeaderBackgroundColor or theme.Second or Color3.fromRGB(40, 40, 60),
            BackgroundTransparency = SectionConfig.HeaderBackgroundTransparency,
            BorderSizePixel = 0,
            ZIndex = 1,
            Parent = HeaderFrame
        })
        Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = HeaderBG })
    end

    local AccentBar
    if SectionConfig.AccentBar then
        AccentBar = Create("Frame", {
            Size = UDim2.new(0, ACCENT_BAR_WIDTH, 0, collapsed and 8 or ACCENT_BAR_HEIGHT),
            Position = UDim2.new(0, 0, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = accentColor,
            BorderSizePixel = 0,
            ZIndex = 3,
            Parent = HeaderFrame
        })
        Create("UICorner", { CornerRadius = UDim.new(0, 2), Parent = AccentBar })
    end

    local IconImage
    if SectionConfig.Icon ~= "" then
        IconImage = Create("ImageLabel", {
            Size = UDim2.new(0, ICON_SIZE, 0, ICON_SIZE),
            Position = UDim2.new(0, ICON_LEFT_OFFSET, 0.5, 0),
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundTransparency = 1,
            Image = SectionConfig.Icon,
            ImageColor3 = collapsed and COLLAPSED_ICON_COLOR or OPEN_ICON_COLOR,
            ImageTransparency = 0,
            Name = "Icon",
            ZIndex = 3,
            Parent = HeaderFrame
        })
    end

    local TitleLabel = Create("TextLabel", {
        Size = UDim2.new(1, -(TITLE_LEFT_OFFSET + TITLE_RIGHT_OFFSET), 1, 0),
        Position = UDim2.new(0, TITLE_LEFT_OFFSET, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextSize = TITLE_SIZE,
        Name = "Title",
        Text = SectionConfig.Name,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        ZIndex = 3,
        TextColor3 = collapsed and COLLAPSED_TITLE_COLOR or OPEN_TITLE_COLOR,
        TextStrokeTransparency = 1,
        TextTransparency = 0,
        Parent = HeaderFrame
    })

    local CountLabel
    if SectionConfig.ShowCount then
        CountLabel = Create("TextLabel", {
            Size = UDim2.new(0, 28, 1, 0),
            Position = UDim2.new(1, collapsible and -(COUNT_RIGHT_OFFSET + 14) or -COUNT_RIGHT_OFFSET, 0, 0),
            AnchorPoint = Vector2.new(1, 0),
            BackgroundTransparency = 1,
            Font = Enum.Font.GothamBold,
            TextSize = 10,
            Name = "Count",
            Text = "",
            TextXAlignment = Enum.TextXAlignment.Right,
            TextYAlignment = Enum.TextYAlignment.Center,
            ZIndex = 3,
            TextColor3 = Color3.fromRGB(155, 155, 172),
            TextTransparency = 0,
            Parent = HeaderFrame
        })
    end

    local Arrow
    if collapsible then
        Arrow = Create("ImageLabel", {
            Size = UDim2.new(0, ARROW_SIZE, 0, ARROW_SIZE),
            Position = UDim2.new(1, -ARROW_RIGHT_OFFSET, 0.5, 0),
            AnchorPoint = Vector2.new(1, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://7072706796",
            ImageColor3 = collapsed and COLLAPSED_ARROW_COLOR or OPEN_ARROW_COLOR,
            ImageTransparency = 0,
            Rotation = collapsed and 0 or 180,
            Name = "Arrow",
            ZIndex = 3,
            Parent = HeaderFrame
        })
    end

    local HeaderClick = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 4,
        Parent = HeaderFrame
    })

    local DividerLine = AddThemeObject(
        SetProps(MakeElement("Frame"), {
            Size = UDim2.new(collapsed and 0.35 or 1, -(DIVIDER_LEFT_OFFSET * 2), 0, 1),
            Position = UDim2.new(0, DIVIDER_LEFT_OFFSET, 0, 0),
            BackgroundTransparency = collapsed and 0.78 or 0.58,
            LayoutOrder = 2,
            Parent = SectionFrame
        }),
        "Divider"
    )

    local ContentContainer = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundTransparency = 1,
        Name = "ContentContainer",
        ClipsDescendants = true,
        LayoutOrder = 3,
        Parent = SectionFrame
    })

    if SectionConfig.ContentBackground then
        local bgColor = SectionConfig.ContentBackgroundColor or theme.Main
        ContentContainer.BackgroundColor3 = bgColor
        ContentContainer.BackgroundTransparency = SectionConfig.ContentBackgroundTransparency
        Create("UICorner", { CornerRadius = UDim.new(0, 6), Parent = ContentContainer })
    end

    local Inner = SetChildren(
        Create("Frame", {
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
            Name = "Inner",
            AutomaticSize = Enum.AutomaticSize.Y,
            Parent = ContentContainer
        }),
        {
            MakeElement("List", 0, CONTENT_SPACING),
            MakeElement("Padding", CONTENT_PADDING_V, CONTENT_PADDING_H, CONTENT_PADDING_H, CONTENT_PADDING_V)
        }
    )

    local function updateCount()
        if not SectionConfig.ShowCount or not CountLabel then return end
        CountLabel.Text = itemCount > 0 and tostring(itemCount) or ""
    end

    local function updateContentHeight()
        if not Inner or not Inner.Parent then return end
        local layout = Inner:FindFirstChildOfClass("UIListLayout")
        if not layout then return end
        contentHeight = layout.AbsoluteContentSize.Y + (CONTENT_PADDING_V * 2)
    end

    AddConnection(Inner.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
        if tweening then return end
        updateContentHeight()
        if not collapsed then
            ContentContainer.Size = UDim2.new(1, 0, 0, contentHeight)
        end
    end)

    local function animateOpen()
        if Arrow then
            tween(Arrow, backOut, { Rotation = 180, ImageColor3 = OPEN_ARROW_COLOR })
        end
        tween(TitleLabel, quick, { TextColor3 = OPEN_TITLE_COLOR })
        if IconImage then
            tween(IconImage, quick, { ImageColor3 = OPEN_ICON_COLOR })
        end
        if AccentBar and SectionConfig.AnimateAccentBar then
            tween(AccentBar, backOut, { Size = UDim2.new(0, ACCENT_BAR_WIDTH, 0, ACCENT_BAR_HEIGHT) })
        end
        tween(DividerLine, fastOut, {
            Size = UDim2.new(1, -(DIVIDER_LEFT_OFFSET * 2), 0, 1),
            BackgroundTransparency = 0.58
        })

        ContentContainer.Size = UDim2.new(1, 0, 0, 0)
        local t = tween(ContentContainer, fastOut, { Size = UDim2.new(1, 0, 0, contentHeight) })
        if t then
            local conn
            conn = t.Completed:Connect(function()
                conn:Disconnect()
                tweening = false
            end)
        else
            tweening = false
        end
    end

    local function animateClose()
        if Arrow then
            tween(Arrow, fastIn, { Rotation = 0, ImageColor3 = COLLAPSED_ARROW_COLOR })
        end
        tween(TitleLabel, superQuick, { TextColor3 = COLLAPSED_TITLE_COLOR })
        if IconImage then
            tween(IconImage, superQuick, { ImageColor3 = COLLAPSED_ICON_COLOR })
        end
        if AccentBar and SectionConfig.AnimateAccentBar then
            tween(AccentBar, fastIn, { Size = UDim2.new(0, ACCENT_BAR_WIDTH, 0, 8) })
        end
        tween(DividerLine, fastIn, {
            Size = UDim2.new(0.35, -(DIVIDER_LEFT_OFFSET * 2), 0, 1),
            BackgroundTransparency = 0.78
        })

        local t = tween(ContentContainer, fastIn, { Size = UDim2.new(1, 0, 0, 0) })
        if t then
            local conn
            conn = t.Completed:Connect(function()
                conn:Disconnect()
                tweening = false
            end)
        else
            tweening = false
        end
    end

    local function Toggle()
        if not collapsible or tweening then return end
        collapsed = not collapsed
        tweening = true
        updateCount()
        updateContentHeight()
        if collapsed then
            animateClose()
        else
            animateOpen()
        end
    end

    if collapsible then
        AddConnection(HeaderClick.MouseButton1Click, Toggle)

        AddConnection(HeaderClick.MouseEnter, function()
            if tweening then return end
            local target = HeaderBG or HeaderFrame
            local targetBG = HeaderBG
                and math.max(0, SectionConfig.HeaderBackgroundTransparency - 0.1)
                or 0.88
            tween(target, quick, {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = targetBG
            })
            if Arrow then
                tween(Arrow, quick, { ImageColor3 = Color3.fromRGB(230, 230, 245) })
            end
            if AccentBar then
                tween(AccentBar, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, ACCENT_BAR_WIDTH + 1, 0, collapsed and 10 or ACCENT_BAR_HEIGHT + 2)
                })
            end
        end)

        AddConnection(HeaderClick.MouseLeave, function()
            local target = HeaderBG or HeaderFrame
            local targetBG = HeaderBG
                and SectionConfig.HeaderBackgroundTransparency
                or 1
            tween(target, quick, { BackgroundTransparency = targetBG })
            if Arrow then
                tween(Arrow, quick, {
                    ImageColor3 = collapsed and COLLAPSED_ARROW_COLOR or OPEN_ARROW_COLOR
                })
            end
            if AccentBar then
                tween(AccentBar, quick, {
                    Size = UDim2.new(0, ACCENT_BAR_WIDTH, 0, collapsed and 8 or ACCENT_BAR_HEIGHT)
                })
            end
        end)

        AddConnection(HeaderClick.MouseButton1Down, function()
            local target = HeaderBG or HeaderFrame
            local targetBG = HeaderBG
                and math.max(0, SectionConfig.HeaderBackgroundTransparency - 0.2)
                or 0.78
            tween(target, TweenInfo.new(0.07), {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = targetBG
            })
        end)

        AddConnection(HeaderClick.MouseButton1Up, function()
            local target = HeaderBG or HeaderFrame
            local targetBG = HeaderBG
                and math.max(0, SectionConfig.HeaderBackgroundTransparency - 0.1)
                or 0.88
            tween(target, superQuick, {
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = targetBG
            })
        end)
    end

    if collapsed then
        ContentContainer.Size = UDim2.new(1, 0, 0, 0)
        TitleLabel.TextColor3 = COLLAPSED_TITLE_COLOR
        if IconImage then IconImage.ImageColor3 = COLLAPSED_ICON_COLOR end
        if AccentBar then AccentBar.Size = UDim2.new(0, ACCENT_BAR_WIDTH, 0, 8) end
        DividerLine.Size = UDim2.new(0.35, -(DIVIDER_LEFT_OFFSET * 2), 0, 1)
        DividerLine.BackgroundTransparency = 0.78
    else
        task.defer(function()
            if not Inner or not Inner.Parent then return end
            updateContentHeight()
            if not collapsed then
                ContentContainer.Size = UDim2.new(1, 0, 0, contentHeight)
            end
        end)
    end

    local SectionFunctions = {}
    local rawElements = GetElements(Inner)

    for name, func in pairs(rawElements) do
        local originalFunc = func
        SectionFunctions[name] = function(self, config, ...)
            local result = originalFunc(self, config, ...)
            itemCount = itemCount + 1
            updateCount()
            return result
        end
    end

    function SectionFunctions:AddSection(config)
        local s = CreateSection(config, Inner)
        itemCount = itemCount + 1
        updateCount()
        return s
    end

    function SectionFunctions:Toggle()
        if collapsible then Toggle() end
    end

    function SectionFunctions:Expand()
        if collapsible and collapsed then Toggle() end
    end

    function SectionFunctions:Collapse()
        if collapsible and not collapsed then Toggle() end
    end

    function SectionFunctions:IsCollapsed()
        return collapsed
    end

    function SectionFunctions:SetName(text)
        if not TitleLabel or not TitleLabel.Parent then return end
        tween(TitleLabel, TweenInfo.new(0.1), { TextTransparency = 1 })
        task.delay(0.08, function()
            if not TitleLabel or not TitleLabel.Parent then return end
            TitleLabel.Text = text
            tween(TitleLabel, quick, { TextTransparency = 0 })
        end)
    end

    function SectionFunctions:GetName()
        return TitleLabel and TitleLabel.Text or ""
    end

    function SectionFunctions:GetCount()
        return itemCount
    end

    function SectionFunctions:SetAccentColor(color)
        accentColor = color
        if AccentBar then
            tween(AccentBar, quick, { BackgroundColor3 = color })
        end
    end

    function SectionFunctions:SetTitleColor(color)
        tween(TitleLabel, quick, { TextColor3 = color })
    end

    function SectionFunctions:SetHeaderBackground(enabled, color, transparency)
        if not HeaderBG then return end
        if enabled then
            if color then HeaderBG.BackgroundColor3 = color end
            tween(HeaderBG, quick, { BackgroundTransparency = transparency or 0.85 })
        else
            tween(HeaderBG, quick, { BackgroundTransparency = 1 })
        end
    end

    function SectionFunctions:SetContentBackground(enabled, color, transparency)
        if enabled then
            ContentContainer.BackgroundColor3 = color or OrionLib.Themes[OrionLib.SelectedTheme].Main
            tween(ContentContainer, quick, { BackgroundTransparency = transparency or 0.95 })
        else
            tween(ContentContainer, quick, { BackgroundTransparency = 1 })
        end
    end

    function SectionFunctions:Flash(color)
        local flashColor = color or accentColor
        local target = HeaderBG or HeaderFrame
        if not target or not target.Parent then return end
        local origBG = HeaderBG and SectionConfig.HeaderBackgroundTransparency or 1
        tween(target, TweenInfo.new(0.08), {
            BackgroundColor3 = flashColor,
            BackgroundTransparency = 0.55
        })
        task.delay(0.08, function()
            if not target or not target.Parent then return end
            tween(target, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                BackgroundTransparency = origBG
            })
        end)
    end

    return SectionFunctions
end

function ElementFunction:AddSection(SectionConfig)
    return CreateSection(SectionConfig, Container)
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
    table.clear(OrionLib.Connections)

    if MainWindow then
        MainWindow:Destroy()
    end
    if MobileIcon then
        MobileIcon:Destroy()
    end
    if OrionLib.MinimizeGUI then
        OrionLib.MinimizeGUI:Destroy()
        OrionLib.MinimizeGUI = nil
    end
    if OrionLib.ActiveNotifications then
        for _, notif in ipairs(OrionLib.ActiveNotifications) do
            if notif and notif.Parent then
                notif:Destroy()
            end
        end
        table.clear(OrionLib.ActiveNotifications)
    end

    local screenGui = Orion and Orion.Parent and Orion or nil
    if screenGui then
        screenGui:Destroy()
    else
        local coreGui = game:GetService("CoreGui")
        local existing = coreGui:FindFirstChild("Orion")
        if existing then existing:Destroy() end
    end

    table.clear(OrionLib.Flags)
    table.clear(OrionLib.ThemeObjects)
end

    return Functions
end

--> Button/Toggle Minimize <--

function OrionLib:BtnMinimize(config)
	local CoreGui = game:GetService("CoreGui")
	local UIS = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local Camera = workspace.CurrentCamera

	if OrionLib.MinimizeGUI and OrionLib.MinimizeGUI.Parent then
		OrionLib.MinimizeGUI:Destroy()
		OrionLib.MinimizeGUI = nil
	end

	local existing = CoreGui:FindFirstChild("ToggleGUI")
	if existing then existing:Destroy() end

	config = config or {}
	local buttonConfig = config.Button or {}
	local cornerConfig = config.Corner or {}
	local strokeConfig = config.Stroke or {}
	local badgeConfig  = config.Badge  or {}
	local labelConfig  = config.Label  or {}
	local pulseConfig  = config.Pulse  or {}

	local MARGIN = 10
	local BTN_W  = buttonConfig.Size and buttonConfig.Size.X.Offset or 56
	local BTN_H  = buttonConfig.Size and buttonConfig.Size.Y.Offset or 56
	local START_X = buttonConfig.Position and buttonConfig.Position.X.Offset or 12
	local START_Y = buttonConfig.Position and buttonConfig.Position.Y.Offset or (Camera.ViewportSize.Y - BTN_H - 80)

	local function clampPos(x, y)
		local vp = Camera.ViewportSize
		return
			math.clamp(x, MARGIN, vp.X - BTN_W - MARGIN),
			math.clamp(y, MARGIN, vp.Y - BTN_H - MARGIN)
	end

	START_X, START_Y = clampPos(START_X, START_Y)

	local MinimizeGUI = Instance.new("ScreenGui")
	MinimizeGUI.Name           = "ToggleGUI"
	MinimizeGUI.ResetOnSpawn   = false
	MinimizeGUI.DisplayOrder   = 999
	MinimizeGUI.IgnoreGuiInset = true
	pcall(function()
		MinimizeGUI.Parent = gethui and gethui() or CoreGui
	end)

	local ToggleButton = Instance.new("ImageButton")
	ToggleButton.Size                   = UDim2.new(0, BTN_W, 0, BTN_H)
	ToggleButton.Position               = UDim2.new(0, START_X, 0, START_Y)
	ToggleButton.Image                  = buttonConfig.Image or "rbxassetid://18503887946"
	ToggleButton.BackgroundColor3       = buttonConfig.BackgroundColor3 or Color3.fromRGB(20, 20, 20)
	ToggleButton.BackgroundTransparency = buttonConfig.BackgroundTransparency or 0.15
	ToggleButton.BorderSizePixel        = 0
	ToggleButton.ZIndex                 = 10
	ToggleButton.Parent                 = MinimizeGUI

	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = cornerConfig.CornerRadius or UDim.new(0.18, 0)
	UICorner.Parent = ToggleButton

	local strokeColor =
		strokeConfig.Color
		or (OrionLib.Themes and OrionLib.Themes[OrionLib.SelectedTheme] and OrionLib.Themes[OrionLib.SelectedTheme].Stroke)
		or Color3.fromRGB(70, 70, 70)

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color     = strokeColor
	UIStroke.Thickness = strokeConfig.Thickness or 1.5
	UIStroke.Parent    = ToggleButton

	local ToggleLabel
	if labelConfig.Text and labelConfig.Text ~= "" then
		ToggleLabel = Instance.new("TextLabel")
		ToggleLabel.BackgroundTransparency = 1
		ToggleLabel.Text           = labelConfig.Text
		ToggleLabel.TextColor3     = labelConfig.Color or Color3.fromRGB(220, 220, 220)
		ToggleLabel.Font           = Enum.Font.GothamBold
		ToggleLabel.TextSize       = labelConfig.Size or 10
		ToggleLabel.TextXAlignment = Enum.TextXAlignment.Center
		ToggleLabel.ZIndex         = 10
		ToggleLabel.Parent         = MinimizeGUI

		local function syncLabel()
			ToggleLabel.Size     = UDim2.new(0, BTN_W, 0, 14)
			ToggleLabel.Position = UDim2.new(0, ToggleButton.Position.X.Offset, 0, ToggleButton.Position.Y.Offset + BTN_H + 3)
		end
		task.defer(syncLabel)
	end
	local BadgeLabel
	if badgeConfig.Text and badgeConfig.Text ~= "" then
		BadgeLabel = Instance.new("TextLabel")
		BadgeLabel.Size             = UDim2.new(0, 18, 0, 18)
		BadgeLabel.AnchorPoint      = Vector2.new(1, 0)
		BadgeLabel.Position         = UDim2.new(1, 0, 0, 0)
		BadgeLabel.BackgroundColor3 = badgeConfig.Color or Color3.fromRGB(220, 50, 50)
		BadgeLabel.BorderSizePixel  = 0
		BadgeLabel.Text             = tostring(badgeConfig.Text)
		BadgeLabel.TextColor3       = Color3.fromRGB(255, 255, 255)
		BadgeLabel.Font             = Enum.Font.GothamBold
		BadgeLabel.TextSize         = 10
		BadgeLabel.ZIndex           = 12
		BadgeLabel.Parent           = ToggleButton
		Instance.new("UICorner", BadgeLabel).CornerRadius = UDim.new(1, 0)
	end

	if pulseConfig.Enabled then
		local PulseRing = Instance.new("ImageLabel")
		PulseRing.Size                = UDim2.new(1, 0, 1, 0)
		PulseRing.Position            = UDim2.new(0, 0, 0, 0)
		PulseRing.BackgroundTransparency = 1
		PulseRing.Image               = "rbxassetid://5028857084"
		PulseRing.ImageColor3         = pulseConfig.Color or strokeColor
		PulseRing.ImageTransparency   = 0.3
		PulseRing.ZIndex              = 9
		PulseRing.Parent              = ToggleButton

		local function doPulse()
			if not MinimizeGUI.Parent then return end
			PulseRing.Size             = UDim2.new(1, 0, 1, 0)
			PulseRing.Position         = UDim2.new(0, 0, 0, 0)
			PulseRing.ImageTransparency = 0.3
			TweenService:Create(PulseRing, TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Size             = UDim2.new(1.8, 0, 1.8, 0),
				Position         = UDim2.new(-0.4, 0, -0.4, 0),
				ImageTransparency = 1
			}):Play()
			task.delay(1.4, doPulse)
		end
		task.defer(doPulse)
	end

	if not UIS.TouchEnabled then
		ToggleButton.MouseEnter:Connect(function()
			TweenService:Create(ToggleButton, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
				BackgroundTransparency = math.max(0, (buttonConfig.BackgroundTransparency or 0.15) - 0.08),
				Size = UDim2.new(0, BTN_W + 4, 0, BTN_H + 4)
			}):Play()
			TweenService:Create(UIStroke, TweenInfo.new(0.18), { Transparency = 0.2 }):Play()
		end)
		ToggleButton.MouseLeave:Connect(function()
			TweenService:Create(ToggleButton, TweenInfo.new(0.18, Enum.EasingStyle.Quad), {
				BackgroundTransparency = buttonConfig.BackgroundTransparency or 0.15,
				Size = UDim2.new(0, BTN_W, 0, BTN_H)
			}):Play()
			TweenService:Create(UIStroke, TweenInfo.new(0.18), { Transparency = 0 }):Play()
		end)
	end

	local dragging     = false
	local dragMoved    = false
	local lockedInput  = nil
	local dragStartPos = Vector2.new(0, 0)
	local startBtnX    = 0
	local startBtnY    = 0

	local function moveTo(x, y)
		local cx, cy = clampPos(x, y)
		ToggleButton.Position = UDim2.new(0, cx, 0, cy)
		if ToggleLabel then
			ToggleLabel.Position = UDim2.new(0, cx, 0, cy + BTN_H + 3)
		end
	end

	ToggleButton.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
		and input.UserInputType ~= Enum.UserInputType.Touch then return end

		if dragging then return end

		dragging      = true
		dragMoved     = false
		lockedInput   = input
		dragStartPos  = Vector2.new(input.Position.X, input.Position.Y)
		startBtnX     = ToggleButton.Position.X.Offset
		startBtnY     = ToggleButton.Position.Y.Offset
	end)

	UIS.InputChanged:Connect(function(input)
		if not dragging then return end
		if input ~= lockedInput then return end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement
		and input.UserInputType ~= Enum.UserInputType.Touch then return end

		local delta = Vector2.new(input.Position.X, input.Position.Y) - dragStartPos
		if delta.Magnitude > 4 then dragMoved = true end
		moveTo(startBtnX + delta.X, startBtnY + delta.Y)
	end)

	UIS.InputEnded:Connect(function(input)
		if input ~= lockedInput then return end
		dragging    = false
		lockedInput = nil
	end)

	Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		task.defer(function()
			moveTo(ToggleButton.Position.X.Offset, ToggleButton.Position.Y.Offset)
		end)
	end)

	ToggleButton.Activated:Connect(function()
		if dragMoved then
			dragMoved = false
			return
		end

		TweenService:Create(ToggleButton, TweenInfo.new(0.08, Enum.EasingStyle.Quad), {
			Size = UDim2.new(0, BTN_W - 6, 0, BTN_H - 6)
		}):Play()
		task.delay(0.08, function()
			TweenService:Create(ToggleButton, TweenInfo.new(0.14, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, BTN_W, 0, BTN_H)
			}):Play()
		end)

		Orion.Enabled = not Orion.Enabled

		if Orion.Enabled and OrionLib.MainWindow then
			OrionLib.MainWindow.Position    = UDim2.new(0.5, -307, 0.5, -172)
			OrionLib.MainWindow.AnchorPoint = Vector2.new(0, 0)
		end

		TweenService:Create(ToggleButton, TweenInfo.new(0.2), {
			BackgroundTransparency = Orion.Enabled and (buttonConfig.BackgroundTransparency or 0.15) or 0.55
		}):Play()
		TweenService:Create(UIStroke, TweenInfo.new(0.2), {
			Transparency = Orion.Enabled and 0 or 0.6
		}):Play()
	end)

	local API = {}

	function API:SetBadge(text)
		if BadgeLabel then
			BadgeLabel.Text    = tostring(text)
			BadgeLabel.Visible = text ~= nil and tostring(text) ~= ""
		end
	end

	function API:SetLabel(text)
		if ToggleLabel then ToggleLabel.Text = tostring(text) end
	end

	function API:SetImage(id)
		ToggleButton.Image = id
	end

	function API:Destroy()
		if MinimizeGUI and MinimizeGUI.Parent then
			MinimizeGUI:Destroy()
		end
		OrionLib.MinimizeGUI = nil
	end

	OrionLib.MinimizeGUI = MinimizeGUI
	return API
end

--> OrionLib Destroy <--

function OrionLib:Destroy()
	for _, Connection in next, OrionLib.Connections do
		if typeof(Connection) == "RBXScriptConnection" and Connection.Connected then
			pcall(function()
				Connection:Disconnect()
			end)
		end
	end

	table.clear(OrionLib.Connections)
	table.clear(OrionLib.Flags)
	table.clear(OrionLib.ThemeObjects)

	if OrionLib.ActiveNotifications then
		for _, notification in ipairs(OrionLib.ActiveNotifications) do
			if notification and notification.Parent then
				pcall(function()
					notification:Destroy()
				end)
			end
		end

		table.clear(OrionLib.ActiveNotifications)
	end

	if OrionLib.MinimizeGUI then
		pcall(function()
			OrionLib.MinimizeGUI.Enabled = false
			OrionLib.MinimizeGUI:Destroy()
		end)

		OrionLib.MinimizeGUI = nil
	end

	local CoreGui = game:GetService("CoreGui")

	local oldGui = CoreGui:FindFirstChild("ToggleGUI")

	if oldGui then
		pcall(function()
			oldGui.Enabled = false
			oldGui:Destroy()
		end)
	end

	if Orion and Orion.Parent then
		pcall(function()
			Orion.Enabled = false
			Orion:Destroy()
		end)
	end

	OrionLib.ConfirmDialogOpen = false
	OrionLib.MainWindow = nil
	OrionLib.SaveCfg = false
	OrionLib.Folder = nil
	OrionLib.SelectedTheme = "Default"
end

return OrionLib