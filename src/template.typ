// Mise en forme du CV : sobre, une colonne, lisible par les ATS.
// Le contenu vit dans fr.typ et en.typ ; ce fichier ne contient aucune donnée personnelle.

#let ink = rgb("#111111")
#let muted = rgb("#555555")
#let rule-color = rgb("#1F2A44") // bleu marine discret pour les filets
#let logo-size = 20pt

// Style actif, fixé par cv() : "serif" (Libertinus Serif) ou "sans" (Geist).
#let cv-style = state("cv-style", "serif")

// Icône Lucide (licence ISC) alignée sur la ligne de texte.
#let icon(name) = box(baseline: 0.14em, image("/assets/icons/" + name + ".svg", height: 0.95em))

// Petit logo de certification aligné sur la ligne de texte.
#let badge(path) = box(baseline: 0.12em, height: 0.85em, image("/assets/logos/" + path, height: 0.85em))

// Contact précédé de son icône.
#let with-icon(name, body) = [#icon(name)#h(3pt)#body]

#let cv(author: "", keywords: (), style: "serif", lang: "fr", footer: (), body) = {
  let serif = style == "serif"
  let sep = h(10pt)
  set document(title: "CV · " + author, author: author, keywords: keywords)
  set page(
    paper: "a4",
    margin: (x: 15mm, top: 12mm, bottom: 17mm),
    footer-descent: 35%,
    footer: if footer.len() > 0 {
      line(length: 100%, stroke: 0.4pt + rule-color)
      v(-2pt)
      align(center, text(size: 0.9em, fill: muted, footer.join(sep)))
    },
  )
  set text(
    font: if serif { "Libertinus Serif" } else { "Geist" },
    size: if serif { 10.7pt } else { 9.6pt },
    fill: ink,
    lang: lang,
    hyphenate: false,
  )
  set par(leading: if serif { 0.6em } else { 0.66em }, spacing: 0.6em, justify: false)
  set list(marker: [•], indent: 2pt, body-indent: 5pt, spacing: 0.62em)
  set strong(delta: if serif { 300 } else { 200 })
  cv-style.update(style)
  body
}

// En-tête centré : nom, accroche et coordonnées (une ligne par groupe).
#let header(name: "", headline: none, contacts: ()) = {
  set align(center)
  context {
    let serif = cv-style.get() == "serif"
    text(
      size: if serif { 25pt } else { 21pt },
      weight: if serif { "regular" } else { "semibold" },
      tracking: if serif { 1.2pt } else { 0.4pt },
      if serif { smallcaps(name) } else { upper(name) },
    )
  }
  v(-2pt)
  if headline != none { block(above: 8pt, text(size: 1.02em, headline)) }
  block(above: 6pt, text(size: 0.9em, fill: muted, contacts.join(h(11pt))))
}

#let section(title) = {
  v(13pt)
  block(below: 4pt, context {
    let serif = cv-style.get() == "serif"
    text(
      size: if serif { 1.12em } else { 1em },
      weight: if serif { "semibold" } else { "bold" },
      tracking: if serif { 0.8pt } else { 1pt },
      fill: rule-color,
      if serif { smallcaps(title) } else { upper(title) },
    )
  })
  v(-3pt)
  line(length: 100%, stroke: 0.6pt + rule-color)
  v(1pt)
}

#let logo(path) = box(
  width: logo-size,
  height: logo-size,
  align(center + horizon, image(path, width: logo-size, height: logo-size, fit: "contain")),
)

// Entrée datée : organisation et dates, puis rôle et lieu, puis détails.
#let entry(logo-path: none, org: "", role: "", date: "", place: "", body) = {
  let head = grid(
    columns: (1fr, auto),
    row-gutter: 3.5pt,
    align: (left, right),
    strong(org), date,
    emph(role), text(fill: muted, emph(place)),
  )
  block(breakable: false, below: 11.5pt, grid(
    columns: (logo-size, 1fr),
    column-gutter: 7pt,
    align: top,
    if logo-path != none { logo(logo-path) } else { none },
    [#head #v(1.5pt) #body],
  ))
}

// Ligne « libellé : contenu » pour compétences, langues et intérêts.
#let item(label, content) = block(below: 5.5pt, grid(
  columns: (30mm, 1fr),
  column-gutter: 4pt,
  strong(label), content,
))
