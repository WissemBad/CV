// Attend que le site serve la version du tag courant (Home met la Release en cache 15 minutes).
const url = process.env.PRODUCTION_URL
const tag = process.env.CI_COMMIT_TAG
if (!url || !tag) throw new Error('PRODUCTION_URL ou CI_COMMIT_TAG manquant.')

let last = 'aucune réponse'
for (let attempt = 0; attempt < 40; attempt++) {
  try {
    const response = await fetch(url, { signal: AbortSignal.timeout(15000) })
    last = `${response.status} ${response.headers.get('x-wsm-cv-version') ?? 'sans version'}`
    if (response.ok && response.headers.get('x-wsm-cv-version') === tag) {
      console.log(`${url} sert ${tag}`)
      process.exit(0)
    }
  } catch (error) {
    last = String(error)
  }
  await Bun.sleep(30_000)
}
throw new Error(`Version attendue ${tag}, dernière réponse : ${last}`)
