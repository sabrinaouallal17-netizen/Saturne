# Spin a Baddie

Jeu Roblox de type RNG : on spin pour obtenir des Baddies de différentes raretés, on les collectionne et on équipe le meilleur.

Le code est géré avec [Rojo](https://rojo.space) et synchronisé dans Roblox Studio.

## Installation (une seule fois)

1. Installer [Rokit](https://github.com/rojo-rbx/rokit) (gestionnaire d'outils Roblox) en suivant son README.
2. Cloner ce dépôt, puis dans le dossier du projet :
   ```
   rokit install
   ```
   Ça installe Rojo, selene, StyLua et Lune aux versions de `rokit.toml`.
3. Dans Roblox Studio, installer le plugin Rojo (version 7.7.1).

## Travailler sur le jeu

1. Dans le dossier du projet : `rojo serve`
2. Ouvrir une place vide dans Roblox Studio.
3. Dans le plugin Rojo : **Connect** (localhost, port 34872).
4. Appuyer sur **Play** pour tester.

## Arborescence

| Dossier | Dans Roblox |
|---|---|
| `src/shared` | `ReplicatedStorage.Shared` (modules partagés) |
| `src/server` | `ServerScriptService.Server` |
| `src/client` | `StarterPlayer.StarterPlayerScripts.Client` |
| `tests` | Tests Lune (hors jeu) |

## Vérifications

```
selene src
stylua --check src tests
lune run tests/Changelog.spec
```

## Changelog

Chaque modification est ajoutée en haut de `src/shared/Changelog.luau`. Elle s'affiche en jeu via le bouton **Changelog**.
