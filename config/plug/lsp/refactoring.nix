{
  plugins.refactoring = {
    enable = true;
    enableTelescope = true;
  };

  keymaps = [
    {
      mode = "v";
      key = "<leader>rs";
      action = "<cmd>pick<CR>";
      options = {
        desc = "Refactor";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ri";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Inline Variable\")<CR>";
      options = {
        desc = "Inline Variable";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>rb";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Extract Block\")<CR>";
      options = {
        desc = "Extract Block";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>rf";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Extract Block To File\")<CR>";
      options = {
        desc = "Extract Block To File";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>rP";
      action = "<cmd>lua require(\"refactoring\").debug.printf({ below = false })<CR>";
      options = {
        desc = "Debug Print";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>rp";
      action = "<cmd>lua require(\"refactoring\").debug.print_var({ normal = true }<CR>";
      options = {
        desc = "Debug Print Variable";
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<leader>rc";
      action = "<cmd>lua require(\"refactoring\").debug.cleanup({})<CR>";
      options = {
        desc = "Debug Cleanup";
        silent = true;
      };
    }
    {
      mode = ["v"];
      key = "<leader>rf";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Extract Function\")<CR>";
      options = {
        desc = "Extract Function";
        silent = true;
      };
    }
    {
      mode = ["v"];
      key = "<leader>rF";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Extract Function To File\")<CR>";
      options = {
        desc = "Extract Function To File";
        silent = true;
      };
    }
    {
      mode = ["v"];
      key = "<leader>rx";
      action = "<cmd>lua require(\"refactoring\").refactor(\"Extract Variable\")<CR>";
      options = {
        desc = "Extract Variable";
        silent = true;
      };
    }
    {
      mode = ["v"];
      key = "<leader>rp";
      action = "<cmd>lua require(\"refactoring\").debug.print_var()<CR>";
      options = {
        desc = "Debug Print Variable";
        silent = true;
      };
    }
  ];
}
