local Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Fusion = require(Plugin:FindFirstChild("Fusion", true))
local Packages = script.Parent.Parent.Packages
local New,Children,Value = Fusion.New,Fusion.Children,Fusion.Value
local Assets = script.Parent
local Stroke = require(Assets.Stroke)
local FusionTypes = require(Packages.FusionTypes)


return function(props)
	return New "Frame" {
		Name = "Frame",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(0.333, 0.332),

		[Children] = {
			Stroke {
				Color = props.Color,
				Thickness = props.Thickness
			}
		}
	}
end