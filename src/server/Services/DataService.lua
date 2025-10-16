local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage") :: ServiceProvider
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local Packages = ReplicatedStorage.Packages
local ServerPackages = ServerScriptService.ServerPackages

local Knit = require(Packages.Knit)

local ProfileStore = require(ServerPackages.profilestore)

local Data = {}

local function GetDataStoreName()
	if RunService:IsStudio() then
		return "Development_Database"
	else
		return "Live_Database"
	end
end

local PlayerStore = ProfileStore.New(GetDataStoreName(), Data)

local DataService = Knit.CreateService({
	Name = "DataService",
	Client = {
		Profiles = {},
	},
})

function DataService.Client:GetPlayersData(Player)
	local Profile = DataService.Client.Profiles[Player]
	if not Profile then
		return nil
	end

	return Profile.Data -- this returns the raw data table inside the profile
end

function DataService:KnitInit()
	print("Loading Data Service")

	local function PlayerAdded(Player: Player)
		local Profile = PlayerStore:StartSessionAsync(`Player_{Player.UserId}`, {
			Cancel = function()
				return Player.Parent ~= Players
			end,
		})

		if Profile ~= nil then
			Profile:AddUserId(Player.UserId)
			Profile:Reconcile()

			Profile.OnSessionEnd:Connect(function()
				Player:Kick("Data Error Occured")
			end)

			if Player.Parent == Players then
				DataService.Client.Profiles[Player] = Profile
				--warn(DataService.Client.Profiles[Player])
			else
				Profile:EndSession()
			end
		else
			Player:Kick("Data Error Occured")
		end
	end

	Players.PlayerAdded:Connect(PlayerAdded)
	Players.PlayerRemoving:Connect(function(Player: Player)
		local Profile = DataService.Client.Profiles[Player]
		if not Profile then
			return
		end
		Profile:EndSession()
		DataService.Client.Profiles[Player] = nil
	end)
end

function DataService:KnitStart()
	print("Loaded Data Service")
end

return DataService
