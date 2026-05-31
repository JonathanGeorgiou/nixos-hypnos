{ self, inputs, ... }:
{
  flake.nixosModules.godot =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      environment.systemPackages = [
        pkgs.godot
        pkgs.blender
      ]

    };
}
