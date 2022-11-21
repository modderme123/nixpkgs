{ lib, buildPythonPackage, fetchPypi, pefile, pillow}:

buildPythonPackage rec {
  pname = "icoextract";
  version = "0.1.4";

  src = fetchPypi {
    inherit pname version;
    extension = "tar.gz";
    sha256 = "sha256-x0GEV0PUbkAzoUJgAqup9bHd7iYttGyzIZNdo8KsFyo=";
  };

  propagatedBuildInputs = [
    pefile
    pillow
  ];

  # tests expect mingw and multiarch
  doCheck = false;

  pythonImportsCheck = [
    "icoextract"
  ];

  meta = with lib; {
    description = "Extract icons from Windows PE files";
    homepage = "https://github.com/jlu5/icoextract";
    license = licenses.mit;
    maintainers = with maintainers; [ bryanasdev000 ];
  };
}
