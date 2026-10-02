# Changelog

All notable changes to this project are documented here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and versions follow [Semantic Versioning](https://semver.org/).

## [Unreleased]

### Changed

- Sharing card: title "Mon CV" / "My resume" with a subtitle, without the name and status already shown on the profile where the link is shared. The resume itself is unchanged.

## [1.1.1] - 2026-10-02

### Fixed

- Publication: running the tag pipeline again completes the existing release instead of failing. The resume itself is unchanged.

## [1.1.0] - 2026-10-02

### Changed

- Sharing card: same layout as the home page of wissem.pro (logo, name, title and address at the same positions), and "Élève ingénieur" without the hyphen.

## [1.0.1] - 2026-10-02

### Added

- Certificat Voltaire (657) on the certifications line.

## [1.0.0] - 2026-10-02

### Added

- Typst sources split into `src/` (template, contact details, French and English content) and `assets/`.
- Public variant (without phone number, nationality or driving licence) and a full variant built locally.
- Automatic release of the public PDFs, previews and 1200 x 630 share cards on every tag.

### Changed

- Certifications: Duolingo English Test 115, TOEIC removed.
