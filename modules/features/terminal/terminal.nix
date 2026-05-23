{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { pkgs, config, lib, ... }:
    {

      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.jonathan = { config, ... }: {

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

        programs.fish = {
          enable = true;
          shellAliases = {
            nrs = "sudo nixos-rebuild switch --flake ~/nixos-hypnos#vm";
            lg = "lazygit";
          };
        };

        programs.ghostty = {
          enable = true;
          enableFishIntegration = true;
          settings.command = "fish";
        };

        programs.starship = {
          enable = true;
          enableFishIntegration = true;
        };

        programs.zellij = {
          enable = true;
          enableFishIntegration = true;
        };

        programs.lazygit = {
          enable = true;
          enableFishIntegration = true;
        };

      };
    };
}
