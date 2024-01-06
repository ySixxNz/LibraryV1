## Six Library
```lua
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ySixxNz/SixLib/LibraryV1/Source')))()
```
## Criando uma Janela
```lua
local Window = OrionLib:MakeWindow({Name = "Título da biblioteca", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
```

## Criando uma Aba
```lua
local Tab = Window:MakeTab({
        Name = "Aba 1",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
})
```

## Criando uma Seção
```lua
local Section = Tab:AddSection({
        Name = "Seção"
})

## Notificando o Usuário
OrionLib:MakeNotification({
        Name = "Título!",
        Content = "Conteúdo da notificação... o que vai dizer??",
        Image = "rbxassetid://4483345998",
        Time = 5
})
```

## Criando um Botão
```lua
Tab:AddButton({
        Name = "Botão!",
        Callback = function()
                      print("botão pressionado")
          end    
})
```

## Criando uma Alternância (Toggle)
```lua
Tab:AddToggle({
        Name = "Esta é uma alternância!",
        Default = false,
        Callback = function(Value)
                print(Value)
        end    
})
```

## Alterando o valor de uma Alternância existente
```lua
CoolToggle:Set(true)
```

## Criando um Seletor de Cores
```lua
Tab:AddColorpicker({
        Name = "Seletor de Cores",
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(Value)
                print(Value)
        end          
})
```

## Definindo o valor do seletor de 
```lua
ColorPicker:Set(Color3.fromRGB(255,255,255))
```

## Criando um Controle Deslizante (Slider)
```lua
Tab:AddSlider({
        Name = "Controle Deslizante",
        Min = 0,
        Max = 20,
        Default = 5,
        Color = Color3.fromRGB(255,255,255),
        Increment = 1,
        ValueName = "bananas",
        Callback = function(Value)
                print(Value)
        end    
})
```

## Alterando o Valor do Controle Deslizante
```lua
Slider:Set(2)
```

## Criando um Rótulo (Label)

```lua
Tab:AddLabel("Rótulo")
```

## Alterando o valor de um rótulo existente
```lua
CoolLabel:Set("Rótulo Novo!")
```
## Criando um Parágrafo

Tab:AddParagraph("Parágrafo", "Conteúdo do parágrafo")

## Alterando um parágrafo existente
```lua
CoolParagraph:Set("Parágrafo Novo!", "Novo Conteúdo do Parágrafo!")
```

## Criando uma Entrada Adaptativa

Tab:AddTextbox({
        Name = "Caixa de Texto",
        Default = "entrada padrão",
        TextDisappear = true,
        Callback = function(Value)
                print(Value)
        end          
})

## Criando uma Tecla de Atalho (Keybind)
```lua
Tab:AddBind({
        Name = "Atalho",
        Default = Enum.KeyCode.E,
        Hold = false,
        Callback = function()
                print("pressionado")
        end    
})
```

## Chaning o valor de uma bind
```lua
Bind:Set(Enum.KeyCode.E)
```

## Criando um Menu suspenso (Dropdown)
```lua
Tab:AddDropdown({
        Name = "Dropdown",
        Default = "1",
        Options = {"1", "2"},
        Callback = function(Value)
                print(Value)
        end    
})
```

## Adicionando um conjunto de novos botões Dropdown a um menu existente
```lua
Dropdown:Refresh(List<table>,true)
```

## O valor booleano acima "true" indica se os botões atuais serão excluídos ou não.

## Selecionando uma opção de menu suspenso
```lua
Dropdown:Set("opção de menu suspenso")
```

## Concluindo seu script (OBRIGATÓRIO)
## A função abaixo precisa ser adicionada no final do seu código.

```lua
OrionLib:Init()
```

## Como funcionam as flags.
O recurso de flags na interface pode ser confuso para algumas pessoas. Ele serve para ser o identificador de um elemento no arquivo de configuração e permite acessar o valor de um elemento em qualquer parte do código.
 
 Abaixo está um exemplo de uso de flags.
 ```lua
 Tab1:AddToggle({
     Name = "Toggle",
     Default = true,
     Save = true,
     Flag = "toggle"
 })
 ```
 
 ```lua
 print(OrionLib.Flags["toggle"].Value) -- imprime o valor do toggle.
 ```

As flags só funcionam com toggle, slider, dropdown, bind e colorpicker.