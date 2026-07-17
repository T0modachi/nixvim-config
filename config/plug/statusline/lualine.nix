{config, ...}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins.lualine = {
    enable = true;
    settings = {
      globalstatus = true;
      disabledFiletypes = {
        statusline = ["dashboard" "alpha" "starter"];
      };
      theme = {
        normal = {
          a = {
            bg = "#b4befe";
            fg = "#1c1d21";
          };
          b = {
            bg = "nil";
          };
          c = {
            bg = "nil";
          };
          z = {
            bg = "nil";
          };
          y = {
            bg = "nil";
          };
        };
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            fmt.__raw = "string.lower";
            color = {
              fg =
                if config.colorschemes.base16.enable
                then colors.base04
                else "none";
              bg =
                if config.colorschemes.base16.enable
                then colors.base00
                else "none";
            };
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
            color = {
              fg =
                if config.colorschemes.base16.enable
                then colors.base04
                else "none";
              bg =
                if config.colorschemes.base16.enable
                then colors.base00
                else "none";
            };
          }
          "diff"
        ];
        lualine_c = [
          {
            __unkeyed-1 = "diagnostics";
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = "󰝶 ";
            };
            color = {
              fg =
                if config.colorschemes.base16.enable
                then colors.base08
                else "none";
              bg =
                if config.colorschemes.base16.enable
                then colors.base00
                else "none";
            };
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = "filetype";
            icon_only = true;
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "filename";
            symbols = {
              modified = "";
              readonly = "";
              unnamed = "";
            };
            color = {
              fg =
                if config.colorschemes.base16.enable
                then colors.base04
                else "none";
              bg =
                if config.colorschemes.base16.enable
                then colors.base00
                else "none";
            };
            separator = {
              left = "";
            };
          }
        ];
        lualine_z = [
          {
            __unkeyed-1 = "location";
            color = {
              fg =
                if config.colorschemes.base16.enable
                then colors.base0B
                else "none";
              bg =
                if config.colorschemes.base16.enable
                then colors.base00
                else "none";
            };
          }
        ];
      };
    };
  };
}
