local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.Knit)

local DataController = Knit.CreateController({
	Name = "DataController",
})

function DataController:KnitInit() end
function DataController:KnitStart()
	warn("Started Data Controller")
	local DataService = Knit.GetService("DataService")

	task.wait(5)
	warn("tester")
	local tester = DataService:GetPlayersData(Player)
	tester:andThen(function(Data)
		warn(Data)
	end)
end

return DataController
