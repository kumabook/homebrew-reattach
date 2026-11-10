class Reattachd < Formula
  desc "Remote control daemon for tmux sessions"
  homepage "https://github.com/kumabook/Reattach"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.2/reattachd-darwin-aarch64.tar.gz"
      sha256 "44ae64b4ba18be12c5c7f9a71ad318e03f86c3537b8536457194e239189c6a1e"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.2/reattachd-darwin-x86_64.tar.gz"
      sha256 "eb6db73aafc53c25ea531085659ab5a2d3ae6a4d0f1beb6fd4592e08e360a268"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.2/reattachd-linux-aarch64-gnu.tar.gz"
      sha256 "314c417d44e13227dd0e8858b0f95248985ecad31adf201d4fad961024bf8f25"
    else
      url "https://github.com/kumabook/Reattach/releases/download/v2.0.2/reattachd-linux-x86_64-musl.tar.gz"
      sha256 "5aa369c5053f3725e5a29cd0da3678672224481650e5a8b823e7d585a77764b1"
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
