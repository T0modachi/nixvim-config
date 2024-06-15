{
  plugins = {
    ollama = {
      enable = true;
      model = "codeqwen:7b-chat";
      serve.onStart = true;
    };
  };
}
