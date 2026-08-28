class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.3.0/reattachd-darwin-aarch64.tar.gz"
      sha256 "5500650a5f511f44a6a25fdb1221b75401da1879ee82ca1290c27f8b51054faa"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.3.0/reattachd-darwin-x86_64.tar.gz"
      sha256 "bea601a62fc040c7b5db5963efeb25e861292fc716a45211d5c9fb79255e7061"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.3.0/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "bece10f95d1131804a400c4ab701b38568e7e4ae24fb3b418ce658377148fbfc"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.3.0/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "26840eab07092e04ff27c1d921b7bdbad077ce71bd6d73851109f00a40390838"
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
