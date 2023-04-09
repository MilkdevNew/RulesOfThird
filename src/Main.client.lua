local Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Packages = script.Parent.Packages
local Assets = script.Parent.Assets
local Fusion = require(Packages.Fusion)
local New, Children, Value = Fusion.New, Fusion.Children, Fusion.Value
local Maid = require(Packages.Maid)
local PluginAction = plugin:CreatePluginAction(
	"Third_milk-studio",
	"Enables Rules of Thirds.",
	"Enables Rules of Thirds, plugin from milk-studio on GitHub"
)
local MaidObject = Maid.new()
local Frame = require(Assets.Frame)
local Enable = Value(false)
local Gui
local GlobalColor = Value(Color3.fromRGB(140, 106, 255))
local GlobalThickness = Value(3)
-- Functions

local function row()
	return {
		Frame({
			Color = GlobalColor,
			Thickness = GlobalThickness,
		}),
		Frame({
			Color = GlobalColor,
			Thickness = GlobalThickness,
		}),
		Frame({
			Color = GlobalColor,
			Thickness = GlobalThickness,
		}),
	}
end

local function action()
	Gui.Enabled = not Gui.Enabled
end

local function setup()
	Gui = New("ScreenGui")({
		Name = "Bars",
		IgnoreGuiInset = true,
		ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
		Enabled = Enable,
		Parent = game.CoreGui,

		[Children] = {
			New("Frame")({
				Name = "Frame",
				BackgroundColor3 = Color3.fromRGB(0, 0, 0),
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 1, 1, 1),

				[Children] = {
					New("UIGridLayout")({
						Name = "UIGridLayout",
						CellPadding = UDim2.new(),
						CellSize = UDim2.fromScale(0.333, 0.332),
						SortOrder = Enum.SortOrder.LayoutOrder,
					}),
					row(),
					row(),
					row(),
				},
			}),
		},
	})
end

setup()

MaidObject:GiveTask(PluginAction.Triggered:Connect(action))
MaidObject:GiveTask(plugin.Unloading:Connect(function()
	Gui:Destroy()
	MaidObject:DoCleaning()
	MaidObject = nil
end))
