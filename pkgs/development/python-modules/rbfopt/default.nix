{ lib, buildPythonPackage, fetchPypi, nose2, numpy, pyomo, scipy }:

buildPythonPackage rec {
  pname = "rbfopt";
  version = "4.2.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-Q0iGUWMQBSFtvNkSYk4JgvC+eIrLqFiPB9ZwYppmtNE=";
  };

  propagatedBuildInputs = [
    nose2
    numpy
    pyomo
    scipy
  ];

  checkInputs = [
    nose2
  ];

  # tests never finish
  # see https://github.com/coin-or/rbfopt/issues/44
  doCheck = false;

  pythonImportsCheck = [
    "rbfopt"
  ];

  meta = with lib; {
    homepage = "https://github.com/coin-or/rbfopt";
    description = "A Python library for black-box optimization (also known as derivative-free optimization)";
    maintainers = with maintainers; [ aanderse ];
    license = licenses.bsd3;
  };
}
