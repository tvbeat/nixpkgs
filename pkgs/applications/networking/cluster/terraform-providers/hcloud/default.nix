{ stdenv, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "terraform-provider-hcloud";
  version = "1.21.0";

  src = fetchFromGitHub {
    owner = "hetznercloud";
    repo = "terraform-provider-hcloud";
    rev = "v${version}";
    sha256 = "08afkvayzzq5yz6fnn4xylskvvn1nh5kw0axvw40q77pmcrrpbnb";
  };

  vendorSha256 = "070p34g0ca55rmfdwf1l53yr8vyhmm5sb8hm8q036n066yp03yfs";

  doCheck = false;

  postBuild = "mv ../go/bin/terraform-provider-hcloud{,_v${version}}";

  meta = with stdenv.lib; {
    homepage = "https://github.com/hetznercloud/terraform-provider-hcloud";
    description = "Terraform Hetzner Cloud provider";
    license = licenses.mpl20;
    maintainers = with maintainers; [ lblasc ];
  };
}
