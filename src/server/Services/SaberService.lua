local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.Knit)

local SaberService = Knit.CreateService({
	Name = "SaberService",
	Client = {},
})

function SaberService:KnitInit() end

function SaberService:KnitStart() end

return SaberService
