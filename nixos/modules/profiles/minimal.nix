# This module defines a small NixOS configuration.  It does not
# contain any graphical stuff.

{ config, lib, ... }:

with lib;

{
  # Perl is a default package.
  environment.defaultPackages = mkDefault [ ];

  # The lessopen package pulls in Perl.
  programs.less.lessopen = mkDefault null;

  # This pulls in nixos-containers which depends on Perl.
  boot.enableContainers = mkDefault false;
}
