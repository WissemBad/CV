# CV · Wissem Badraoui

One-page A4 resume written in Typst, in French and English, in two variants.

| Variant | Content | Where |
| --- | --- | --- |
| Public | Without phone number, nationality or driving licence | GitHub release, served on [wissem.pro/cv](https://www.wissem.pro/cv) |
| Full | With these details | Built locally, never published |

Part of the writing is done with the help of AI; the content is reviewed and approved by Wissem.

## Layout

| Path | Role |
| --- | --- |
| `src/fr.typ`, `src/en.typ` | Content, kept in sync |
| `src/profile.typ` | Contact details, per variant |
| `src/template.typ` | Layout |
| `assets/` | Geist fonts (OFL), Lucide icons (ISC), logos |
| `scripts/` | Build, checks, release |
| `private.example.toml` | Template of the personal data (`private.toml`, ignored by git) |

## Build

Requires [Typst](https://typst.app) 0.15.1 (`winget install --id Typst.Typst`) and Bun.

```bash
bun run build        # public variant in dist/ (PDF and PNG)
bun run build:full   # full variant, reads private.toml or WSM_CV_PRIVATE
bun run check        # no personal data in src/ and scripts/
bun run watch        # rebuilds the French version on save
```

The build fails if a PDF is longer than one page.

## Release

Versions follow Semantic Versioning and changes are listed in [CHANGELOG.md](CHANGELOG.md).

```bash
bun run release 1.1.0   # updates package.json and the changelog
```

Merge, then push the `v1.1.0` tag: the pipeline builds the public variant and creates the GitHub release with the PDFs, previews and share cards. The site serves the latest release (15-minute cache) on `/cv.pdf` and `/en/cv.pdf`.

## License

Resume content: all rights reserved. Template and scripts: MIT, see [LICENSE](LICENSE).
