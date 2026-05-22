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

        programs.git = {
          enable = true;
          settings = {
            user.name = "JonathanGeorgiou";
            user.email = "j.georgiou94@gmail.com";

          };
        };
        programs.bash = {
          enable = true;
          shellAliases = {
            nrs = "sudo nixos-rebuild switch --flake ~/nixos-hypnos#vm";
          };
        };

        stylix = {
          targets.noctalia-shell.enable = false;
          targets.neovim.enable = false;
          targets.ghostty.enable = false;
        };

        home.packages = with pkgs; [
          # Packages that don't need configuration
          ripgrep # move to neovim?
          nil # move to neovim?
          nixpkgs-fmt # move to neovim?
          nodejs # move to neovim?
          gcc # move to neovim?
          ghostty # create module
        ];
      };
    };
}
