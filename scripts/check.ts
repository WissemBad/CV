// Garde-fou : aucune donnée personnelle ne doit apparaître dans les sources versionnées.
import { Glob } from 'bun'

const forbidden = [
  { name: 'numéro de téléphone', pattern: /(?:\+|00)\d{2}[\s.]?\d(?:[\s.]?\d{2}){4}|\b0[1-9](?:[\s.]?\d{2}){4}\b/ },
  { name: 'lien tel:', pattern: /["(]tel:\+?\d/ },
]

let failures = 0
for await (const file of new Glob('{src,scripts}/**/*').scan('.')) {
  if (file.endsWith('check.ts')) continue
  const text = await Bun.file(file).text()
  for (const { name, pattern } of forbidden) {
    if (pattern.test(text)) {
      console.error(`${file} : ${name} détecté`)
      failures++
    }
  }
}
if (failures > 0) process.exit(1)
console.log('Aucune donnée personnelle dans src/ et scripts/')
