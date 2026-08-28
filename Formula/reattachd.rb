class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.2.0/reattachd-darwin-aarch64.tar.gz"
      sha256 "7584774e83250173abd242fa4b5c168dcc99acc69ac4f2e1ba45f925f05cc37e"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.2.0/reattachd-darwin-x86_64.tar.gz"
      sha256 "14378f18fa6fbf0623fa9d07ab437c6b8139d4324e50a67afed04aceec650fe9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.2.0/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "75b14665e3e83f74282186849ec50c6675c47377460ce731c91459056367750b"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.2.0/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "c274ac948decf2a6aef7bddc7380efc09101626b9923e80188d1aebc873d1ae6"
    end
  end

  def install
    bin.install "reattachd"
  end

  service do
    run [opt_bin/"reattachd"]
    keep_alive true
    log_path var/"log/reattachd.log"
    error_log_path var/"log/reattachd.error.log"
  end

  test do
    assert_match "Remote control daemon for tmux sessions",
                 shell_output("#{bin}/reattachd --help")
  end
end
