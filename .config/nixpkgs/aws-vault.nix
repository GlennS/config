{ buildGoModule, lib, fetchFromGitHub }:
buildGoModule rec {
  name = "aws-vault-${version}";
  version = "5.2.0";

  #goPackagePath = "github.com/99designs/${pname}";

  src = fetchFromGitHub {
    owner = "99designs";
    repo = name;
    rev = "v${version}";
    sha256 = "1zakj87lvxi79smih4mhlsg3z39s6ahbqq740n9qh07xn3has8v3";
  };

  modSha256 = "1qb8y2mqd3xk342mfdi2ddkj1zpbbbvrb129rslipa65xqb1rdw3";

  # set the version. see: aws-vault's Makefile
  # buildFlagsArray = ''
  #   -ldflags=
  #   -X main.Version=v${version}
  # # '';

  meta = with lib; {
    description = "A vault for securely storing and accessing AWS credentials in development environments";
    homepage = "https://github.com/99designs/aws-vault";
    license = licenses.mit;
    maintainers = with maintainers; [ zimbatm ];
  };

}
