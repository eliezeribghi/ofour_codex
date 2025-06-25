module.exports = {
  root: true,
  plugins: ['svelte'],
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
