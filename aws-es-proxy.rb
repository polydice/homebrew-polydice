class AwsEsProxy < Formula
  desc "Small web server sitting between your HTTP client and AWS Elasticsearch service."
  homepage "https://github.com/abutaha/aws-es-proxy"
  url "https://github.com/abutaha/aws-es-proxy/archive/v0.3.tar.gz"
  sha256 "0ca80b0823fe0cb4103b0e9a3b1f062a911f6d247cc8a0bed45cbc2c93e5c7ed"
  head "https://github.com/abutaha/aws-es-proxy.git"

  depends_on "glide" => :build
  depends_on "go" => :build

  def install
    ENV["GLIDE_HOME"] = buildpath/"glide_home"
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/abutaha/aws-es-proxy").install buildpath.children
    cd "src/github.com/abutaha/aws-es-proxy" do
      system "glide", "install"
      system "go", "build", "-o", "aws-es-proxy"

      bin.install "aws-es-proxy"
      prefix.install_metafiles
    end
  end

  def caveats
    <<-EOS.undent
      Before you can use these tools you must export some variables to your $SHELL.
        export AWS_ACCESS_KEY="<Your AWS Access ID>"
        export AWS_SECRET_KEY="<Your AWS Secret Key>"
        export AWS_CREDENTIAL_FILE="<Path to the credentials file>"
    EOS
  end

  test do
    begin
      io = IO.popen("#{bin}/aws-es-proxy -endpoint https://dummy-host.eu-west-1.es.amazonaws.com")
      sleep 2
    ensure
      Process.kill("SIGINT", io.pid)
      Process.wait(io.pid)
    end

    assert_match "Listening on", io.read
  end
end
