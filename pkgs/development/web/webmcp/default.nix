{ stdenv, fetchurl, lua5}:

stdenv.mkDerivation rec {
  version  ="2.1.0";
  name = "webmcp-${version}";

  src = fetchurl {
    url = "http://www.public-software-group.org/pub/projects/webmcp/v${version}/webmcp-v${version}.tar.gz";
    sha256 = "0h72f4nd9abqijk70j2ip61swc0x817w4xhbn6w95v8jkp95jn1b";
  };

  buildInputs = [
   lua5 
  ];

  preBuild = ''
  mv Makefile bMakefile
  '';
  postBuild = "bmake -f bMakefile" ;

  installPhase = ''
   mkdir -p $out/bin
   cp moonbridge $out/bin/moonbridge
  '';

  meta = with stdenv.lib; {
    description = "WebMCP is web application framework written in Lua and C.";
    homepage = "http://www.public-software-group.org/webmcp";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ ruebenix ];
  };
}
