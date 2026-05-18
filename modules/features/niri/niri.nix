{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {

      programs.niri = {
        enable = true;
      };

      environment.systemPackages = with pkgs; [
        wl-clipboard
      ];

      home-manager.users.jonathan =
        { config, ... }:
        {

          # Tell Home Manager to symlink your config file directly from your dotfiles directory
          xdg.configFile."niri/config.kdl".source =
            config.lib.file.mkOutOfStoreSymlink "${self}/modules/features/niri/config.kdl";

        };
    };
}
