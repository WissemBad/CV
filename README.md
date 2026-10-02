# CV · Wissem Badraoui

CV d'une page A4 en Typst, en français et en anglais, avec deux variantes.

| Variante | Contenu | Où |
| --- | --- | --- |
| Publique | Sans téléphone, nationalité ni permis | Release GitHub, relayée par [www.wissem.pro/cv](https://www.wissem.pro/cv) |
| Complète | Avec ces informations | Compilée en local, jamais publiée |

Une partie de la rédaction est faite avec l'aide d'une IA ; le contenu est relu et validé par Wissem.

## Structure

| Chemin | Rôle |
| --- | --- |
| `src/fr.typ`, `src/en.typ` | Contenu, à garder synchronisé |
| `src/profile.typ` | Coordonnées, selon la variante |
| `src/template.typ` | Mise en forme |
| `assets/` | Polices Geist (OFL), icônes Lucide (ISC), logos |
| `scripts/` | Compilation, contrôle, publication |
| `private.example.toml` | Modèle des données personnelles (`private.toml`, ignoré par git) |

## Compiler

Prérequis : [Typst](https://typst.app) 0.15.1 (`winget install --id Typst.Typst`) et Bun.

```bash
bun run build        # variante publique dans dist/ (PDF et PNG)
bun run build:full   # variante complète, lit private.toml ou WSM_CV_PRIVATE
bun run check        # aucune donnée personnelle dans src/ et scripts/
bun run watch        # recompile le français à chaque sauvegarde
```

Le build échoue si un PDF dépasse une page.

## Publier

1. Modifier `src/fr.typ` et `src/en.typ`, puis `bun run check && bun run build`.
2. Incrémenter `version` dans `package.json`, ajouter l'entrée du `CHANGELOG.md`.
3. Tag `vX.Y.Z` identique à la version : la CI compile et crée la Release avec les PDF et PNG publics.
4. Le site relaie la dernière Release (cache de 15 minutes) sur `/cv.pdf` et `/en/cv.pdf`.

Le lien LinkedIn (section Sélection) est ajouté une fois à la main : `https://www.wissem.pro/cv`.

## Licence

Contenu du CV : tous droits réservés. Modèle et scripts : MIT, voir `LICENSE`.
