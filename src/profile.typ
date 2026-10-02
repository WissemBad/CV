// Identité et coordonnées. La variante « public » omet les informations personnelles ;
// la variante « full » les lit dans les entrées (--input) fournies par scripts/build.ts.
#import "template.typ": with-icon

#let variant = sys.inputs.at("variant", default: "public")
#let full = variant == "full"

#let labels = (
  fr: (location: [Île-de-France · Lille], nationality: [Nationalité française], licence: [Permis B]),
  en: (location: [Paris area · Lille, France], nationality: [French citizen], licence: [Driving licence]),
)

#let footer = (
  with-icon("globe", link("https://www.wissem.pro")[www.wissem.pro]),
  with-icon("linkedin", link("https://linkedin.com/in/WissemBadraoui")[linkedin.com/in/WissemBadraoui]),
  with-icon("github", link("https://github.com/WissemBad")[github.com/WissemBad]),
)

#let contacts(lang) = {
  let l = labels.at(lang)
  let list = (with-icon("mail", link("mailto:contact@wissem.pro")[contact\@wissem.pro]),)
  if full {
    let phone = sys.inputs.at("phone")
    list.push(with-icon("phone", link("tel:" + phone.replace(" ", ""))[#phone]))
  }
  list.push(with-icon("map-pin", l.location))
  if full {
    list.push(with-icon("flag", l.nationality))
    list.push(with-icon("car", l.licence))
  }
  list
}
