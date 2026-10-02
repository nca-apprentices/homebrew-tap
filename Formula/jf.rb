# Written by jjforge's release workflow for v0.2.2. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.2/jf-aarch64-apple-darwin"
      sha256 "d3930f165c615aee0e7b32948ad194a593b4e9c7b4bcd8bb99f09d32cf2bfe06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.2/jf-aarch64-unknown-linux-gnu"
      sha256 "a550709e083d95c9ccbeefb26a56bb898bebd75bb2c307bf8e05a68c9b79dc49"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.2/jf-x86_64-unknown-linux-gnu"
      sha256 "9bcb599b2c0c94186e3c5068abd23ce4c0369bdf9a3721c3235838dbb8a225cc"
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
