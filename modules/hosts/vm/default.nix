{ self, inputs, ... }:
{
  flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
    # import the vmConfiguration from configuration.nix
    modules = [
      self.nixosModules.vmConfig
    ];
  };
}
