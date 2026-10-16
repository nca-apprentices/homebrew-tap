# Written by jjforge's release workflow for v0.6.0. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.6.0/jf-aarch64-apple-darwin"
      sha256 "7f4a09553d35b3d2fd0ebbe231ba2dc3e7b1be101b083f30f1e010f622ded464"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.6.0/jf-aarch64-unknown-linux-gnu"
      sha256 "2adeb4c2ea67d4b6586e1715a6baa740203cb58cb0e30db57deb277697afa367"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.6.0/jf-x86_64-unknown-linux-gnu"
      sha256 "9a88e0fe5b1ecba299e2275c3560ab2210ef5acda5d27ce41613e61a546bf7f5"
    end
  end

  conflicts_with "jfrog-cli", because: "both install a `jf` binary"

  def install
    bin.install Dir["jf-*"].first => "jf"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/jf --version")
  end
end
