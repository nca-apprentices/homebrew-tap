# Written by jjforge's release workflow for v0.2.4. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.4/jf-aarch64-apple-darwin"
      sha256 "09ba1068189f951fba911ecc21a867e58afc564dc0c4640f5cc8c31622600295"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.4/jf-aarch64-unknown-linux-gnu"
      sha256 "95818ccbddd9eda3528e0408242ed381d50c632dafba747588fdd7f5c378095d"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.2.4/jf-x86_64-unknown-linux-gnu"
      sha256 "7225fce40bf3adc8c0b957a5c65a234d2f3b4e955e98b05c8aeb3b83dcecac04"
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
