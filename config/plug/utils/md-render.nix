{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    # Core plugin
    (buildVimPlugin {
      pname = "md-render.nvim";
      version = "2026-07-08";
      src = pkgs.fetchFromGitHub {
        owner = "delphinus";
        repo = "md-render.nvim";
        rev = "56057d92d636a45cdeac5d1857e776e10d279d69";
        hash = "sha256-q/0ZRbsvADdS7LBD03uuAABdkE330jbIHY8066t0MvI=";
      };
    })
    # Optional: CJK phrase-level line breaking (BudouX)
    (buildVimPlugin {
      pname = "budoux.lua";
      version = "2026-04-02";
      src = pkgs.fetchFromGitHub {
        owner = "delphinus";
        repo = "budoux.lua";
        rev = "7f23658b127b9a74aae5b388fefcd997be30cbfc";
        hash = "sha256-obBkZym7E4lMhFFIaGt8yWArFcVqi+jqUkSVFbbynpw=";
      };
    })
  ];

  # System dependencies for image/video/mermaid features
  extraPackages = with pkgs; [
    curl # download web images/video
    ffmpeg # image conversion, animated GIF, video frames
    imagemagick # image conversion fallback
    mermaid-cli # render Mermaid diagrams as images (mmdc command)
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>mp";
      action = "<Plug>(md-render-preview)";
      options.desc = "Markdown preview (toggle)";
    }
    {
      mode = "n";
      key = "<leader>mt";
      action = "<Plug>(md-render-preview-tab)";
      options.desc = "Markdown preview in tab (toggle)";
    }
    {
      mode = "n";
      key = "<leader>md";
      action = "<Plug>(md-render-demo)";
      options.desc = "Markdown render demo";
    }
  ];
}
