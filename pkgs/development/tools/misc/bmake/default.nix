{ stdenv, fetchurl, lib, copyPathsToStore, m4, perl, getopt}:

stdenv.mkDerivation rec {
  version = "20170114";
  name = "bmake-${version}";

  src = fetchurl {
    url = "http://www.crufty.net/ftp/pub/sjg/${name}.tar.gz";
    sha256 = "054ws5ljfjjancsa97x41h65la5jxr30l2xp3z0a4qdcjzg04ak4";
  };

  buildInputs = [
  perl m4 getopt 
  ];
  
  configureFlags = [ "--with-default-sys-path=$out/share/mk" ];

  patches =  copyPathsToStore (lib.readPathsFromFile ./. ./series) ;


  meta = {
    homepage = "http://www.crufty.net/help/sjg/bmake.html";
    description = "autoconf version of NetBSDs make";
    license = stdenv.lib.licenses.gpl2Plus;

    platforms = stdenv.lib.platforms.all;
  };
}
