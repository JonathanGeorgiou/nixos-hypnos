{ self, inputs, ... }:
{
  flake.nixosModules.noctalia =
    { pkgs, lib, ... }:
    {
      # 1. Tell the core OS to load the Home Manager framework capability
      imports = [
        inputs.home-manager.nixosModules.home-manager
      ];

      # 2. Open the Home Manager sandbox for your user profile
      home-manager.users.jonathan = {
        
        # 3. Import your Home Manager specific profiles SAFELY in here!
        imports = [
          inputs.noctalia.homeModules.default
        ];

        # 4. Configure Noctalia now that its module is safely imported inside user-space
        programs.noctalia-shell = {
          enable = true;
          settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
        };
      };
    };
}
