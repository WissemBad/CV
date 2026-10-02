// CV de Wissem Badraoui, une page A4.

#import "template.typ": *
#import "profile.typ": contacts, footer

// Réglages rapides.
#let style = sys.inputs.at("style", default: "serif") // "serif" ou "sans"
#let debut-stage = "juin 2027"

#show: cv.with(
  author: "Wissem Badraoui",
  keywords: ("élève-ingénieur", "IMT Nord Europe", "stage", "développement logiciel", "données", "Python", "SQL"),
  style: style,
  footer: footer,
)

#header(
  name: "Wissem Badraoui",
  headline: [Élève-ingénieur à IMT Nord Europe · Recherche d'un stage de 12 à 16 semaines à partir de #debut-stage],
  contacts: contacts("fr"),
)

#v(4pt)
#par(justify: true)[
  Orienté développement logiciel et données, j'ai consacré deux stages à la modernisation d'outils internes utilisés au quotidien, avec une exigence de fiabilité et de confidentialité. Je souhaite désormais m'orienter vers la science des données et la sécurité des systèmes d'information, sur des projets concrets au sein d'une équipe expérimentée.
]

#section("Formation")

#entry(
  logo-path: "/assets/logos/imt.png",
  org: "IMT Nord Europe · École Mines-Télécom",
  role: "Diplôme d’ingénieur généraliste · 1re année du cycle ingénieur (Bac+3)",
  date: "2024 – 2029",
  place: "Lille (59)",
)[
  - Tronc commun scientifique et méthodologique, puis parcours visé en informatique et numérique.
  - Cycle préparatoire validé en 2026 ; projets : jeu en *C/SDL2*, gestionnaire de mots de passe en *Python*.
  - Projet en équipe sur 7 mois : gestion du budget, du planning et des livrables.
]

#entry(
  logo-path: "/assets/logos/saint-paul.png",
  org: "Lycée Saint-Paul",
  role: "Baccalauréat général, spécialités Mathématiques et Physique-Chimie · Mention Très Bien",
  date: "2021 – 2024",
  place: "Angoulême (16)",
)[]

#section("Expérience professionnelle")

#entry(
  logo-path: "/assets/logos/marianne.png",
  org: "Direction générale des Finances publiques (DGFiP)",
  role: "Stage · Développement logiciel et données · Mission Risques et Audit",
  date: "Juin – août 2026 · 11 semaines",
  place: "Paris (75)",
)[
  - Refonte d'une application *Python/Tkinter* d'aide à l'audit de paiements (architecture, interface).
  - Traitement de corpus de plusieurs millions de lignes avec *DuckDB* et *SQLite*, sans calculs redondants.
  - Développement des recherches libre et multicritère, du contrôle des comptes et d'un assistant de rapport.
  - Démarche itérative par lots avec l'équipe et les auditeurs, tests de bout en bout et documentation.
]

#entry(
  logo-path: "/assets/logos/nidec.png",
  org: "Nidec Leroy-Somer · Bureau d’études",
  role: "Stage · Amélioration d’un outil interne de gestion des essais",
  date: "Janv. – févr. 2025 · 6 semaines",
  place: "Angoulême (16)",
)[
  - Analyse des besoins des techniciens et ingénieurs utilisant un outil *Excel/VBA* de suivi des essais.
  - Fiabilisation des traitements de données et des méthodes de calcul, refonte de l'interface utilisateur.
  - Développement de nouvelles fonctionnalités en *VBA* et validation des résultats sur données réelles.
]

#section("Projets personnels")

#entry(
  logo-path: "/assets/logos/wissem-violet.svg",
  org: "Wissem’s Industries · Infrastructure et applications web",
  role: "Projet personnel · conception, déploiement et maintenance",
  date: "2025 – aujourd’hui",
  place: link("https://www.wissem.pro")[Écosystème wissem.pro],
)[
  - Serveur Linux auto-administré : services *Docker*, déploiement continu, authentification unique.
  - Applications web en *TypeScript* (Nuxt, Vue.js) et API *Node.js/Express* : portfolio, panel d'administration.
  - Base *PostgreSQL* partagée entre les services, documentation et suivi des versions de chaque projet.
]

#entry(
  logo-path: "/assets/logos/rubiks.png",
  org: "Rubik’s Network · Communauté de jeu en ligne",
  role: "Contribution technique bénévole",
  date: "2020 – aujourd’hui",
  place: "À distance",
)[
  - Rédaction de spécifications et coordination des mises à jour avec développeurs et graphistes.
  - Développement de fonctionnalités, support utilisateur et priorisation des problèmes signalés.
]

#section("Compétences")

#item("Programmation")[Python, SQL, C, TypeScript/JavaScript, VBA]
#item("Données")[PostgreSQL, MySQL, SQLite, DuckDB, MongoDB, Prisma, Excel avancé, CaseWare IDEA]
#item("Web et système")[Node.js, Express, Nuxt, Vue.js, API REST, Linux, Docker, CI/CD]
#item("Outils")[Git, GitHub, IDE JetBrains, agents IA, Postman, Jira, Microsoft Office, Typst]
#item("Méthodes")[Analyse du besoin, démarche itérative, tests et recette, documentation utilisateur]
#item("Savoir-être")[Rigueur, autonomie, discrétion professionnelle, travail en équipe, curiosité, adaptabilité]

#section("Langues, certifications et intérêts")

#item("Langues")[Français _(langue maternelle)_ · Anglais B2 · Espagnol A2]
#item("Certifications")[Duolingo English Test : 115]
#item("Engagement")[Hackathon Orion Jeunesse, ministère des Armées (Lille, mars 2026) : 24 h en équipe]
#item("Intérêts")[Transports _(ferroviaires, urbains et aéronautiques)_, natation, cinéma, voyages, billard]
