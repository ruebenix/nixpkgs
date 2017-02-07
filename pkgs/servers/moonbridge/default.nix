{ stdenv, fetchurl, lua5, libbsd }:

stdenv.mkDerivation rec {
  version  ="1.0.1";
  name = "moonbridge-${version}";

  src = fetchurl {
    url = "http://www.public-software-group.org/pub/projects/moonbridge/v${version}/moonbridge-v${version}.tar.gz";
    sha256 = "0h72f4nd9abqijk70j2ip61swc0x817w4xhbn6w95v8jkp95jn1b";
  };

  buildInputs = [
   lua5 libbsd 
  ];

  buildPhase =''
   pmake 
  '';

  configureFlags = [
  ];

  meta = with stdenv.lib; {
    description = "Moonbridge is a stand-alone TCP/IP (and HTTP) network server for applications that are written in the Lua programming language.";
    homepage = "http://www.public-software-group.org/moonbridge";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ ruebenix ];
  };
}
