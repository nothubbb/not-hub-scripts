-- NOTHUB Script GUI
-- Place this in StarterGui > NOTHUBGUI > LocalScript

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local gui = script.Parent

-- Script link (replace with your actual script URL)
local SCRIPT_URL = "https://loot-link.com/s?6YiQUbM1" -- Replace with your actual script link

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 400)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = gui

-- Corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

-- Drop shadow
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://5554237731"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(23, 23, 277, 277)
shadow.Parent = mainFrame

-- Top bar
local topBar = Instance.new("Frame")
topBar.Name = "TopBar"
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.Position = UDim2.new(0, 0, 0, 0)
topBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topBarCorner = Instance.new("UICorner")
topBarCorner.CornerRadius = UDim.new(0, 12)
topBarCorner.Parent = topBar

-- Title
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "NOTHUB"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = topBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0.5, -15)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.Font = Enum.Font.GothamBold
closeButton.Parent = topBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Content area
local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -40, 1, -80)
content.Position = UDim2.new(0, 20, 0, 60)
content.BackgroundTransparency = 1
content.Parent = mainFrame

-- Script icon
local icon = Instance.new("ImageLabel")
icon.Name = "Icon"
icon.Size = UDim2.new(0, 80, 0, 80)
icon.Position = UDim2.new(0.5, -40, 0, 20)
icon.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
icon.BorderSizePixel = 0
icon.Image = "rbxassetid://7733960981" -- Default script icon
icon.Parent = content

local iconCorner = Instance.new("UICorner")
iconCorner.CornerRadius = UDim.new(0, 16)
iconCorner.Parent = icon

-- Status label
local status = Instance.new("TextLabel")
status.Name = "Status"
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0, 120)
status.BackgroundTransparency = 1
status.Text = "✅ Script Updated!"
status.TextColor3 = Color3.fromRGB(100, 255, 100)
status.TextSize = 16
status.Font = Enum.Font.GothamSemibold
status.Parent = content

-- Description
local description = Instance.new("TextLabel")
description.Name = "Description"
description.Size = UDim2.new(1, 0, 0, 40)
description.Position = UDim2.new(0, 0, 0, 150)
description.BackgroundTransparency = 1
description.Text = "Click the button below to get the new script"
description.TextColor3 = Color3.fromRGB(200, 200, 200)
description.TextSize = 14
description.Font = Enum.Font.Gotham
description.TextWrapped = true
description.Parent = content

-- Get Script Button
local getButton = Instance.new("TextButton")
getButton.Name = "GetButton"
getButton.Size = UDim2.new(1, 0, 0, 50)
getButton.Position = UDim2.new(0, 0, 1, -70)
getButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
getButton.BorderSizePixel = 0
getButton.Text = "GET THE SCRIPT"
getButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getButton.TextSize = 16
getButton.Font = Enum.Font.GothamBold
getButton.Parent = content

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = getButton

-- Loading animation
local loading = Instance.new("Frame")
loading.Name = "Loading"
loading.Size = UDim2.new(0, 0, 1, 0)
loading.Position = UDim2.new(0, 0, 0, 0)
loading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
loading.BackgroundTransparency = 0.7
loading.BorderSizePixel = 0
loading.Visible = false
loading.Parent = getButton

local loadingCorner = Instance.new("UICorner")
loadingCorner.CornerRadius = UDim.new(0, 8)
loadingCorner.Parent = loading

-- Success message
local successMessage = Instance.new("TextLabel")
successMessage.Name = "SuccessMessage"
successMessage.Size = UDim2.new(1, 0, 0, 30)
successMessage.Position = UDim2.new(0, 0, 1, -110)
successMessage.BackgroundTransparency = 1
successMessage.Text = "✅ Script copied to clipboard!"
successMessage.TextColor3 = Color3.fromRGB(100, 255, 100)
successMessage.TextSize = 14
successMessage.Font = Enum.Font.Gotham
successMessage.Visible = false
successMessage.Parent = content

-- Functions
local function animateButton()
    local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(getButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 90, 200)})
    tween:Play()
    
    loading.Visible = true
    local loadingTween = TweenService:Create(loading, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    loadingTween:Play()
    
    wait(0.5)
    
    loadingTween = TweenService:Create(loading, tweenInfo, {Size = UDim2.new(0, 0, 1, 0)})
    loadingTween:Play()
    
    tween = TweenService:Create(getButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(0, 120, 255)})
    tween:Play()
end

local function copyToClipboard()
    -- This sets the clipboard to your script URL
    pcall(function()
        setclipboard(SCRIPT_URL)
    end)
    
    -- Show success message
    successMessage.Visible = true
    
    -- Open browser (this will open Roblox's browser)
    pcall(function()
        game:GetService("GuiService"):OpenBrowserWindow(SCRIPT_URL)
    end)
    
    wait(2)
    successMessage.Visible = false
end

-- Button click event
getButton.MouseButton1Click:Connect(function()
    animateButton()
    copyToClipboard()
end)

-- Close button event
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

-- Make frame draggable
local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)