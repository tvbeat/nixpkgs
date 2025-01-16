{
  lib,
  buildPythonPackage,
  cython,
  numpy,
  setuptools,
  fetchFromGitHub,
  mock,
  scipy,
  smart-open,
  pyemd,
  pytestCheckHook,
  pythonOlder,
}:

buildPythonPackage rec {
  pname = "gensim";
  version = "4.3.3";
  pyproject = true;

  # C code generated with CPython3.12 does not work cython_0.
  # disabled = !(pythonOlder "3.12");

  src = fetchFromGitHub {
    owner = "julianpollmann";
    repo = "gensim";
    rev = "5b9c76c48b9097b8a46eed1f75474ad3f8a31e4e";
    hash = "sha256-gipx2BGiIVtAubjzsWzaGYkYfrJHBaiGGnCvin59nlk=";
  };

  build-system = [
    cython
    numpy
    setuptools
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython>=3.1.3" "Cython" \
  '';

  dependencies = [
    smart-open
    numpy
    scipy
  ];

  nativeCheckInputs = [
    mock
    pyemd
    pytestCheckHook
  ];

  pythonImportsCheck = [ "gensim" ];

  # Test setup takes several minutes
  doCheck = false;

  enabledTestPaths = [ "gensim/test" ];

  meta = with lib; {
    description = "Topic-modelling library";
    homepage = "https://radimrehurek.com/gensim/";
    changelog = "https://github.com/RaRe-Technologies/gensim/blob/${version}/CHANGELOG.md";
    license = licenses.lgpl21Only;
  };
}
