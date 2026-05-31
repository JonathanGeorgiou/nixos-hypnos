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
      environment.systemPackages = [ pkgs.neovim ];
      environment.variables = {
        EDITOR = "nvim";
        VISUAL = "nvim";
      };

      environment.shellAliases = {
        vi = "nvim";
        vim = "nvim";
      };

      home-manager.users.jonathan =
        { config, pkgs, ... }:
        {
          xdg.configFile."nvim".source =
            config.lib.file.mkOutOfStoreSymlink "/home/jonathan/nixos-hypnos/modules/features/neovim/nvim";

        };
    };
}
