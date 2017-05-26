# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class AwsEcsUtils < Formula
  desc "Connect to shell of containerized application like you were used to before Docker"
  homepage "https://github.com/polydice/aws-ecs-utils"
  url "https://github.com/polydice/aws-ecs-utils/archive/v0.1.0.tar.gz"
  sha256 "3b38994954abd0f233176ac1579b97c552d4204526fbb1f0c2ca288d6e5fb792"

  depends_on "awscli"

  def install
    bin.install "bin/ecs-connect"
    bin.install "bin/ecs-run-shell"
  end
end
