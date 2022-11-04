local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Star's Gui", "BloodTheme")

-- Main
local Main = Window:NewTab("Main")
local MainSection = Main:NewSection("Main")
MainSection:NewKeybind("Open/Close menu", "Opens and closes the menu", Enum.KeyCode.E, function()
    Library:ToggleUI()
end)

MainSection:NewButton("Fly", "bird mode", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))() 

    Fly(true)
end)
 
-- Toggle
local Toggle = Window:NewTab("Toggle")
local ToggleSection = Toggle:NewSection("Toggle")

ToggleSection:NewToggle("Infinite Jump", "Lets you infinitely jump", function()
    local InfiniteJumpEnabled = true
    game:GetService("UserInputService").JumpRequest:connect(function()
        if InfiniteJumpEnabled then
            game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
        end
    end)
end)

getgenv().auttodropval = false

local function autoDrop()
    task.spawn(function()
        while getgenv().auttodropval and task.wait() do
            if not getgenv().auttodropval then
                break
            end
            game:GetService("ReplicatedStorage").MainEvent:FireServer("DropMoney", "10000")
        end
    end)
end

ToggleSection:NewToggle("Autodrop", "Lets u autodrop", function(Value)
    getgenv().auttodropval = Value
    autoDrop()
end)
