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
    
  ];

  services.openssh = {
    enable = true;
    permitRootLogin = "yes";
  };
}

