// English version of Wissem Badraoui's CV, one A4 page. Keep in sync with cv.typ.

#import "template.typ": *
#import "profile.typ": contacts, footer

#let style = sys.inputs.at("style", default: "serif") // "serif" or "sans"
#let internship-start = "June 2027"

#show: cv.with(
  author: "Wissem Badraoui",
  keywords: ("engineering student", "IMT Nord Europe", "internship", "software development", "data", "Python", "SQL"),
  style: style,
  lang: "en",
  footer: footer,
)

#header(
  name: "Wissem Badraoui",
  headline: [Engineering student at IMT Nord Europe · Seeking a 12 to 16-week internship from #internship-start],
  contacts: contacts("en"),
)

#v(4pt)
#par(justify: true)[
  With a focus on software development and data, I spent two internships modernising internal tools used daily, with high standards of reliability and confidentiality. I now aim to move towards data science and information systems security, working on concrete projects within an experienced team.
]

#section("Education")

#entry(
  logo-path: "/assets/logos/imt.png",
  org: "IMT Nord Europe · Institut Mines-Télécom",
  role: "General engineering degree (Master’s level) · 1st year of the engineering cycle",
  date: "2024 – 2029",
  place: "Lille, France",
)[
  - Scientific and methodological core curriculum, then a planned specialisation in computer science.
  - Completed the integrated preparatory cycle in 2026; projects: *C/SDL2* game, *Python* password manager.
  - 7-month team project: managing budget, schedule and deliverables.
]

#entry(
  logo-path: "/assets/logos/saint-paul.png",
  org: "Lycée Saint-Paul",
  role: "French Baccalauréat, Mathematics and Physics-Chemistry · Highest honours",
  date: "2021 – 2024",
  place: "Angoulême, France",
)[]

#section("Professional experience")

#entry(
  logo-path: "/assets/logos/marianne.png",
  org: "French Public Finances Directorate (DGFiP)",
  role: "Intern · Software development and data · Risk and Audit Unit",
  date: "June – Aug. 2026 · 11 weeks",
  place: "Paris, France",
)[
  - Redesigned a *Python/Tkinter* application supporting payment audits (architecture, interface).
  - Processed datasets of several million rows with *DuckDB* and *SQLite*, removing redundant computations.
  - Built free-text and multi-criteria search, account review and a report-writing assistant.
  - Iterative, batch-based delivery with the team and auditors, end-to-end testing and documentation.
]

#entry(
  logo-path: "/assets/logos/nidec.png",
  org: "Nidec Leroy-Somer · Engineering Department",
  role: "Intern · Improvement of an internal test-management tool",
  date: "Jan. – Feb. 2025 · 6 weeks",
  place: "Angoulême, France",
)[
  - Gathered requirements from technicians and engineers using an *Excel/VBA* test-tracking tool.
  - Made data processing and calculation methods more reliable and redesigned the user interface.
  - Developed new features in *VBA* and validated results against real data.
]

#section("Personal projects")

#entry(
  logo-path: "/assets/logos/wissem-violet.svg",
  org: "Wissem’s Industries · Infrastructure and web applications",
  role: "Personal project · design, deployment and maintenance",
  date: "2025 – present",
  place: link("https://www.wissem.pro")[wissem.pro ecosystem],
)[
  - Self-managed Linux server: *Docker* services, continuous deployment, single sign-on.
  - Web applications in *TypeScript* (Nuxt, Vue.js) and *Node.js/Express* APIs: portfolio, admin panel.
  - Shared *PostgreSQL* database across services, documentation and versioning for each project.
]

#entry(
  logo-path: "/assets/logos/rubiks.png",
  org: "Rubik’s Network · Online gaming community",
  role: "Volunteer technical contributor",
  date: "2020 – present",
  place: "Remote",
)[
  - Wrote specifications and coordinated updates with developers and designers.
  - Developed features, provided user support and prioritised reported issues.
]

#section("Skills")

#item("Programming")[Python, SQL, C, TypeScript/JavaScript, VBA]
#item("Data")[PostgreSQL, MySQL, SQLite, DuckDB, MongoDB, Prisma, advanced Excel, CaseWare IDEA]
#item("Web & systems")[Node.js, Express, Nuxt, Vue.js, REST APIs, Linux, Docker, CI/CD]
#item("Tools")[Git, GitHub, JetBrains IDEs, AI agents, Postman, Jira, Microsoft Office, Typst]
#item("Methods")[Requirements analysis, iterative delivery, testing and acceptance, user documentation]
#item("Soft skills")[Rigour, autonomy, professional discretion, teamwork, curiosity, adaptability]

#section("Languages, certifications and interests")

#item("Languages")[French _(native)_ · English B2 · Spanish A2]
#item("Certifications")[Certificat Voltaire (French spelling): 657 · Duolingo English Test: 115]
#item("Engagement")[Orion Jeunesse Hackathon, French Ministry of Armed Forces · Lille, March 2026 · 24 h]
#item("Interests")[Transport _(rail, urban and aviation)_, swimming, cinema, travel, billiards]
