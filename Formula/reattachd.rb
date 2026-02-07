class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.0/reattachd-darwin-aarch64.tar.gz"
      sha256 "6c346998cbbf8222f5104248a12b56e51a52c06cf2a3350b24f64e6a103e3acf"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.0/reattachd-darwin-x86_64.tar.gz"
      sha256 "626b75656a6a2b9370bcac0519c8e882cb935c445f62716e1b99310847870fdd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.0/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "7bb23d8f75942f92ae74ee91166b45dadb24fb0351580bc05f0720a47b5fc553"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.0/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "0306406a2ced615dee0dade39a80e4a9a739d32c78f6be6a684a14fd07e328e1"
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
