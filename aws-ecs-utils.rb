# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class AwsEcsUtils < Formula
  desc "Connect to shell of containerized application like you were used to before Docker"
  homepage "https://github.com/polydice/aws-ecs-utils"
  url "https://github.com/polydice/aws-ecs-utils/archive/v0.1.1.tar.gz"
  sha256 "81957754255e16d08f6515564489f73457e2098af73f5a649d0f909ff93c987f"

  depends_on "awscli"
  depends_on "jq"

  def caveats
    <<~EOS
      Notice: AWS CLI's Session Manager plugin is required.

      You can install via `brew install --cask session-manager-plugin`.
    EOS
  end

  def install
    bin.install "bin/ecs-connect"
    bin.install "bin/ecs-run-shell"
  end
end
