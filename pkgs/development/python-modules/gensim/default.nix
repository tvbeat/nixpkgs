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
    owner = "piskvorky";
    repo = "gensim";
    rev = "37f90ec121eb7cd401448a947e80953e0c53ccdc";
    hash = "sha256-TXutcU43ReBj9ss9+zBJFUxb5JqVHpl+B0c7hqcJAJY=";
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
