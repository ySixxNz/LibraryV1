-- Load the library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ySixxNz/LibraryV1/main/Source"))()

-- Choose icon version v1 or v2 (optional)

SetIconsVersion("v2")

-- Create the main window
local Window =
    OrionLib:MakeWindow(
    {
        Name = "Orion Library",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "OrionLib"
    }
)

-- Create a minimize button (optional)
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

-- Create a tab
local Tab =
    Window:MakeTab(
    {
        Name = "Tab",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    }
)

-- Add a section
local Section =
    Tab:AddSection(
    {
        Name = "Controls"
    }
)

-- Add a button
Tab:AddButton(
    {
        Name = "Click Me",
        Callback = function()
            print("Button clicked!")
        end
    }
)

-- Add a toggle
Tab:AddToggle(
    {
        Name = "Enable Thing",
        Default = false,
        Save = true,
        Flag = "EnableThing",
        Callback = function(Value)
            print("Toggle value:", Value)
        end
    }
)

-- Add a slider
Tab:AddSlider(
    {
        Name = "Power Level",
        Min = 0,
        Max = 100,
        Default = 50,
        Increment = 1,
        ValueName = "%",
        Save = true,
        Flag = "PowerLevel",
        Callback = function(Value)
            print("Slider:", Value)
        end
    }
)

-- Add a dropdown
Tab:AddDropdown(
    {
        Name = "Select Option",
        Default = "Option1",
        Options = {"Option1", "Option2", "Option3"},
        Save = true,
        Flag = "MyDropdown",
        Callback = function(Value)
            print("Selected:", Value)
        end
    }
)

-- Add a textbox
Tab:AddTextbox(
    {
        Name = "Say something",
        Default = "Hello world!",
        TextDisappear = true,
        Callback = function(Value)
            print("Typed:", Value)
        end
    }
)

-- Add a keybind
Tab:AddBind(
    {
        Name = "Press E",
        Default = Enum.KeyCode.E,
        Hold = false,
        Callback = function()
            print("E key pressed!")
        end
    }
)

-- Add a color picker
Tab:AddColorpicker(
    {
        Name = "Pick a Color",
        Default = Color3.fromRGB(255, 0, 0),
        Save = true,
        Flag = "MyColor",
        Callback = function(Value)
            print("Color:", Value)
        end
    }
)

-- Add a label
Tab:AddLabel("Status: Ready")

-- Add a paragraph
Tab:AddParagraph("Tips", "Click buttons. Toggle things. Slide sliders. Be awesome.")

-- Add a notification
OrionLib:MakeNotification(
    {
        Name = "Hello!",
        Content = "Library successfully loaded.",
        Image = "rbxassetid://4483345998",
        Time = 5
    }
)

-- Required to show the UI
OrionLib:Init()
