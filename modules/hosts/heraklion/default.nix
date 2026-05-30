{ self, inputs, ... }:
{
  flake.nixosConfigurations.heraklion = inputs.nixpkgs.lib.nixosSystem {
    # import the heraklionConfiguration from configuration.nix
    modules = [
      self.nixosModules.heraklionConfig
    ];
  };
}
