# AGENT.md — NixVim Configuration

## Project Overview

NeoVim configuration built with [nixvim](https://github.com/nix-community/nixvim), managed as a Nix flake using flake-parts. Configuration is declarative, modular, and reproducible.

**Owner:** T0modachi  
**Base:** Forked from [elythh/nixvim](https://github.com/elythh/nixvim)

## Repository Structure

```
.
├── flake.nix              # Main flake entry, defines packages/checks/devShells
├── flake.lock             # Locked dependencies
├── update.sh              # Shortcut for `nix flake update`
├── config/
│   ├── default.nix        # Root module, imports all submodules
│   ├── sets.nix           # Editor options (opts)
│   ├── keys.nix           # Keymaps and leader bindings
│   ├── highlight.nix      # Base16 highlight groups (conditional)
│   ├── colors/            # Base16 color schemes (9 themes)
│   │   ├── paradise.nix   # (default active)
│   │   ├── decay.nix
│   │   ├── mountain.nix
│   │   ├── tokyonight.nix
│   │   ├── everforest.nix
│   │   ├── everblush.nix
│   │   ├── jellybeans.nix
│   │   ├── aquarium.nix
│   │   └── gruvbox.nix
│   └── plug/              # Plugin modules organized by category
│       ├── colorscheme/   # Theme selection (catppuccin active)
│       ├── completion/    # Autocomplete (cmp, codeium, lspkind, schemastore)
│       ├── git/           # Git integration (gitsigns, lazygit, gitlinker, worktree)
│       ├── lsp/           # LSP servers, DAP, formatters, diagnostics
│       ├── snippets/      # LuaSnip
│       ├── statusline/    # Lualine
│       ├── treesitter/    # Treesitter + textobjects
│       ├── ui/            # Telescope, bufferline, noice, notify, btw
│       └── utils/         # Oil, flash, grapple, whichkey, illuminate, ufo, etc.
```

## Build System

### Flake Outputs

- `packages.default` — The Neovim derivation (`nixvim.makeNixvimWithModule`)
- `checks.default` — Test derivation that validates the config loads
- `checks.pre-commit-check` — Statix + Alejandra linters
- `devShells.default` — Shell with pre-commit hooks
- `formatter` — Alejandra (Nix formatter)

### Supported Systems

- `x86_64-linux`
- `aarch64-linux`
- `x86_64-darwin`
- `aarch64-darwin`

### Build Commands

```bash
# Build the config
nix build

# Run without installing
nix run .#

# Update flake inputs
./update.sh  # or: nix flake update

# Format Nix files
nix fmt

# Run checks
nix flake check
```

## Architecture

### Module System

`config/default.nix` is the root module. It:
1. Imports all plugin modules from `plug/`
2. Imports core config: `keys.nix`, `sets.nix`, `highlight.nix`
3. Exposes a `theme` option (enum of 9 color schemes)
4. Sets `extraConfigLua` to expose `_G.theme` globally

### Plugin Organization

Each plugin is a separate Nix module in `config/plug/<category>/<plugin>.nix`. They:
- Use the nixvim `plugins.<name>` attribute set
- Can access `config`, `lib`, `pkgs` via module arguments
- May include `extraConfigLua` for raw Lua snippets
- Are imported unconditionally (no conditional loading based on `lib.mkIf`)

### Configuration Layers

1. **Options** (`sets.nix`) — `vim.opt.*` settings
2. **Keymaps** (`keys.nix`) — `vim.keymap.set` bindings
3. **Plugins** (`plug/*/`) — Plugin configs via nixvim's declarative API
4. **Highlights** (`highlight.nix`) — Conditional on `colorschemes.base16.enable`
5. **Raw Lua** (`extraConfigLua`) — Escape hatch for non-declarative config

## Key Configuration

### Leader Key

`mapleader = " "` (space)

### Keymap Prefixes

| Prefix | Purpose |
|--------|---------|
| `<leader>f` | Find/file (Telescope) |
| `<leader>s` | Search |
| `<leader>q` | Quit/session |
| `<leader>g` | Git (normal + visual) |
| `<leader>u` | UI toggles |
| `<leader>w` | Windows |
| `<leader><Tab>` | Tabs |
| `<leader>d` | Debug (normal + visual) |
| `<leader>c` | Code actions (normal + visual) |
| `<leader>r` | Refactor (normal + visual) |
| `<leader>t` | Test (normal + visual) |

### Notable Keymaps

**Windows:**
- `<C-h/j/k/l>` — Navigate windows
- `<leader>ww` — Other window
- `<leader>wd` — Delete window
- `<leader>w-` — Split below
- `<leader>w|` — Split right

**Navigation:**
- `<leader>m` — Grapple toggle tag
- `<leader>k` — Grapple toggle tags
- `<leader>1-4` — Grapple select 1-4
- `<leader>j/J` — Grapple cycle forward/backward

**LSP (via `lspBuf`):**
- `gd` — Go to definition
- `gr` — Go to references
- `gD` — Go to declaration
- `gI` — Go to implementation
- `gT` — Type definition
- `K` — Hover
- `<leader>cr` — Rename
- `<leader>cw` — Workspace symbol
- `<leader>cd` — Line diagnostics
- `[d` / `]d` — Next/prev diagnostic

**Editing:**
- `<C-s>` — Save
- `<leader>p` — Paste without yanking (visual)
- `<leader>y/Y` — Yank to system clipboard
- `<leader>D` — Delete to void register
- `J` (visual) — Move line down
- `K` (visual) — Move line up

## Plugin Inventory

### LSP Servers

Configured in `config/plug/lsp/lsp.nix`:

- `eslint` — JavaScript/TypeScript
- `html` — HTML
- `lua_ls` — Lua
- `nil_ls` — Nix
- `marksman` — Markdown
- `pyright` — Python
- `gopls` — Go
- `terraformls` — Terraform
- `ts_ls` — TypeScript
- `yamlls` — YAML
- `jsonls` — JSON
- `ruby_lsp` — Ruby
- `phpactor` — PHP

### Completion

- `nvim-cmp` — Autocomplete engine
- `cmp-nvim-lsp` — LSP source
- `cmp-buffer` — Buffer words
- `cmp-path` — File paths
- `cmp_luasnip` — Snippets
- `cmp-emoji` — Emoji
- `codeium` — AI completion
- `lspkind` — Kind icons
- `schemastore` — JSON/YAML schemas

### UI

- `telescope` — Fuzzy finder
- `bufferline` — Tab/buffer bar
- `lualine` — Statusline
- `noice` — UI enhancements (cmdline, messages)
- `nvim-notify` — Notifications
- `btw` — Startup screen

### Git

- `gitsigns` — Git signs in gutter
- `lazygit` — LazyGit integration
- `gitlinker` — Share file links
- `worktree` — Git worktree management

### Treesitter

- `treesitter` — Syntax highlighting, indentation, folding
- `treesitter-textobjects` — Text objects (functions, classes, etc.)

### Debugging & Testing

- `dap` — Debug Adapter Protocol
- `neotest` — Test runner framework
- `refactoring` — Refactoring operations

### Utilities

- `oil` — File explorer
- `flash` — Quick motion
- `grapple` — File tagging/bookmarks
- `whichkey` — Key binding help
- `illuminate` — Word highlighting
- `ufo` — Better folding
- `undotree` — Undo history visualization
- `nvim-autopairs` — Auto-close pairs
- `comment` — Comment toggling
- `ollama` — Local LLM integration
- `venv-selector` — Python venv picker
- `conform` — Formatter runner
- `fidget` — LSP progress indicator
- `lspsaga` — Enhanced LSP UI
- `trouble` — Diagnostics list
- `none-ls` — Null-ls replacement (formatters/linters)
- `hlchunk` — Chunk highlighting
- `luasnip` — Snippet engine

## Color Schemes

### Active Theme

**Catppuccin** (frappe variant) with transparent background.

Configured in `config/plug/colorscheme/colorscheme.nix`.

### Available Themes

The `theme` option (in `config/default.nix`) accepts:
- `paradise` (default for base16 highlights)
- `decay`
- `mountain`
- `tokyonight`
- `everforest`
- `everblush`
- `jellybeans`
- `aquarium`
- `gruvbox`

Note: The `theme` option controls `config/colors/*.nix` (base16 palettes used by `highlight.nix`), but the active colorscheme is **catppuccin** (configured separately in `colorscheme.nix`).

### Changing Theme

1. Edit `config/default.nix`, change `theme = "paradise"` to another enum value
2. Edit `config/plug/colorscheme/colorscheme.nix`, enable the desired colorscheme and disable others

## Editor Options

Key settings from `config/sets.nix`:

- **Line numbers:** Relative + absolute
- **Indentation:** 2 spaces, `expandtab`, `smartindent`
- **Search:** `ignorecase`, `smartcase`, `hlsearch`, `incsearch`, `grepprg = "rg --vimgrep"`
- **UI:** `termguicolors`, `cursorline`, `cmdheight = 0`, `showmode = false`
- **Performance:** `updatetime = 50`, `timeoutlen = 10`
- **Folding:** Configured for `nvim-ufo` (`foldlevel = 99`)
- **Clipboard:** `unnamedplus` (system clipboard)
- **Undo:** Persistent undo history (`undofile = true`)

## Development Workflow

### Adding a Plugin

1. Create `config/plug/<category>/<plugin>.nix`
2. Use nixvim's declarative API: `plugins.<name> = { enable = true; settings = { ... }; };`
3. Add `extraConfigLua` for non-declarative setup
4. Import the module in `config/default.nix` under the appropriate category

### Adding an LSP Server

Edit `config/plug/lsp/lsp.nix`, add to `plugins.lsp.servers`:

```nix
<server_name> = {
  enable = true;
  # Optional: settings, extraOptions, etc.
};
```

### Adding a Keymap

Edit `config/keys.nix`, append to `keymaps`:

```nix
{
  mode = "n";  # or "v", "i", "x", or list
  key = "<leader>x";
  action = "<cmd>...<cr>";
  options = {
    silent = true;
    desc = "Description";
  };
}
```

### Testing Changes

```bash
# Quick syntax check
nix flake check

# Build and run
nix run .#

# If it fails to load, check the error output
```

## Pre-commit Hooks

Enabled in devShell via `pre-commit-hooks.nix`:

- `statix` — Nix linter
- `alejandra` — Nix formatter

Run manually:

```bash
nix develop -c pre-commit run --all-files
```

## Known Conventions

1. **One plugin per file** — Each plugin gets its own `.nix` file in `plug/`
2. **Declarative first** — Use nixvim's `plugins.*` API, fall back to `extraConfigLua` only when needed
3. **Transparent backgrounds** — Most colorschemes configured with transparency
4. **Rounded borders** — LSP floating windows use `border = "rounded"`
5. **Ghost text** — CMP shows inline suggestions
6. **Grapple over Harpoon** — File tagging uses `grapple.nix` (harpoon file exists but is not imported)
7. **Telescope for fuzzy finding** — All `<leader>f` and `<leader>s` bindings
8. **No alpha.nix** — Commented out; uses `btw.nix` for startup screen instead

## Troubleshooting

### Config fails to load

```bash
# Check for Nix syntax errors
nix flake check

# Run with verbose output
nix run .# -- -V
```

### Plugin not working

1. Verify it's imported in `config/default.nix`
2. Check nixvim docs for correct attribute path
3. Ensure `enable = true` is set
4. Check `extraConfigLua` for Lua errors

### LSP server not attaching

1. Verify server is enabled in `config/plug/lsp/lsp.nix`
2. Check if the server binary is in PATH (nixvim should handle this)
3. Open a file of the correct filetype
4. Run `:LspInfo` in Neovim to see server status

## External References

- [nixvim docs](https://nix-community.github.io/nixvim/)
- [flake-parts docs](https://flake.parts/)
- [Neovim docs](https://neovim.io/doc/)
- Base template: [elythh/nixvim](https://github.com/elythh/nixvim)
