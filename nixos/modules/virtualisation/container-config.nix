{ config, pkgs, lib, ... }:

with lib;

{

  config = mkIf config.boot.isContainer {

    # Disable some features that are not useful in a container.

    # containers don't have a kernel
    boot.kernel.enable = false;
    boot.modprobeConfig.enable = false;

    console.enable = mkDefault false;

    networking.useHostResolvConf = mkDefault true;

    # Containers should be light-weight, so start sshd on demand.
    services.openssh.startWhenNeeded = mkDefault true;

    # Shut up warnings about not having a boot loader.
    system.build.installBootLoader = lib.mkDefault "${pkgs.coreutils}/bin/true";

    # Use the host's nix-daemon.
    environment.variables.NIX_REMOTE = "daemon";

  };

}
