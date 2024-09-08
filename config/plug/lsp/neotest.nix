{
  plugins.neotest = {
    enable = true;

    adapters = {
      bash.enable = true;
      go.enable = true;
      plenary.enable = true;
      python.enable = true;
    };

    settings = {
      log_level = "warn";

      discovery = {
        enabled = true;
      };

      output_panel = {
        enabled = true;
      };
    };
  };
}
