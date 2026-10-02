// Compile les CV (FR et EN) dans dist/.
// Sans option : variante publique (aucune donnée personnelle), celle publiée par la CI.
// --full : variante complète, lit private.toml (ou WSM_CV_PRIVATE), jamais publiée.
import { mkdirSync, readFileSync, readdirSync, rmSync } from 'node:fs'

const full = process.argv.includes('--full')
const langs = ['fr', 'en'] as const
const dist = 'dist'

function readPrivate(): Record<string, string> {
  const path = process.env.WSM_CV_PRIVATE ?? 'private.toml'
  let raw: string
  try {
    raw = readFileSync(path, 'utf8')
  } catch {
    throw new Error(`Fichier introuvable : ${path} (modèle : private.example.toml)`)
  }
  const values: Record<string, string> = {}
  for (const line of raw.split('\n')) {
    const match = line.match(/^\s*(\w+)\s*=\s*"(.*)"\s*$/)
    if (match?.[1]) values[match[1]] = match[2] ?? ''
  }
  if (!values.phone) throw new Error('private.toml : clé "phone" manquante')
  return values
}

function typst(args: string[]) {
  const result = Bun.spawnSync(
    ['typst', 'compile', '--root', '.', '--font-path', 'assets/fonts', '--ignore-system-fonts', ...args],
    { stdout: 'inherit', stderr: 'inherit' },
  )
  if (result.exitCode !== 0) throw new Error(`typst a échoué (${args.at(-1)})`)
}

const inputs = full ? ['--input', 'variant=full', '--input', `phone=${readPrivate().phone}`] : []
const suffix = full ? { fr: '_complet', en: '_full' } : { fr: '', en: '' }

mkdirSync(dist, { recursive: true })

for (const lang of langs) {
  const base = `CV_Wissem_Badraoui_${lang.toUpperCase()}${suffix[lang]}`
  const pages = `${dist}/.pages-${lang}`
  rmSync(pages, { recursive: true, force: true })
  mkdirSync(pages, { recursive: true })

  typst([...inputs, `src/${lang}.typ`, `${dist}/${base}.pdf`])
  typst([...inputs, '--format', 'png', '--ppi', '144', `src/${lang}.typ`, `${pages}/{p}.png`])

  const count = readdirSync(pages).length
  if (count !== 1) throw new Error(`${base}.pdf compte ${count} pages, une seule est autorisée`)
  if (!full) await Bun.write(`${dist}/${base}.png`, Bun.file(`${pages}/1.png`))
  rmSync(pages, { recursive: true, force: true })
  console.log(`${base}.pdf : 1 page`)
}
