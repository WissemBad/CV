// Carte de partage 1200 x 630 (aperçu LinkedIn et réseaux). Entrées : lang (fr|en).
// Même gabarit que la carte de l'accueil de wissem.pro : logo, nom, intitulé et adresse aux mêmes positions.
// L'aperçu du CV est lu dans dist/ : build.ts le génère avant cette carte.
#let lang = sys.inputs.at("lang", default: "fr")
#let t = (
  fr: (kicker: "CURRICULUM VITAE", status: "Élève ingénieur à IMT Nord Europe"),
  en: (kicker: "RESUME", status: "Engineering student at IMT Nord Europe"),
).at(lang)
#let ink = rgb("#0a0a0a")
#let ink-2 = rgb("#15101f")
#let violet = rgb("#8e51ff")
#let violet-deep = rgb("#5d0ec0")
#let violet-soft = rgb("#a684ff")

#set page(width: 1200pt, height: 630pt, margin: 0pt, fill: gradient.linear(ink, ink-2, angle: 70deg))
#set text(font: "Geist", fill: rgb("#fafafa"), lang: lang)

#let glow(color, opacity, cx, cy, r) = place(top + left, dx: cx - r, dy: cy - r, circle(radius: r, fill: gradient.radial(color.transparentize(100% - opacity), color.transparentize(100%))))
#glow(violet, 45%, 1000pt, 120pt, 440pt)
#glow(violet-deep, 38%, 110pt, 620pt, 380pt)

#let grid-paint = gradient.linear(white.transparentize(94%), white.transparentize(100%), angle: 90deg, relative: "parent")
#for i in range(0, 21) {
  place(top + left, dx: i * 60pt, line(length: 630pt, angle: 90deg, stroke: 1pt + grid-paint))
}
#for j in range(0, 11) {
  place(top + left, dy: j * 60pt, line(length: 1200pt, stroke: 1pt + grid-paint))
}

#place(top + left, dx: 80pt, dy: 72pt, image("/assets/logos/wissem-white.svg", width: 72pt))

#place(top + left, dx: 80pt, dy: 156pt, text(size: 20pt, weight: "medium", tracking: 3.5pt, fill: violet-soft)[#t.kicker])
#let name-line(dy, body) = place(top + left, dx: 80pt, dy: dy, text(size: 104pt, weight: "semibold", tracking: -5.2pt, top-edge: "ascender", bottom-edge: "descender")[#body])
#name-line(183pt)[Wissem]
#name-line(280pt)[Badraoui]
#place(top + left, dx: 80pt, dy: 440pt, text(size: 36pt, weight: "medium", fill: white.transparentize(14%))[#t.status])
#place(top + left, dx: 80pt, dy: 530pt, text(font: "DejaVu Sans Mono", size: 24pt, weight: "medium", fill: white.transparentize(40%))[www.wissem.pro/cv])

#place(top + left, dx: 750pt, dy: 70pt, rotate(
  -3deg,
  origin: top + left,
  block(
    width: 380pt,
    radius: 14pt,
    clip: true,
    stroke: 1pt + white.transparentize(82%),
    image("/dist/CV_Wissem_Badraoui_" + upper(lang) + ".png", width: 380pt),
  ),
))
