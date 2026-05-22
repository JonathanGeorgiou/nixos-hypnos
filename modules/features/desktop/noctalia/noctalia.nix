{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, config, lib, ... }:
    {

      imports = [ inputs.home-manager.nixosModules.home-manager ];
      home-manager.users.jonathan = { config, ... }: {

        imports = [
          inputs.noctalia.homeModules.default
        ];

        programs.noctalia-shell = {
          enable = true;
        };

        xdg.configFile."noctalia/settings.json".source =
            config.lib.file.mkOutOfStoreSymlink "/home/jonathan/nixos-hypnos/modules/features/desktop/noctalia/noctalia.json";


      };
    };
}
