{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
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
        # catppuccin-cursors.mochaLight
        # catppuccin-cursors.mochaDark
        phinger-cursors
      ];

      home-manager.users.jonathan =
        { config, ... }:
        {

          # Tell Home Manager to symlink your config file directly from your dotfiles directory
          xdg.configFile."niri/config.kdl".source =
            config.lib.file.mkOutOfStoreSymlink "/home/jonathan/nixos-hypnos/modules/features/desktop/niri/config.kdl";

        };
    };
}
