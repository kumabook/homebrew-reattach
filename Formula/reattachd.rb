class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "1.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.2/reattachd-darwin-aarch64.tar.gz"
      sha256 "928db119cd04d358250ee44ec7fcf256921e5b74b4e3367b2e7a68c4b8473c8a"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.2/reattachd-darwin-x86_64.tar.gz"
      sha256 "f3e06b308c9541552cba6c530316dcd1b7687d5b29ba68c4ccd1db32e2942bf7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.2/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "f6d4df1dcd4202bf0644fbc09b4fbacd0045a87b7c71fa429f8a2f4744f52e42"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v1.0.2/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "eadef5dbc61e0f4f91ff4086ccf83acd875d619b4fc230246c0b3a5f69e65435"
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
