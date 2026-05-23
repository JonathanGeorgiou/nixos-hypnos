{ self, inputs, ... }:
{

  flake.nixosModules.vmConfig =
    {
      config,
      lib,
      pkgs,
      ...
    }:

    {

      # Import all modules necessary modules for this machine here
      imports = [
        self.nixosModules.vmHardware
        self.nixosModules.home
        self.nixosModules.desktop
        self.nixosModules.nvim
        self.nixosModules.terminal
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Bootloader.
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/sda";
      boot.loader.grub.useOSProber = true;

      networking.hostName = "vm"; # Define your hostname.
      networking.networkmanager.enable = true;

      time.timeZone = "Europe/London";

      # Select internationalisation properties.
      i18n.defaultLocale = "en_GB.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "gb";
        variant = "";
      };

      # Configure console keymap
      console.keyMap = "uk";

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      users.users.jonathan = {
        isNormalUser = true;
        description = "jonathan";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        packages = with pkgs; [ ];
      };

      # List packages installed in system profile. To search, run:
      # $ nix search wget
      environment.systemPackages = with pkgs; [
        vim
        wget
        neovim
        git
        firefox
      ];

      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "25.11"; # Did you read the comment?
    };
}
