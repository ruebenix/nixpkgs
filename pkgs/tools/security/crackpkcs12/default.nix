{ stdenv, fetchurl, pkgconfig, autoconf, automake, openssl }:

stdenv.mkDerivation rec {

  name = "crackpkcs12-${version}";
  version = "0.2.10";

  src = fetchurl {
     url = "mirror://sourceforge/crackpkcs12/crackpkcs12-${version}.tar.gz";
     sha256 = "0slnv8rrbv64kkxm6plzqwapq78hx7mqf8bm1592n24kjs6pnam6";
  };

  buildInputs = [ pkgconfig autoconf automake openssl ];

  installPhase =
  ''
    mkdir -p $out/bin
    cp src/crackpkcs12 $out/bin/
  '';

  meta = with stdenv.lib; {
    homepage = http://crackpkcs12.sourceforge.net/;
    description = "A multithreaded program to crack PKCS#12 files (p12 and pfx extensions) ";
    platforms = platforms.linux;
    license = licenses.gpl3;
  };
}
