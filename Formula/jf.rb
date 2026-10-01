# Written by jjforge's release workflow for v0.2.1. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.1/jf-aarch64-apple-darwin"
      sha256 "488a3e9f5e5045776c8bb75c9794d2eb674a82d0e25ea8783ad9eaaa143bcfa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.1/jf-aarch64-unknown-linux-gnu"
      sha256 "c5adb92ae72af0def6d1a46de9dcb3950295d481c7e5d73e05834ffe27d2ea1b"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.1/jf-x86_64-unknown-linux-gnu"
      sha256 "e8a0960face4bf3c7c35f81215ad295a7cb4aebdfdca032ba541e9d15b9cfefd"
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
