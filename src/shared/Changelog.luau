--!strict
-- Journal des mises à jour affiché en jeu. Ajouter les nouvelles entrées EN HAUT.

export type Entry = {
	version: string,
	date: string,
	changes: { string },
}

local Changelog: { Entry } = {
	{
		version = "0.0.1",
		date = "2026-10-06",
		changes = {
			"Mise en place du projet (Rojo, Luau)",
			"Ajout du panneau Changelog en jeu",
		},
	},
}

return Changelog
