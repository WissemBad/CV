// Publie la Release GitHub du tag courant avec les PDF et PNG publics de dist/.
import { readFileSync } from 'node:fs'

const token = process.env.GITHUB_RELEASE_TOKEN
const tag = process.env.CI_COMMIT_TAG
const repo = `${process.env.CI_REPO_OWNER}/${process.env.CI_REPO_NAME}`
if (!token || !tag || !process.env.CI_REPO_OWNER) throw new Error('Variables CI ou jeton manquants.')
if (!/^v\d+\.\d+\.\d+$/.test(tag)) throw new Error('Un tag de version sémantique est requis.')

const headers = {
  Accept: 'application/vnd.github+json',
  Authorization: `Bearer ${token}`,
  'X-GitHub-Api-Version': '2022-11-28',
}

function notes(version: string) {
  const changelog = readFileSync('CHANGELOG.md', 'utf8')
  const start = changelog.indexOf(`## [${version}]`)
  if (start === -1) throw new Error(`Aucune entrée ${version} dans CHANGELOG.md`)
  const rest = changelog.slice(start).split('\n').slice(1).join('\n')
  return rest.split(/^## \[/m)[0]?.trim() ?? ''
}

const created = await fetch(`https://api.github.com/repos/${repo}/releases`, {
  method: 'POST',
  headers,
  body: JSON.stringify({ tag_name: tag, name: tag, body: notes(tag.slice(1)), draft: false, prerelease: false }),
})
if (!created.ok) throw new Error(`Création de la release : ${created.status} ${await created.text()}`)
const release = (await created.json()) as { id: number }

const assets = [
  ['CV_Wissem_Badraoui_FR.pdf', 'application/pdf'],
  ['CV_Wissem_Badraoui_EN.pdf', 'application/pdf'],
  ['CV_Wissem_Badraoui_FR.png', 'image/png'],
  ['CV_Wissem_Badraoui_EN.png', 'image/png'],
  ['CV_Wissem_Badraoui_FR_SOCIAL.png', 'image/png'],
  ['CV_Wissem_Badraoui_EN_SOCIAL.png', 'image/png'],
] as const

for (const [name, type] of assets) {
  const upload = await fetch(`https://uploads.github.com/repos/${repo}/releases/${release.id}/assets?name=${name}`, {
    method: 'POST',
    headers: { ...headers, 'Content-Type': type },
    body: readFileSync(`dist/${name}`),
  })
  if (!upload.ok) throw new Error(`Dépôt de ${name} : ${upload.status} ${await upload.text()}`)
  console.log(`${name} publié`)
}
