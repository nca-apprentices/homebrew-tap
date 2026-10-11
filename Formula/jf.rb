# Written by jjforge's release workflow for v0.5.0. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.5.0/jf-aarch64-apple-darwin"
      sha256 "0b8bfd6a7d613c1da6eeddc7a12e0ea24bb84fdb90ee252bc1ff409a4c23c0b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.5.0/jf-aarch64-unknown-linux-gnu"
      sha256 "d4f341534ae5198768b2e3405390bcfc0e42a710bb51f119c798c4f4cf0a5aa1"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.5.0/jf-x86_64-unknown-linux-gnu"
      sha256 "6b8289fcbd5eb40c388c43bd792c5779836440b0b064dbf4c9f248e4b20bd02b"
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
