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
          animation = "colormix";
          bigclock = "en";
          box_title = "Welcome, Colossus";
          initial_info_text = "Welcome, Colossus";
          };
        };

    };
}
