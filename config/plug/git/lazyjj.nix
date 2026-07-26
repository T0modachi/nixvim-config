{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    lazyjj-nvim
  ];

  extraConfigLua = ''
    require("lazyjj").setup({
      mapping = false,  -- Desactivar keymap del plugin; usamos keymaps de nixvim
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>gj";
      action = "<cmd>LazyJJ<CR>";
      options = {
        desc = "LazyJJ (TUI for Jujutsu)";
      };
    }
  ];
}
