{
  plugins.mini-files = {
    enable = true;
    settings = {
      windows = {
        preview = true;
        width_focus = 50;
        width_preview = 25;
      };
      options = {
        permanent_delete = false;
        use_as_default_explorer = true;
      };
      mappings = {
        close = "q";
        go_in = "l";
        go_in_plus = "L";
        go_out = "h";
        go_out_plus = "H";
        show_help = "g?";
        synchronize = "=";
        reset = "<BS>";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>lua MiniFiles.open()<CR>";
      options = {
        desc = "Open file explorer";
        silent = true;
      };
    }
  ];
}
