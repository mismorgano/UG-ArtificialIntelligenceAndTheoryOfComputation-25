console.log("Hello via Bun!");

// to bundle the first app
await Bun.build({
    entrypoints: ['../ArtificialIntelligence/Tareas/Tarea-01/src/puzzle.ts'],
    outdir: '../ArtificialIntelligence/Tareas/Tarea-01/out',
    format: "esm"
})
