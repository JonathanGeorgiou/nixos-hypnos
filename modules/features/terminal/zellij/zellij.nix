{ self, inputs, ... }:
{
  flake.nixosModules.terminal =
    { pkgs, config, lib, ... }:
    {

      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.jonathan = { config, ... }: {

        home.packages = with pkgs; [
          fzf
        ];

        programs.zellij = {
          enable = true;
          enableFishIntegration = true;
          settings.default_mode = "locked";
          settings.default_shell = "fish";
          settings.copy_command = "wl-copy";
          };

        xdg.configFile."zellij/config.kdl".source = ./config/config.kdl;
        xdg.configFile."zellij/layouts".source = ./config/layouts;

        home.file.".local/bin/project-picker.sh" = {
          source = ../scripts/project-picker.sh;
          executable = true;
        };
      };
    };
}
