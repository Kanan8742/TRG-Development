local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

local Knit = require(Packages.Knit)

Knit.AddControllers(ReplicatedStorage.Client.Controllers)

Knit.Start():andThen(function() end)

print(`{Player.Name} has joined the server.`)
