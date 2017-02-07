{ stdenv, fetchurl}:

stdenv.mkDerivation rec {
  version = "20170114";
  name = "bmake-${version}";

  src = fetchurl {
    url = "http://www.crufty.net/ftp/pub/sjg/${name}.tar.gz";
    sha256 = "113nlmidxy9kjr45kg9x3ngar4951mvag1js2a3j8nxcz34wxsv4";
  };



  meta = {
    homepage = "http://www.crufty.net/help/sjg/bmake.html";
    description = "autoconf version of NetBSDs make";
    license = stdenv.lib.licenses.gpl2Plus;

    platforms = stdenv.lib.platforms.all;
  };
}
