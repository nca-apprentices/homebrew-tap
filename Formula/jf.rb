# Written by jjforge's release workflow for v0.4.2. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.2/jf-aarch64-apple-darwin"
      sha256 "8a40636d46d02a7b9251f7390e08782f571620cb98711ee11cd15d899f4cf23d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.2/jf-aarch64-unknown-linux-gnu"
      sha256 "45d8f06a6d5163da2b74aa66521a3f5468dcb2c94cb8f1bc23ad050b4a5f1545"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.2/jf-x86_64-unknown-linux-gnu"
      sha256 "da9b3db86f20e20d20e8e22c7aab6fb23a10959271032d6e8abf806ff93ad6ef"
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
