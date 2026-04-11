# 🌌 Orion Library

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)
![Roblox](https://img.shields.io/badge/platform-Roblox-ff0000?style=for-the-badge&logo=roblox)
![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)
![Made by](https://img.shields.io/badge/made%20by-ySixx-9cf?style=for-the-badge)

*A powerful, modern UI library for Roblox script developers.*

</div>

---

## 📖 Overview

**Orion Library** is a feature‑rich, easy‑to‑use interface library built specifically for Roblox exploit environments. It empowers developers to create sleek, responsive GUIs with minimal code, offering a wide range of customizable components and built‑in configuration saving.

Whether you're building a simple script hub or a complex multi‑tab utility, Orion provides the tools you need to make your project look professional and function flawlessly.

---

## ⚡ Quick Start

### 📦 Loading the Library

```lua
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Source"))()
```

🪟 Creating a Window

```lua
local Window = OrionLib:MakeWindow({
    Name = "My Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MyHubConfigs",
    IntroEnabled = true,
    IntroText = "Orion Library",
    IntroIcon = "rbxassetid://4483345998",
    Icon = "rbxassetid://4483345998",
    CloseCallback = function()
        print("Window closed")
    end
})
```

📑 Creating Tabs & Sections

```lua
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local MySection = MainTab:AddSection({
    Name = "Features"
})
```

---

🧩 Component Showcase

🔘 Button

```lua
MainTab:AddButton({
    Name = "Click me!",
    Callback = function()
        print("Button clicked")
    end
})
```

🔄 Toggle

```lua
local Toggle = MainTab:AddToggle({
    Name = "Enable Feature",
    Default = false,
    Callback = function(Value)
        print("Toggle is now:", Value)
    end
})

-- Update later
Toggle:Set(true)
```

🎚️ Slider

```lua
local Slider = MainTab:AddSlider({
    Name = "Speed",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    ValueName = "studs/s",
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})

Slider:Set(75)
```

🎨 Color Picker

```lua
local ColorPicker = MainTab:AddColorpicker({
    Name = "Theme Color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print("Color selected:", Value)
    end
})

ColorPicker:Set(Color3.fromRGB(0, 255, 0))
```

📝 Textbox

```lua
MainTab:AddTextbox({
    Name = "Username",
    Default = "Player",
    TextDisappear = true,
    Callback = function(Value)
        print("Input:", Value)
    end
})
```

⌨️ Keybind

```lua
local Bind = MainTab:AddBind({
    Name = "Toggle UI",
    Default = Enum.KeyCode.RightShift,
    Hold = false,
    Callback = function()
        print("Key pressed!")
    end
})

Bind:Set(Enum.KeyCode.LeftControl)
```

📋 Dropdown

```lua
local Dropdown = MainTab:AddDropdown({
    Name = "Select Weapon",
    Default = "Sword",
    Options = {"Sword", "Gun", "Magic"},
    Callback = function(Value)
        print("Selected:", Value)
    end
})

Dropdown:Set("Magic")
Dropdown:Refresh({"Axe", "Bow", "Staff"}, true)
```

🏷️ Label & Paragraph

```lua
local Label = MainTab:AddLabel("Hello, World!")
Label:Set("Updated Label")

local Para = MainTab:AddParagraph("Info", "This is a description.")
Para:Set("New Title", "New description text.")
```

---

🔔 Notifications

```lua
OrionLib:MakeNotification({
    Name = "Welcome!",
    Content = "Orion Library loaded successfully.",
    Image = "rbxassetid://4483345998",
    Time = 5
})
```

---

⚙️ Configuration System

Orion features a built‑in configuration system that automatically saves the state of supported components.

Saving a Component's State

Add Save = true and a unique Flag to any toggle, slider, dropdown, keybind, or color picker:

```lua
MainTab:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Save = true,
    Flag = "auto_farm",
    Callback = function(Value) end
})
```

Accessing Flag Values Anywhere

```lua
if OrionLib.Flags["auto_farm"].Value then
    -- Auto farm is enabled
end
```

Note: Flags are automatically saved in the folder specified by ConfigFolder when creating the window.

---

🎨 Icon Packs

Choose between two icon sets by calling this before creating the window:

```lua
SetIconsVersion("v1")  -- Default (stable, light)
-- or
SetIconsVersion("v2")  -- Alternative (more variety)
```

If not set, v1 is used automatically.

---

🔽 Minimize Button (Optional)

Add a custom minimize button anywhere on the screen:

```lua
OrionLib:BtnMinimize({
    Button = {
        Size = UDim2.new(0, 60, 0, 60),
        Position = UDim2.new(0, 10, 1, -160),
        BackgroundTransparency = 1
    },
    Corner = {
        CornerRadius = UDim.new(1, 0)
    }
})
```

---

🧹 Cleanup

To completely destroy the UI and free resources:

```lua
OrionLib:Destroy()
```

---

🧪 Complete Example Script

```lua
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Source"))()

local Window = OrionLib:MakeWindow({
    Name = "Orion Demo",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionDemo",
    IntroEnabled = true,
    IntroText = "Orion Library"
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddSection({ Name = "Controls" })

Tab:AddButton({
    Name = "Greet",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Hello!",
            Content = "Welcome to Orion Library",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
    end
})

Tab:AddToggle({
    Name = "Enable Feature",
    Default = false,
    Save = true,
    Flag = "feature_toggle",
    Callback = function(Value) end
})

OrionLib:Init()
```

---

🔧 Notes

· Always call OrionLib:Init() at the end of your script.
· Config files are game‑specific and stored locally.
· Invalid icon version strings fall back to v1.
· Premium features are indicated by HidePremium and PremiumOnly (cosmetic only unless you implement backend checks).

---

📄 License

This project is licensed under the MIT License – feel free to use, modify, and distribute as long as credit is given.

---

👤 Author

ySixx
GitHub: @ySixxNz
Repository: Orion Library

---

<div align="center">
    <sub>Built with ❤️ for the Roblox scripting community</sub>
</div>
