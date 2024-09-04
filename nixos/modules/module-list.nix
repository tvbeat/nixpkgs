[
  ./config/console.nix
  ./config/i18n.nix
  ./config/iproute2.nix
  ./config/networking.nix
  ./config/nix.nix
  ./config/nix-flakes.nix
  ./config/nsswitch.nix
  ./config/resolvconf.nix
  ./config/shells-environment.nix
  ./config/swap.nix
  ./config/sysctl.nix
  ./config/system-environment.nix
  ./config/system-path.nix
  ./config/users-groups.nix
  ./config/vte.nix
  ./misc/assertions.nix
  ./misc/extra-arguments.nix
  ./misc/ids.nix
  ./misc/lib.nix
  ./misc/meta.nix
  ./misc/nixpkgs.nix
  ./misc/version.nix
  ./programs/bash/bash.nix
  ./programs/environment.nix
  ./programs/less.nix
  ./programs/shadow.nix
  ./programs/ssh.nix
  ./programs/zsh/zsh.nix
  ./security/ca.nix
  ./security/pam.nix
  ./security/sudo.nix
  ./security/wrappers/default.nix
  ./services/networking/dhcpcd.nix
  ./services/networking/firewall.nix
  ./services/networking/firewall-iptables.nix
  ./services/networking/firewall-nftables.nix
  ./services/networking/nat.nix
  ./services/networking/nat-iptables.nix
  ./services/networking/nat-nftables.nix
  ./services/networking/nftables.nix
  ./services/networking/ssh/sshd.nix
  ./services/system/dbus.nix
  ./services/system/nix-daemon.nix
  ./services/system/nscd.nix
  ./services/ttys/getty.nix
  ./system/activation/activatable-system.nix
  ./system/activation/activation-script.nix
  ./system/activation/bootspec.nix
  ./system/activation/top-level.nix
  ./system/boot/initrd-network.nix
  ./system/boot/kernel.nix
  ./system/boot/loader/grub/grub.nix
  ./system/boot/loader/systemd-boot/systemd-boot.nix
  ./system/boot/modprobe.nix
  ./system/boot/networkd.nix
  ./system/boot/resolved.nix
  ./system/boot/stage-1.nix
  ./system/boot/stage-2.nix
  ./system/boot/systemd.nix
  ./system/boot/systemd/coredump.nix
  ./system/boot/systemd/initrd-secrets.nix
  ./system/boot/systemd/initrd.nix
  ./system/boot/systemd/journald.nix
  ./system/boot/systemd/logind.nix
  ./system/boot/systemd/nspawn.nix
  ./system/boot/systemd/shutdown.nix
  ./system/boot/systemd/sysusers.nix
  ./system/boot/systemd/tmpfiles.nix
  ./system/boot/systemd/user.nix
  ./system/boot/tmp.nix
  ./system/etc/etc-activation.nix
  ./tasks/filesystems.nix
  ./tasks/filesystems/overlayfs.nix
  ./tasks/network-interfaces-scripted.nix
  ./tasks/network-interfaces-systemd.nix
  ./tasks/network-interfaces.nix
  ./virtualisation/container-config.nix
  ./virtualisation/nixos-containers.nix

  ({ lib, ... }: {


    #options.virtualisation.containers.enable = lib.mkEnableOption "";
    options.programs.bash.completion.enable = lib.mkEnableOption "";

    # nix-daemon
    options.nix.distributedBuilds = lib.mkEnableOption "";
  })
]
