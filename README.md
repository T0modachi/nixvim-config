# nixvim-config

my nixvim configuration as a flake, copy as a base configuration this repo [https://github.com/elythh/nixvim](https://github.com/elythh/nixvim)

## Usage

### Try it without installing

Run the flake directly without installing anything:

```bash
nix run github:T0modachi/nixvim-config
```

This will:
- Download and build the neovim configuration
- Launch nixvim with all plugins and settings pre-configured
- Leave no trace on your system after you exit

### Install permanently

Add to your flake inputs:

```nix
{
  inputs = {
    nixvim-config.url = "github:T0modachi/nixvim-config";
  };

  outputs = { nixvim-config, ... }: {
    # Use nixvim-config.packages.${system}.default
  };
}
```

Or install system-wide:

```bash
nix profile install github:T0modachi/nixvim-config
```

Then run `nvim` to launch.
