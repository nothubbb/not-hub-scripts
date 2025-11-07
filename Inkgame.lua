-- Discord Only GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DiscordGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 460, 0, 280)
MainFrame.Position = UDim2.new(0.5, -230, 0.5, -140)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(45, 45, 55)
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 55)
TopBar.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

local BottomCover = Instance.new("Frame")
BottomCover.Size = UDim2.new(1, 0, 0, 10)
BottomCover.Position = UDim2.new(0, 0, 1, -10)
BottomCover.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
BottomCover.BorderSizePixel = 0
BottomCover.Parent = TopBar

local TitleContainer = Instance.new("Frame")
TitleContainer.Name = "TitleContainer"
TitleContainer.Size = UDim2.new(0, 200, 0, 40)
TitleContainer.Position = UDim2.new(0, 18, 0, 8)
TitleContainer.BackgroundTransparency = 1
TitleContainer.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "NOT HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 26
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextStrokeTransparency = 0.8
Title.Parent = TitleContainer

local TitleGlow = Instance.new("TextLabel")
TitleGlow.Name = "TitleGlow"
TitleGlow.Size = UDim2.new(1, 0, 1, 0)
TitleGlow.BackgroundTransparency = 1
TitleGlow.Font = Enum.Font.GothamBold
TitleGlow.Text = "NOT HUB"
TitleGlow.TextColor3 = Color3.fromRGB(147, 51, 234)
TitleGlow.TextSize = 26
TitleGlow.TextXAlignment = Enum.TextXAlignment.Left
TitleGlow.TextStrokeTransparency = 0
TitleGlow.TextStrokeColor3 = Color3.fromRGB(147, 51, 234)
TitleGlow.ZIndex = 0
TitleGlow.Parent = TitleContainer

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -45, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
CloseButton.BorderSizePixel = 0
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseButton.TextSize = 20
CloseButton.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Name = "InfoLabel"
InfoLabel.Size = UDim2.new(1, -40, 0, 80)
InfoLabel.Position = UDim2.new(0, 20, 0, 75)
InfoLabel.BackgroundTransparency = 1
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Join our Discord server to get the script!\n\nScript is available exclusively on our Discord community."
InfoLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
InfoLabel.TextSize = 13
InfoLabel.TextWrapped = true
InfoLabel.TextYAlignment = Enum.TextYAlignment.Top
InfoLabel.Parent = MainFrame

local DiscordButton = Instance.new("TextButton")
DiscordButton.Name = "DiscordButton"
DiscordButton.Size = UDim2.new(1, -40, 0, 50)
DiscordButton.Position = UDim2.new(0, 20, 0, 175)
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.BorderSizePixel = 0
DiscordButton.Font = Enum.Font.GothamBold
DiscordButton.Text = "JOIN DISCORD"
DiscordButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordButton.TextSize = 14
DiscordButton.Parent = MainFrame

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 8)
DiscordCorner.Parent = DiscordButton

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Size = UDim2.new(1, -40, 0, 30)
StatusLabel.Position = UDim2.new(0, 20, 0, 235)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(160, 160, 170)
StatusLabel.TextSize = 11
StatusLabel.Parent = MainFrame

-- Configuration
local DISCORD_INVITE = "https://discord.gg/pD4WM5rx"

-- Dragging functionality
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
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

UIS.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if dragging and dragInput then
        update(dragInput)
    end
end)

-- Animation functions
local TweenService = game:GetService("TweenService")

local function animateGlow()
    spawn(function()
        while TitleGlow and TitleGlow.Parent do
            TweenService:Create(TitleGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextStrokeTransparency = 0.3
            }):Play()
            wait(1.5)
            TweenService:Create(TitleGlow, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                TextStrokeTransparency = 0
            }):Play()
            wait(1.5)
        end
    end)
end

animateGlow()

local function buttonHover(button, originalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = originalColor}):Play()
    end)
end

buttonHover(DiscordButton, Color3.fromRGB(88, 101, 242), Color3.fromRGB(108, 121, 255))
buttonHover(CloseButton, Color3.fromRGB(30, 30, 38), Color3.fromRGB(239, 68, 68))

-- Status update function
local function updateStatus(message, color)
    StatusLabel.Text = message
    StatusLabel.TextColor3 = color
    wait(3)
    StatusLabel.Text = ""
end

-- Button functionality
DiscordButton.MouseButton1Click:Connect(function()
    if DISCORD_INVITE then
        setclipboard(DISCORD_INVITE)
        updateStatus("Discord link copied! Join to get the script.", Color3.fromRGB(88, 101, 242))
        
        if syn and syn.request then
            syn.request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode({
                    cmd = "BROWSER_OPEN",
                    args = {url = DISCORD_INVITE},
                    nonce = game:GetService("HttpService"):GenerateGUID(false)
                })
            })
        end
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Auto-close after 30 seconds
spawn(function()
    wait(30)
    if ScreenGui and ScreenGui.Parent then
        ScreenGui:Destroy()
    end
end)