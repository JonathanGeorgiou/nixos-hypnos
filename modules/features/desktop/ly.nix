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

      services.displayManager.ly = {
        enable = true;
        settings = {
          animation = "doom";
          bigclock = "en";
          box_title = "Welcome, Colossus";
          };
        };

    };
}
