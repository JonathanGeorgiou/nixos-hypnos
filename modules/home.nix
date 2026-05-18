{ self, inputs, ... }:
{
  flake.nixosModules.home =
    { pkgs, config, lib, ... }:

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

        programs.git.enable = true;
        programs.bash = {
          enable = true;
          shellAliases = {
            nrs = "sudo nixos-rebuild switch --flake ~/nixos-hypnos#vm";
          };
        };

        home.packages = with pkgs; [
          neovim
          ripgrep
          nil
          nixpkgs-fmt
          nodejs
          gcc
	  ghostty
        ];
      };
    };
}
