{ config, lib, pkgs, ... }:

{
    imports =
    [
        # Core Files
            ./hardware-configuration.nix
            ./user.nix

        # Desktop
            ./modules/desktop/boot.nix
            ./modules/desktop/vm.nix
            ./modules/desktop/xfce.nix
            ./modules/desktop/zsh.nix

        # Hardware
            ./modules/hardware/bluetooth.nix
            ./modules/hardware/btrfs.nix
            ./modules/hardware/ntfs.nix
            ./modules/hardware/nvidia.nix
            ./modules/hardware/printer.nix
            ./modules/hardware/zram.nix

        # Others
            ./modules/others/flatpak.nix
            ./modules/others/font.nix
            ./modules/others/important.nix
            ./modules/others/services.nix

        # Software
            ./modules/software/blender.nix
            ./modules/software/obs.nix
            ./modules/software/game.nix
            ./modules/software/nvim.nix
            ./modules/software/package.nix
            ./modules/software/kicad.nix
            ./modules/software/scrcpy.nix
            ./modules/software/droidcam.nix
    ];
}