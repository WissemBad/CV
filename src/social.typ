// Carte de partage 1200 x 630 (aperçu LinkedIn et réseaux). Entrées : lang (fr|en).
// L'aperçu du CV est lu dans dist/ : build.ts le génère avant cette carte.
#let lang = sys.inputs.at("lang", default: "fr")
#let t = (
  fr: (kicker: "CURRICULUM VITAE", headline: [Élève-ingénieur à IMT Nord Europe], sub: [Développement logiciel et données]),
  en: (kicker: "RESUME", headline: [Engineering student at IMT Nord Europe], sub: [Software development and data]),
).at(lang)
#let violet = rgb("#7C3AED")
#let ink = rgb("#0B0B14")

#set page(width: 1200pt, height: 630pt, margin: 0pt, fill: ink)
#set text(font: "Geist", fill: white, lang: lang)

#place(top + left, dx: -180pt, dy: -220pt, circle(radius: 380pt, fill: gradient.radial(violet.transparentize(55%), ink.transparentize(100%))))
#place(bottom + right, dx: 120pt, dy: 200pt, circle(radius: 300pt, fill: gradient.radial(violet.transparentize(65%), ink.transparentize(100%))))

#place(left + horizon, dx: 80pt, block(width: 560pt)[
  #text(size: 17pt, weight: "medium", tracking: 3pt, fill: violet.lighten(35%))[#t.kicker]
  #v(14pt)
  #text(size: 66pt, weight: "bold", tracking: -1.5pt)[Wissem \ Badraoui]
  #v(18pt)
  #text(size: 27pt, weight: "medium", fill: white.transparentize(15%))[#t.headline]
  #v(4pt)
  #text(size: 22pt, fill: white.transparentize(45%))[#t.sub]
  #v(34pt)
  #text(size: 20pt, weight: "medium", fill: violet.lighten(35%))[www.wissem.pro/cv]
])

#place(right + top, dx: -70pt, dy: 52pt, rotate(
  4deg,
  origin: top + left,
  block(
    width: 400pt,
    radius: 6pt,
    clip: true,
    stroke: 1pt + white.transparentize(80%),
    image("/dist/CV_Wissem_Badraoui_" + upper(lang) + ".png", width: 400pt),
  ),
))
