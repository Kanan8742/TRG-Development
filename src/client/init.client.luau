local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local Packages = ReplicatedStorage.Packages

print(`{Player.Name} has joined the server.`)
