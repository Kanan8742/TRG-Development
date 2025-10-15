local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.Knit)

Knit.AddServices(script.Parent.Services)

Knit.Start():andThen(function() end)

Players.PlayerAdded:Connect(function(player)
	warn(`{player.Name} has joined the server.`)
end)
