{ self, inputs, ... }:
{
  flake.nixosModules.nvim =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.jonathan =
        { config, pkgs, ... }:
        {
          programs.neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
          };
          xdg.configFile."nvim".source =
            config.lib.file.mkOutOfStoreSymlink "/home/jonathan/nixos-hypnos/modules/features/neovim/nvim";

        };
    };
}
