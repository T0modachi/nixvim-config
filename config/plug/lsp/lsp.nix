{
  plugins = {
    lsp-format = {
      enable = true;
    };
    lsp = {
      enable = true;
      servers = {
        eslint = {
          enable = true;
        };
        html = {
          enable = true;
        };
        lua_ls = {
          enable = true;
        };
        nil_ls = {
          enable = true;
        };
        marksman = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
        #ruff = {enable = true;};
        #ruff-lsp = {enable = true;};
        gopls = {
          enable = true;
        };
        terraformls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
        };
        yamlls = {
          enable = true;
        };
        jsonls = {
          enable = true;
        };
        ruby_lsp = {
          enable = true;
        };
        phpactor = {
          enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.config('*', {
      handlers = {
        ["textDocument/hover"] = function(err, result, ctx, config)
          config = config or {}
          config.border = _border
          return vim.lsp.handlers.hover(err, result, ctx, config)
        end,
        ["textDocument/signatureHelp"] = function(err, result, ctx, config)
          config = config or {}
          config.border = _border
          return vim.lsp.handlers.signature_help(err, result, ctx, config)
        end,
      },
    })

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }
  '';
}
