{pkgs, ...}: {
  #dependencies for neotest
  extraPlugins = with pkgs.vimPlugins; [
    nvim-nio
    FixCursorHold-nvim
  ];

  plugins.neotest = {
    enable = true;

    adapters = {
      bash.enable = true;
      go.enable = true;
      plenary.enable = true;
      python = {
        enable = true;
      };
    };

    settings = {
      log_level = "warn";

      discovery = {
        enabled = true;
      };

      output_panel = {
        enabled = true;
        open = "botright split";
      };
    };
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<leader>tt";
      action = "<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<cr>";
      options = {
        silent = true;
        desc = "Run File";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tT";
      action = "<cmd>lua require(\"neotest\").run.run(vim.uv.cwd()<cr>";
      options = {
        silent = true;
        desc = "Run All Test Files";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tr";
      action = "<cmd>lua require(\"neotest\").run.run()<cr>";
      options = {
        silent = true;
        desc = "Run Nearest";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tl";
      action = "<cmd>lua require(\"neotest\").run.run_last()<cr>";
      options = {
        silent = true;
        desc = "Run Last";
      };
    }
    {
      mode = ["n"];
      key = "<leader>ts";
      action = "<cmd>lua require(\"neotest\").summary.toggle()<cr>";
      options = {
        silent = true;
        desc = "Toggle Summary";
      };
    }
    {
      mode = ["n"];
      key = "<leader>to";
      action = "<cmd>lua require(\"neotest\").output.open({ enter = true, auto_close = true })<cr>";
      options = {
        silent = true;
        desc = "Show Output";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tO";
      action = "<cmd>lua require(\"neotest\").output_panel.toggle()<cr>";
      options = {
        silent = true;
        desc = "Toggle Output Panel";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tS";
      action = "<cmd>lua require(\"neotest\").run.stop()<cr>";
      options = {
        silent = true;
        desc = "Stop";
      };
    }
    {
      mode = ["n"];
      key = "<leader>tw";
      action = "<cmd>lua require(\"neotest\").watch.toggle(vim.fn.expand(\"%\"))<cr>";
      options = {
        silent = true;
        desc = "Toggle Watch";
      };
    }
    {
      mode = ["n"];
      key = "<leader>td";
      action = "<cmd>lua require(\"neotest\").run.run({strategy = \"dap\"})<cr>";
      options = {
        silent = true;
        desc = "Debug Nearest";
      };
    }
  ];
}
