{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/profiles/qemu-guest.nix>
      ./generic.nix
    ];
  
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };
  
  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "virtio_pci" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  networking.interfaces.enp1s0.useDHCP = true;
  
  fileSystems."/" =
    { device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-label/swap"; }
    ];

  nix.maxJobs = lib.mkDefault 2;

  services.fstrim.enable = true;
}

