{
  lib,
  buildPythonPackage,
  cython_0,
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
  disabled = !(pythonOlder "3.12");

  src = fetchFromGitHub {
    owner = "julianpollmann";
    repo = "gensim";
    rev = "122f4ae80ccf7b27d49889ba9ac4f338ed082b7b";
    hash = "sha256-OFm5B8htSYNvevcfaWFtbM+nJZwEnEkFJlPn5FzEvPA=";
  };

  build-system = [
    cython_0
    numpy
    setuptools
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython>=0.29.32,<3.0.0" "Cython" \
      --replace-fail "numpy==2.0.0; python_version>='3.9' and platform_machine not in 'arm64|aarch64'" "numpy"
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

  pythonRelaxDeps = [
    "scipy"
    "numpy"
  ];

  pythonImportsCheck = [ "gensim" ];

  # Test setup takes several minutes
  doCheck = false;

  pytestFlagsArray = [ "gensim/test" ];

  meta = with lib; {
    description = "Topic-modelling library";
    homepage = "https://radimrehurek.com/gensim/";
    changelog = "https://github.com/RaRe-Technologies/gensim/blob/${version}/CHANGELOG.md";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ jyp ];
  };
}
