# CV — consignes de projet

- Dépôt public : jamais de téléphone, nationalité, permis ni autre donnée personnelle dans `src/`, `scripts/` ou l'historique. Ces valeurs viennent de `private.toml` (ignoré) ou de `--input`. `bun run check` doit passer.
- Tout changement de contenu se fait dans `src/fr.typ` et `src/en.typ`. Chaque PDF tient sur une page.
- Variante complète : en local seulement, jamais en CI ni en Release.
- Tag `vX.Y.Z` égal à `package.json.version`, entrée dans `CHANGELOG.md` obligatoire. Typst épinglé dans `.typst-version`.
- Secret CI : `github_release_token` (droit `contents:write` sur ce dépôt uniquement).
- Les PDF sont servis par Wissem Home (`/cv.pdf`) depuis la dernière Release ; ne pas changer les noms des assets sans adapter Home.
