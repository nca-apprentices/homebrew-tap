# Written by jjforge's release workflow for v0.2.3. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.3/jf-aarch64-apple-darwin"
      sha256 "91f82b046b743cde94ea5679a62b396cf7a16fef655f68de3af9fa43b8690eca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.3/jf-aarch64-unknown-linux-gnu"
      sha256 "20114d480c36dba757b16bff6a0689c86d9baabe93cb70b5210c76a27bc0a032"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.3/jf-x86_64-unknown-linux-gnu"
      sha256 "5da5c2cc94deade85ee21a14978bda4b08f0974baed92ea942603737e7eda50e"
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
