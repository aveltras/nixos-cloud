{ config, pkgs, ... }:

{
  system.stateVersion = "20.03";

  networking.useDHCP = false;

  i18n = {
    defaultLocale = "fr_FR.UTF-8";
    supportedLocales = [ "fr_FR.UTF-8/UTF-8" ];
    inputMethod.enabled = "ibus";
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };
  
  time.timeZone = "Europe/Paris";

  environment.systemPackages = with pkgs; [
    inetutils
    sysstat
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };

  users.users.aveltras = {
    isNormalUser = true;
    home = "/home/aveltras";
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICRH41b8Qn+80OJuZssDDfqcSkH3MkVyqoA4I8V2FkW7 aveltras"
    ];
  };
}

