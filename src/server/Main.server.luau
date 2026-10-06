--!strict
-- Point d'entrée serveur de Spin a Baddie.

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Changelog = require(ReplicatedStorage.Shared.Changelog)

print(`[SpinABaddie] Serveur démarré (v{Changelog[1].version})`)
