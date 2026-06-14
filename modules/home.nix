{ self, inputs, ... }:
{
  flake.nixosModules.home =
    {
      pkgs,
      config,
      lib,
      ...
    }:

    {
      home-manager = {
        backupFileExtension = "backup";
        useGlobalPkgs = true;
        useUserPackages = true;
      };

      home-manager.users.jonathan = {
        home.username = "jonathan";
        home.homeDirectory = "/home/jonathan";
        home.stateVersion = "25.11";

        stylix = {
          targets.noctalia-shell.enable = false;
          targets.neovim.enable = false;
          targets.gnome.enable = false;
          targets.ghostty.enable = false;
          targets.firefox = {
            enable = true;
            profileNames = [ "default" ];
            colors.enable = true;
          };
        };

        programs.firefox = {
          enable = true;
          profiles = {
            default = {
              id = 0;
              isDefault = true;
              settings = {
                "browser.startup.page" = 3;
              };
            };
          };
        };

        home.packages = with pkgs; [
          # Packages that don't need configuration
          ripgrep # move to neovim?
          nil # move to neovim?
          nixpkgs-fmt # move to neovim?
          nodejs # move to neovim?
          gcc # move to neovim?
        ];
      };
    };
}
