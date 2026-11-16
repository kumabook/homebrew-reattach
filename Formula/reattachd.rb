class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.3/reattachd-darwin-aarch64.tar.gz"
      sha256 "0b36a5785f9140cf4abd895fb97ab2eb40f07028cd4abdc1c31f31ee44f09168"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.3/reattachd-darwin-x86_64.tar.gz"
      sha256 "7b6e265677f4da08687dad33a2d2837dcdffde0ef34f36f404ae7b4e974e423b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.3/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "11b65d89a64af4354a7aa84a57372a1aa13b199d3b8747952db1b462cdacdf85"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.3/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "a6c5824a0d3f8bad5454fdf1d8106f251685dd40fb9979f39b0af5fb21ed845c"
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
