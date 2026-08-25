{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = false;
    settings = {
      updateInInsert = false;
    };
    sources = {
      code_actions = {
        gitsigns.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        golangci_lint.enable = true;
        statix.enable = true;
        yamllint.enable = true;
      };
    # Formatting handled by conform.nvim (see plug/lsp/conform.nix)
    };
  };
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
