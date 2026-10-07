# Written by jjforge's release workflow for v0.3.0. Edits here are lost.
class Jf < Formula
  desc "Command-line client for jjforge, a forge for Jujutsu repositories"
  homepage "https://jjforge-docs.nca-apprentices.dev"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.3.0/jf-aarch64-apple-darwin"
      sha256 "8b3c4e912b5648815959c1838b104620265bcc306a7fe435a29e404e4be7ba45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.3.0/jf-aarch64-unknown-linux-gnu"
      sha256 "4185ae71384b79c482fb2b7fa02767fd0a9b21012e3391a94412a184a76cfbdb"
    end
    on_intel do
      url "https://github.com/nca-apprentices/jjforge/releases/download/v0.3.0/jf-x86_64-unknown-linux-gnu"
      sha256 "339e0ee6cee82af8578e836d02d8c4403c826bb330033bdb2b37a057ea7c9cf1"
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
