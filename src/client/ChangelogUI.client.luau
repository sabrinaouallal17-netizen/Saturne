--!strict
-- Bouton + panneau qui affiche le Changelog en jeu.

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Changelog = require(ReplicatedStorage.Shared.Changelog)

local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ChangelogGui"
gui.ResetOnSpawn = false

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "Toggle"
toggleButton.AnchorPoint = Vector2.new(0, 1)
toggleButton.Position = UDim2.new(0, 16, 1, -16)
toggleButton.Size = UDim2.fromOffset(140, 40)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 105, 180)
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.Text = "Changelog"
toggleButton.Parent = gui
Instance.new("UICorner").Parent = toggleButton

local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.AnchorPoint = Vector2.new(0.5, 0.5)
panel.Position = UDim2.fromScale(0.5, 0.5)
panel.Size = UDim2.fromScale(0.4, 0.6)
panel.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
panel.Visible = false
panel.Parent = gui
Instance.new("UICorner").Parent = panel

local sizeLimit = Instance.new("UISizeConstraint")
sizeLimit.MinSize = Vector2.new(280, 240)
sizeLimit.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 105, 180)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.Text = "Mises à jour"
title.Parent = panel

local list = Instance.new("ScrollingFrame")
list.Position = UDim2.fromOffset(16, 52)
list.Size = UDim2.new(1, -32, 1, -68)
list.BackgroundTransparency = 1
list.BorderSizePixel = 0
list.ScrollBarThickness = 6
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.CanvasSize = UDim2.new()
list.Parent = panel

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 12)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

for index, entry in Changelog do
	local lines = { `<b>v{entry.version}</b>  <font color="#aaaaaa">{entry.date}</font>` }
	for _, change in entry.changes do
		table.insert(lines, `• {change}`)
	end

	local label = Instance.new("TextLabel")
	label.LayoutOrder = index
	label.Size = UDim2.fromScale(1, 0)
	label.AutomaticSize = Enum.AutomaticSize.Y
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Font = Enum.Font.Gotham
	label.TextSize = 16
	label.TextWrapped = true
	label.RichText = true
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.TextYAlignment = Enum.TextYAlignment.Top
	label.Text = table.concat(lines, "\n")
	label.Parent = list
end

toggleButton.Activated:Connect(function()
	panel.Visible = not panel.Visible
end)

gui.Parent = player:WaitForChild("PlayerGui")
