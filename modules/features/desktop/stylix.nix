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
      imports = [ inputs.stylix.nixosModules.stylix ];

      stylix = {
        enable = true;
        image  = ./ravens.jpg;
        polarity = "dark";
      };

    };
}
