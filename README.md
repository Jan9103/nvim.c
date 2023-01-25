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

## Post setup:

### Fix Mason MyPy, etc installations

[related mason issue](https://github.com/williamboman/mason.nvim/issues/372)

- `~/.local/share/nvim/mason/packages/mypy/venv/pyvenv.cfg`: `include-system-site-packages = true`
