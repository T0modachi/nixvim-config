{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "venv-selector";
      src = pkgs.fetchFromGitHub {
        owner = "linux-cultist";
        repo = "venv-selector.nvim";
        rev = "c9d638f";
        hash = "sha256-3lJT9fr/CZsBIa+fJIM27fAbQa+F2U18tM6SDR5j2YI=";
      };
    })
  ];

  extraConfigLua = ''
    require('venv-selector').setup {
         dap_enabled = true
       }  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>tv";
      action = "<cmd>VenvSelect<cr>";
      options = {
        desc = "select venv";
      };
    }
  ];
}
