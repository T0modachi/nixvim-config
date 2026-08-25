{
  plugins.lint = {
    enable = true;
    autoInstall.enable = true;
    lintersByFt = {
      go = ["golangci_lint"];
      nix = ["statix"];
      yaml = ["yamllint"];
    };
  };
}
