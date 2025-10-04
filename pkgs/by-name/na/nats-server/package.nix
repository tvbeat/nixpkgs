{
  lib,
  buildGoModule,
  fetchFromGitHub,
  nixosTests,
}:

buildGoModule rec {
  pname = "nats-server";
  version = "2.11.10";

  src = fetchFromGitHub {
    owner = "nats-io";
    repo = "nats-server";
    rev = "v${version}";
    hash = "sha256-xTum+LimUidz8mnAG3C2JwoYOFJCdReKPyHGyldEkME=";
  };

  vendorHash = "sha256-wK+J5Km7k33nLeafWTisx2WSfShX5sNyFB377EEsbXM=";

  doCheck = false;

  passthru.tests.nats = nixosTests.nats;

  meta = {
    description = "High-Performance server for NATS";
    mainProgram = "nats-server";
    homepage = "https://nats.io/";
    changelog = "https://github.com/nats-io/nats-server/releases/tag/v${version}";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [
      swdunlop
      derekcollison
    ];
  };
}
