## Orion Library

**Orion Library** is an easy-to-use and powerful user interface library designed specifically for Roblox script developers. It enables the creation of clean, modern interfaces with components such as windows, tabs, buttons, toggles, sliders, and more. Perfect for enhancing your scripts and making them more professional-looking.

**Ready-to-use script:** [Click here to view the full script](https://github.com/ySixxNz/Library/blob/main/Misc/Exemple.lua)

## Library (REQUIRED)

```lua
local OrionLib = loadstring(game:HttpGet(("https://raw.githubusercontent.com/ySixxNz/LibraryV1/refs/heads/LibraryV1/Source")))()
```

## Creating Window (REQUIRED)

```lua
local Window =
    OrionLib:MakeWindow({Name = "Library Title", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

```
## Creating Button Minimize

```lua
OrionLib:BtnMinimize(
    {
        Button = {
            Size = UDim2.new(0, 60, 0, 60),
            Position = UDim2.new(0, 10, 1, -160),
            BackgroundTransparency = 1
        },
        Corner = {
            CornerRadius = UDim.new(1, 0)
        }
    }
)

--[[
Button = <table> - Configuration for the minimize button.
Size = <UDim2> - The size of the minimize button.
Position = <UDim2> - The position of the button on the screen.
BackgroundTransparency = <number> - Transparency level of the button's background (0 = opaque, 1 = fully transparent).
Corner = <table> - Configuration for rounding the button edges.
CornerRadius = <UDim> - Determines how rounded the button corners are. UDim.new(1, 0) means fully rounded.
]]
```


## **Choose Icon Version**

**Optional**, but if you are going to use it, place it **above the Window** or at the **beginning of the script**.

**Usage**

```lua
-- Choose icon version (v1 or v2)  
SetIconsVersion("v1") -- Default  
-- SetIconsVersion("v2")

--[[
How it works

The library supports two icon packs:
- v1 → Default icons (lighter and more stable)  
- v2 → Alternative icons (more variety)

If you do not select anything, it will automatically use v1.
]]
```
**Notes**
- Accepts: **"v1"**, **"V1"**, **"v2"**, **"V2"**  
- Invalid values fallback to **v1**

## Creating Tab (REQUIRED AT LEAST ONE)

```lua
local Tab =
    Window:MakeTab(
    {
        Name = "Tab 1",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
```

## Creating Section

```lua
local Section =
            Tab:AddSection(
            {
                Name = "Section"
            }
        )
        
--[[
Name = <string> - The name of the section.
]]
```

## Creating Notification

```lua
OrionLib:MakeNotification(
            {
                Name = "Title!",
                Content = "Notification content... what will it say??",
                Image = "rbxassetid://4483345998",
                Time = 5
            }
        )

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notification.
]]

```

## Creating Button

```lua
Tab:AddButton(
              {
                  Name = "Button!",
                  Callback = function()
                      print("button pressed")
                  end
              }
          )
          
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
```

## Creating Toggle

```lua
Tab:AddToggle(
            {
                Name = "This is a toggle!",
                Default = false,
                Callback = function(Value)
                    print(Value)
                end
            }
        )
        
--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]
```

## Changing the value of an existing Toggle

```lua
CoolToggle:Set(true)
```

## Creating Color Picker

```lua
Tab:AddColorpicker(
            {
                Name = "ColorPicker",
                Default = Color3.fromRGB(255, 0, 0),
                Callback = function(Value)
                    print(Value)
                end
            }
        )
        
--[[
Name = <string> - The name of the colorpicker.
Default = <color3> - The default value of the colorpicker.
Callback = <function> - The function of the colorpicker.
]]
```

## Setting the value of the selector

```lua
ColorPicker:Set(Color3.fromRGB(255,255,255))
```

## Creating Slider

```lua
Tab:AddSlider(
            {
                Name = "Slider",
                Min = 0,
                Max = 20,
                Default = 5,
                Color = Color3.fromRGB(255, 255, 255),
                Increment = 1,
                ValueName = "bananas",
                Callback = function(Value)
                    print(Value)
                end
            }
        )
        
--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maximum value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]
```

## Changing the Slider Value

```lua
Slider:Set(2)
```

Make sure you make your slider a variable (local CoolSlider = Tab:AddSlider...) for this to work.

## Creating Label

```lua
Tab:AddLabel("Label")
```

## Changing the value of an existing label

```lua
CoolLabel:Set("New Label!")
```

## Creating Paragraph

```lua
Tab:AddParagraph("Paragraph", "Paragraph content")
```

## Changing an existing paragraph

```lua
CoolParagraph:Set("New paragraph!", "New Paragraph Content!")
```

## Creating an Adaptive Input

```lua
Tab:AddTextbox(
	    {
	        Name = "Textbox",
	        Default = "default box input",
	        TextDisappear = true,
	        Callback = function(Value)
	            print(Value)
	        end
	    }
	)
	
--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]
```

## Creating Keybind

```lua
Tab:AddBind(
            {
                Name = "Bind",
                Default = Enum.KeyCode.E,
                Hold = false,
                Callback = function()
                    print("press")
                end
            }
        )
        
--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Hold = <bool> - Makes the bind work like: Holding the key > The bind returns true, Not holding the key > Bind returns false.
Callback = <function> - The function of the bind.
]]
```

## Changing the value of a bind

```lua
Bind:Set(Enum.KeyCode.E)
```

## Creating Dropdown

```lua
Tab:AddDropdown(
            {
                Name = "Dropdown",
                Default = "1",
                Options = {"1", "2"},
                Callback = function(Value)
                    print(Value)
                end
            }
        )
        
--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]
```

## Adding a set of new Dropdown buttons to an existing menu

The Boolean value below "true" indicates whether the current buttons will be deleted or not.

```lua
Dropdown:Refresh(List<table>,true)
```

## Selecting a dropdown menu option

```lua
Dropdown:Set("dropdown option")
```

## Completing your script (REQUIRED)

The function below needs to be added at the end of your code.

```lua
OrionLib:Init()
```

## How Flags Work

The flag feature in the interface can be confusing for some people. It serves as the identifier of an element in the config file and allows access to the value of an element anywhere in the code.

Below is an example of using flags.

```lua
Tab:AddToggle(
    {
        Name = "Toggle",
        Default = true,
        Save = true,
        Flag = "toggle"
    }
)
```

```lua
print(OrionLib.Flags["toggle"].Value) -- prints the value of the toggle.
```

Flags only work with toggle, slider, dropdown, bind, and colorpicker.

## Making your interface work with configs.

In order to make your interface use the configs function you first need to add the `SaveConfig` and `ConfigFolder` arguments to your window function. The explanation of these arguments in above. Then you need to add the `Flag` and `Save` values to every toggle, slider, dropdown, bind, and colorpicker you want to include in the config file. The `Flag = <string> `argument is the ID of an element in the config file. `The Save = <bool>`  argument includes the element in the config file. Config files are made for every game the library is launched in.

## Destroying the Interface

```lua
OrionLib:Destroy()
```
