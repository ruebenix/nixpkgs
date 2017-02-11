{ stdenv, fetchurl, lua5, postgresql}:

stdenv.mkDerivation rec {
  version  ="2.1.0";
  name = "webmcp-${version}";

  src = fetchurl {
    url = "http://www.public-software-group.org/pub/projects/webmcp/v${version}/webmcp-v${version}.tar.gz";
    sha256 = "098myg9a43djjrmsvz64as4fiwialfg6zi3b2yxaqfadficgpyhj";
  };

  buildInputs = [
   lua5 postgresql
  ];

  installPhase = ''
   mkdir -p $out/bin
   cp -RL framework/* $out/
  '';

  meta = with stdenv.lib; {
    description = "WebMCP is web application framework written in Lua and C.";
    homepage = "http://www.public-software-group.org/webmcp";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ ruebenix ];
  };
}
