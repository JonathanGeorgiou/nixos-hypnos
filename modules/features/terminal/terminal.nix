{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { pkgs, config, lib, ... }:
    {
      # For packages that aren't available in home-manager, or do not have good set up options
      environment.systemPackages = [
        pkgs.taskwarrior3
        pkgs.taskwarrior-tui
      ];


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
            nrs = "sudo nixos-rebuild switch --flake ~/nixos-hypnos#heraklion";
          };
        };

        programs.fish = {
          enable = true;
          shellAliases = {
            nrs = "sudo nixos-rebuild switch --flake ~/nixos-hypnos#heraklion";
            lg = "zellij run --floating --close-on-exit --width 80% --height 80% --x 10% --y 10% -- lazygit";
            tt = "taskwarrior-tui";
            vi = "nvim";
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
