# Written by jjforge's release workflow for v0.4.0. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.0/jf-aarch64-apple-darwin"
      sha256 "29e34408562bac121751598addc389e7c4b5d9de2cef6646fb4b39f4ee70e404"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.0/jf-aarch64-unknown-linux-gnu"
      sha256 "d2e1d21e520c7cbfa0302c4950f6e9b349135d201a20df158d4cca6516bc5ae6"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.0/jf-x86_64-unknown-linux-gnu"
      sha256 "e3c14363c5dfa4fb013fc38f7f66300fd70625b29f3fd96761e623b315738640"
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
