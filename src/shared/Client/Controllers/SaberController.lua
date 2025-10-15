local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.Knit)

local SaberController = Knit.CreateController({
	Name = "SaberController",
})

function SaberController:KnitInit() end
function SaberController:KnitStart() end

return SaberController
