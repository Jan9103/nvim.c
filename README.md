# NVim config

## Features:
- Tab completion (via language-server, dictionary, snippets, etc)
- Issue detection (shellcheck, flake8, language-server)
- Treesitter syntax highlight
- per project language-server config (via nvim-lspconfig)
- A good (enough) dracula-ish design
- Controls and shortcuts adjusted for my workflow and keyboard-layout

### Primarily configured for:
- Python
- Rust
- Shell scripts: bash and nu
- English text (md, adoc, RST)
- Config files (json, toml, yaml, ron, lua, etc)
- Small edits to frontend (html, css, js, php, etc)

## Structure:
- `lua/init.lua` is called from `init.vim` and starts all the lua configs
- `nlsp-settings/` contains the configs for the language-servers
- `lua/config/` contains a config file for each plugin, which requires it.
- `lua/lsp_setup.lua` contains the lsp-initialisation
