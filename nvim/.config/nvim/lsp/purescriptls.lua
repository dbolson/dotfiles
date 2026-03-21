return {
  cmd = { 'purescript-language-server', '--stdio' },
  flags = {
    debounce_text_changes = 150,
  },
  filetypes = { 'purescript' },
  root_markers = { 'bower.json', 'flake.nix', 'psc-package.json', 'shell.nix', 'spago.dhall', 'spago.yaml' },
  settings = {
    purescript = {
      addSpagoSources = true
    },
  },
}
