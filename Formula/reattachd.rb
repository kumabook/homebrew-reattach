class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.3/reattachd-darwin-aarch64.tar.gz"
      sha256 "433a6fb3ad63b4f014e3b84135a00ed91f13645cfa82ecbdfe2d59d044cab5ea"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.3/reattachd-darwin-x86_64.tar.gz"
      sha256 "e12dfac8b306eb2eeba2174964164bcd1aef82d94910e876f6682a7eb8081d26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.3/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "59cc0ba3fe5ba9d7bf21eda483b8ac4561a77d4329c11c6b3c65ad3e38565312"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.3/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "10bcdf18a940aa0342d157602b94075f4f1cbbb2927198c0b387c378d30b4233"
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
    environment_variables REATTACHD_PORT: "8787", REATTACHD_BIND_ADDR: "127.0.0.1"
  end

  test do
    assert_match "Remote control daemon for tmux sessions",
                 shell_output("#{bin}/reattachd --help")
  end
end
