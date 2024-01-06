## Six Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ySixxNz/SixLib/LibraryV1/Source')))()

## Criando uma Janela
local Window = OrionLib:MakeWindow({Name = "Título da biblioteca", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

## Criando uma Aba
local Tab = Window:MakeTab({
        Name = "Aba 1",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
})

## Criando uma Seção
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

## Criando um Botão
Tab:AddButton({
        Name = "Botão!",
        Callback = function()
                      print("botão pressionado")
          end    
})

## Criando uma Alternância (Toggle)
Tab:AddToggle({
        Name = "Esta é uma alternância!",
        Default = false,
        Callback = function(Value)
                print(Value)
        end    
})

## Alterando o valor de uma Alternância existente
CoolToggle:Set(true)

## Criando um Seletor de Cores
Tab:AddColorpicker({
        Name = "Seletor de Cores",
        Default = Color3.fromRGB(255, 0, 0),
        Callback = function(Value)
                print(Value)
        end          
})

## Definindo o valor do seletor de cores
ColorPicker:Set(Color3.fromRGB(255,255,255))

## Criando um Controle Deslizante (Slider)
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

## Alterando o Valor do Controle Deslizante
Slider:Set(2)

## Criando um Rótulo (Label)
Tab:AddLabel("Rótulo")

## Alterando o valor de um rótulo existente
CoolLabel:Set("Rótulo Novo!")

## Criando um Parágrafo
Tab:AddParagraph("Parágrafo", "Conteúdo do parágrafo")

## Alterando um parágrafo existente
CoolParagraph:Set("Parágrafo Novo!", "Novo Conteúdo do Parágrafo!")

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
Tab:AddBind({
        Name = "Atalho",
        Default = Enum.KeyCode.E,
        Hold = false,
        Callback = function()
                print("pressionado")
        end    
})

## Chaning o valor de uma bind
Bind:Set(Enum.KeyCode.E)

## Criando um Menu suspenso (Dropdown)
Tab:AddDropdown({
        Name = "Dropdown",
        Default = "1",
        Options = {"1", "2"},
        Callback = function(Value)
                print(Value)
        end    
})

## Adicionando um conjunto de novos botões Dropdown a um menu existente
Dropdown:Refresh(List<table>,true)

## O valor booleano acima "true" indica se os botões atuais serão excluídos ou não.

## Selecionando uma opção de menu suspenso
Dropdown:Set("opção de menu suspenso")

## Concluindo seu script (OBRIGATÓRIO)
## A função abaixo precisa ser adicionada no final do seu código.
OrionLib:Init()

## Como funcionam as flags.
## O recurso de flags na interface pode ser confuso para algumas pessoas. Ele serve para ser
