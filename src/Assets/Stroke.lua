--!strict
local Plugin = script:FindFirstAncestorWhichIsA("Plugin")
local Fusion = require(Plugin:FindFirstChild("Fusion", true))
local Packages = script.Parent.Parent.Packages
local New = Fusion.New
local FusionTypes = require(Packages.FusionTypes)

export type StrokeData = {
	Color: FusionTypes.Value<Color3>,
	Thickness: FusionTypes.Value<number>,
}

return function(props: StrokeData)
	return New("UIStroke")({
		Name = "UIStroke",
		Color = props.Color,
		Thickness = props.Thickness,
	})
end
