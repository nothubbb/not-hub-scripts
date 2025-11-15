-- NOTHUB Executor Script
-- Paste this into your executor (Synapse, Krnl, etc.)

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("NOTHUBGUI") then
    game:GetService("Players").LocalPlayer.PlayerGui.NOTHUBGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NOTHUBGUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("Players").LocalPlayer.PlayerGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "NOTHUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, 0, 0, 30)
Status.Position = UDim2.new(0, 0, 0, 60)
Status.BackgroundTransparency = 1
Status.Text = "✅ Script Updated!"
Status.TextColor3 = Color3.fromRGB(100, 255, 100)
Status.TextSize = 14
Status.Font = Enum.Font.Gotham
Status.Parent = MainFrame

local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, -20, 0, 40)
Description.Position = UDim2.new(0, 10, 0, 90)
Description.BackgroundTransparency = 1
Description.Text = "Click to get the new script"
Description.TextColor3 = Color3.fromRGB(200, 200, 200)
Description.TextSize = 12
Description.TextWrapped = true
Description.Font = Enum.Font.Gotham
Description.Parent = MainFrame

local GetButton = Instance.new("TextButton")
GetButton.Size = UDim2.new(0, 200, 0, 40)
GetButton.Position = UDim2.new(0.5, -100, 1, -60)
GetButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
GetButton.Text = "GET THE SCRIPT"
GetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetButton.TextSize = 14
GetButton.Font = Enum.Font.GothamBold
GetButton.Parent = MainFrame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = GetButton

-- Script functionality
GetButton.MouseButton1Click:Connect(function()
    local SCRIPT_URL = "https://loot-link.com/s?6YiQUbM1"
    
    -- Copy to clipboard
    setclipboard(SCRIPT_URL)
    
    -- Open browser
    if syn then
        syn.open(SCRIPT_URL)
    else
        request({Url = SCRIPT_URL, Method = "GET"})
    end
    
    -- Show confirmation
    GetButton.Text = "COPIED!"
    wait(1)
    GetButton.Text = "GET THE SCRIPT"
end)

-- Make draggable
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

print("NOTHUB GUI Loaded - Click the button to get the script!")
