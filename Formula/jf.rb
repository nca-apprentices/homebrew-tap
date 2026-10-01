# Written by jjforge's release workflow for v0.2.0. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.0/jf-aarch64-apple-darwin"
      sha256 "de7a53c226d1c903efeb16a76e05d185f7825e50d6d7a1b16adda0e6aaeec590"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.0/jf-aarch64-unknown-linux-gnu"
      sha256 "a196e581368c87f6752353f266cc713c285ac4609d75a9ab96d9517f66d5822e"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.0/jf-x86_64-unknown-linux-gnu"
      sha256 "15e1f939fec226e4a71a48640b44f5cf5f846f160bf867cb87abc236d9706b82"
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
