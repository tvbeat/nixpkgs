{ stdenv
, fetchFromGitHub
, lib
, lua
, rustPlatform
, toLuaModule
}:

toLuaModule (rustPlatform.buildRustPackage rec {
  pname = "lua-rtoml";
  version = "0.2";

  src = fetchFromGitHub {
    owner = "lblasc";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-+Epmcut5kB2tztOF0T6FIVEalduSyKKZo/f8fv2igUU=";
  };

  propagatedBuildInputs = [
    lua # propagate it for its setup-hook
  ];

  cargoSha256 = "sha256-mnZT1qSk+hMha2JuBGQcs4xhU/OoOxNUYEFe3VcKsLg=";

  buildFeatures =
    if (lib.getName lua) == "luajit" then [ "luajit" ]
    else if (lib.versions.majorMinor lua.version) == "5.1" then [ "lua51" ]
    else if (lib.versions.majorMinor lua.version) == "5.2" then [ "lua52" ]
    else if lua.luaversion == "5.3" then [ "lua53" ] else throw "unsuported lua version";

  postInstall = ''
    mkdir -p $out/lib/lua/${lua.luaversion}
    mv $out/lib/libtoml.so $out/lib/lua/${lua.luaversion}/toml.so
  '';

  meta = with lib; {
    description = "Lua bindings for the Rust toml crate.";
    homepage = "https://github.com/lblasc/lua-rtoml/";
    license = with lib.licenses; [ mit ];
    maintainers = [ maintainers.lblasc ];
  };
})
