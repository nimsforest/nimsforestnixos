{ config, pkgs, ... }:

{
  # Pi 5 hardware configuration
  boot.loader.raspberryPi = {
    enable = true;
    version = 5;
  };
  
  # Basic system configuration
  system.stateVersion = "23.11";
  
  # Enable flakes (modern Nix)
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Network configuration
  networking = {
    hostName = "nimsforest-body";
    networkmanager.enable = true;
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 80 8080 ];
  };
  
  # User configuration
  users.users.nimsforest = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      # Add your SSH public key here
      # "ssh-rsa AAAAB3NzaC1yc2EAAAA..."
    ];
  };
  
  # Enable SSH for remote access
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
  
  # Essential packages
  environment.systemPackages = with pkgs; [
    git
    vim
    htop
    curl
    wget
    nfs-utils
    sqlite
  ];
  
  # NFS client support for mounting orgdata
  services.nfs.server.enable = false;
  boot.supportedFilesystems = [ "nfs" ];
  
  # Placeholder for NimsForest service
  # systemd.services.nimsforest = {
  #   enable = true;
  #   description = "NimsForest Service";
  #   after = [ "network.target" ];
  #   serviceConfig = {
  #     ExecStart = "${pkgs.nimsforest}/bin/nimsforest";
  #     Restart = "always";
  #     User = "nimsforest";
  #   };
  # };
  
  # Auto-mount orgdata if available
  # fileSystems."/mnt/orgdata" = {
  #   device = "nas.local:/pool/orgdata";
  #   fsType = "nfs";
  #   options = [ "nofail" "x-systemd.automount" ];
  # };
}