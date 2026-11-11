
--[[
    COOLGUY V5.0
    Original Admin GUI
]]

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "COOLGUY"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Name = "Main"
frame.Size = UDim2.fromOffset(300, 350)
frame.Position = UDim2.new(0.5, -150, 0.5, -175)
frame.BackgroundColor3 = Color3.fromRGB(20, 16, 32)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 55)
title.BackgroundTransparency = 1
title.Text = "⚡ COOLGUY V5.0"
title.TextColor3 = Color3.fromRGB(190, 135, 255)
title.TextSize = 23
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function createButton(name, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.85, 0, 0, 38)
    button.Position = UDim2.new(0.075, 0, 0, position)
    button.BackgroundColor3 = Color3.fromRGB(105, 65, 155)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = name
    button.TextSize = 15
    button.Font = Enum.Font.GothamBold
    button.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

local search = Instance.new("TextBox")
search.Size = UDim2.new(0.85, 0, 0, 35)
search.Position = UDim2.new(0.075, 0, 0, 65)
search.PlaceholderText = "Search players..."
search.Text = ""
search.Parent = frame

local buttons = {
    "TARGET SELECT",
    "FLING",
    "SPIN",
    "LAUNCH",
    "FREEZE",
    "UNFREEZE"
}

for i, name in ipairs(buttons) do
    createButton(name, 110 + (i - 1) * 40)
end

local close = createButton("CLOSE", 355)
close.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

gui.Parent = player:WaitForChild("PlayerGui")

-- COOLGUY V5.1
-- Admin GUI for your own Roblox experience

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "COOLGUY"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(320, 390)
frame.Position = UDim2.new(0.5, -160, 0.5, -195)
frame.BackgroundColor3 = Color3.fromRGB(20, 16, 32)
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 14)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "⚡ COOLGUY V5.1"
title.TextColor3 = Color3.fromRGB(190, 135, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.Parent = frame

-- Drag window
local dragging = false
local dragStart
local startPos

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType ==
        Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Close button
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(35, 35)
close.Position = UDim2.new(1, -42, 0, 7)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(130, 45, 65)
close.TextColor3 = Color3.new(1, 1, 1)
close.Parent = frame

local open = Instance.new("TextButton")
open.Size = UDim2.fromOffset(55, 55)
open.Position = UDim2.new(0, 15, 0.5, 0)
open.Text = "⚡"
open.TextSize = 25
open.BackgroundColor3 = Color3.fromRGB(105, 65, 155)
open.TextColor3 = Color3.new(1, 1, 1)
open.Visible = false
open.Parent = gui

close.MouseButton1Click:Connect(function()
    frame.Visible = false
    open.Visible = true
end)

open.MouseButton1Click:Connect(function()
    frame.Visible = true
    open.Visible = false
end)

-- Player search
local search = Instance.new("TextBox")
search.Size = UDim2.new(0.88, 0, 0, 35)
search.Position = UDim2.new(0.06, 0, 0, 65)
search.PlaceholderText = "Search players..."
search.Text = ""
search.TextColor3 = Color3.new(1, 1, 1)
search.BackgroundColor3 = Color3.fromRGB(42, 34, 55)
search.Parent = frame

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(0.88, 0, 0, 240)
list.Position = UDim2.new(0.06, 0, 0, 110)
list.BackgroundColor3 = Color3.fromRGB(30, 25, 42)
list.ScrollBarThickness = 5
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.Parent = frame

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 5)
layout.Parent = list

local selectedPlayer = nil

local function refreshPlayers()
    for _, item in ipairs(list:GetChildren()) do
        if item:IsA("TextButton") then
            item:Destroy()
        end
    end

    for _, target in ipairs(Players:GetPlayers()) do
        if target ~= player and
            target.Name:lower():find(search.Text:lower(), 1, true) then

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(1, -8, 0, 35)
            button.BackgroundColor3 =
                Color3.fromRGB(105, 65, 155)
            button.TextColor3 = Color3.new(1, 1, 1)
            button.Text = target.Name
            button.Parent = list

            button.MouseButton1Click:Connect(function()
                selectedPlayer = target
                title.Text = "⚡ " .. target.Name
            end)
        end
    end
end

search:GetPropertyChangedSignal("Text"):Connect(refreshPlayers)
Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

refreshPlayers()

gui.Parent = player:WaitForChild("PlayerGui")
