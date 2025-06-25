module.exports = {
  root: true,
  plugins: ['svelte'],
  ignores: [
      "src/components/Header.svelte" // <-- ignore ce fichier
    ],

  overrides: [
    {
      files: ['*.svelte'],
      parser: 'svelte-eslint-parser',
      parserOptions: {
        parser: '@typescript-eslint/parser' // si tu utilises TypeScript
      },
      plugins: ['svelte'],
      rules: {
        // tes règles ici
      }
    }
  ]
};
