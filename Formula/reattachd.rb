class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.0/reattachd-darwin-aarch64.tar.gz"
      sha256 "b64b2a799b094b9b63dda6555343da13ac5a5d0a60673e9bb4491b22f5de6523"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.0/reattachd-darwin-x86_64.tar.gz"
      sha256 "5593d291d00ed996448634df7fec983949632c27c7d27b8b03ead622e2f59271"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.0/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "a73930b3f6528c281a4806c3d50dd1a7aa0df871b0efb2c64822fcee6cb0e5dd"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.0/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "fd99c6c855486fdd99324c162a5fb841ae0c012a6bb9f9982039e9696fd330b7"
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
