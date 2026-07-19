# nixvim-config

my nixvim configuration as a flake, copy as a base configuration this repo [https://github.com/elythh/nixvim](https://github.com/elythh/nixvim)

## Usage

### Try it without installing

Run the flake directly without installing anything:

```bash
nix run github:T0modachi/nixvim-config
```

This will:
- Download and build the neovim configuration
- Launch nixvim with all plugins and settings pre-configured
- Leave no trace on your system after you exit

### Install permanently

Add to your flake inputs:

```nix
{
  inputs = {
    nixvim-config.url = "github:T0modachi/nixvim-config";
  };

  outputs = { nixvim-config, ... }: {
    # Use nixvim-config.packages.${system}.default
  };
}
```

Or install system-wide:

```bash
nix profile install github:T0modachi/nixvim-config
```

Then run `nvim` to launch.

## Plugins requiring specific terminals

### md-render.nvim

This config includes [md-render.nvim](https://github.com/delphinus/md-render.nvim) for rich Markdown rendering (images, video, Mermaid diagrams) inside the editor.

**Terminal requirements:** Inline images and video use the [Kitty graphics protocol](https://sw.kovidgoyal.net/kitty/graphics-protocol/). Only terminals that implement this protocol are supported:

- [Ghostty](https://ghostty.org/)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [WezTerm](https://wezfurlong.org/wezterm/)

If your terminal does not support the Kitty graphics protocol, Markdown text formatting (bold, tables, callouts, code blocks) still renders — only inline images and video will not display.

Keymaps: `<leader>mp` (floating preview), `<leader>mt` (tab preview), `<leader>md` (demo).
