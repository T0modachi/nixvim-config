{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "venv-selector";
      src = pkgs.fetchFromGitHub {
        owner = "linux-cultist";
        repo = "venv-selector.nvim";
        rev = "fbafbdd";
        hash = "sha256-3Fd0D0uy3YDPj7rUTnUfltgpX8LktRB0HZyu20qLEBA=";
      };
      nvimSkipModules = [
        "venv-selector.cached_venv"
      ];
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
