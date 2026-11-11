
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
