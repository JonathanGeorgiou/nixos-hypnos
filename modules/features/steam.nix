{ self, inputs, ... }:
{
  flake.nixosModules.gaming =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.steam
      ];

    };
}
