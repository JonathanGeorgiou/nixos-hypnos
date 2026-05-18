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

      home-manager.users.jonathan =
        { config, pkgs, ... }:
        {
          programs.neovim = {
            enable = true;
            viAlias = true;
            vimAlias = true;
          };
          # Tell Home Manager to symlink your config file directly from your dotfiles directory
          xdg.configFile."nvim".source =
            config.lib.file.mkOutOfStoreSymlink "${self}/modules/features/neovim/nvim";

        };
    };
}
