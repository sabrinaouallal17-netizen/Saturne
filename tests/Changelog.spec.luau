-- Vérifie que le Changelog est bien formé. Lancer : lune run tests/Changelog.spec
local Changelog = require("../src/shared/Changelog")

local function parseVersion(version: string): (number, number, number)
	local major, minor, patch = string.match(version, "^(%d+)%.(%d+)%.(%d+)$")
	assert(major and minor and patch, `version invalide : "{version}"`)
	return tonumber(major) :: number, tonumber(minor) :: number, tonumber(patch) :: number
end

local function isNewer(a: string, b: string): boolean
	local a1, a2, a3 = parseVersion(a)
	local b1, b2, b3 = parseVersion(b)
	if a1 ~= b1 then
		return a1 > b1
	elseif a2 ~= b2 then
		return a2 > b2
	end
	return a3 > b3
end

assert(#Changelog > 0, "le Changelog est vide")

for index, entry in Changelog do
	parseVersion(entry.version)
	assert(string.match(entry.date, "^%d%d%d%d%-%d%d%-%d%d$"), `date invalide pour v{entry.version}`)
	assert(#entry.changes > 0, `aucun changement listé pour v{entry.version}`)

	local previous = Changelog[index + 1]
	if previous then
		assert(
			isNewer(entry.version, previous.version),
			`v{entry.version} doit être plus récente que v{previous.version}`
		)
	end
end

print(`OK : {#Changelog} entrée(s) de Changelog valides`)
