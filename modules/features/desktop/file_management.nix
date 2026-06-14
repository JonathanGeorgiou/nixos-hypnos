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

      environment.systemPackages = with pkgs; [
        kdePackages.dolphin
        kdePackages.ark
        unzip
        yazi
        fd
        file
        ffmpegthumbnailer
        tree
      ];


    };
}
