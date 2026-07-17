{
  # nvim-ufo is incompatible with Neovim 0.12 (async API changed)
  # Disabled until nixpkgs updates to a compatible version
  plugins.nvim-ufo = {
    enable = false;
  };
}
