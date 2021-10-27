{ self, callPackage }:
callPackage ./default.nix {
  inherit self;
  version = "2.1.0-2021-10-13";
  rev = "bfd076532cdf1159df13499392879f5f4d3a9a5d";
  isStable = false;
  sha256 = "1wglz395ppp08c908x4xlax1ak6ji90vkkk1vc38il3zr98g4n98";
}
