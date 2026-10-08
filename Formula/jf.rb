# Written by jjforge's release workflow for v0.4.1. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.1/jf-aarch64-apple-darwin"
      sha256 "e94c93a34417df515683e4fa906cff5965a4fae87fadf861c5de6152a05ce22b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.1/jf-aarch64-unknown-linux-gnu"
      sha256 "7f5e511b5415c5225677b36cb7abbc9c92925d2f7bacba118f59dd760b540c13"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.4.1/jf-x86_64-unknown-linux-gnu"
      sha256 "87048619fd38978c436bc32b454167954917a084dc88013d2f45ed8d649bfc4f"
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
