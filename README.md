# Personal NVim config

## Features:

- Tab completion (via language-server, dictionary, snippets, etc)
- Issue detection (shellcheck, flake8, language-server)
- Treesitter syntax highlight
- per project config (via project.lua.nvim)
- A good (enough) dracula-ish design
- Controls and shortcuts adjusted for my workflow and keyboard-layout (colmak based)

I would not recommend using this as a template! The settings are very personal and a lot of things are fun instead of ideal solutions.

### Primarily configured for:

1. Python
2. Rust
3. Shell scripts: bash and nu
4. English text (md, adoc, RST)
5. Config files (json, toml, yaml, ron, lua, etc)
6. Small edits to frontend (html, css, js, php, etc)

## Post-clone setup:

- install language-servers and linters manually via `:Mason`
- install Treesitter languages via `:TSInstall <language>`

### OS-side dependencies

- ripgrep
- find
- fzf
- (optional) libqalculate (for the `:Qualc` command)

### Fix Mason MyPy, etc installations

[related mason issue](https://github.com/williamboman/mason.nvim/issues/372)

- `~/.local/share/nvim/mason/packages/mypy/venv/pyvenv.cfg`: `include-system-site-packages = true`
